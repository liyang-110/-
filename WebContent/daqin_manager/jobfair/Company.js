/* =======================================================*/
// 功能：企业管理
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData(){
		$('#resultId').datagrid( {
			title :false, // job_fair_id==""?'企业参会记录':false,
			toolbar:[{  
	            text:'导出全部参会企业名单列表',  
	            iconCls:'icon-save',
	            handler:function(){
    					// window.open(cur_path+'/file/download.jsp?filename=高校开通使用申请表.docx');
    					var url=getUrl2();
    					 window.open( url );

	            }  
	        },{  
	            text:'导出全部企业资质',  
	            iconCls:'icon-save',
	            handler:function(){
	            	$("#jCompanyCredit").load("/daqin_manager/jobfair/jCompanyCredit.jsp?id="+job_fair_id,function(){
	            		$("#jCompanyCredit").show().window({
	    					
	    				});	
	            	});
    				
    					//'jCompanyCredit.jsp?id=' );

	            }  
	        },{  
	            text:'添加备注',  
	            iconCls:'icon-add',
	            handler:function(){
    					 remark();
	            }  
	        },{  
	            text:'发送短信',  
	            iconCls:'icon-copy',  
	            handler:function(){
					sendShotMessage();
	            }  
	        },{  
	            text:'返回',  
	            iconCls:'icon-undo',
	            handler:function(){
    					 window.parent.closeDialog();
	            }  
	        }],
			columns : [ [
			    {
				field : 'admin_name',
				title : '客户经理',
				width:20
			},{
				field : 'area_id',
				title : '地区',
				width:15
			},{
				field : 'member_type',
				title : '会员类型',
				width:30
			},{
				field : 'company_name',
				title : '企业名称',
				width: 150,
				formatter :function(value,row,index){
					var company= '<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>';
					if( row.remark ){
						var remark='<span style="color:red;padding-left:15px;">[ '+row.remark+' / '+row.operadmin+']</span>';
						return company+remark;
					}else{
						return company;
					}
				}
			},{
			    field : 'resumes',
			    title :'简历/待处理',
			    formatter : function(value,row,index){
			   		return row.resumes+'&nbsp;/&nbsp;<span style="color:red;">'+row.last_resumes+'</span>';
			    },
				width : 50,
				align : 'center'
			},{
				field : 'signed',
				title : '签到',
				width : 80,
				align:'center'
			},{
				field : 'company_remark',
				title : '企业备注',
				formatter :function (value,row,index ){
					if( row.company_remark ){
						var remark='<span style="color:green;">'+row.company_remark+'</span>';
						return remark;
					}else{
						return value;
					}
				},
				width:80
			},{
				field : 'doc',
				title : '招聘简章',
				width:30,
				formatter: function(value,row,index){
					if(value===null || value==""){
						 return '无';
					}else{
						return '<a href="'+cur_path+'/upload/download.jsp?path='+value+'&name='+row.company_name+'" target="_blank">下载</a>';
					}
				},
				align:'center'
			},{
				field : 'contact_person',
				title : '联系人',
				width:30
			},{
				field : 'contact_tel',
				title : '联系电话',
				width:50
			}
			] ],
	
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
			collapsible : false,
			rownumbers : true,
			nowrap : true,
			striped : true,
			border:false,
			fitColumns : true
		});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, undefined, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=jobfair_company_query&in_r=ad&in_school_id="+school_id+"&in_job_fair_id="+job_fair_id;
	return ls_url;	
}
function getUrl2() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_jobfair_company_xls&in_school_id="+school_id+"&in_job_fair_id="+job_fair_id;
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
			pageSize : 20
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagesize,ini_pagenum,ini_currentnum); 
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
function remark()
{
	var lo_selected = getCheckObj("resultId","请选择一行记录");
	if( !lo_selected ){
		return;
	}
	var company_id=lo_selected[0].company_id;
	var company_name=lo_selected[0].company_name;
	var remark = lo_selected[0].remark;
	$("#mem").val(remark);
	var dlg_title=company_name;
	$("#dlg_check").show().dialog({  title:dlg_title,
	    											width: 350,
	    											height: 180,
	    											fit:false,
	    											buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendData(company_id, remark);
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_check").dialog('close') ;
												                    }
												                }]
	    												   });
	$("#dlg_check").dialog("open");

 }
function sendData(company_id,remark)
{
	var mems=$("#mem").val();
	if(!mems ){
		$.messager.alert("提示信息","请填写内容！","info");
		return;
	}
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=jobfair_company_query&in_action=remark&in_r=ad&in_job_fair_id="+job_fair_id+"&in_school_id="+school_id+"&in_company_id="+company_id+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
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
	if( lo_selected && lo_selected.length==1 ){
		sendShotMessageTo( lo_selected[0].contact_tel );	
	}else{
    	$.messager.alert('提示信息','请选择一行记录！','info');
    	return false;							
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
	$('#fm_msg').form('submit', {
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

