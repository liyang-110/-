/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function(){
	linkSelectCode('area_id','in_area_id',false,'','');
	linkSelectCode('area_id','in_area_id2',false,'','');

	getData();
	ajaxdata1();
	
	$('#searchAndreloadData').bind('click',function(){
		searchData("#resultId", getUrl, getData);
	});
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		toolbar:[{  
            text:'注册查询',  
            iconCls:'icon-view',
            handler:function(){
            	companyStatus();
            }  
        },{  
            text:'查看详情',  
            iconCls:'icon-view',
            handler:function(){
            	companyDetail();
            }  
        },{  
            text:'资源分配',  
            iconCls:'icon-copy',  
            handler:function(){
				//setAdvertisement();
				assignAdmin();
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
			field : 'add_time',
			title : '预定时间',
			width : 120
		},{
			field : 'area_id',
			title : '地区',
			width : 50
		},{
			field : 'company_name',
			title : '公司名称',
			width : 200
		},{
			field : 'job_fair_name',
			title : '招聘会',
			width : 200,
			formatter : function(value,row,index ){
				return '<a title="'+value+'" href="/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+'</a>';

			}
		},{
			field : 'contact_person',
			title : '联系人',
			width : 80
		},{
			field : 'contact_tel',
			title : '电话',
			width : 120
		},{
			field : 'email',
			title : '邮箱',
			width : 120
		},{
			field : 'user_name',
			title : '招聘顾问',
			width : 80
		},{
			field : 'remark',
			title : '处理结果',
			width : 80,
			formatter : function(value,row,index ){
				if( value=='' || value == null ){
					return '<button onclick="dealApply(\''+row.apply_id+'\',\''+row.company_name+'\','+index+');">回访</button>';

				}else{
					return '<a href="javascript:;" onclick="dealApply(\''+row.apply_id+'\',\''+row.company_name+'\','+index+');">查看</a>';
				}
			}
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
		singleSelect : false ,
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
		},
		onDblClickRow : function(index ,row ){
			var introduce = row.introduce;
			var recruit = row.recruit;
			var company_nature = row.company_nature;
			var industry = row.industry;
			var content = '<div class="detail-dlg" style="height:280px;width:405px;overflow:scroll;">'+
							'<h6>简介</h6><p>'+introduce+'</p><h6>招聘:</h6><p>'+recruit+'</p>'+
							'<h6>行业</h6><p>'+industry+'</p><h6>性质:</h6><p>'+company_nature+'</p>';
			// $.messager.alert(row.company_name,content );
			$("#dd").dialog({
			    title:row.company_name,   
			    width: 420,   
			    height: 320,   
			    closed: false,   
			    cache: false,   
			    modal: false,
			    content :content 
			});
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
		ls_url = cur_path + "/esbServer.do?method=execProc&in_r=ad&methodId=job_fair_apply&in_URLEncoding=UTF-8"+querystr;
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
function companyStatus()
{
	var company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    //if(lo_selected.length!=1){
    //	$.messager.alert('提示信息','请选择一行信息！','info');
    //	return false;
    //}
    if(lo_selected.length>1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }else if(lo_selected.length>=1 ){
        company_name = lo_selected[0].company_name;
    }else{
    	company_name='';
    }
    $('#if_deal')[0].src='../jCompanySearchQuick.jsp?in_company_name='+company_name+'&date='+new Date();
	$('#dlg_deal').dialog('open').dialog('setTitle','企业会员注册查询'); 
}
function companyDetail()
{
	var company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
	var row=lo_selected[0];
	var introduce = row.introduce;
	var recruit = row.recruit;
	var content = '<div style="height:280px;width:405px;overflow:scroll;"><p>简介</p><p>'+introduce+'</p><p>招聘:</p><p>'+recruit+'</p>';
	// $.messager.alert(row.company_name,content );
	$("#dd").dialog({
	    title:row.company_name,   
	    width: 420,   
	    height: 320,   
	    closed: false,   
	    cache: false,   
	    modal: false,
	    content :content 
	});
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
	    lo_selected   = getCheckObj('resultId','请选择！'); 
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
 						input='<li><input type="hidden" name="in_company_'+i+'" value="'+lo_selected[i].apply_id+'"/>'+lo_selected[i].company_name+'</li>';
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
   var 	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=job_fair_apply&r=ad&in_action=chown&in_URLEncoding=UTF-8&date="+new Date();
	
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
function dealApply( apply_id, company_name,index ){
	$("#fm3").find("input[name='in_apply_id']").val( apply_id );
	var rows = $("#resultId").datagrid("getRows");
	var remark = rows[index].remark;
	if( remark ){
		$("#fm3").find("textarea[name='in_remark']").val( remark );
	}else{
		$("#fm3").find("textarea[name='in_remark']").val( '' );
	}
    var lo_pg         = $("#resultId").datagrid("getPager");
    var li_pagenum    = lo_pg.pagination('options').pageNumber;
	var li_pagesize = lo_pg.pagination("options").pageSize;
    $("#deal_apply").show().dialog({  title:company_name,
		   width: 390,
		   height: 260,
		   fit:false,
		   buttons: [{
                 text:'确定',
                 iconCls:'icon-ok',
                 handler:function(){
                	 submit_deal_apply(function(){
	                     $("#deal_apply").dialog('close');
	                     closepage(li_pagesize,li_pagenum,index );
                 });
                 }
             },{
                 text:'取消',
                 handler:function(){
                     $("#deal_apply").dialog('close') ;
                 }
             }]
		   });

}
function submit_deal_apply(ins_upFun)
{
   var 	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=job_fair_apply&r=ad&in_action=deal&in_URLEncoding=UTF-8&date="+new Date();
	
   $('#fm3').form('submit', {
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
function viewRemark( company_name,remark ){
	$.messager.alert(company_name,remark);
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
				var rowcount = out_return[0].querycount;
				var queryresult = out_return[0].queryresult;
				if( rowcount == -1 && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	 	return;
            	}
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
//				else{
//					inf_deal();
//					}
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