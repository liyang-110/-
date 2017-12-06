/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#notice').datagrid( {
		title : false,
		toolbar:'#toolbar',
		columns : [ [
		  {
			field : 'add_time',
			title : '申请时间',
			width: 110
		},{
			field : 'apply_person',
			title : '单位名称',
			formatter : function(value,row,index){
				var pic=row.company_pic=='no'?'':'<a title="组织机构代码证" href="jImage.jsp?file_id='+row.company_pic+'" target="_blank"><span class="green">[代]</span></a>';
				var img=row.company_img=='no'?'':'<a title="营业执照" href="jImage.jsp?file_id='+row.company_img+'" target="_blank"><span class="red">[执]</span></a>';
				return pic+img+'<a href="'+cur_path+'/company/info.do?id='+row.apply_personid+'" target="_blank" title="'+value+'">'+value+'</a>';
			},
			width: 215
		},{
			field : 'job_fair_name',
			title : '招聘会',
			formatter : function(value,row,index){
				return '<a href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" title="'+row.job_fair_time+'&nbsp;'+value+'" target="_blank">'+row.job_fair_time+'&nbsp;'+value+'</a>';
			},
			width: 250
		},{
			field : 'status',
			title : '审核(展位/预定)',
			formatter:function(value,row,index){
				var btnStr="";
				if (value=='未审核'){
					if(row.apply_type == 'company')
						btnStr='<input type="button" value="审核" onClick="audit(\''+row.processid+'\',\'apply\','+index+','+row.last_company_num+','+row.permit+')" />';
					else
						btnStr='<input type="button" value="审核" onClick="audit(\''+row.processid+'\',\'sch_apply\','+index+','+row.last_company_num+','+row.permit+')" />';
					return btnStr+'（'+row.job_fair_company_num+'&nbsp;/&nbsp;'+row.company_num+'）';
				}else{
					return '<a style=color:green title="'+value+'">'+value+'</a>';
				}	
			},
			width: 130
		}/*,{
			field : 'action',
			title : '操作'
		} */
		] ],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : "755",
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
function goBack()
{
	 window.parent.closeDialog();
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#notice', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=undo_com&in_URLEncoding=UTF-8&in_job_fair_id="+job_fair_id+"&in_id="+id+"&in_user_id="+user_id+"&date="+new Date();
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
		$('#notice').datagrid( {
			pageNumber : 1,
			pageSize : 20
		    });
		ajaxData('#notice',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
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
	ajaxData("#notice", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
function audit(processid,buss_id,index,lastNum,permit,msg ){
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
		msg_alert('提示信息',title+msg,'info',function(){
				sendData("N",processid,buss_id,title);
		});
	}else{
		art.dialog({
			title:'审核招聘会申请' , // '提示信息',
			opacity: 0.5,
			content:'<div style="padding:5px;width:328px;">'+msg+'</div>'+$("#dlg_audit").html(),
			icon: false, // 'face-smile',
			fixed: true,
			lock:true,
			padding:'0 15px',
			id:'dlg_audit',
//			okVal:'同意',
//			cancelVal:'不同意',
//			ok: function(){
//					submit_form(  $(this.content()).find("form")  ,close_layer );
//					return false;
//			},
//			cancel:function(){
//					this.close();
//			},
//			cancel:true,
			button:[{name: '同意', focus: true, callback: function () {
						sendData("Y",processid,buss_id,'');
					}},{name: '不同意',callback: function () {
						textarea= $(this.content()).find('textarea');
						mem =textarea.val();
						if(mem==''){
							msg_alert("提示信息","请填写不同意的原因","error",function(){
								textarea.focus();
							});
							return false;
						}else{
							sendData("N",processid,buss_id,mem);
						}
					}}, {name: '取消'}] 
		});
	}
}	
function sendData(deal_type,processid,buss_id,mem,in_func )
{
	var data={processid: processid, buss_id: buss_id, deal_type: deal_type,mem:mem};
	var url= "/sheetAction.do?method=dealSheet";
	$.post(url,data,function(data){
		if(data=='outdate'){
			msg_alert('提示信息','招聘会不在企业会员有效期内','info');
		}else if(data=="succ"){
			window.location.reload();
		}else{
			msg_alert('提示信息','服务器连接错误','info');
		}
	});
}