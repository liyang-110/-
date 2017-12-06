/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '企业用户管理',
		toolbar:[{  
            text:'返回',  
            iconCls:'icon-undo',
            handler:function(){
					 window.parent.closeDialog();
            }  
        },{  
            text:'录入回访记录',  
            iconCls:'icon-view',
            handler:function(){
            	insertVisitRecord();
            }
        }],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50,
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			}
		}]],
		columns : [ [
		{
			field : 'add_time',
			title : '回访时间',
			width : 30
		},{
			field : 'user_name',
			title : '招聘顾问',
			width : 20
		},{
			field : 'person',
			title : '企业联系人',
			width : 20
		},{
			field : 'company_tel',
			title : '企业电话',
			width : 30
		},{
			field : 'company_email',
			title : '企业邮箱',
			width : 50
		},{
			field : 'content',
			title : '回访内容',
			width : 100
		},{
			field : 'next_time',
			title : '下次回访时间',
			width : 30
		}
		]],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		fitColumns:true,
		border:false,
		fitColumns :true,
		rowStyler: function(index,row){
		}
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
		ajaxData('#resultId', getUrl, getData, undefined, undefined, undefined);
		return;
		
		var cur_page_size = $('#resultId').datagrid('options').pageSize;
		var ls_url=getUrl();
		
		$.ajax({
	        url: "/daqin_manager/visitRecord.do?type=show&company_id="+company_id,
	        type: "post",
	        dataType: "text",
	        success: function(data) {
	        	$.messager.progress("close");
	            if (!data) return;
	            var out_return = eval("[" +data+ "]");//讲json字符串转为对象
	            var rowcount=0;
	            if(((out_return[0])[0]).rn !=undefined){
	            	rowcount=(out_return[0][0]).rn;
	            };  //获取数据记录数
	            
	            out_return = "{\"total\":" + rowcount + ",\"rows\":"+ JSON.stringify(out_return[0]) + "}";
	            out_return = eval("[" + out_return + "]");
	            //加载数据
	            $('#resultId').datagrid('loadData', out_return[0]);
	        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
	    });
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="/daqin_manager/visitRecord.do?type=show&company_id="+company_id;
	return ls_url;	
}	
	/* =======================================================*/
// 函数作用：加载或刷新数据
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
function downOrreloadData(ini_pagesize,ini_pagenum,ini_currentnum){
	$('#resultId').datagrid( {
		pageNumber : 1,
		pageSize : ini_pagesize
	    });
	ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
}
/* =======================================================*/
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closepage(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData("#resultId", getUrl, getData, ini_pagenum, cur_page_size, ini_currentnum);
}
function closePageCancel()
{
	$('#dlg_deal').dialog('close') ;
}


function initPaperareafm(ins_id,inf_url,inf_deal,pageSize){
	 var pg = $(ins_id).datagrid("getPager");
	if(pg)
	{
	   $(pg).pagination({
	       pageSize: pageSize,
	       onRefresh:function(pageNumber,pageSize){
		        searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        },
	       onChangePageSize:function(pageSize){
		        searchData(ins_id,inf_url,inf_deal,1,pageSize,undefined);
	        },
	       onSelectPage:function(pageNumber,pageSize){
	             searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        }
	   });
	}
 }
function getCheckObj(ins_id,ins_msg){
	//当前选中行
	if (!$("#"+ins_id).datagrid("getSelections") || $("#"+ins_id).datagrid("getSelections")==""){
		return false;
	}else{
		var lo_selected= $("#"+ins_id).datagrid("getSelections");
		return lo_selected;
	}
}
//录入回访记录
function insertVisitRecord(){
	 //$('#if_deal')[0].src='jInsertVisitRecord.jsp?company_id='+company_id+"&user_id="+user_id;
	var lo_selected   = getCheckObj('resultId','请选择用户！'); 
	try{
		if( lo_selected[0] ){
			lo_selected[0].next_time='';
			lo_selected[0].content='';
			$("#fm").form("load",lo_selected[0] );
		}else{
			$.ajax({
				type:'GET',
				url:"/daqin_manager/visitRecord.do?type=contact&company_id="+company_id,
				async:false,
				dataType:'json',
				success:function(d){
					$("#fm").form("load",d);
				},
				error:function (XMLHttpRequest, textStatus, errorThrown) {
				    throw "获取企业联系方式失败";
				}
			});
		}
		$('#dlg_deal').dialog({width:390,height:300,fit:false,modal:true});
		$('#dlg_deal').dialog('open').dialog('setTitle','录入回访记录');
	}catch( err ){
		$.messager.alert("错误提示",err ,'error');
	}
}
/* =======================================================*/
//函数作用：保存数据并返回调用页面
//输入参数及数据类型：无
//返回参数及数据类型：无
/* ===================================================== */
function add() {
	if( $("#fm").form("validate") ){
		 $.ajax({
		     url: "/daqin_manager/visitRecord.do?type=update",
		     data : $("#fm").serialize(),
		     type: "post",
		     dataType: "text",
		     success: function(data) {
		         if( data =='1'){
		         	$.messager.alert('提示信息','录入成功！','info',function(){
		         		parent.window.closePageCancel();
		         	});
		         }else{
		         	$.messager.alert('提示信息','录入失败！','info');
		         }
		         return;
		     },
		     complete: function () {//完成响应
		     },
		     contentType:"application/x-www-form-urlencoded; charset=utf-8"
		 });
	}
}
//刷新数据
function reloadDG(){  
	  $('#resultId').datagrid('reload');
}  