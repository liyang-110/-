/////////////////////////////////////////////////////////////////////
/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	linkSelectCode('news_type03','in_sub_type',true,'','');
    //linkSelectCode('news_type','in_news_type',true,'','');
    // linkSelectCode('display','in_news_display',true,'','');
    
	setTimeout("setData()", 500);
	//给按钮绑定事件
	$("#btn_save").bind("click", function () {
		edit();
	});
	$("#btn_return").bind("click", function () {
		closePage();
	});
   
});
/* =======================================================*/
// 函数作用：加载信息
// 输入参数及数据类型：
// 返回参数及数据类型：
/* ===================================================== */
function setData() {	
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_news_update&in_action=view&in_id=" + id + "&date=" + new Date();
	$.ajax({
		url:ls_url, 
		type:"post", 
		dataType:"text", 
		success:function (data) {
		if (!data) {
			return false;
		}
		data = decodeURIComponent(data);
		var re = eval("[" + data + "]");
		if (re.length > 0 && re[0].returncode == "ok") {
			initdata= re[0].queryresult;
			$("#fm").form("load", initdata[0]);
		}
	}});
	
}
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
function edit() {
	if( $("#in_area_id").val()=='')
	{
		$.messager.alert('提示信息','显示站点必须选择！','info');
		return false;
	}
	var file_id = $("#file_id").val();
	var ls_url = cur_path + "/news.do?method=execProc&methodId=ad_news_update&in_action=edit&in_id=" + id+"&in_file_id="+file_id+"&date=" + new Date();
	   //处理数据 code:数据修改成功
	saveData(ls_url, closePage, "\u6570\u636e\u4fee\u6539\u6210\u529f\uff01");
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