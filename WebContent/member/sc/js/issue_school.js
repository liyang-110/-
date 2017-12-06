function editItem()
{
	var id = checkValue();
	if( id != undefined ){
		window.location.href="edit_school.jsp?id="+id;
	}
}
function deleteItem()
{
	msg_alert("提示信息","不能删除已发布的招聘会","error");
	return;
	var id = checkValue();
	if( id != undefined ){
	   	 msg_wait('提示信息', '您确定要进行删除操作吗?',"question", function(r){
			ls_id=lo_selected[0].g_id;
			ls_url = 	cur_path + "/school/graduation.do?action=del&in_g_id="+ls_id+"&date=" + new Date();
			ajaxDealUrl(ls_url,'删除成功',downOrreloadData);
	 	 });
	}
}
function checkValue( )
{
	var checkboxs = $(".item_check:checked");
	if(checkboxs.length==0 ){
		msg_alert("提示信息","请选择招聘会","error");
		return undefined;
	}else if(checkboxs.length>1){
		msg_alert("提示信息","只能选择一行信息","error");
		return undefined;
	}else{
		return checkboxs.val();
	}
}