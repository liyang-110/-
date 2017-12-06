<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%
UserInterface user = User.currentUser(session);
HashMap<String,String> errorMap = new HashMap<String,String>();

if( user == null){
	errorMap.put("errorMsg", "请您先登录系统，后才能进入会场！");
	errorMap.put("errorCode","801");
	errorMap.put("jumpUrl", request.getRequestURI() );
	request.setAttribute("errorMap", errorMap );
	String forward = "/netcongress/jNotLogin.jsp";
	request.setAttribute("forward", request.getRequestURI() );
	request.getRequestDispatcher(
						request.getContextPath() + "/" + forward).forward(
						request, response);
	return;
}
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
String job_fair_id=jobfairMap.get("job_fair_id").toString();
String school_id=jobfairMap.get("school_id").toString();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="css/core.css" />
<script src="<%=request.getContextPath()%>/assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets2/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
	
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>

<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.textSearch-1.0.js" charset="utf-8"></script>

<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/tooltip.css" type="text/css"></link>
<script type="text/javascript" src="js/tooltip.js"></script>
<script>
	$(function(){
		$("#resumeList li").showTip();
	});
</script>
</head>

<body>
<jsp:include page="include/header_anonymous.jsp" flush="true" />
<div class="menu">
	<div class="caidan caidan_a">
    	<ul>
        	<li><a href="/netcongress/start.do?id=<%=job_fair_id %>" class="on" >招聘大厅</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume"  class="notLogin">已投简历</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=interview"  class="notLogin">面试机会</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=result"  class="notLogin">面试结果</a></li>

        </ul>
        <div class="clear"></div>
    </div>
</div>



<!--list_box开始-->
<div class="list_box">	
	<div class="cont_a">
    	<div class="form">
			<form name="search" onsubmit="return findInPage(this.string.value);">
            	<input name="string" type="text" size=15 onchange="n = 0;" placeholder="请输入企业名称或应聘职位" class="zp" />
                <input type="submit" value="搜索" class="s" />
            </form>
        </div>
    <!--shang-->
    <div class="cont_b" id="job_fair_company_list">
        <!--xia-->
    <div class="cont_c">
        <!--zhong-->
    	<%
    		List<HashMap> companyList = (List<HashMap>)request.getAttribute("companyList");
    		int no=0;
    		for(HashMap row : companyList){
    			no++;
    			%>
       	<div class="interview" >
        	<ul>
            	<li><a href="#"><img src="/netcongress/img/tubiao/ren_a.png" /></a></li>
                <li class="bg" style=" width: 70px;  height: 70px;  text-align: center; line-height: 70px;padding:0;" href="#"><%=no %></a></li>
                <li><a href="#"><img src="/netcongress/img/tubiao/ren_b.png" /></a></li>
            </ul>
            <div class="clear"></div>
            <div class="qq">
            	<p class="company" >
            	<a style="color:#d6e4d5;" title="<%=row.get("company_name") %>"  href="/company/info.do?id=<%=row.get("company_id") %>" target="_blank">
            	<%=row.get("company_name") %>
            	</a>
            	</p>
            </div>
            <div class="clear"></div>
            
  			<% List jobs= (List)row.get("jobs");
	               if(jobs!=null && jobs.size()>0){ 
	               		%>
	               		<div style="height:60px;"><p style="font-size:14px;">
	               		<%
	                    for(Iterator jt=jobs.iterator();jt.hasNext();){
	                    	HashMap job=(HashMap)jt.next();
	                    %>
	                    	<a class="job" title="<%=job.get("job_name") %>" href="/company/jobDetail.do?id=<%=job.get("job_id") %>" target="_blank">
          							<%=job.get("job_name") %>
          						</a>
	                    	<span>[简历<%=job.get("resumecount") %>份]</span><br />
	        <% 		} %>
	        			</p></div>
	        			<p style="font-size:14px;">
	        			<a class="apply"  href="javascript:;"  onclick="openOrder('<%=job_fair_id %>','<%=school_id %>','<%=row.get("company_id") %>','<%=row.get("company_name") %>');">投递简历</a>
	        			</p>
	        			<%
	                }else{%>
	                      <p> 好像没有发布职位哦！</p>
	        <%	}%>
            
        </div>
    			<%
    		}
    	 %>
        <div class="clear"></div>
        <!--mianshi-->
    </div>
    </div>
    </div>
</div>
<!--yejiao-->
<jsp:include page="include/footer.jsp" flush="true" />
</body>
</html>
