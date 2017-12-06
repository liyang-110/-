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
		title : '招聘会服务订单管理',
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		
		columns : [ [ {
			field : 'add_date',
			title : '日期'
		},{
			field : 'order_id',
			title : '编号'
		},{
			field : 'title',
			title : '名称'
		},{
			field : 'points',
			title : '点数'
		},{
			field : 'add_time',
			title : '申请时间'
		},{
			field : 'company_name',
			title : '申请单位',
			formatter : function(value,row,index){
					return '<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank" title="'+value+'">'+value+'</a>';
			}
		},{
			field : 'job_fair_date',
			title :'招聘会日期'
		},{
			field : 'job_fair_name',
			title : '招聘会',
			formatter : function(value,row,index){
					return '<a title="'+value+'" href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+'</a>';
			},
			width:150
		},{
			field : 'deal_time',
			title : '处理时间'
		},{
			field : 'deal_user',
			title : '操作员'
		},{
			field : 'status',
			title : '进度',
			formatter : function(value,row,index){
				if( row.process !=null && row.process!='' ){
					return '<a title="'+row.process+'" style="text-decoration:underline">'+value+'</a>';
				}else{
					return value;
				}
			}
		},{
			field : 'action',
			title : '操作',
			formatter : function(value,row,index){
				if(row.status=='完成'){
					return '<font color="green">完成</font>';
				}else if(row.status=='取消'){
					return '<font color="red">关闭</font>';
				}else if(row.zt==0){
					return '<font color="red">待审</font>';
				}else{
					return '<button onclick="deal_fuwu('+index+')">跟单</button>';
				}
			}
		} 
		] ], 

		type : 'GET',
		nowrap : true,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : false,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		fitColumns :true,
		view:groupview,
        groupField:'add_date',
        groupFormatter:function(value,rows){
            return value + ' - ' + rows.length + ' Item(s)';
        }
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&in_r=ad&methodId=zp_fuwu_orders&in_URLEncoding=UTF-8"+querystr;
	return ls_url;	
}


 /* =======================================================*/
// 函数作用：得到当前被选中行的对象
// 输入参数及数据类型： ins_id   数据显示域id
//					ins_msg  无选中行时提示信息
// 返回参数及数据类型： lo_selected 选中行对象
/* ===================================================== */
	function getCheckObj(ins_id,ins_msg){
		//当前选中行
		if (!$("#"+ins_id).datagrid("getSelections") || $("#"+ins_id).datagrid("getSelections")==""){
			return false;
		}else{
			var lo_selected= $("#"+ins_id).datagrid("getSelections");
			return lo_selected;
		}
		
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
	
function view() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].job_fair_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jJobFairView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
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
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
/* =======================================================*/
// 函数作用：按条件搜索招聘会
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
	function searchAndreloadData(){
		var cur_page_size = $('#resultId').datagrid('options').pageSize;
		ajaxData('#resultId',getSearchUrl,getData,undefined,cur_page_size,undefined); 
	}
	function getSearchUrl()
	{
		var in_title=  $('#in_title').val() ;
		var in_type_id=$('input[name=in_type_id]').val();
		var url = getUrl();
		return url+"&in_title="+in_title+
				        "&in_type_id="+in_type_id;
	}
/* =======================================================*/
// 函数作用：打开新增页面
// 输入参数及数据类型：
//			  无
// 返回参数及数据类型：无
/* ===================================================== */
function add(){
	var li_currentnum = 0; //当前行
	var li_pagesize = 0; //每页行数
	var li_pagenum = 0; //页码
	var lo_selected;          //当前选中行
	var lo_pg;                //分页对象
	lo_selected = $("#resultId").datagrid("getSelected");                                               
	if (lo_selected) {
		li_currentnum = $("#resultId").datagrid("getRowIndex", lo_selected);
	}
	lo_pg = $("#resultId").datagrid("getPager");
	li_pagenum = lo_pg.pagination("options").pageNumber;
	li_pagesize = lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src = "./jMailTemplateAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
}
/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的文件！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_content_mgr"+i+"="+ lo_selected[i].id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=bottom_content_del" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
 }
/* =======================================================*/
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].fuwu_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jMailTemplateEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
function deal_fuwu( index ) {
	if( index != undefined ){
		$("#resultId").datagrid("selectRow",index);
	}
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  // zk_id
	var area_id="";
	var company_id="";

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }
        var li_order_id     = lo_selected[0].order_id;
        
	if (li_order_id==null || li_order_id=='' || li_order_id==undefined ){
   		$.messager.alert('提示信息','操作错误，请刷新页面后重试！','info');
		return false;
	}
     var li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
    var lo_pg         = $("#resultId").datagrid("getPager");
    var li_pagenum    = lo_pg.pagination('options').pageNumber;
    var li_pagesize = lo_pg.pagination("options").pageSize;
    
    $("#process_company_name").text( lo_selected[0].company_name );
    $("#process_contact_person").text( lo_selected[0].contact_person );
    $("#process_contact_tel").text( lo_selected[0].contact_tel );
    $("#process_content").text( lo_selected[0].process==null?'':lo_selected[0].process );
    $("#process_order_id").val( li_order_id );
    switch( lo_selected[0].status ){
    	case "待审": $("#status_01").attr("checked",true);break;
    	case "确认": $("#status_02").attr("checked",true);break;
    	case "处理": $("#status_03").attr("checked",true);break;
    	case "完成": $("#status_04").attr("checked",true);break;
    	default : $("#status_01").attr("checked",true);
    }
   	var dlg_title="服务跟单";
     $("#dlg_process").show().dialog({  title:dlg_title,
	    												   width: 360,
	    												   height: 230,
	    												   fit:false,
	    												   modal:true,
	    												   buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zp_fuwu_orders&in_action=process&date=" + new Date();
	$('#fm').form('submit', {
        url: ls_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
             console.info(re);
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var res = re[0].queryresult;
            	 console.info(res);
            	 if( res[0].ok=='ok'){
	                 $.messager.alert('提示信息','操作成功！','info',function(){//提示信息
	                 	ajaxData("#resultId", getUrl, getData, li_pagenum, li_pagesize, li_currentnum );
	                 	$("#dlg_process").dialog('close') ;
	            	});
	            }else {
	                 $.messager.alert('提示信息','未知错误！','error');
	            }
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });                    
												                    
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_process").dialog('close') ;
												                    }
												                }]
	    												   });
	  $("#dlg_process").dialog("open");
 }