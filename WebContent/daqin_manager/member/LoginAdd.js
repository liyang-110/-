/* =======================================================*/
// 函数作用：页面初始化函数
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
$(function () {
	//linkSelectCode('company_nature','in_company_nature',false,'','');
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
var tempVal="";
     	var tempText="";
     	var treeObj = $.fn.zTree.getZTreeObj("myTree");
     	var nodes = treeObj.getCheckedNodes(true);
     	
     	if(nodes.length>0){
	    for(i=0;i<nodes.length;i++){
	    	tempVal = tempVal + nodes[i].id+",";
        	tempText = tempText + nodes[i].name+",";
        	
        }
       	alert(tempVal);
       	alert(tempText);
 			
 			

      }else{
      	alert("请选择一个子节点");
      }
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_03&date=" + new Date();
   //处理数据 调用公用js保存数据函数 code:数据添加成功
	saveData(ls_url, closePage, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
}