/* =======================================================*/
// 功能：高校/人才市场给企业发送的信息
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#datagrid').datagrid( {
		title : false,
		toolbar:false,
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		{
			field : 'job_fair_time',
			title : '日期',
			width : 125
		},{
			field : 'job_fair_type',
			title : '类型',
			width : 125
		},{
			field : 'job_fair_name',
			title : '招聘会名称',
			width : 300,
			formatter : function(value,row,index){
				return '<a href="/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+"</a>";
			}
		},{
			field : 'action',
			title : '操作',
			width : 60,
			formatter : function(value,row,index){
				return '<button onclick="applyJobfair(\''+row.job_fair_id+'\');">申请</button>';
			}
		}
		] ],
		type : 'POST',
		nowrap : false,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 10,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : false,
		collapsible : false,
		rownumbers : true,
		striped : true,
		checkbox:true,
		fitColumns: true
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#datagrid', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=job_fair_search&in_r=ad&in_URLEncoding=UTF-8&in_company_id="+company_id;
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
		$('#datagrid').datagrid( {
			pageNumber : 1,
			pageSize : 20
		    });
		ajaxData('#datagrid',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
	}

	function searchJobfair(){
		searchData("#datagrid", getUrl, getData);
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
	/* =======================================================*/
	// 函数作用：申请参加招聘会
	/* ===================================================== */
	function applyJobfair(job_fair_id ){
		$.messager.confirm("提示信息",'<span style="color:red;">申请不可撤销,继续申请点击[确定],或点击[取消]退出操作?</span>',function(r){
			if(r){
				var url= cur_path +"/sheetAction.do?method=applySheet&ids=" +job_fair_id+"&flow_id=001&buss_id=apply";
				$.post(url, {
					company_id :company_id,
					user_code :user_code
				}, function(data){
			        if(data=="succ"){
			          $.messager.alert('提示信息', '申请成功，等待高校审核!','info',function (){downOrreloadData('','','');});
			        }else if(data =="usedout"){
			          $.messager.alert('提示信息', '会员套餐招聘会数量已用完，申请失败!','info');
			        }else{
			        	show_result( data );
			          // $.messager.alert('提示信息','操作失败，您可能已申请过该招聘会，或者学校已向您发了邀请！','info');
			        }
			    });
			}
		});

	 }
	function show_result( data ){
			if(data=="attended"){
				$.messager.alert("提示信息","您已预定招聘会，请不要重复申请！","warning");
			}else if(data=="applied"){
				$.messager.alert("提示信息","您已申请该招聘会，请等待学校审核！","warning");
			}else if(data=="invited"){
				$.messager.alert("提示信息","学校已向你发出邀请，请及时审核！","warning");
			}else if(data=="done"){
				$.messager.alert("提示信息","您已申请该招聘会，请不要重复申请预定！","warning");
			}else if(data=="nologin"){
				$.messager.alert("提示信息","请用企业账号登陆后预约！","error");
			}else if(data=="noaudit"){
				$.messager.alert("提示信息","您的账号未通过审核，不能申请招聘会！","error");
			}else if(data=="nomoney"){
				$.messager.alert("提示信息","账号点数不足，无法申请招聘会！","error");
			}else if(data=="over"){
				$.messager.alert("提示信息","该招聘会展位已满，请选择其他招聘会！","error");
			}else if(data=="end"){
				$.messager.alert("提示信息","预定已经结束，请选择其他招聘会！","error");
			}else if(data=="black"){
				$.messager.alert("提示信息","您的账户已被举办学校列人黑名单，无法预定该招聘会！<br/>如有异议，请联系211校招网！","error");
			}else if( data=="usedout"){
				$.messager.alert('提示信息', '会员套餐招聘会数量已用完，申请失败!','error');
			}else if(data =="outdate" ){
				$.messager.alert('提示信息', '招聘会举办时间不在会员有效期内，申请失败!','error');
			}else{
				$.messager.alert("提示信息","预订失败！","error");
			}
	}