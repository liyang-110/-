<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/initdata.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>求职大厅 - <%=jobfairMap.get("job_fair_name") %> - <%=com.zhaopin.Config.getSiteTitle() %></title>

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
		$(".nav-pills>li:eq(1)").addClass("activ_one");
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
	});
</script>
<jsp:include page="include/weixin.jsp" flush="true" />
</head>

<body>
<jsp:include page="include/header_sch.jsp" flush="true" />

<a name="searchlist"></a>
<div class="job">
    <h1>求职大厅</h1>
    <form  id="search" class="form-inline" role="form" action="?<%=request.getQueryString() %>#searchlist" method="post">
       <div class="form-group">
          <input type="text" class="form-control control" 
          	id="keyword" name="keyword"  value="${requestScope.keyword }"
          	placeholder="请输入专业或求职岗位关键字搜索">
       </div>
       <button type="submit" class="btn btn-default">搜索</button>
       <style type="text/css">
       	.quick-search a {color:#FFF;text-decoration:underline;}
       	.quick-search a.on {background-color:#fd6828;}
       </style>
       <%
       	 pageContext.setAttribute("level", request.getParameter("level"));
       %>
       <c:set var="level" value="${pageScope.level }"/>
       <div class="form-group quick-search ">
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_07'?'on':'' }" href="?id=<%=job_fair_id %>&m=resume&level=level_07">大专</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_03'?'on':'' }" href="?id=<%=job_fair_id %>&m=resume&level=level_03">高职</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_02'?'on':'' }" href="?id=<%=job_fair_id %>&m=resume&level=level_02">本科</a>
       	   &nbsp;&nbsp;&nbsp;<a class="${level=='level_01'?'on':'' }" href="?id=<%=job_fair_id %>&m=resume&level=level_01">研究生</a>
        <c:if test="${not empty requestScope.where }">
       	   &nbsp;&nbsp;&nbsp;<a href="?id=<%=job_fair_id %>&m=resume">显示全部</a>
       </c:if>
       </div>
    </form>
</div>
<!--job完成-->
<div class="container cont" id="resumeList">
<% 
	List studentList = (List)request.getAttribute("studentList");
	//out.println( studentList.size() );
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
        			<a href="javascript:;" onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">
			<%
			if(head_pic!=null ){
			%>
					<img src="/upload/headpic/<%=head_pic %>" style="width:90px;height:125px;"/>
			<%
			}else if("男".equals( sex ) ){
			%>
			
					<img src="head/<%=level==null?"":level %>_man.png"/>
					
			<%
			}else if("女".equals(sex) ){
			%>
					<img src="head/<%=level==null?"":level %>_woman.png"/>
			<%	
			}else{
			%>
					<img src="head/<%=level==null?"":level %>_woman.png"/>
			<%	
			}
			%>
					</a>
				</div>
				<div class="text_b" 
					style="text-overflow:ellipsis;width:145px;overflow:hidden;white-space:nowrap;">
		            <p>
		            <span>姓名：</span>
		            <a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')" 
		            	href="javascript:;" title="<%=row.get("hope_positions")%>">
		            	<%=row.get("name")%>
		            </a>
		            </p>
		            <p>
		            <span>求职：</span>
		            <a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')" 
		            	href="javascript:;" title="<%=row.get("hope_positions")%>">
		            	<%=row.get("hope_positions")==null?"其他":row.get("hope_positions") %>
		            </a>
		            </p>
		        </div>
				<div class="text_im" style="text-align:center;">
		        	<!-- 
		        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
							onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
		    		 -->
		    		<% if("online".equals( row.get("hx_status") )){ %>
		    			<button type="button" class="btn btn-default contact" onclick="IM_contact('<%=easemobUser%>','','<%=row.get("name") %>');">一键面试</button>
		    		<% }else{ %>
		    			<!--  
		    			<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;color:#666;" onclick="msg_alert('提示信息','对方不在线请稍后再试！','face-sad');">一键面试</button>
		    			-->
		    			<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;color:#666;" onclick="IM_contact('<%=easemobUser%>','','<%=row.get("name") %>');">一键面试</button>

		    		<%} %>
		    	</div>
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
<jsp:include page="include/footer.jsp" flush="true" />
</body>
</html>
