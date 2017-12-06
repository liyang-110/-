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
	$('#notice').datagrid( {
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
			field : 'log_add_time',
			title : '时间',
			width : '125'
		},{
			field : 'log_content',
			title : '内容',
			width : '125',
			formatter : function(value,row,index){
				var wait='';
				switch( row.type ){
					case 4:
						wait='<span style="color:red;">[申请]</span>';
						break;
					case 5:
						wait='<span style="color:red;">[撤销]</span>';
						break;
					case 6:
						wait='<span style="color:green;">[通过]</span>';
						break;
					case 7:
						wait='<span style="color:red;">[拒绝]</span>';
						break;
				}
				if(row.remark!=null){
					return wait+'<a href="/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+(row.job_fair_time?row.job_fair_time:'')+'&nbsp;&nbsp;'+row.remark+"</a>";
				}else{
					return value;
				}
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
	ajaxData('#notice', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=member_log&in_r=ad&in_URLEncoding=UTF-8&in_user_code="+user_code;
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
// 函数作用：设置消息已读
/* ===================================================== */
   function setRead() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('notice','请选择要设置的消息！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要设置的消息！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要设为已读吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_message_mgr"+i+"="+ lo_selected[i].message_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=message_02" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'设置成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
 }

