<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.vo.PageResVO"%>
<%@page import="com.zhaopin.database.cDataControlA"%>
<%
request.setCharacterEncoding("GBK");
cDataControlA cdata = new cDataControlA();
String area_id=request.getParameter("area_id");
String area_name=""; 
area_name=com.zhaopin.Station.getStationName( area_id );
if(area_name.equals("")){
	area_name="全国";
}

String job_fair_type=request.getParameter("job_fair_type");
String job_fair_type_name=""; 
job_fair_type_name=cdata.GetFirfield("select base_name from tbl_base_code where base_code='"+job_fair_type+"'");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=job_fair_type_name%> -- <%=area_name %>站 -- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/styles/site.css" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/slide/slide.css" />

<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
	</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>
    </head>

	<body>
<jsp:include  page="./include/topnav.jsp" flush="true"/>
<jsp:include  page="./include/header1.jsp" flush="true">
	<jsp:param name="area_id" value="<%=area_id%>" />
	<jsp:param name="area_name" value="<%=area_name%>" />
</jsp:include>

<div class="container" style="height:30px;">
        <ul class="breadcrumb">
          <li>
            <a href="./">首页</a> <span class="divider">&gt;</span>
          </li>
           <li><a href="<%=request.getContextPath() %>/substation.do?method=subindex&area_id=<%=area_id %>">
           <%=area_name %>站</a><span class="divider">&gt;</span></li>
            <li class="active"><%=job_fair_type_name%></li>
        </ul>
</div>

    <div class="container f_content">
        
         <div class="info_card_container">
       <%
    	PageResVO pageVO=(PageResVO)session.getAttribute("moreJobfair");
	  	if(pageVO!=null){
	          	List list=pageVO.getResList();
	          	if(list!=null&&list.size()>0){
	          	    int i=0;
	            	for(Iterator iter=list.iterator();iter.hasNext();){
	            		List temp=(List)iter.next();
	            		i++;
	            		%>
         <div class="info_card"><!-- info_card 招聘会卡片模板，可循环套用 -->
         	<div class="title"><%=temp.get(7).toString()%> <%=temp.get(1)%></div>
            <div class="line">主<span class="divider"></span>办：
            	<% if("".equals( temp.get(6).toString() ) ) {%>
            	<%=temp.get(2).toString() %>
				<%}else{ %>
            	<a href="<%=request.getContextPath() %>/substation.do?method=schoolindex&school_id=<%=temp.get(6).toString()%>" target="_blank">
            	<%=temp.get(2).toString() %>
				</a>
				<%} %>
            </div>
            <div class="line">时<span class="divider"></span>间：
            	<%=temp.get(3)%>
            </div>
            <div class="line">地<span class="divider"></span>点：
            	<%=temp.get(4)%>
            </div>
            <div class="line last">预订截止：
            	<%=temp.get(5)%>
            </div>
            <div class="action">
            	<a href="javascript:;" class="btn btn-warning btn-small" onClick="ComApply('<%=temp.get(0)%>','<%=temp.get(6)%>')">企业预订</a>剩余<%=temp.get(8)%>个展位
                <a href="javascript:;" onClick="openOrder('<%=temp.get(0)%>','<%=temp.get(6)%>')" class="btn  btn-warning btn-small">求职报名</a><% // 已报名<%=temp.get(9)人 %>
                <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=temp.get(0).toString()%>" target="_blank" class="btn-link">查看详情&gt;&gt;</a>
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
		}
	    %>
        
         
         </div>
         <div>
         <%
          	if(pageVO!=null && pageVO.getResList().size()>0 ){
          %>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	     	<tr>
					<td align="center">
					<div style=" clear:both;">
	         <div class="pagination pagination-centered f">
					<span>总共<%=pageVO.getPageCount()%>页&nbsp;当前第<%=pageVO.getCurrentPage() + 1%>页</span>
					<span> 
					    <a class="first" href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&flush=flush&directflag=-2" class="btn btn-small">首页</a>
						<a class="pre" href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&flush=flush&directflag=-1" class="btn btn-small">上一页</a>
						<a class="next" href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&flush=flush&directflag=1" class="btn btn-small">下一页</a>
						<a class="last" href="<%=request.getContextPath()%>/multiQueryAction.do?method=jobfairSearch&queryType=moreJobfair&savesign=savesign&flush=flush&directflag=2" class="btn btn-small">尾页</a>
						
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

