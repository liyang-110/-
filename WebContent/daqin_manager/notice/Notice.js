/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function(){
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		toolbar:[{  
            text:'发送通知',  
            iconCls:'icon-add',
            handler:function(){
                        //$.messager.alert("提示信息","正在开发中……","info");
						sendShotMessageTo();
            }  
        },{  
            text:'撤销通知',  
            iconCls:'icon-cancel',
            handler:function(){
                        //$.messager.alert("提示信息","正在开发中……","info");
						stopMessageTo();
            }  
        }
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		
		columns : [ [ {
			field : 'send_time',
			title : '发送时间',
			width : 120
		},{
			field : 'sms_to',
			title : '接收',
			width : 100,
			formatter : function(value,row,index){
				switch(value){
				case 'company':return '企业';
				case 'student':return '学生';
				case 'school':return '学校';
				default : return value;
				}
			}
		},{
			field : 'title',
			title : '标题',
			width : 100
		},{
			field : 'content',
			title : '内容',
			width : 300
		},{
			field : 'send_status',
			title : '发送状态',
			width : 60
		},{
			field : 'add_person_name',
			title : '操作员',
			width :  60
		},{
			field : 'add_time',
			title : '时间',
			width : 120
		}
		] ], 

		type : 'GET',
		nowrap : true,
		fit : true,
		//width : '100%',
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : false,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		rowStyler: function(index,row){
			if (row.deleted==1){
				return 'background-color:#6293BB;color:#fff;';
			}
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
		ls_url = cur_path + "/esbServer.do?method=execProc&in_r=ad&methodId=notice&in_URLEncoding=UTF-8"+querystr;
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
	$("#if_deal")[0].src = "./jShotMessageAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	 $('#dlg_deal').dialog({width:450,height:220,fit:false});
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
}
/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
function stopMessageTo() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要撤销的通知！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要撤销的通知！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要撤销选择的通知?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_notice_mgr"+i+"="+ lo_selected[i].id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&in_r=ad&methodId=notice&in_action=stop" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
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
	    ls_id     = lo_selected[0].tpl_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jMailTemplateEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
/* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendShotMessageTo(){
   	 var dlg_title="发布即时通知";
     $("#dlg_check2").show().dialog({  title:dlg_title,
	    												   width: 500,
	    												   height: 350,
	    												   fit:false,
	    												   modal:true,
	    												   buttons: [{
												                    text:'发送',
												                    iconCls:'icon-ok',
												                    handler:function(){
	var ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=notice&in_action=add&date=" + new Date();
	// saveData(ls_url, function(){$("#dlg_check2").dialog('close') ;}, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
	$('#fm').form('submit', {
        url: ls_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var res = re[0].queryresult;
            	 if( res[0].ok=='ok'){
	                 $.messager.alert('提示信息','短信已发送！','info',function(){//提示信息
	                 	$("#dlg_check2").dialog('close') ;
	                 	downOrreloadData();
	            	});
	            }else if( res[0].msg ){
	                 $.messager.alert('提示信息', res[0].msg ,'error');
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
												                        $("#dlg_check2").dialog('close') ;
												                    }
												                }]
	    												   });
	  $("#dlg_check2").dialog("open");
}