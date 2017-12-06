<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui/demo.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		var lastValue = "", nodeList = [], fontCss = {};
		
		function getNodesByParamFuzzy( value ){
        	var treeObj = $.fn.zTree.getZTreeObj("myTree");
        	var treeNodes = treeObj.transformToArray(treeObj.getNodes());
			if (lastValue === value) return;
			lastValue = value;
			for( var i=0, l=treeNodes.length; i<l; i++) {
					var n = treeObj.getNodeByTId(treeNodes[i].tId ) ;
					treeObj.showNode(n);
			}
			if (value === "") {
				treeObj.expandAll( false );
				return;
        	}
        	updateNodes(false);
        	nodeList = treeObj.getNodesByParamFuzzy("name", value);
        	updateNodes(true);
        	var showList =[];
			for( var i=0, l=nodeList.length; i<l; i++) {
				showList.push( nodeList[i].tId ) ;
			}
			for( var i=0, l=treeNodes.length; i<l; i++) {
				 if( $.inArray( treeNodes[i].tId, showList )<0 )
				 {
				 	var n = treeObj.getNodeByTId(treeNodes[i].tId ) ;
				 	if( !treeNodes[i].isParent  ){
				 		treeObj.hideNode( n );
				 	}else{
				 	   var childs = treeObj.transformToArray( n );
				 	   var hidden=true;
				 	   for(var h = 0 ,j = childs.length ; h<j; h++){
				 	   		if( $.inArray( childs[h].tId, showList )>0 ) 
				 	   		{
				 	   			hidden=false;
				 	   			break;
				 	   		}
				 	   }
				 	   if(hidden)treeObj.hideNode( n );
				 	}
				 }
			}
			treeObj.expandAll( true );
		}
		function updateNodes(highlight) {
			var zTree = $.fn.zTree.getZTreeObj("myTree");
			for( var i=0, l=nodeList.length; i<l; i++) {
				nodeList[i].highlight = highlight;
				zTree.updateNode(nodeList[i]);
			}
		}
		function getFontCss(treeId, treeNode) {
			return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
		}
		$(function(){
			parent.$('.expandTree').unbind();
			parent.$('.collapseTree').unbind();
			parent.$('.saveTree').unbind();
			parent.$('.expandTree').bind("click",function(){
				expandTree( true );
			});
			parent.$('.collapseTree').bind("click",function(){
				expandTree( false );
			});
			parent.$('.saveTree').bind("click",function(){
				sendData();
			});
		});
		function sendData(){
			var tempVal="";
        	var tempText="";
        	var treeObj = $.fn.zTree.getZTreeObj("myTree");
        	var nodes = treeObj.getCheckedNodes(true);
        	
        	if(nodes.length>0){
				    for(i=0;i<nodes.length;i++){
				    	if(!nodes[i].isParent){
			        	tempVal = tempVal + nodes[i].id+",";
			        	tempText = tempText + nodes[i].name+",";
			        	}
			        }
		        	window.parent.document.getElementById("in_professional").value=tempVal;
		  			window.parent.document.getElementById("professional_name").value=tempText;
		  			window.parent.$('#w1').window('close');
	        }else{
	        	$.messager.alert("提示信息","您确定不选择任何专业！","info");
	        }
	        
		}
		function zTreeBeforeCheck(treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			// var checked = treeObj.getCheckedNodes(true);
			var nodes = treeObj.getNodes();
			if( treeNode.checked==false ){
				var checkedNum=getNodesNum( nodes );
				var counts=computeChidsNum(treeNode);	
				if( checkedNum+counts>5){
		        	$.messager.alert("提示信息","最多可以选择5个专业.<br/>已选择"+checkedNum+"个专业，本次选择"+counts+"个专业！","info");
					return false;
				}
			}
			return true;
		}
		function getNodesNum( treeNodes ){
			var counts=0;
			if(treeNodes.length>0)
			{
				for(var i=0;i<treeNodes.length;i++){
						counts+=computeCheckedChidsNum( treeNodes[i] );
				}
			}
			return counts;
		}
		function computeCheckedChidsNum(treeNode){
			var counts=0;
			if(treeNode.isParent==true){
				var chids =treeNode.childs;
				for(var i=0;i<chids.length;i++){
					counts+=computeCheckedChidsNum( chids[i] );
				}
			}else{
				if(treeNode.checked==true)
						counts=1;
			}
			return counts;
		}
		function computeChidsNum(treeNode){
			var counts=0;
			if(treeNode.isParent==true){
				var chids =treeNode.childs;
				for(var i=0;i<chids.length;i++){
					counts+=computeChidsNum( chids[i] );
				}
			}else{
				counts=1;
			}
			return counts;
		}
		function zTreeBeforeClick(treeId, treeNode) {
		}
		function zTreeOnCheck(event, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			var checked = treeObj.getCheckedNodes(true);
			if(checked.length>0){
				for(i=0;i<checked.length;i++){
					checked[i].checkedOld = true;
					treeObj.updateNode( checked[i] );
			    }
			}
		}
		function treeNodeToggle(event, treeId, node, clickFlag){
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			treeObj.checkNode(node, !node.checked , true);
			// zTreeOnCheck(event, treeId, node) ;
		}
		function expandTree( flag )
		{
			var treeObj = $.fn.zTree.getZTreeObj("myTree");
			
			if( flag == false ){
				treeObj.expandAll( flag );
				/*
				var node = treeObj.getNodeByParam("id","00", null);
				//console.info(node);
				treeObj.expandNode(node, true,false,true,false);
				*/
			}else if( flag == true ){
				treeObj.expandAll( flag );
			}
			
		}
	</script>
	<style type="text/css">
		/*
		li.level0 {
			float:left;
			width:230px;
			display:block;
			margin-top:0;
		}
		*/
		#myTree a:hover{background:#FFE6B0;}
		#myTree .curSelectedNode{background:none;border:none;}
		#myTree .checkbox_true_full+a {border: 1px #FFB951 solid;background:#FFE6B0;}
		#myTree .checkbox_true_part+a {border: 1px #FFB951 solid;background:#DDF3BF;}
	</style>
  </head>
  <body>
   <%
   		 String level=request.getParameter("level");
   		 String school_id=request.getParameter("school_id");

   		
//   	 String sql="select id,name,decode(pid,null,edu,pid) pid from tbl_professional";
 		/*
 		//显示全部学历和专业
 		String sql="select id,name,pid from ( " +
 						" (select base_code id,base_name name,null pid from tbl_base_code " +
 						" where base_type='job_fair_level' and is_avail=0 ) union all ( "+
 						" select a.id,a.name,decode(a.pid,null,b.base_code,pid) pid from ( "+
 						" select id,name,pid,edu from tbl_professional ) a, "+
						" (select base_code from tbl_base_code where base_type='job_fair_level'and is_avail=0) b "+ 
						" where instr(a.edu,b.base_code)>0 ) order by pid,id )";  	 
		
		//学历名称作为根节点			
 		String sql="select id,name,pid from ( " +
 						" (select base_code id,base_name name,null pid from tbl_base_code  " +
 						" where base_type='job_fair_level' and is_avail=0 and base_code='"+level+"' ) union all ( "+
 						" select a.id,a.name,decode(a.pid,null,b.base_code,pid) pid from ( "+
 						" select id,name,pid,edu from tbl_professional ) a, "+
						" (select base_code from tbl_base_code where base_type='job_fair_level'and is_avail=0 and base_code='"+level+"' ) b "+ 
						" where instr(a.edu,b.base_code)>0 ) order by pid,id )";
		*/
		//显示某一学历专业	 
		
 		String sql=null;
 		if( "level_all".equals( level ) ){
 			sql= " select a.id,lpad(to_number(id),6,'0')||' '||a.name||' ('||fun_concat_decode( wm_concat(edu),'job_fair_level',0)||')' name, max(a.pid) pid from ("+
 						" select id,name,pid,edu from tbl_professional ) a, "+
						" (select base_code from tbl_base_code where base_type='job_fair_level'  "+ 
						"  ) b "+ 
						" where instr(a.edu,b.base_code)>0 "+
						" group by a.id,a.name,a.pid order by a.name asc ";
 		}else { 
 			sql= " select a.id,lpad(to_number(id),6,'0')||' '||a.name||' ('|| fun_concat_decode( wm_concat(edu),'job_fair_level',0)||')' name, max(a.pid) pid from ("+
 						" select id,name,pid,edu from tbl_professional ) a, "+
						" (select base_code from tbl_base_code where base_type='job_fair_level' and is_avail=0 "+ 
						" and instr('"+level+"',base_code)>0 ) b "+ 
						" where instr(a.edu,b.base_code)>0 "+
						" group by a.id,a.name,a.pid order by a.name asc ";
		}
   %>
  <t:TreeTag className="com.zhaopin.tree.ProfessionalTreeConfig" 
  documentObject="parent.document.getElementById('mainFrame')" 
  queryDataURL=""
   isNeedButton="1" 
   cssName="width:460px;border:0;height:320px;margin:0 0 10px 10px;" 
   displayText="testName" 
   displayVlaue="testValue" 
   getTreeValueStyle="2" 
   isCheckBox="1" 
   isAutoClose="1"
   JSONDataFunctionName="getData" 
   autoParam="type"
   treeName="myTree"
   treeNodeClickFunctionName="treeNodeToggle"
   sql="<%=sql%>"
   commitURL=""
    />
  </body>
</html>
