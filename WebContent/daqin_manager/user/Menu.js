/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	$('#tree-add').bind("click",function(){ 
								add();
								});
	$('#tree-edit').bind("click",function(){ 
								edit();
								});
	$('#tree-del').bind("click",function(){ 
								// del();
								$.messager.alert('提示信息','不允许删除！','info');
								});
	var treeObj = $.fn.zTree.getZTreeObj("myTree");
	treeObj.expandAll(true);
});
function add() {
	var curId=getCurId();
	if(curId){
	    $('#if_deal')[0].src='./jMenuAdd.jsp?id='+curId+"&date="+new Date();
	 	$('#dlg_deal').dialog('open').dialog('setTitle','添加节点'); 
	}
}
function edit() {
	var curId=getCurId();
	if(curId){
	    $('#if_deal')[0].src='./jMenuEdit.jsp?id='+curId+"&date="+new Date();
	    $('#dlg_deal').dialog({width:500,height:260,fit:false});
	 	$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
	}
}
function del() {
	var curId=getCurId();
	if(curId){
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
							var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_menu_del&in_id="+curId+"&date=" + new Date();
							$.post(ls_url,function (data, textStatus){ 
								data = $.parseJSON( decodeURIComponent(data) );
								/*
								{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
								*/
								if(data.returncode =='ok'){
									$.messager.alert('提示信息','删除成功！','info');
									removeTreeNode(curId);
								}
							});
	    	 	}
	    	 });
	}
}
function removeTreeNode(curId)
{
	window.location.reload();
}
function getCurId()
{
    var treeObj = $.fn.zTree.getZTreeObj("myTree");
    var nodes = treeObj.getSelectedNodes();
    if(nodes.length != 1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
	}
	return nodes[0].id;
}
function closepage() { 
	$('#dlg_deal').dialog('close') ;
}
function getCurNode()
{
    var treeObj = $.fn.zTree.getZTreeObj("myTree");
    var nodes = treeObj.getSelectedNodes();
    if(nodes.length != 1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
	}
	return nodes[0];
}