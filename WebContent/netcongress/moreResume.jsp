<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%  
	UserInterface user = User.currentUser(session);

	String job_fair_id= (String)request.getAttribute("job_fair_id");
	List studentList = (List)request.getAttribute("studentList");
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
			<%if(head_pic!=null ){%>
					<img src="/upload/headpic/<%=head_pic %>" style="width:90px;height:125px;"/>
			<%}else if("男".equals( sex ) ){%>
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
				
		    	<% if( user instanceof AdUserBean){ %>
				<div class="text_im" style="text-align:center;">
		        	<%-- 
		        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
							onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
		        	--%>
		        	<% if("online".equals( row.get("hx_status") )){ %>	
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;color:#fff;" onclick="msg_alert('提示信息','只有用人单位和求职者，才可以进行一键面试！','face-sad');">一键面试</button>
		    		<% }else{ %>
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;color:#666;" onclick="msg_alert('提示信息','只有用人单位和求职者，才可以进行一键面试！','face-sad');">一键面试</button>
		    		<% } %>
		    	</div>
		    	<%} else if( user instanceof ComUserBean){ %>
					<% if(request.getAttribute("onlineView")!=null ){ %>
					<div class="text_im" style="text-align:center;">
			        	<%-- 
			        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
								onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
			        	--%>
			        	<% if( request.getAttribute("reserved")!=null ){ %>
			        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="IM_contact('<%=easemobUser%>','<%=head_pic==null?"":head_pic %>','<%=row.get("name")%>');">一键面试</button>
			    		<% }else{%>
			        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您没有预定本场招聘会，不能发起在线面试！','face-sad')">一键面试</button>
			    		<% }%>
			    	</div>
			    	<% }else{ %>
					<div class="text_im" style="text-align:center;">
			        	<%-- 
			        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
								onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
			        	--%>
			        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','网络招聘会举办期间，才能进行一键面试！','face-sad');">一键面试</button>
			    	</div>
			    	<% } %>
		    	<%} else if(request.getAttribute("onlineView")!=null ){ %>
				<div class="text_im" style="text-align:center;">
		        	<%--
		        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
							onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
		        	 --%>
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="IM_contact('<%=easemobUser%>','<%=head_pic==null?"":head_pic %>','<%=row.get("name")%>');">一键面试</button>
		    	</div>
		    	<% }else{ %>
				<div class="text_im" style="text-align:center;">
		        	<%-- 
		        	<button type="button" class="btn btn-default toudi"  style="width:72px;margin-left:-4px;padding-left:8px;"
							onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=<%=row.get("student_id") %>')">查看简历</button>
		        	--%>
		        	<button type="button" class="btn btn-default contact" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','网络招聘会举办期间，才能进行一键面试！','face-sad');">一键面试</button>
		    	</div>
		    	<% } %>
    		</div>
			<%
		}
	}
%>