/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() { 
	linkSelectCode('job_fair_level','in_education',false,'','');
	linkSelectCode('area_id','in_area_id',false,'','');
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '搜索招聘会',
		toolbar : [{  
            text:'删除',  
            iconCls:'icon-cancel1',
            handler:function(){
            	deleteStudent();
            			}  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
							edit();
            			}  
        },{  
            text:'审核',  
            iconCls:'icon-edit',  
            handler:function(){
							auditStudent();
            			}  
        },{  
            text:'发送短信',  
            iconCls:'icon-copy',  
            handler:function(){
				sendShotMessage();
            }  
        },{  
            text:'群发短信',  
            iconCls:'icon-copy',  
            handler:function(){
				sendAllShotMessage();
            }  
        },'-',{  
            text:'联系招客',  
            iconCls:'icon-copy',  
            handler:function(){
				showZhaoke();
            }  
        }
		],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 20,
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			}
		}]],
		
		columns : [ [{
			field :'add_time',
			title :'注册日期'
		},{
			field :'login_date',
			title :'登录日期'
		},{
			field : 'in_user_name',
			title : '姓名',
			formatter : function(value,row,index){
				if( !value ){
					value='空';
				}
				return '<a href="'+cur_path+'/daqin_manager/memberLogin.do?user_type=student&user_code='+row.user_code+'" target="_blank">'+value+'</a>';
			},
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			}
		},{
			field : 'down_count',
			title : '下载次数'
		},{
			field : 'resume_score',
			title : '完整度'
		},{
			field : 'in_sex',
			title : '性别'
		},{
			field : 'age',
			title : '年龄'
		},{
			field : 'grad_year',
			title : '毕业年份',
			align : 'center'
		},{
			field : 'education',
			title : '学历'
		},{
			field : 'in_profession',
			title : '专业'
		},{
			field : 'hope_areas',
			title : '意向地区'
		},{
			field : 'hope_positions',
			title : '意向岗位'
		},{
			field : 'in_hope_salary',
			title : '期望薪资'
		},{
			field : 'in_school_name',
			title : '学校',
			formatter : function (value,row,index){
				if(row.in_school_id && row.in_school_id !=null && row.in_school_id !=''){
					return '<a href="'+cur_path+'/school/info.do?id='+row.in_school_id+'" target="_blank">'+value+'</a>';
				}else{
					return value;
				}
			}
		},{
			field : 'in_contact_tel',
			title : '电话'
		},{
			field : 'in_user_email',
			title : '邮箱'
		},{
			field : 'area_id',
			title : '所在地区'
		},{
			field : 'zk_name',
			title : '招客'
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
		singleSelect : false,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		fitColumns:true,
		rowStyler: function(index,row){
			var cssStr="";
			if (row.flag==1){
					cssStr+='color:#FFAA25;';
			}
			return cssStr;
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_URLEncoding=UTF-8"+querystr;
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
function closePageCancel()
{
	$('#dlg_deal').dialog('close') ;
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
		var in_area_id=$('input[name=in_area_id]').val();
		var job_fair_name=   $('#in_job_fair_name').val() ;
		var job_fair_time_1=$('#in_job_fair_time_1').datebox('getValue');
		var job_fair_time_2=$('#in_job_fair_time_2').datebox('getValue');
		var job_fair_type=$('input[name=in_job_fair_type]').val();
		var job_fair_level=$('input[name=in_job_fair_level]').val();
		var job_fair_feature=$('input[name=in_job_fair_feature]').val();
		var preview=$('input[name=in_preview]:checked').val();
		var flag=$('input[name=in_flag]:checked').val();
		var url = getUrl();
		return url+"&in_job_fair_name="+job_fair_name+
		                "&in_area_id="+in_area_id+
				        "&in_job_fair_time_1="+job_fair_time_1+
				        "&in_job_fair_time_2="+job_fair_time_2+
				        "&in_job_fair_type="+job_fair_type+
				        "&in_job_fair_level="+job_fair_level+
				        "&in_job_fair_feature="+job_fair_feature+
				        "&in_preview="+preview+
				        "&in_flag="+flag;
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
	$("#if_deal")[0].src = "./jJobFairAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
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
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='../member/jLoginEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog({width:400,height:272,fit:false});
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
function auditStudent()
{
			var lo_selected;      //当前选中行
		    var ls_id = "";        //用户id
		    var ls_url;           //url
		    var ls_sign="";
		    lo_selected   = getCheckObj('resultId','请选择记录！'); 
		    if(!lo_selected[0]){
		    	$.messager.alert('提示信息','请选择记录！','info');
		    	return false;
		    }else{
		    	 $.messager.confirm('提示信息', '您确定要进行审核操作吗?', function(r){
		    	 	if (r){
		    	 		for(var i=0;i< lo_selected.length;i++){
	    					ls_id += "&in_student_mgr"+i+"="+ lo_selected[i].user_code;
	   					}
	   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action=audit" + ls_id+"&date="+new Date();
					    ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
		    	 	}
		    	 });
	     }
}

/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function deleteStudent() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的记录！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的记录！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_student_mgr"+i+"="+ lo_selected[i].user_code;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action=del" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除成功',downOrreloadData);
	    	 	}
	    	 });
     }
 }
 function searchStudent(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	searchForm("#resultId", getUrl, getData,1,cur_page_size);
}
 function showZhaoke( index ) {
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
	    	$.messager.alert('提示信息','请选择一行来查看！','info');
	    	return false;
	    }else{
			if (lo_selected[0].zk_id==null || lo_selected[0].zk_id ==''){
	    		$.messager.alert('提示信息','该企业并非招客注册，请重新选择！','info');
				return false;
			}
		    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
		    ls_id     = lo_selected[0].zk_id;
		    area_id = lo_selected[0].area_id;
		    company_id  = lo_selected[0].company_id;
	        lo_pg         = $("#resultId").datagrid("getPager");
	        li_pagenum    = lo_pg.pagination('options').pageNumber;

	        $('#if_deal')[0].src='./jZhaokeView.jsp?id='+ls_id+'&area_id='+area_id+'&company_id='+company_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();
		     $('#dlg_deal').dialog({width:390,height:210,fit:false});
		    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
	    }
	}
 /* ====================================*/
//函数作用：（发送一条消息）
/*====================================*/
function sendShotMessage(){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";

	lo_selected   = getCheckObj('resultId','请选择用户！'); 
	if(lo_selected.length!=1 ){
	    	$.messager.alert('提示信息','请选择一行记录！','info');
	    	return false;
	}else{
		console.info( lo_selected );
			sendShotMessageTo( lo_selected[0].in_contact_tel )
   }
}
/* ====================================*/
//函数作用：（发送一条消息）
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

/* ====================================*/
//函数作用：（批量发送短信）
/*====================================*/
function sendAllShotMessage(){
	var pg = $("#resultId").datagrid("getPager");
	var options = pg.pagination("options");
	if(options.total<1){
		$.messager.alert("提示信息","没有需要发短信的记录！","info");
		return;
	}
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送短信(共 "+ options.total + " 条)";
	$("#dlg_check3").show().dialog({  title:dlg_title,
		   width: 300,
		   height: 200,
		   fit:false,
		   modal:true,
		   buttons: [{
                 text:'发送',
                 iconCls:'icon-ok',
                 handler:function(){
           //var ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=short_message&in_action=addall&date=" + new Date();
           var sms_content = $("#bat_sms_content").val();
           if( sms_content=='' ){
        	   $.messager.alert("提示信息","请输入短信内容","info");
        	   return;
           }
           $("#in_sms_content").val( sms_content );
           var ls_url = getUrl()+'&in_action=batSendSMS';
$('#fm').form('submit', {
	url: ls_url,
	onSubmit: function() {
		return $(this).form('validate');
	},
	success: function(data) {
		data = decodeURIComponent(data);
		var re = eval("[" + data + "]");
		console.log( re );
		if (re.length > 0 && re[0].returncode == 'ok') {
			var res = re[0].queryresult;
			if( res[0].ok=='ok'){
				$.messager.alert('提示信息',res[0].msg,'info',function(){//提示信息
					$("#dlg_check3").dialog('close') ;
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
                     $("#dlg_check3").dialog('close') ;
                 }
             }]
		   });
$("#dlg_check3").dialog("open");
}