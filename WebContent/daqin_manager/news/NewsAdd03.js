/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('news_type03','in_sub_type',true,'','');
	// linkSelectCode('display','in_news_display',false,'','');
	//绑定按钮相应事件
	$("#btn_save").click(function(){
		save();
	});
	$("#btn_return").click(function(){
		closePage();
	});
});
/* =======================================================*/
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage() {
	window.parent.closepage(gi_pagesize, gi_pagenum, gi_currentnum);
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function save() {
	if( $("#in_area_id").val()=='')
	{
		$.messager.alert('提示信息','显示站点必须选择！','info');
		return false;
	}
	var file_id = $("#file_id").val();
	var ls_url = cur_path + "/news.do?method=execProc&methodId=ad_news_add&date=" + new Date()+"&in_file_id="+file_id+"&in_role_id="+role_id+"&in_add_person="+user_code;
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}
function zTreeValues( treeId )
{
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getCheckedNodes(true);
	var tempVal='';
	for(var i=0;i<nodes.length;i++)
	{
		tempVal = tempVal + nodes[i].id+",";
	}
	$('#in_area_id').val(tempVal);
}
function zTreeOnCheck(event, treeId, treeNode) {
		
		zTreeValues( treeId );
}
function treeNodeToggle(event, treeId, node, clickFlag){
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	treeObj.checkNode(node, !node.checked , true);
	zTreeOnCheck(event, treeId, node) ;
}
function zTreeSelectAll( treeId, checked )
{
	var treeObj = $.fn.zTree.getZTreeObj( treeId );
	treeObj.checkAllNodes( checked );
	zTreeValues( treeId );
}