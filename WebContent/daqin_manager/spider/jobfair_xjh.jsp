<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'gaoxiaojob.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=request.getContextPath() %>/assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


	<script src="<%=request.getContextPath() %>/assets2/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/assets2/jquery/jquery.form.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

	<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/spider.js" charset="utf-8"></script>
	
	<script type="text/javascript">
		$(function(){
			$(".news_list a").live("click",function(e){
				e.preventDefault();
				window.open( $(this).attr("href") );
			});
			$(".pageUrl").bind("change",function(e){
				$(this).val( $(this).next().attr("href") );
			});
			$("#select_pageUrl").bind("change",function(){
				$("input[name='pageNum']").val(1);
				$(".news_list").text("");
			});
			$("#select_pageUrl").find("option[value='<%=request.getAttribute("subType") %>']").attr("SELECTED","SELECTED");
		});
	</script>
<style type="text/css">
	.news_list a company+span{
		color:#00cc00;
		margin-left:10px;
	}
</style>
  </head>
  
  <body> 
  <div style="margin:5px 20px;">
  	<form class="form-inline" action="" method="post">
   采集地址：
	<select class="span8" name="select" id="select_pageUrl">

	<option value="301">
1.海投网 宣讲会 http://xjh.haitou.cc/</option>
	</select>

  	<input type="text" class="span1" name="pageNum" value="<%=request.getAttribute("pageNum")==null?"1":request.getAttribute("pageNum")%>"/>
  	<input type="submit" value="确定" />
	<a onclick="open_source_page();" href="javascript:;">访问来源</a>
   	<script>
   		function open_source_page()
   		{

   			var regx = new RegExp("(?:([A-Za-z]+):)?(//{0,3})([0-9./-A-Za-z]+)(?::(/d+))?(?://([^?#]*))?(?:/?([^#]*))?(?:#(.*))?");
   			//var regx = /(http|https)?:\/\/([w-]+.)+[w-]+(\/[w-.\/?%&=]*)?/i;
   			var select = $("#select_pageUrl").find("option:selected").text();
   			window.open( regx.exec( select )[0] );
   		}
   	</script>
  	</form>

	</div>
	<div style="margin:5px 20px;">
     <form id="createTask" name="createTask" action="<%=request.getContextPath() %>/spider/createTask.do" method="post"> 
     <%
     List linkList=(List)request.getAttribute("linkList");
     
     %>
		<div class="news_list">
     <%
     
     if( linkList!=null && linkList.size()>0){
     	for(Iterator it=linkList.iterator();it.hasNext(); ){
     	%>
     		<input class="pageUrl" name="pageUrl" value="" type="checkbox" />
     		&nbsp;&nbsp;&nbsp;&nbsp;
     		<%=it.next() %><br/>
     	<%
     	}
     }else{
		%>
		<%=request.getAttribute("errorMessage") %>
		<%
     }
     %>
     	</div>
     	<br/>
     	<table><tr><td>
     	<label>
     	<input class="select_all" name="select_all" value="" type="checkbox" />
     	全选/取消全选</label></td><td>
     	
     	&nbsp;&nbsp;&nbsp;&nbsp;
     	<input name="subType" value="<%=request.getAttribute("subType") %>" type="hidden" />
     	
     	<input name="type" value="jobfair" type="hidden" />

     	</td><td>
     	<input type="submit" value="提交采集"/>
		</td></tr></table>
     	</form>
     </div>
     	<script>
     		$(function(){
     			$(".select_all").bind("click",function(e){
     				$(".news_list input[type='checkbox']").each(function(){
						   /*
						   if($(this).attr("checked"))
						   {
						    	$(this).removeAttr("checked");
						   }
						   else
						   {
						    	$(this).attr("checked",'true');
						   }
						   */
						   $(this).trigger("click");
     				});
     			});
     			
     		});
     		CreateTask.init();
     	</script>
  </body>
</html>
