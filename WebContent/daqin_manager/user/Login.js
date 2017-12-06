/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
		/*
		$("#btn_save").bind("click", function () {
			save();
		});
		$("#btn_return").bind("click", function () {
			$('#edit').window('close');
		});
		*/
		$("#searchAndreloadData").bind("click",function(e){
			searchLoginAccount();
		});
	});
function searchLoginAccount(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;

	searchForm("#resultId", getUrl, getData,1,cur_page_size);
}
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
		toolbar:[{  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
			add();
             
            }  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
			edit();
             
            }  
        },{  
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
			del();
             
            }  
        },'-',{  
            text:'站点授权',  
            iconCls:'icon-search',  
            handler:function(){
				role_area();
             
            }  
        },{  
            text:'行业授权',  
            iconCls:'icon-search',  
            handler:function(){
				industry();
             
            }  
        },{  
            text:'操作授权',  
            iconCls:'icon-search',  
            handler:function(){
				role_menu();
             
            }  
        }/*,'-',{  
            text:'充点',  
            iconCls:'icon-edit',  
            handler:function(){
						recharge();
                        }  
        }*/,{  
            text:'发送短信',  
            iconCls:'icon-copy',  
            handler:function(){
				sendShotMessage();
            }   
        },{  
            text:'短信帐户',  
            iconCls:'icon-copy',  
            handler:function(){
				setSmsAccount();
            }   
        }
        
        
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]], 
		columns : [ [
		{
			field : 'area_id',
			title : '站点',
			width : 50
		},{
			field : 'user_id',
			title : '用户账号',
			width : 50
		},{
			field : 'user_name',
			title : '姓名',
			width : 50
		},{
			field : 'role_name',
			title : '角色备注',
			width : 80
		},{
			field : 'acc_type',
			title : '账户类型',
			width : 50
		},{
			field : 'has_id',
			title : '子账户数',
			align : 'center',
			width : 50
		},{
			field : 'com_points',
			title : '企业点数',
			width : 50
		},{
			field : 'in_sms_used',
			title : '累计发送短信',
			align : 'center',
			width : 50
		},{
			field : 'in_sms_last',
			title : '短信帐户余额',
			align : 'center',
			width : 50
		}/*,{
			field : 'user_tel',
			title : '电话',
			width : 50
		},{
			field : 'user_qq',
			title : 'QQ',
			width : 50
		},{
			field : 'user_email',
			title : '电子邮件',
			width : 80
		}*/,{
			field : 'login_date',
			title : '最近登录',
			width : 80
		},{
			field : 'login_count',
			title : '登录次数',
			width : 80
		}
		] ],

		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		fitColumns: true,
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
		border:false
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_login_query&r=ad&in_URLEncoding=UTF-8";
	return ls_url;	
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
	li_pagesize = $('#resultId').datagrid('options').pageSize;// lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src = "./jLoginAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$('#dlg_deal').dialog({width:480,height:300,fit:true,resizable:true});
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
    					ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_login_del&r=ad" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
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
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum = lo_pg.pagination('options').pageNumber;
		li_pagesize = $('#resultId').datagrid('options').pageSize;// lo_pg.pagination("options").pageSize;
        $('#if_deal')[0].src='./jLoginEdit.jsp?id='+ls_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog({width:480,height:300,fit:true,resizable:true});
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
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
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jLoginView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
function recharge() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    var row = $('#resultId').datagrid('getSelected');
	    if(row.recharge=="false"){
	    	$.messager.alert('提示信息','您只能给点数账户为独立账户的用户充点！','error');
	    	return false;
	    }/*else if(!row.area_id){
	    	$.messager.alert('提示信息','所选用户没有地区授权，不允许充点！','error');
	    	return false;
	    } */else if(user_code==row.user_code){
	    	$.messager.alert('提示信息','你真是太有才了！！！','error');
	    	return false;
	    }
	    row.in_company_points=0;
	    row.in_school_points=0;
	    $('#fm').form('clear');
	    if (row){
	        $('#edit').window('open');
	        row.in_id=row.user_code;
	        row.in_user_id=row.user_id;
	        $('#fm').form('load', row);
	    } else {
	        $.messager.show({
	            title:'警告', 
	            msg:'错误'
	        });
	    }
    }
}
function save() {
	if( $('#in_school_points').val()==0 && $('#in_company_points').val()==0){
	    	$.messager.alert('提示信息','企业点数和学校点数不能都为零！','error');
	    	return false;
	}
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_login_edit&r=ad&in_buss_id=recharge&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closeEditWin, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
}
function closeEditWin() { 
	$('#edit').window('close');
	
	var ini_pagenum = $('#resultId').datagrid('options').pageNumber;
	var ini_pagesize = $('#resultId').datagrid('options').pageSize;
	var ini_currentnum = $('#resultId').datagrid('getRowIndex', $('#resultId').datagrid('getSelected') );
	
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
function role_area() {
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
	    ls_id     = lo_selected[0].role_id;
	    if(ls_id==role_id){
	    	$.messager.alert('提示信息','您不能修改自己账户的角色权限！','info');
	    	return false;
	    }
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jRoleArea.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog({width:480,height:300,fit:false,resizable:true});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}
function role_menu() {
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
	    ls_id     = lo_selected[0].role_id;
	    if(ls_id==role_id){
	    	$.messager.alert('提示信息','您不能修改自己账户的角色权限！','info');
	    	return false;
	    }
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jRoleMenu.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog({width:480,height:390,fit:false,resizable:true});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}
/* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendShotMessage(){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";

	lo_selected   = getCheckObj('resultId','请选择用户！'); 
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
			sendShotMessageTo( lo_selected[0].user_tel )
     }
     
 }
 /* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendShotMessageTo( contact_tel ){
   	var dlg_title="发送短信";
   	if(contact_tel != undefined ){
			$("#in_sms_to").val( contact_tel );
			$("input[name='in_sms_to']").val( contact_tel );
			$("#in_sms_to").validatebox("validate");
	}else if(contact_tel != '' || contact_tel==null ){
		$("#in_sms_to").val( contact_tel );
		$("input[name='in_sms_to']").val( contact_tel );
	}
     $("#dlg_check2").show().dialog({  title:dlg_title,
	    												   width: 300,
	    												   height: 200,
	    												   fit:false,
	    												   modal:true,
	    												   buttons: [{
												                    text:'发送',
												                    iconCls:'icon-ok',
												                    handler:function(){
	var ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=short_message&in_action=add&date=" + new Date();
	// saveData(ls_url, function(){$("#dlg_check2").dialog('close') ;}, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
	$('#fm2').form('submit', {
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
/*
 * 
 */
function setSmsAccount()
{
	var lo_selected   = getCheckObj('resultId','请选择用户！'); 
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
    var li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
    var lo_pg         = $("#resultId").datagrid("getPager");
    var li_pagenum    = lo_pg.pagination('options').pageNumber;
    $('#setSmsAccountForm').form('load', lo_selected[0] ); 
	    
    $("#dlg_sms_account")
			.show()
			.dialog(
					{
						title : '短信帐户充值',
						width : 300,
						height : 200,
						fit : false,
						modal : true,
						buttons : [
								{
									text : '确定',
									iconCls : 'icon-ok',
									handler : function() {
										var ls_url = cur_path
												+ "/esbServer.do?in_r=ad&method=execProc&methodId=admin_login_query&in_action=set_sms&date="
												+ new Date();
										// saveData(ls_url,
										// function(){$("#dlg_check2").dialog('close')
										// ;},
										// "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
										$('#setSmsAccountForm').form('submit', {
															url : ls_url,
															onSubmit : function() {
																return $(this)
																		.form(
																				'validate');
															},
															success : function(
																	data) {
																data = decodeURIComponent(data);
																var re = eval("["
																		+ data
																		+ "]");
																if (re.length > 0
																		&& re[0].returncode == 'ok') {
																	var res = re[0].queryresult;
																	if (res[0].ok == 'ok') {
																		$.messager
																				.alert(
																						'提示信息',
																						'操作成功',
																						'info',
																						function() {// 提示信息

																							searchForm("#resultId", getUrl, getData,li_pagenum,cur_page_size,li_currentnum);																							$("#dlg_sms_account")
																									.dialog(
																											'close');
																						});
																	} else if (res[0].ok == 'deny') {
																		$.messager
																				.alert(
																						'提示信息',
																						'您没有权限',
																						'error');
																	} else if ( res[0].ok=='fail' && res[0].msg ) {
																		$.messager
																				.alert(
																						'提示信息',
																						res[0].msg,
																						'error');
																	}else {
																		$.messager
																				.alert(
																						'提示信息',
																						'未知错误！',
																						'error');

																	}
																} else {
																	$.messager
																			.alert(
																					'\u9519\u8bef\u4fe1\u606f',
																					data,
																					'alert');//错误信息
																}
															}
														});

									}
								}, {
									text : '取消',
									handler : function() {
										$("#dlg_sms_account").dialog('close');
									}
								} ]
					});
	$("#dlg_sms_account").dialog("open");
    
}
