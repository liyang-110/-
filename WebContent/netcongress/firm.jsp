<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="include/initdata.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>求职大厅 - <%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>
<link type="text/css" rel="stylesheet" href="/static/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/carousel.js"></script>
<script type="text/javascript" src="js/jquery.downCount.js"></script>

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
<script type="text/javascript">
	$(function(){
		$(".nav-pills>li:eq(0)").addClass("activ_one");

		$("#more-btn").bind("click",function(e){
			e.preventDefault();
			var $this = $(this);
			
			var page = $this.attr("data-page");
			var data = $("#search").serialize()+"&ajax=1&page="+page;
			
			var url="/netcongress/moreResume.do?<%=request.getQueryString()%>";
			$this.text("正在加载");
			$.post(url,
				data,
				function( d ){
					if( d.trim()=='' ){
						$this.text("没有了");
					}else{
						$this.attr("data-page",parseInt(page)+1 );
						$("#resumeList").append( d );
						$this.text("更多");
					}
					
				}
			);
		});
		$("#search_btn").bind("click",function(e){
			e.preventDefault();
			var $this = $(this);
			var page = 1; // $this.attr("data-page");
			var data = $("#search").serialize()+"&ajax=1&page="+page;
			var url="/netcongress/moreResume.do?<%=request.getQueryString()%>";
			$this.text("正在加载");
			$.post(url,
				data,
				function( d ){
					if( d.trim()=='' ){
						$this.text("没有了");
					}else{
						$this.attr("data-page",parseInt(page)+1 );
						$("#resumeList").html( d );
						$this.text("更多");
					}
					
				}
			);
		});
	});
	//查看简历，一键面试
	function IM_interview(api, hx_user,headpic,name ){
		api.close();
		IM_contact(hx_user,headpic,name );
	}
</script>
<style type="text/css">
.container .cont_pull {
    /* height:128px; */
    overflow: hidden;
}
</style>
<script type="text/javascript" src="js/studentNotice.js?r=co" charset="utf-8"></script>
<jsp:include page="include/weixin.jsp" flush="true" />
<style type="text/css">
	.quick-search a {color:#FFF;text-decoration:underline;}
	.quick-search a.on {background-color:#fd6828;}
</style>
</head>

<body>
<jsp:include page="include/header_com.jsp" flush="true" />
<jsp:include page="include/banner.jsp" flush="true"/>

<a name="searchlist"></a>
<div class="job">
    <h1>求职大厅</h1>
    <form id="search" class="form-inline" role="form" action="?<%=request.getQueryString() %>#searchlist" method="post">
       <div class="form-group">
       	  <input type="hidden" value="search" name="action" />
          <input type="text" class="form-control control" 
          	id="keyword" name="keyword"  value="${requestScope.keyword }"
          	placeholder="请输入专业或求职岗位关键字搜索">
       </div>
       <button type="submit" id="search_btn" class="btn btn-default">搜索</button>

       <%
       	 pageContext.setAttribute("level", request.getParameter("level"));
       %>
       <c:set var="level" value="${pageScope.level }"/>
       <div class="form-group quick-search ">
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_07'?'on':'' }" href="?id=<%=job_fair_id %>&level=level_07">大专</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_03'?'on':'' }" href="?id=<%=job_fair_id %>&level=level_03">高职</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_02'?'on':'' }" href="?id=<%=job_fair_id %>&level=level_02">本科</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_01'?'on':'' }" href="?id=<%=job_fair_id %>&level=level_01">研究生</a>
        <c:if test="${not empty requestScope.where }">
       	   &nbsp;&nbsp;&nbsp;<a href="?id=<%=job_fair_id %>">显示全部</a>
       </c:if>
       </div>
    </form>
</div>
<!--job完成-->
<div class="container cont" id="resumeList">
<%  List studentList = (List)request.getAttribute("studentList");
	if( studentList != null && studentList.size()>0 ){
		for(Iterator it=studentList.iterator();it.hasNext(); ){
			HashMap row = (HashMap)it.next();
			String sex= (String)row.get("sex");
			String level = (String)row.get("education");
			String head_pic = (String)row.get("head_pic");
			String easemobUser = (String)row.get("hx_user");
%>
			<div class="pull-left cont_pull firm_pull">
        		<div class="text_a text_firm">
        			<a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&netViewResume=netcom&id=<%=row.get("student_id") %>')">
			<%if(head_pic!=null ){%>
					<img src="/upload/headpic/<%=head_pic %>" style="width:90px;height:125px;"/>
			<%}else if("男".equals( sex ) ){	%>
					<img src="head/<%=level==null?"":level %>_man.png"/>
			<%}else if("女".equals(sex) ){%>
					<img src="head/<%=level==null?"":level %>_woman.png"/>
			<%}else{%>
					<img src="head/<%=level==null?"":level %>_woman.png"/>
			<%}%>
					</a>
				</div>
				<div class="text_b" 
					style="text-overflow:ellipsis;width:145px;overflow:hidden;white-space:nowrap;">
		            <p>
		            <span>姓名：</span>
		            <a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&netViewResume=netcom&id=<%=row.get("student_id") %>')" 
		            	href="javascript:;" title="<%=row.get("hope_positions")%>">
		            	<%=row.get("name")%>
		            </a>
		            </p>
		            <p>
		            <span>求职：</span>
		            <a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&netViewResume=netcom&id=<%=row.get("student_id") %>')" 
		            	href="javascript:;" title="<%=row.get("hope_positions")%>">
		            	<%=row.get("hope_positions")==null?"其他":row.get("hope_positions") %>
		            </a>
		            </p>
		        </div>
				<% if(request.getAttribute("onlineView")!=null ){ %>
				<div class="text_im" style="text-align:center;">
		        	<% if( request.getAttribute("reserved")!=null ){ %>
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="IM_contact('<%=easemobUser%>','<%=head_pic==null?"":head_pic %>','<%=row.get("name")%>');">一键面试</button>
		    		<% }else{%>
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您没有预定本场招聘会，不能发起在线面试！','face-sad')">一键面试</button>
		    		<% }%>
		    	</div>
		    	<% }else{ %>
				<div class="text_im" style="text-align:center;">
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','网络招聘会举办期间，才能进行一键面试！','face-sad');">一键面试</button>
		    	</div>
		    	<% } %>
    		</div>
			<%
		}
	}
%>
</div>
<div style="clear:both;"></div>
<div class="container cont" >
	<div style="border:#fff 1px solid;margin:auto;width:300px;">
		<a data-page="2" id="more-btn" href="javascript:;" style="line-height:36px;color:#FFF;display:block;text-align:center;">更多</a>
	</div>
</div>
<div style="clear:both;"></div>
<jsp:include page="include/easemobim.jsp" flush="true"/>
<jsp:include page="include/footer.jsp" flush="true"/>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>