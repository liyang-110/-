/* =======================================================*/
// 功能：企业管理
/* ===================================================== */
$(function() {
	linkSelectCode('area_id','in_area_id',false,'','');
	//linkSelectCode('company_nature','in_company_nature',false,'','');
	//linkSelectCode('company_person_num','in_company_person_num',false,'','');
	//linkSelectCode('company_registered_capital','in_company_registered_capital',false,'','');
	linkSelectCode('member_type','in_member_type',false,'','');
	$('#searchAndreloadData').bind('click',function(){
		searchCompany();
		//searchAndreloadData();
	});			
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
		toolbar:[/*{  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
					//		add();
				$.messager.alert("提示信息","正在开发！","info");
           			 }  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
							edit();
            			}  
        },*/{  
            text:'批量删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
							del();
            			}  
        },{  
            text:'批量审核',  
            iconCls:'icon-search',  
            handler:function(){
							batCheck();
           	 			}  
           	 			
        }/*,{  
            text:'设置登陆账号',  
            iconCls:'icon-search',  
            handler:function(){
							setLogin();
           	 		}  	
        }*/,{  
            text:'资源分配',  
            iconCls:'icon-copy',  
            handler:function(){
				//setAdvertisement();
				assignAdmin();
            }  
        },{  
            text:'发送短信',  
            iconCls:'icon-copy',  
            handler:function(){
				sendShotMessage();
            }  
        }],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [{
			field : 'add_time',
			title : '注册时间'
		},{
			field : 'audit_time',
			title : '审核时间'
		},{
			field : 'zk_name',
			title : '招客'
		},{
			field : 'admin_name',
			title : '招聘顾问'
		},{
			field : 'area_id',
			title : '地区'
		},{
			field : 'member_type',
			title : '会员类型'
		},{
			field : 'company_name',
			title : '企业名称',
			formatter : function(value,row,index){
				var pic=row.company_pic=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_pic+'" target="_blank"><span class="red">[代]</span></a>';
				var img=row.company_img=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_img+'" target="_blank"><span class="red">[执]</span></a>';
				var status="";
				var doc="";
				var email = "";
				if( row.email_verify =='success'){
					email ='<a class="green" title="'+row.user_email+'">[邮]</a>';
				}
				if(row.status=='1'){
					status='<span class="green">[审]</span>';
				}else if(row.status=='2'){
					status='<span class="red">[退]</span>';
				}else if(row.status=='3'){
					status='<span style="color:#c90;">[逾]</span>';
				}
				if( row.doc && row.doc!=""){
					doc= '<a href="'+cur_path+'/upload/download.jsp?path='+row.doc+'&name='+row.company_name+'" target="_blank" style="color:#669900;">[简]</a>';
				}
				return email+doc+pic+img+status+'<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'
							+value+'</a>';
			}
		},{
			field : 'contact_person',
			title : '联系人'
		},{
			field : 'contact_tel',
			title : '联系电话'
		},{
			field : 'email',
			title : '电子邮件'
		},{
			field : 'company_nature',
			title : '企业类型'
		},{
			field : 'industry_name',
			title : '所属行业'
		}/*,{
			field : 'establish_date',
			title : '成立日期'
		},{
			field : 'company_registered_capital',
			title : '注册资金'
		},{
			field : 'company_addr',
			title : '公司地址'
		},{
			field : 'company_person_num',
			title : '单位人数'
		}*/
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
		singleSelect : false,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		rowStyler: function(index,row){
			/*
			var cssStr="";
			if (row.zk_id!=null && row.zk_id !=''){
					cssStr+='background-color:#67FFAE;'; // return inline style
			}
			return cssStr;
			*/
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
function assignAdmin()
{
		var li_currentnum =0; //当前行
		var li_pagesize   =0; //每页行数
		var li_pagenum    =0; //页码

		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择企业！','info');
	    	return false;
	    }else{
		    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	        lo_pg         = $("#resultId").datagrid("getPager");
	        li_pagenum    = lo_pg.pagination('options').pageNumber;
   	 		li_pagesize = lo_pg.pagination("options").pageSize;
   	 		
   	 		var input="";
   	 		$("#company_list").html("");
   	 		for(var i=0;i< lo_selected.length;i++){
  					ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
 						input='<li><input type="hidden" name="in_company_'+lo_selected[i].company_id+'" value="'+lo_selected[i].company_id+'"/>'+lo_selected[i].company_name+'</li>';
 						$("#company_list").append( input );
 			}
   	 	}

     $("#dlg_change_admin").show().dialog({  title:'资源分配',
	    												   width: 390,
	    												   height: 260,
	    												   fit:false,
	    												   buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       submit_admin_change(function(){
												                        $("#dlg_change_admin").dialog('close');
												                        closepage(li_pagesize,li_pagenum,li_currentnum);
												                    });
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_change_admin").dialog('close') ;
												                    }
												                }]
	    												   });
}
function submit_admin_change(ins_upFun)
{
   var 	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_user_company_query&r=ad&in_action=chown&in_URLEncoding=UTF-8&date="+new Date();
	
   $('#fm2').form('submit', {
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
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_company_query&r=ad&in_URLEncoding=UTF-8"+querystr;
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
	li_pagesize = lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src =  "./jCompanyAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
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
    					ls_id += "&in_company_mgr"+i+"="+ lo_selected[i].company_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_02" + ls_id+"&date="+new Date();
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
	    var lo_pg         = $("#resultId").datagrid("getPager");
	    var li_pagenum = lo_pg.pagination('options').pageNumber;
	    var li_pagesize  = lo_pg.pagination('options').pageSize;
		searchData("#resultId", getUrl, getData, li_pagenum, li_pagesize, ini_currentnum );
		/*
		$('#resultId').datagrid( {
			pageNumber : 1,
			pageSize : ini_pagesize
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum);
		*/ 
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
	    ls_id     = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum = lo_pg.pagination('options').pageNumber;
        li_pagesize  = lo_pg.pagination('options').pageSize;
        
        $('#if_deal')[0].src='./jCompanyEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
	    ls_id     = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jCompanyView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
	//ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
	searchData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
function closePageCancel(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
}
/* ====================================*/
// 函数作用：（批量审核通过）
/*====================================*/
function batCheck(){
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要审核的信息！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要审核的信息！','info');
	    	return false;
	    }else{
	    	for(var i=0;i< lo_selected.length;i++){
    			ls_id += "&in_company_mgr"+i+"="+ lo_selected[i].company_id;
   			}
	    	$("#dlg_check").show().dialog({  title:"审核",
	    												   width: 350,
	    												   height: 220,
	    												   fit:false,
	    												   buttons: [{
												                    text:'通过',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendCheck('Y',ls_id);
												                    }
												                },{
												                    text:'不通过',
												                    handler:function(){
												                        sendCheck('N',ls_id);
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
 }
function sendCheck(deal_type,ls_id)
{
	var mem=$("#mem").val();
	if (deal_type=='N' && mem==""){
		$.messager.alert('提示信息','请输入批注意见','info');
		return;
	}
	var mems =   mem ;
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_audit&in_r=ad&in_buss_id=company" + ls_id+"&in_deal_type="+deal_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}
/*
设置登陆账户
*/
function setLogin() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].company_id;
	    ls_user_code = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
		if(ls_user_code == null){
        	$('#if_deal')[0].src='./jLoginAdd.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	   	 	$('#dlg_deal').dialog('open').dialog('setTitle','开通用户'); 
			
		}else {
        	$('#if_deal')[0].src='./jLoginEdit.jsp?id='+ls_user_code+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	   		$('#dlg_deal').dialog('open').dialog('setTitle','修改用户'); 
	    
		}
    }
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
		var member_type=$('input[name=in_member_type]').val();

		var url = getUrl();
		return url+"&in_job_fair_name="+job_fair_name+
				        "&in_job_fair_time_1="+job_fair_time_1+
				        "&in_job_fair_time_2="+job_fair_time_2+
				        "&in_job_fair_type="+job_fair_type+
				        "&in_job_fair_level="+job_fair_level+
				        "&in_job_fair_feature="+job_fair_feature+
				        "&in_member_type="+member_type;
	}
	function searchCompany(){
		var cur_page_size = $('#resultId').datagrid('options').pageSize;
		searchData("#resultId", getUrl, getData,1,cur_page_size);
	}
	function searchData(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
		var ls_url = inf_url();
		
	    if (ini_page && ini_page > 0)
			ls_url = ls_url + "&in_page=" + ini_page;
		if (ini_pagesize && ini_pagesize > 0)
			ls_url = ls_url + "&in_pagenum=" + ini_pagesize;

	    $('#fm').form('submit', {
	        url: ls_url,
			type : "post",
			dataType : "text",
			onSubmit : function(){
				$.messager.progress({
					text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
				});
				return true;
			},
			success : function(data) {
				$.messager.progress("close");
				if (!data)
					return;
				data = decodeURIComponent(data);
				 out_return = eval("[" + data + "]");
				if (out_return.length > 0 && out_return[0].returncode == 'ok') {
					rowcount = out_return[0].querycount;
					if(rowcount<1&&!tip){
						 //$.messager.alert('提示信息','无查询结果');   
						 
					}
					out_return = "{\"total\":" + rowcount + ",\"rows\":"+ JSON.stringify(out_return[0].queryresult) + "}";
					out_return = eval("[" + out_return + "]");
					//处理页面一致
					if (ini_page && ini_page > 0){
						$(ins_id).datagrid( {
							pageNumber : ini_page,
							pageSize   : ini_pagesize
					    });
	                }
//					else{
//						inf_deal();
//						}
				  //加载数据
				   $(ins_id).datagrid('loadData', out_return[0]);
			
				   initPaperareafm(ins_id,inf_url,inf_deal,ini_pagesize);
				    //选中当前行
				   if (ini_currentrow>=0)
					{
						$(ins_id).datagrid('selectRow', ini_currentrow);
					}
				} else if (out_return.length > 0 && out_return[0].returncode == 'fail') {
					showError(out_return[0].errordesc);
					
				}
			}
	    });
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
