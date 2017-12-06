var reason = ["不按规定时间参加招聘会",
					"夸大宣传",
					"有收取学生费用行为",
					".其他",
					];
/* =======================================================*/
// 功能：企业管理
/* ===================================================== */
$(function() {
	linkSelectCode('area_id','in_area_id',false,'','');
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
function getData(){
		$('#resultId').datagrid( {
			title : false, // job_fair_id==""?title:false,
			columns : [ [
			{
				field : 'add_time',
				title : '时间'
			},{
				field : 'area_id',
				title : '地区'
			},{
				field : 'company_name',
				title : '企业名称',
				formatter :function(value,row,index){
					if( value != null ){
						return '<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>';
					}else{
						return '';
					}
				}
			},{
				field : 'member_type_name',
				title : '会员类型'
			},{
				field : 'admin_name',
				title : '招聘顾问'
			},{
				field : 'mem',
				title : '原因',
				formatter :function(value,row,index){
					if( value ){
						return value.replace(/\[BR\]/g,'');
					}else{
						return '';
					}
				}
			},{
				field : 'school_name',
				title : '学校名称',
				formatter :function(value,row,index){
					if( value != null ){
						return '<a href="'+cur_path+'/school/info.do?id='+row.school_id+'" target="_blank">'+value+'</a>';
					}else{
						return '';
					}
				}
			},{
				field : 'job_fair_name',
				title : '招聘会名称',
				formatter :function(value,row,index){
					if( value != null ){
						return '<a href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+'</a>';
					}else{
						return '';
					}
				}
			}/* ,{
				field : 'contact_person',
				title : '联系人'
			},{
				field : 'contact_tel',
				title : '联系电话'
			},{
				field : 'flag',
				title : '操作',
				formatter : function(value,row,index){
					if(value==1){
						return '<button onclick="blacklist(\''+row.company_id+'\',false);">移出黑名单</button>';
					}else{
						return '<button onclick="blacklist(\''+row.company_id+'\',true);">加入黑名单</button>';
					}
				}
			} */
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
			border:false
		});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, undefined, undefined);
}
function searchCompany(){
	searchData("#resultId", getUrl, getData);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=black_list&in_r=ad";
	return ls_url;	
}
function getUrl2() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=jobfair_company_xls&in_school_id="+school_id+"&in_job_fair_id="+job_fair_id;
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
/* ====================================*/
// 函数作用：（加入\移出黑名单）
/*====================================*/
function blacklist(company_id,flag)
{
		if( flag == true ){
			var dlg_title="加入黑名单";
	     	$("#dlg_check").show()
     								  .dialog({  title:dlg_title,
	    											width: 350,
	    											height: 280,
	    											fit:false,
	    											buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendData(company_id,flag);
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_check").dialog('close') ;
												                    }
												                }]
	    												   });
		  $("#dlg_check").dialog("open");
	}else{
		  $.messager.confirm("提示信息","确定移出黑名单！", function(r){
		  	if(r){
		  		sendData(company_id,flag);
		  	}
		  });
		 
	}
 }
function sendData(company_id,flag)
{
	var mems="";
	var reason_type="";
	if(flag==true){
		mems =$("#mem").val();
		reason_type = $("input[name=reason_type]:checked").val();
		if( typeof(reason_type)!='undefined' ){
			mems = reason_type+"[BR]"+mems;
		}
		if(mems==""){
			$.messager.alert("提示信息","请选择或填写加入黑名单的原因！","info");
			return;
		}
	}
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=jobfair_company_query&in_action=black&in_job_fair_id="+job_fair_id+"&in_school_id="+school_id+"&in_company_id="+company_id+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
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