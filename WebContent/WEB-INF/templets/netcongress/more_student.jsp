<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
UserInterface user = User.currentUser(session);
request.setAttribute("currentUser", user );
%>
<c:forEach var="row" items="${studentList }">
	<li class="item" data-ref-id="${row.student_id }">
		<div class="student">
			<div class="photo">
				<c:choose>
					<c:when test="${not empty row.head_pic}">
						<img class="img-circle"
							src="//cdn.211zph.com/upload/headpic/${row.head_pic }?x-oss-process=style/62x62" />
					</c:when>
					<c:when test="${row.sex eq '男' }">
						<img src="/static/netcongress/image/default_boy.png" />
					</c:when>
					<c:when test="${row.sex eq '女' }">
						<img src="/static/netcongress/image/default_girl.png" />
					</c:when>
					<c:otherwise>
						<img src="/static/netcongress/image/default_boy.png" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="score">${row.resume_score }%</div>
			<div class="name">
				<a
					onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')"
					href="javascript:;"> ${row.name} </a>
			</div>
			<div>
				<p class="position">
					<a
						onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')"
						href="javascript:;"> ${empty row.hope_positions?'不限':row.hope_positions}
					</a>
				</p>
			</div>
			<div class="action">
				<button class="btn btn-success"
					onclick="$('#wellcomeModalDiialog').modal({});">手机视频</button>
				<c:choose>
					<c:when test="${empty requestScope.currentUser }">
						<button type="button" class="btn btn-info" onclick="open_login_layer();">一键面试</button>	  
					</c:when>
					<c:when test="${requestScope.onlineView }">
						<c:choose>
							<c:when test="${currentUser.userType eq 'admin' }">
								<button class="btn btn-info" 
									onclick="IM_contact('${row.hx_user }','${row.head_pic }','${row.name }');">一键面试</button>
							</c:when>
							<c:when test="${requestScope.reserved}">
								<button class="btn btn-info" 
									onclick="IM_contact('${row.hx_user }','${row.head_pic }','${row.name }');">一键面试</button>
							</c:when>
							<c:otherwise>
		        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您没有预定本场招聘会，不能发起在线面试！','face-sad')">一键面试</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
		 		       	<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','网络招聘会举办期间，才能进行一键面试！','face-sad');">一键面试</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</li>
</c:forEach>