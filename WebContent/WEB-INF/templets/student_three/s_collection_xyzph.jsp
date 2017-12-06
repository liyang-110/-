<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>收藏校园招聘会</title>
		<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    	<link href="/static/css/s_collection_xyzph.css" rel="stylesheet" type="text/css" />
		
		<script src="/static/jquery/1.11.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
    	<script src="/static/artDialog/plugins/iframeTools.js"></script>
    	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/js/setFavorite.js" type="text/javascript" charset="utf-8"></script>
	</head>
<body>
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>

	<div style="clear:both"></div>
	<!-- Nav tabs -->
	<div class="main">
		<div style="margin:10px 0;">
			<div style="width:100px;float:left;">我的收藏</div><div style="width:924px;height:2px;background:#fff;float:left;margin-top: 10px;"></div>
			<div style="clear:both"></div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 c_left">
					<div class="l_header">
						<ul>
							<li><a href="/student/sCollection.do?type=zhiwei">职位</a><span
								class="l_span">|</span></li>
							<li><a href="/student/sCollection.do?type=wl">网络招聘会</a><span
								class="l_span">|</span></li>
							<li><span class="active" style="padding:0 20px;"><a
									href="/student/sCollection.do?type=xy">校园招聘会</a></span></li>
						</ul>
					</div>
					<div class="l_bottom">
						<%
					List sczphList = (List)request.getAttribute("sczphList") ;
					boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>
						<%
    				if(!isLogin){
				%>
						<div>
							<ul class="l_b_ul">
								<li
									style="width:680px;>只有登陆用户才可以查看参会企业列表</li></ul></div>
				<%
	  				}else if(sczphList!=null &&sczphList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=sczphList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            %>
          			<div>
        					<ul class="l_b_ul">
          						<li><%=row.get("add_time") %></li>
          						<li><a href="/jobfair/detail.do?id=<%=row.get("job_fair_id")%>" target="_blank" style="background:none;"><%=row.get("job_fair_name")%></a></li>
          						<li><a href="/jobfair/detail.do?flag=1&id=<%=row.get("job_fair_id")%>" target="_blank" class="chqy_a">查看参会企业</a></li>
          					</ul>
          			</div>	
				<%
	             	}
	    			}else{
	    		%>
            		<div><ul><li style="padding:10px;">您还未收藏校园招聘会！</li></ul></div>
	             <% 
					}
	    		%>				
				 <div style="clear:both"></div>
				 <style>
				 	.fy .active{
				 		background:#fff;
				 	}
				 	.xyy{
    					float: right !important;
    					margin-top: -34px;
    					margin-left: 19px !important;
				 	}
				 </style>
				 <div style="text-align:center;" class="fy">
				 	${empty sczphList?'':sczphpagenation}
				</div>
          			</div><!--l_bottom end  -->
        		</div>
        		
        		<div class="col-md-4 c_right">
          			<div class="r_header">
          				猜你喜欢
          			</div>
          			<div class="r_bottom">
          				<c:forEach var="row" items="${jobList }">
							<div class="r_b_favorite">
								<ul>
									<li><a class="zhiwei-a" href="/jobfair/job.do?id=${row.job_id}"
										target="_blank">${row.job_name }</a> <span class="money">${empty row.money ? "面议" :row.money}</span>
									<c:if test="${row.sc==1}">
										<a onclick="setFavorite('${row.job_id}','0');"
											href="javascript:;"><i class=" fa fa-heart"></i></a>
									</c:if> <c:if test="${row.sc==0}">
										<a onclick="setFavorite('${row.job_id}','1');"
											href="javascript:;"><i class=" fa fa-heart-o"></i></a>
									</c:if></li>
								<li>${row.areas }</li>
								<li><a class="qiye-a"
									href="/jobfair/company.do?id=${row.company_id}&jobs=1"
									target="_blank">${row.company_name}</a></li>
							</ul>
						</div>
						</c:forEach>
						<div class="r_header" style="margin-top:2px;">
							<a
								href="/jobfair/search.do?type=search_recruit&in_hope_area=${studentHashMap.hope_area }&in_hope_position=${studentHashMap.hope_position }"
								style="color:#7885a0;">查看更多 <i
								class="fa fa-angle-double-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div style="clear:both"></div>
	<jsp:include page="../include/s_footer.jsp" flush="true"></jsp:include>
</body>
</html>
