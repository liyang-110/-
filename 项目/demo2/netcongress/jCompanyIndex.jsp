<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
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

<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.textSearch-1.0.js" charset="utf-8"></script>
<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/tooltip.css" type="text/css"></link>
<script type="text/javascript" src="js/tooltip.js"></script>
<script>
	$(function(){
		$(".interviewLi").showTip();
	});
	
</script>
</head>

<body>
<jsp:include page="include/header_com.jsp" flush="true" />
<!-----------menu----------------->
<div class="menu">
	<div class="caidan caidan_a">
    	<ul>
        	<li><a href="/netcongress/start.do?id=<%=job_fair_id %>" class="on" >招聘大厅</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume" >收到简历</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=interview"  >等待面试</a></li>
            <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=result" >面试结果</a></li>

        </ul>
        <div class="clear"></div>
    </div>
</div>
<!--list_bot开始-->
<div class="list_bot">
	<!--cont开始-->
	<div class="cont_d">
    <!--shang-->
    <div class="cont_b">
        <!--xia-->
    <div class="cont_c">
        <!--zhong-->
        <div class="left_a">   
        	<ul>
       <%
        List<HashMap> resumeList = (List<HashMap>)request.getAttribute("resumeList");
        
       if(resumeList!=null && resumeList.size()>0){
       		int status =0;
       		for(HashMap row: resumeList ){
	       		try{
	       			status = Integer.parseInt( (String)row.get("status") );
	       		}catch(Exception e){}
       		
       	%>
            	<li class="interviewLi" title="姓名：<%=row.get("name") %><br/>投递时间：<%=row.get("add_time") %><br/>应聘岗位：<%=row.get("job_name") %>">
            	<p class="left">
            	<a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&oid=<%=row.get("order_id") %>')">
				<%=row.get("name") %>&nbsp;&nbsp;应聘岗位：<%=row.get("job_name") %>
            	</a>
            	</p>
            	<p class="right">
            	<% if(1==status ){%>
            	<span class="red">简历未通过</span>
            	<% }else if(2==status) {%>
            	<span class="green">通知面试</span>
            	<% }else if(0==status) { %>
            	<span class="yellow">待定</span>
            	<% }else if(3==status) { %>
            	<span class="red">面试未通过</span>
            	<% }else if(4==status) { %>
            	<span class="green">通知复试</span>
            	<% }else if(5==status) { %>
            	<span class="green">通知录用</span>
            	<% } %>
            	</p>
            	</li>
       
       
       	<%
       		}
       }
        %>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="duo">
        	<a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume" >更多</a>
        </div>
    </div>
    </div>
    </div>
</div>
<!--list_bot-->
<div class="list_bot">
	<!--cont开始-->
	<div class="cont_f">
    <!--shang-->
    <div class="cont_b">
        <!--xia-->
    <div class="cont_c">   
        <!--zhong-->
        <div class="left_a">   
        	<ul>
       <%
        List<HashMap> interviewList = (List<HashMap>)request.getAttribute("interviewList");
        
       if(interviewList!=null && interviewList.size()>0){
       		int status =0;
       		for(HashMap row: interviewList ){
	       		try{
	       			status = Integer.parseInt( (String)row.get("status") );
	       		}catch(Exception e){}
       	%>
            	<li class="interviewLi" title="姓名：&nbsp;<%=row.get("name")%>&nbsp;&nbsp;<%=row.get("job_name")==null?"":("应聘岗位："+ row.get("job_name") )%><br/>
            	通知时间：<%=row.get("add_time") %><br/>
            	通知内容：<%=row.get("remark")%>">
            	<p class="left">
            	<a href="javascript:;" onclick="open_deal_resume('<%=row.get("student_id") %>','<%=row.get("order_id") %>')">
				<span><%=row.get("name") %></span>&nbsp;&nbsp;
				<%=row.get("job_name")==null?"":("应聘岗位："+row.get("job_name") ) %>
				</a>
				</p>
            	<p class="qq">
            	<% if(row.get("bind_qq")!=null){ %>
            	<a href="http://wpa.qq.com/msgrd?v=3&uin=<%=row.get("bind_qq")%>&Site=211校招网&Menu=yes" title="QQ：<%=row.get("bind_qq")%>" target="_blank">
            		<img class="qq" src="/netcongress/img/tubiao/qq.png" /></a>
            	<% } %>
            	</p>
				<p class="right">
				<% if(2==status ){%>
            	<span class="yellow">等待面试</span>
            	<% }else if( 4==status) {%>
            	<span class="green">等待复试</span>
            	<% } %>
            	</p>
            	</a>
            	
            	</li>
       
       
       	<%
       		}
       }
        %>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="duo">
        	<a href="/netcongress/start.do?id=<%=job_fair_id %>&m=interview" >更多</a>
        </div>
    </div>
    </div>
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
    <div class="cont_b"  id="job_fair_company_list">
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
