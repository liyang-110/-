/* =======================================================*/
// 功能：待审核文件
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
		$('#searchAndreloadData').bind("click",function(){
			searchData("#resultId", getUrl, getData);
		});

	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		toolbar :[{  
            text:'学校会员中心',  
            iconCls:'icon-view',  
            handler:function(){
            	schoolCenter();
           	}  
        }
		],
		columns : [ [
		  {
			field : 'add_time',
			title : '申请时间',
			width: 100
		},{
			field : 'apply_dept_name',
			title : '申请企业',
			formatter : function(value,row,index){
				// row.apply_type == 'company'
				if( row.attend==1 ){
					return '<a href="'+cur_path+'/company/info.do?id='+row.apply_personid+'" target="_blank" title="'+value+'"><font color="green">'+value+'</font></a>';
				}else{
					return '<a href="'+cur_path+'/company/info.do?id='+row.apply_personid+'" target="_blank" title="'+value+'">'+value+'</a>';
				}
			},
			width: 200
		},{
			field : 'job_fair_name',
			title : '招聘会',
			formatter : function(value,row,index){
				var remark='';
				if( row.remark ){
					remark='<span style="color:red;">'+row.remark+'</span>';
				}
				return '<a href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" title="'+row.job_fair_time+'&nbsp;'+value+'" target="_blank">'+row.job_fair_time+'&nbsp;'+value+'</a>'+remark;
			},
			width:360
		},{
			field : 'invited_dept_name',
			title : '审核学校',
			formatter : function(value,row,index){
				if( row.apply_type == 'school'){
					return '<a href="'+cur_path+'/company/info.do?id='+row.deptid+'" target="_blank" title="'+value+'">'+value+'</a>';
				}else if( row.apply_type == 'company' ){
					return '<a href="'+cur_path+'/school/info.do?id='+row.deptid+'" target="_blank" title="'+value+'">'+value+'</a>';
				}
			},
			width: 150
		},{
			field : 'status',
			title : '审核(展位/剩余)',
			formatter:function(value,row,index){
				var btnStr="";
				if (value==null || value==''){
					if(row.apply_type == 'company')
						btnStr='<input type="button" value="审核" onClick="audit(\''+row.processid+'\',\'apply\','+index+','+row.last_company_num+','+row.permit+',\''+row.sch_user_code+'\')" />';
					else
						btnStr='<input type="button" value="审核" onClick="audit(\''+row.processid+'\',\'sch_apply\','+index+','+row.last_company_num+','+row.permit+',\''+row.sch_user_code+'\')" />';
					return btnStr+'('+row.job_fair_company_num+'/'+row.last_company_num+')';
				}else if(value=='ok'){
					if(row.permition=='admin'){
						return '<a style=color:green title="'+value+'">通过&nbsp&nbsp</a><input type="button" value="撤销审核" onClick="cancel(\''+row.job_fair_id+'\','+row.apply_personid+',\''+row.apply_dept_name+'\')" />';
					}else{
						return '<a style=color:green title="'+value+'">通过&nbsp&nbsp</a>';
					}
				
				}else if(value=='deny'){
					return '<a style=color:red title="'+row.mem+'">未通过'+row.mem+'</a>';
				}else if(value=='02'){
					return '<a style=color:red title="'+row.mem+'">'+row.mem+'</a>';
				}
			},
			width: 120
		}
		] ],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		fitColumns:true,
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
		checkbox:true,
		border:false,
		onLoadSuccess : function(){
			/* var ifram = parent.document.getElementById("rightFrm");
			var panel = $(this).datagrid("getPanel");
			setTimeout(function() {
		          var contentHeight =  $(panel).height();
				  $(ifram).attr("height",contentHeight+32 ); 
		    }, 500);
			*/
		}
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=ad_file_undosearch&in_r=ad&in_apply_type=company&in_id="+id+"&in_user_id="+user_id;
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
		ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
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
	$('#w').dialog('close') ;
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
function audit(processid,buss_id,index,lastNum,permit,user_code ){
	var data = { processid: processid, 
			 buss_id: buss_id, 
			// deal_type: deal_type,
			 mem:'',
			 user_code:user_code };
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象

   	lo_pg         = $("#resultId").datagrid("getPager");
   	li_pagenum    = lo_pg.pagination('options').pageNumber;
	li_pagesize = $('#resultId').datagrid('options').pageSize;
   	li_currentnum = index; //$("#resultId").datagrid("getRowIndex",lo_selected[0]);
	if( lastNum==0 || permit ==0 ){
		var title="";
		var msg="";
		if(lastNum==0){
			title='展位已满';
		}else{
			title='预定已经截止';
		}
		if(buss_id=='apply'){
			msg="，申请已取消！";
		}else{
			msg="，邀请已取消！";		
		}
		$.messager.alert('提示信息',title+msg,'info',function(){
				data.mem=title+msg;
				sendData("N",data ,li_pagenum,li_pagesize,li_currentnum );
		});
	}else{
		var rows = $("#resultId").datagrid("getRows");
		var row = rows[index];
		$("#deal_form").find(".company_name").text( row.apply_dept_name );
		$("#deal_form").find(".job_fair_name").text( row.job_fair_name );
		if( row.remark ){
			$("#deal_form").find(".remark").text( row.remark );
		}else{
			$("#deal_form").find(".remark").text( '' );
		}
		//var params=$.extend({},row,data ) ;
		$("#deal_form").form("load", data );
		//$("#if_deal")[0].src = "jDeal.jsp?processid=" + processid+ "&buss_id=" + buss_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();;
		$("#dlg_deal").dialog({buttons:[{
			text:'同意',
			iconCls : 'icon-ok',
			handler:function(){
				sendData('Y',data,li_pagenum,li_pagesize,li_currentnum );
			}
		},{
			text:'不同意',
			iconCls : 'icon-no',
			handler:function(){
				var mem = $("#deal_form").find(".text_mem").val();
				if( mem=='' ){
					$.messager.alert("提示信息","请输入不同意的原因","warning",function(){
						$("#deal_form").find(".text_mem").focus();
					});
					return;
				}
				data.mem=mem;
				sendData('N',data,li_pagenum,li_pagesize,li_currentnum );
			}
		},{
			text:'取消',
			handler:function(){
				$("#dlg_deal" ).dialog("close");
			}
		}]}).dialog("open").dialog("setTitle","代学校审核企业申请");
	}
}
/*撤销审核
 * job_fair_id    招聘会id
 * apply_personid 企业id
 * */
function cancel(job_fair_id,apply_personid,apply_dept_name){
	
	 var ls_url;    //url
	 
     $.messager.confirm('提示信息', '您确定要撤销'+apply_dept_name+'的审核吗?', function(r){
    	 	if (r){
					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=cancel_apply_audit&in_r=ad&in_job_fair_id="+job_fair_id+"&in_company_id="+apply_personid+"&date="+new Date();
					ajaxDealUrl(ls_url,'撤销审核成功',downOrreloadData);
    	 	}
    	 });
}
function sendData(deal_type,data,pagenum,pagesize,currentnum )
{
			var url= cur_path +"/sheetAction.do?method=dealApply&deal_type="+deal_type;
			$.post(url,data, function(data){
				if(data=="succ"){
					$("#dlg_deal" ).dialog("close");
					ajaxData("#resultId", getUrl, getData, pagenum, pagesize, currentnum);
				}else if("nopermmit"==data){
					$.messager.alert('提示信息','没有权限','error');
				}else{
					$.messager.alert('提示信息','服务器连接错误','info');
				}
			});
}
function searchData(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
	var ins_url = inf_url();
    if (ini_page && ini_page > 0)
		 ins_url = ins_url + "&in_page=" + ini_page;
	if (ini_pagesize && ini_pagesize > 0)
		 ins_url = ins_url + "&in_pagenum=" + ini_pagesize;
    $('#fm').form('submit', {
        url: ins_url,
        onSubmit: function() {
        	if($(this).form('validate')){
				$.messager.progress({
					text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
				});
				return true;
        	}else{
            	return false;
            }
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
                }else{
					$(ins_id).datagrid( {
						pageNumber : 1,
						pageSize : 20
					});
                }
//				else{
//					inf_deal();
//					}
			  //加载数据
			   $(ins_id).datagrid('loadData', out_return[0]);
			   initPaperareafm(ins_id,inf_url,inf_deal,ini_pagesize);
			   //initPaperarea(ins_id,inf_url,inf_deal,ini_pagesize);
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
	        },
	       onSelectPage:function(pageNumber,pageSize){
	             searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        }
	   });
	}
 }
function schoolCenter(){
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
	    ls_id     = lo_selected[0].sch_user_code;
		window.open(cur_path+"/daqin_manager/memberLogin.do?user_type=school&user_code="+ls_id);
    }
}
function cancelWindow( in_id )
{
	$("#"+in_id ).window("close");
}


