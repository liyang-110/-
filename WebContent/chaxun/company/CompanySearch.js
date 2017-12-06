/* =======================================================*/
// 功能：高校/人才市场给企业发送的信息
/* ===================================================== */
$(function() {
		getData();
		//ajaxdata1();
		searchCompany();
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
			field : 'admin_name',
			title : '招聘顾问',
			width : 80
		},{
			field : 'area_name',
			title : '地区',
			width : 80
		},{
			field : 'member_type',
			title : '会员类型',
			width : 80
		},{
			field : 'end_date',
			title : '会员截止',
			width: 100
		},{
			field : 'company_name',
			title : '企业名称',
			width : 300,
			formatter : function(value,row,index){
				var pic=row.company_pic=='no'?'':'<span class="red">[代]</span>';
				var img=row.company_img=='no'?'':'<span class="red">[执]</span>';
				var status="";
				var doc="";
				var email = "";
				if( row.email_verify =='success'){
					email ='<a style="color:green;" title="'+row.user_email+'">[邮]</a>';
				}
				if(row.status=='1'){
					status='<span class="green">[审]</span>';
				}else if(row.status=='2'){
					status='<span class="red">[退]</span>';
				}else if(row.status=='3'){
					status='<span style="color:#c90;">[逾]</span>';
				}
				if( row.doc && row.doc!=""){
					doc= '<span style="color:#669900;">[简]</span>';
				}
				return email+doc+pic+img+status+value;
			},
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			}
		},{
			field : 'add_time',
			title : '注册时间',
			width:  100
		},{
			field : 'login_date',
			title : '最后登录',
			width: 100
		}
		] ],
		type : 'POST',
		nowrap : false,
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_find&in_r=ad&in_action=searchall&in_URLEncoding=UTF-8&date="+new Date();
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
	function searchCompany(){
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
