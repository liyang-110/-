function editItem()
{
	var id = checkValue();
	if( id != undefined ){
		window.location.href="edit_uploading.jsp?id="+id;
	}
}
function deleteItem()
{
	var ls_id = checkValue();
	if( ls_id != undefined ){
	   	 msg_wait('提示信息', '您确定要进行删除操作吗?',"question", function(){
			var ls_url ="/school/graduation.do?action=del&in_g_id="+ls_id+"&date=" + new Date();
			ajaxDealUrl(ls_url,'删除成功',function(){
				window.location.reload();
			});
	 	 });
	}
}
function checkValue( )
{
	var checkboxs = $(".item_check:checked");
	if(checkboxs.length==0 ){
		msg_alert("提示信息","请选择毕业生信息","error");
		return undefined;
	}else if(checkboxs.length>1){
		msg_alert("提示信息","只能选择一行信息","error");
		return undefined;
	}else{
		return checkboxs.val();
	}
}