<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%
    Map map = (Map)request.getAttribute("map");
    int counts=Integer.parseInt( (String)map.get("querycount") );
    int pages  = (int)Math.ceil( counts/20.0 );
    List result = (List)map.get("queryresult");
    
    int in_page =Integer.parseInt( request.getParameter("in_page")==null ? "1":(String)request.getParameter("in_page")  );
    
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>招聘会搜索-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/styles/site.css" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/slide/slide.css" />

<link rel="shortcut icon" href="media/image/favicon.ico" />
<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
    </head>

	<body>
<jsp:include  page="./include/topnav.jsp" flush="true"/>
<jsp:include  page="./include/header4.jsp" flush="true"/>

	<div class=" container" style="height:20px;clear:both;">
    </div>
    <div class="container f_content">
        
         <div class="info_card_container">
       <%
	  	if( result !=null && result.size()>0)
	  	{
			     for(Iterator it = result.iterator(); it.hasNext(); )
			     {
			     	Map row = (Map)it.next();
	            		%>
         <div class="info_card"><!-- info_card 招聘会卡片模板，可循环套用 -->
         	<div class="title"><%=row.get("job_fair_date") %> <%=row.get("job_fair_name") %></div>
            <div class="line">主<span class="divider"></span>办：
            	<a href="<%=request.getContextPath()%>/substation.do?method=schoolindex&school_id=<%=row.get("school_id") %>" target="_blank"><%=row.get("job_fair_sponsor") %></a>
            </div>
            <div class="line">时<span class="divider"></span>间：
            	<%=row.get("job_fair_time") %>
            </div>
            <div class="line">地<span class="divider"></span>点：
            	<%=row.get("job_fair_addr") %>
            </div>
            <div class="line last">预订截止：
            	<%=row.get("job_fair_endtime") %>
            </div>
            <div class="action">
            	<a href="#" class="btn btn-warning btn-small" onClick="ComApply('<%=row.get("job_fair_id") %>','<%=row.get("school_id") %>')">企业预订</a>剩余<%=row.get("company_num") %>个展位
                <a href="#" onClick="openOrder('<%=row.get("job_fair_id") %>','<%=row.get("school_id") %>')" class="btn  btn-warning btn-small">求职报名</a><% //已报名<%=row.get("person_num")人 %>
                <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=row.get("job_fair_id") %>" target="_blank" class="btn-link">查看详情&gt;&gt;</a>
            </div>
         </div>
	            		<%
	             	}
		}else{
	             	%>
	             
	             <div style="margin:auto;text-aglin:center;">	
	      <table style="margin:20px auto; ">
	      	<tr>
	      		<td rowspan="2">
	      			<img src="<%=request.getContextPath() %>/assets/images/nodata_03.png" />
	      		</td>
	      		<td valign="top" style="padding-left:30px;">对不起，没有查询到结果。</td>
	      	</tr>
	      	<tr>
	      		<td valign="bottom" style="padding-left:30px;color:#FD871F;">请修改搜索条件重新搜索。</td>
	      	</tr>
	      </table>
	      		</div>
	      
	             	<%
		}
	    %>
        
         
         </div>
         <div>
       <% 
	  	if( result !=null && result.size()>0)
	  	{ %>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	     	<tr>
					<td align="center">
					<div style=" clear:both;">
	         <div class="pagination pagination-centered f">
					<span>总共<%=pages %>页&nbsp;当前第<%=in_page %>页</span>
					<span> 
					<%
					String queryStr =request.getQueryString().replaceAll("&in_page=[0-9]*","");
					 %> 
					    <a class="first" href="<%=request.getContextPath()%>/search.do?<%=queryStr%>&in_page=1">首页</a>
						<a class="pre" href="<%=request.getContextPath()%>/search.do?<%=queryStr%>&in_page=<%=(in_page-1)<1?1:(in_page-1) %>">上一页</a>
						<a class="next" href="<%=request.getContextPath()%>/search.do?<%=queryStr%>&in_page=<%=(in_page+1)>pages?pages:(in_page+1) %>">下一页</a>
						<a class="last" href="<%=request.getContextPath()%>/search.do?<%=queryStr%>&in_page=<%=pages %>">尾页</a>
					</span>
					 </div> </div>
				</td>
			</tr>
       </table>
       <%
       	}
        %>
         </div>
         
    </div>
    <div style="clear:both;"></div>
    
<jsp:include  page="./include/footer.jsp" flush="true"/>


<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

	</body>
</html>

