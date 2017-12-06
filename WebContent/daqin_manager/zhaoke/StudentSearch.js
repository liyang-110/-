/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() { 
	linkSelectCode('job_fair_level','in_education',false,'','');

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
            text:'审核',  
            iconCls:'icon-edit',  
            handler:function(){
							auditStudent();
            			}  
        },'-',{  
            text:'联系指导师',  
            iconCls:'icon-copy',  
            handler:function(){
				showZhaoke();
            }  
        },'-',{  
            text:'屏蔽简历',  
            iconCls:'icon-copy',  
            handler:function(){
				editResume("hide_resume");
            }  
        },{  
            text:'激活简历',  
            iconCls:'icon-copy',  
            handler:function(){
            	editResume("open_resume");
            }  
        },'-',{  
            text:'登记入职',  
            iconCls:'icon-copy',  
            handler:function(){
            	editHire();
            }  
        }
		],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 20
		}]],
		columns : [ [{
			field :'add_time',
			title :'注册日期',
			width : 50
		},{
			field :'audit_time',
			title :'审核日期',
			width : 50
		},{
			field :'status',
			title :'状态',
			formatter : function(value,row,index){
				if( row.audit_time ){
					return '已审';
				}else if( row.audit_remark ){
					return '<span style="color:red;">未通过('+row.audit_remark+')</span>';
				}else{
					return '待审核';
				}
			},
			width : 50
		},{
			field : 'zk_name',
			title : '指导师',
			width : 30
		},{
			field : 'hire_status',
			title : '是否入职',
			width : 30,
			formatter:function(value,row,index){
				if('HIRE'== value ){
					return '<a title="'+row.hire_date+'">已入职</a>';
				}
			}
		},{
			field : 'in_user_name',
			title : '姓名',
			formatter : function(value,row,index){
				var is_open="";
				if(row.is_open=='0'){
					is_open='<span style="color:red">[屏蔽]</span>';
				}else if(row.is_open=='1'){
					is_open='<span style="color:green">[激活]</span>';
				}
				return is_open+'<a href="'+cur_path+'/daqin_manager/memberLogin.do?user_type=student&user_code='+row.user_code+'" target="_blank">'+value+'</a>';
			},
			width : 50
		},{
			field : 'resume_score',
			title : '完整度',
			width : 20
		}/*,{
			field : 'is_open',
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
		}*/,{
			field : 'in_school_name',
			title : '学校',
			formatter : function (value,row,index){
				if(row.in_school_id && row.in_school_id !=null && row.in_school_id !=''){
					return '<a href="'+cur_path+'/school/info.do?id='+row.in_school_id+'" target="_blank">'+value+'</a>';
				}else{
					return value;
				}
			},
			width : 50
		},{
			field : 'in_contact_tel',
			title : '电话',
			width : 50
		},{
			field : 'in_user_email',
			title : '邮箱',
			width : 50
		},{
			field : 'area_id',
			title : '所在地区',
			width : 20
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
    	var preview = lo_selected[0].preview;
    	if(preview == 1){
	    	$.messager.alert('提示信息','不能修改学校待审核招聘会！','info');
	    	return false;
    	}
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].job_fair_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jJobFairEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
function auditStudent()
{
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	var lo_pg;
	
	var lo_selected;      //当前选中行
    var ls_id = "";        //用户id
    var ls_url;           //url
    var ls_sign="";
    lo_selected   = getCheckObj('resultId','请选择记录！'); 
    if(!lo_selected[0]){
    	$.messager.alert('提示信息','请选择记录！','info');
    	return false;
    }else{
    	/*
    	 $.messager.confirm('提示信息', '您确定要进行审核操作吗?', function(r){
    	 	if (r){
    	 		for(var i=0;i< lo_selected.length;i++){
					ls_id += "&in_student_mgr"+i+"="+ lo_selected[i].user_code;
				}
				ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action=audit" + ls_id+"&date="+new Date();
			    ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
    	 	}
    	 });
    	*/
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
	 	li_pagesize = lo_pg.pagination("options").pageSize;
	 	
 		var input="";
 		$("#student_list").html("");
 		for(var i=0;i< lo_selected.length;i++){
				ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
					input='<li><input type="hidden" name="in_student_mgr'+lo_selected[i].user_code+'" value="'+lo_selected[i].user_code+'"/>'+lo_selected[i].in_user_name+'</li>';
					$("#student_list").append( input );
		}
	}
    $("#dlg_student_audit").show().dialog({  title:'招客注册学生审核',
		   width: 390,
		   height: 260,
		   fit:false,
		   buttons: [{
                 text:'通过',
                 iconCls:'icon-ok',
                 handler:function(){
                	 submit_student_check('Y',function(){
	                     $("#dlg_student_audit").dialog('close');
	                     closepage(li_pagesize,li_pagenum,li_currentnum);
                 });
                 }
             },{
                 text:'未通过',
                 iconCls:'icon-cancel',
                 handler:function(){
                	 submit_student_check('N',function(){
	                     $("#dlg_student_audit").dialog('close');
	                     closepage(li_pagesize,li_pagenum,li_currentnum);
                 });
                 }
             },{
                 text:'取消',
                 handler:function(){
                     $("#dlg_student_audit").dialog('close') ;
                 }
             }]
		   });	    
}
function submit_student_check(flag , ins_upFun)
{
   if('N'==flag ){
	   var remark = $("#in_remark").val();
	   if( remark==''){
		   $.messager.alert('提示信息','未通过,请输入备注','warning');
		   return;
	   }
   }
   var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action=audit&in_flag="+flag+"&date="+new Date();
   $('#student_audit_fm').form('submit', {
        url: ls_url,
        onSubmit: function() {
            return true;
        },
        success: function(data) {
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	}else if(queryresult[0].ok=='ok' && queryresult[0].msg){
	                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'info',function(){//提示信息
	                 	if(typeof(ins_upFun) !='undefined'){
	                 		ins_upFun();
	                 	}
	            	});
            	}else{
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f','未知错误！','error');

            	}
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
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
 
 //屏蔽/激活简历   参数in_cation：hide_resume（屏蔽）， open_resume（激活）
 function editResume(in_action){
 		var lo_selected;      //当前选中行
 		var ls_id = "";        //用户id	
 		lo_selected = getCheckObj('resultId','请选择要操作的信息！'); 
 		if(lo_selected.length!=1){
 			$.messager.alert('提示信息','请选择一行！','info');
 	    	return false;
 		}
 		 if(!lo_selected[0]){
 	    	$.messager.alert('提示信息','请选择要操作的信息！','info');
 	    	return false;
 	    	}else{
 	    			if(in_action=='hide_resume'){
 	    				$.messager.confirm('提示信息', '您确定要屏蔽简历吗?', function(r){
 	    				urldo(r);
 	    			});
 	    			}else if(in_action=='open_resume'){
 	    				$.messager.confirm('提示信息', '您确定要激活简历吗?', function(r){   
 	    				urldo(r);
 	    				});
 	    			}  
 	    			var urldo=function(r){
 	    				if(r){
 	    						ls_id = "&in_student_mgr"+"="+ lo_selected[0].user_code;
 	    						ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action="+in_action+ ls_id+"&date="+new Date();
 	    						ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
 	    					}
 	    			};	
 	    	     }
 }
 function editHire(){
		var li_currentnum =0; //当前行
		var li_pagesize   =0; //每页行数
		var li_pagenum    =0; //页码
		
		var lo_selected;      //当前选中行
	    var lo_pg;            //分页对象

	    //得到选中行对象 code:请选择一行用户信息！
	    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
	    if(lo_selected.length!=1){
	    	$.messager.alert('提示信息','请选择一行！','info');
	    	return false;
	    }else{
		    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	        lo_pg         = $("#resultId").datagrid("getPager");
	        li_pagenum    = lo_pg.pagination('options').pageNumber;
	        li_pagesize	  = lo_pg.pagination('options').pageSize;
	        $("#dlg_eidt_hire_fm").form("load",{
	        	user_name : lo_selected[0].in_user_name,
	        	in_user_code : lo_selected[0].user_code,
	        	in_begin_date : (new Date()).Format("yyyy-MM-dd")
	        });
	        var ls_url ='/esbServer.do?method=execProc&in_r=ad&methodId=student_work';
	        $('#dlg_eidt_hire').show().dialog({width:390,height:290,fit:false,buttons: [{
	            text:'确定',
	            iconCls:'icon-ok',
	            handler:function(){
	            	$("#dlg_eidt_hire_fm").form("submit",{
	            	        url: ls_url,
	            			type : "post",
	            			dataType : "text",
	            			onSubmit : function(){
	            				if($(this).form('validate') ){
	                				$.messager.progress({
	                					text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
	                				});
	            					return true;
	            				}
	            				return false;
	            			},
	            			success : function(data) {
	            				$.messager.progress("close");
	            				data = decodeURIComponent( data );
	            				out_return = eval("[" + data + "]");
	            				if(out_return[0].returncode =='ok'){
	            					var list = out_return[0].queryresult;
	            					if( list[0].ok== 'ok' ){
	            						$.messager.alert("提示信息","操作成功","info",function(){
	            							 $("#dlg_eidt_hire").dialog('close') ;
	            							 searchForm('#resultId',getUrl,getData,li_pagenum,li_pagesize,li_currentnum );
	            						});
	            						return;
	            					}else if( list[0].msg ){
	            						$.messager.alert("提示信息",list[0].msg,"error");
	            						return;
	            					}
	            				}
	            				$.messager.alert("提示信息","操作失败","error");
	            			}
	            	});
	            }
	        },{
	            text:'取消',
	            handler:function(){
	                $("#dlg_eidt_hire").dialog('close') ;
	            }
	        }]}).dialog('open').dialog('setTitle','学生入职登记'); 
	    }
	}