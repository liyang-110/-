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
		var hostUrl="<%=request.getAttribute("hostUrl")%>";
		$(function(){
			$(".news_list a").live("click",function(e){
				e.preventDefault();
				window.open( hostUrl+$(this).attr("href") );
			});
			$(".pageUrl").bind("change",function(e){
				$(this).val( hostUrl+$(this).next().attr("href") );
			});
			$("#select_pageUrl").bind("change",function(){
				$("input[name='pageNum']").val(1);
				$(".news_list").text("");
			});
			$("#select_pageUrl").find("option[value='<%=request.getAttribute("strUrl") %>']").attr("SELECTED","SELECTED");
		});
	</script>

  </head>
  
  <body> 
  <div style="margin:5px 20px;">
  	<form class="form-inline" action="" method="post">
   采集地址：
	<select class="span6" name="pageUrl" id="select_pageUrl">

	
		<option value="http://www.gaoxiaojob.com/zhaopin/gongwuyuankaoshi/news/">
		01 公务员 http://www.gaoxiaojob.com/zhaopin/gongwuyuankaoshi/news/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/xuandiaosheng/">
		02 公务员 http://www.gaoxiaojob.com/zhaopin/xuandiaosheng/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/shiyedanwei/">
		03 事业单位 http://www.gaoxiaojob.com/zhaopin/shiyedanwei/</option>	
		<option value="http://www.gaoxiaojob.com/zhaopin/meitilei/">
		04 事业单位 http://www.gaoxiaojob.com/zhaopin/meitilei/</option>		
		<option value="http://www.gaoxiaojob.com/zhaopin/sydw/guanban/">
		05 事业单位 http://www.gaoxiaojob.com/zhaopin/sydw/guanban/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/wenzhirenyuanzhaopin/">
		06 事业单位 http://www.gaoxiaojob.com/zhaopin/wenzhirenyuanzhaopin/</option>

		<option value="http://www.gaoxiaojob.com/zhaopin/gaoxiaojiaoshi/">
		07 高校招聘 http://www.gaoxiaojob.com/zhaopin/gaoxiaojiaoshi/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/zhiyeyuanxiao/">
		08 高校招聘http://www.gaoxiaojob.com/zhaopin/zhiyeyuanxiao/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/gaoxiaojiaofu/">
		09 高校招聘 http://www.gaoxiaojob.com/zhaopin/gaoxiaojiaofu/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/fudaoyuan/">
		10 高校招聘 http://www.gaoxiaojob.com/zhaopin/fudaoyuan/</option>
		
		<option value="http://www.gaoxiaojob.com/zhaopin/jiaoyuju/">
		11 中小学校 http://www.gaoxiaojob.com/zhaopin/jiaoyuju/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/zhongxiaoxue/">
		12 中小学校 http://www.gaoxiaojob.com/zhaopin/zhongxiaoxue/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/zhongxiaoxuexiao/zhiye/">
		13 中小学校 http://www.gaoxiaojob.com/zhaopin/zhongxiaoxuexiao/zhiye/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/zhongxiaoxuexiao/youeryuan/">
		14 中小学校 http://www.gaoxiaojob.com/zhaopin/zhongxiaoxuexiao/youeryuan/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/qiye/">
		15 企业招聘 http://www.gaoxiaojob.com/zhaopin/qiye/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/yinhangzhaopinhui/">
		16 银行招聘 http://www.gaoxiaojob.com/zhaopin/yinhangzhaopinhui/</option>
		<option value="http://www.gaoxiaojob.com/zhaopin/weisheng/">
		17 卫生系统 http://www.gaoxiaojob.com/zhaopin/weisheng/</option>
		
	</select>
	<a href=""></a>
   <%=request.getAttribute("pageInfo")%>
   
  	当前页<input class="span1" name="pageNum" value="<%=request.getAttribute("page") %>"/>
  	<input type="submit" value="确定" />
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
     	<input name="subType" value="0" type="hidden" />
     	
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
