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

  </head>
  
  <body> 
  <div style="margin:5px 20px;">
  	<form class="form-inline" action="" method="post">
   采集地址：
	<select class="span8" name="select" id="select_pageUrl">
<!-- 西电 -->
<option value="1">
1.电子通讯 http://job.xidian.edu.cn/html/zpxx/jobs/</option>
<!-- 西建大 -->
<option value="2">
2.土木桥梁 http://jiuye.xauat.edu.cn/JobFair/ShowJobFairByCategory/3</option>
<option value="3">
3.浙江大学 http://www.career.zju.edu.cn/ejob/zpxxmorelogin.do</option>
<option value="4">
<!-- 西安交大 -->
4.文财经管法医 http://job.xjtu.edu.cn/jobmore.do</option>
<!-- 西安理工大 -->
<option value="5">
5.水电工程 http://job.xaut.edu.cn/job/netjob.php</option>
<!-- 西北工大 -->
<option value="6">
6.航空航天IT http://job.nwpu.edu.cn/nwpujy/List/NewZPXXLIst.aspx</option>
<option value="7">
7.武汉大学企业  http://xsjy.whu.edu.cn/type_zplist/00001012307.html</option>
<option value="8">
8.河南毕业生就业信息网 http://www.hnbys.gov.cn/ShowContentList.aspx?cid=4</option>
<option value="9">
9.四川西南财经大学 http://job.swufe.edu.cn/Client/CompanyDemandList.aspx?key=0</option>
<option value="10">
10.成都大学http://cdu.good-edu.cn/showmore.php?actiontype=12</option>
<option value="11">
11.四川农业大学 http://job.sicau.edu.cn/showmore.php?actiontype=1</option>
<option value="12">
12.河南财经政法大学 http://job.huel.edu.cn/jyzx/zpxx.htm</option>
<option value="13">
13.河南工业大学 http://job.haut.edu.cn/ZhaoPin.aspx?page=1</option>
<option value="22">
22.上海理工大学 http://91.usst.edu.cn/RecAnnouncements.asp?Tpage=1</option>


 <option value="a" style="color:red;">
- - - - -以下地址正在开发中- - - - -</option>
<option value="14">
14.河南大学 http://job.henu.edu.cn/shownewslist.aspx?ID=8</option>
<option value="15">
15.河南大学 http://job.henu.edu.cn/shownewslist.aspx?ID=7</option>
<option value="16">
16.洛阳理工学院 http://www1.lit.edu.cn/jy/Item/list.asp?id=1229</option>
<option value="17">
17.河南师范大学 http://job.htu.cn/n_job_list.asp</option>
<option value="18">
18.浙江财经大学 http://career.zufe.edu.cn/list.jsp?urltype=tree.TreeTempUrl&wbtreeid=1003</option>
<option value="19">
19.上海财经大学 http://career.shufe.edu.cn/jy/main/list/267-1-20.htm?zpxx.gwlx.id=4640</option>
	<option value="20">
20.浙江理工大学 http://jyb.zstu.edu.cn/zp/</option>
<option value="21">
21.杭州电子科技大学 http://career.hdu.edu.cn/xyzph.asp</option>
<option value="23">
23.杭州师范大学 http://job.hznu.edu.cn/view/ind_list.do?pageNo=1&type=&rId=</option>
<option value="24">
24.湖北工业大学 http://jy.hbut.edu.cn/zpxx/</option>
<option value="25">
25.华中科技大学 http://job.hust.edu.cn/show/recruitnews/jobnewslist.htm</option>
<option value="26">
26.武汉科技大学 http://www.91.wust.edu.cn/SpNeed.aspx</option>
		
	</select>

  	<input type="hidden" name="pageNum" value="1"/>
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
