<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.StudentModel" %>
<%@ page import="com.zhaopin.bean.Member"%>
<%@ page import="com.zhaopin.bean.ComUserBean"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
if( com.zhaopin.bean.User.currentUser(session) == null ){
	response.sendRedirect("/");
}

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

HashMap studentMap=(HashMap)request.getAttribute("student");
HashMapFactory student;
if(studentMap==null){
	out.println("学生简历不存在或已删除！");
	return;
}else{
	student=new HashMapFactory(studentMap,"");
}
List edu=(List)request.getAttribute("edu");
List work=(List)request.getAttribute("work");
String student_id=request.getAttribute("student_id")==null?"":(String)request.getAttribute("student_id");
String order_id=request.getAttribute("order_id")==null?"":(String)request.getAttribute("order_id");
String netViewResume=request.getAttribute("netViewResume")==null?"":(String)request.getAttribute("netViewResume");

ComUserBean company = (ComUserBean)com.zhaopin.bean.User.getUser("company", request.getSession() );
String member_type=company!=null ?company.getMemberType():""; 
String chargetype=company!=null ?company.getChargeType():""; 
String company_status=company!=null ?company.getStatus():""; 

String _s = request.getParameter("_s")!=null?request.getParameter("_s"):"";
String nid = request.getParameter("nid")!=null?request.getParameter("nid"):"";
String recruit = request.getParameter("recruit")!=null?new String(request.getParameter("recruit").getBytes("ISO-8859-1"),"GBK"):"";
String sms_count = request.getAttribute("sms_count")!=null?String.valueOf(request.getAttribute("sms_count")):"0";
String comtel = (String)request.getAttribute("comtel");

boolean isPaid=( (Boolean)request.getAttribute("isPaid") ).booleanValue();
int interviewStatus=-2;
int price=1;
try{	
	interviewStatus =( (Integer)request.getAttribute("interviewStatus") ).intValue();
	price =( (Integer)request.getAttribute("price") ).intValue();
}catch(NumberFormatException e){
}catch(Exception e){
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>简历预览</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link  href="/statics/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="/statics/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
<script src="/statics/jquery/jquery.form.js" type="text/javascript"></script>
<script src="/assets2/jquery/jquery.validate.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="./member/js/front.js" charset="utf-8"></script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
	var cur_path="<%=path%>";
	var callback = "<%=request.getParameter("callback")%>";
	var chargetype="<%=company!=null?company.getChargeType():""%>";
	var order_id='<%=order_id%>';
	var student_id='<%=student_id%>';
</script>
<script type="text/javascript" src="/static/js/resumeDetail.js" charset="utf-8"></script>
<style>
	*{font-size:14px;}
	.table{width:755px;margin:auto;}
	.table th {background-color: #f9f9f9;}
	dl.reason-options dt {clear:both;}
	dl.reason-options dd {float:left;}
</style>
 </head>
  <body>
<!--简历未通过  -->
  	<div id="dlg_failure1" style="display:none;">
  		<div style="font-size:14px; font-familly:微软雅黑;">
  		<strong><%=student.get("name") %></strong>的简历未通过,请选择原因：<br/>
  		<div class="reason-container">
  			<dl class="reason-options">
  				<dt>一，基本要求不符合</dt>
  					<dd><label class="checkbox"><input type="checkbox" value="要求大专学历" />要求大专学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="要求本科学历" />要求本科学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="要求研究生学历" />要求研究生学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="专业不符合要求" />专业不符合要求</label></dd>
  				<dt>二，技能不符合要求</dt>
					<dd><label class="checkbox"><input type="checkbox" value="英语四级未通过" />英语四级未通过</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="英语六级未通过" />英语六级未通过</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="计算机二级" />计算机二级</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="相关技能未展示" />相关技能未展示</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="普通话不达标" />普通话不达标</label></dd>
  				<dt>三，个人能力</dt>
					<dd><label class="checkbox"><input type="checkbox" value="语言表达能力还需提高" />语言表达能力还需提高</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="简历中未体现出特长" />简历中未体现出特长</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="动手能力不强" />动手能力不强</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="需提升团队合作能力" />需提升团队合作能力</label></dd>			
  				<dt>四、实习经验</dt>
 					<dd><label class="checkbox"><input type="checkbox" value="没有实习经验" />没有实习经验</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="缺乏实践能力" />缺乏实践能力</label></dd>
  				<dt>五、薪资</dt>
 					<dd><label class="checkbox"><input type="checkbox" value="不能满足期望薪资" />不能满足期望薪资</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="不愿意调整高薪" />不愿意调整高薪</label></dd>
  				<dt>六、其他</dt>
  					<dd><label class="checkbox"><input type="checkbox" value="性别不符合" />性别不符合</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="身高不达标" />身高不达标</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="其他" />其他</label></dd>
					<dd><input type="text"  style="width:300px;" maxlength="20" /></dd>
  			</dl>
  		<form>
  		<input type="hidden" name="nid" value="<%=nid %>" />
  		<input type="hidden" name="_s" value="<%=_s %>" />
  		<input type="hidden" name="content" style="width:320px;" /> 
  		<input name="status" value="1" type="hidden"/>
  		<input name="sid" value="<%=student_id%>" type="hidden"/>
  		<input name="oid" value="<%=order_id%>" type="hidden"/>
  		</form>
  		</div>
  		</div>
  	</div>
<!--发送面试通知  -->
  	<div id="dlg_interview" style="display:none;">
  		<form style="line-height:25px;">
  		<input type="hidden" name="nid" value="<%=nid %>" />
  		<input type="hidden" name="_s" value="<%=_s %>" />
  		<input name="status" value="2" type="hidden"/>
  		<input name="sid" value="<%=student_id%>" type="hidden"/>
  		<input name="oid" value="<%=order_id%>" type="hidden"/>
  		姓名：<%=student.get("name") %><br/>
  		<%if(!"".equals(recruit)){%>
  			投递岗位：<%=recruit %></br>
  		<%}else{%>
			<select name="jobId">
            	<c:forEach var="row" items="${recruitlist}">
            	<option value="${row.job_id }">${row.job_name }</option>
            	</c:forEach>
			</select><br/>
  		<%} %>
  		<textarea id="content" name="content" cols="50" rows="5" style="width:440px;"><%=student.get("name") %>您好，我司已收到您的简历并邀请您参加面试，联系方式：<%=comtel %>
  		</textarea>
  		<br/>
  			<%if("0".equals(sms_count)){%>
  				<label>
  					<input type="checkbox" name="system" value="2" checked="checked"/>
  					发送系统消息
  				</label>
  				<label>
  		  			<input type="checkbox" name="sms"  value="-1" disabled="disabled"/>
  					<span style="color:#999;">发送短信通知</span><span  style="color:#e03919;">(短信余额不足，无法同时发送短信通知，请联系客服充值！)</span>
  				</label>
  		  	<%}else{ %>
  		  		<label>
  		  			<input type="checkbox" name="system" value="2" checked="checked"/>
  		  			发送系统消息
  		  		</label>
  		  		<label>
  					<input type="checkbox" name="sms" value="1" />
  					发送短信通知(<span style="font-size:12px;color:red;">剩余短信数：<%=sms_count %>条</span>)
  				</label>
  			<%} %>
  		</form>
  	</div>
<!--面试未通过  -->
  	<div id="dlg_failure2" style="display:none;">
  		<div style="font-size:14px; font-familly:微软雅黑;">
  		<strong><%=student.get("name") %></strong>面试未通过,请选择原因：<br/>
  		<div class="reason-container">
  			<dl class="reason-options">
  				<dt>一，基本要求不符合</dt>
  					<dd><label class="checkbox"><input type="checkbox" value="要求大专学历" />要求大专学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="要求本科学历" />要求本科学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="要求研究生学历" />要求研究生学历</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="专业不符合要求" />专业不符合要求</label></dd>
  				<dt>二，技能不符合要求</dt>
					<dd><label class="checkbox"><input type="checkbox" value="英语四级未通过" />英语四级未通过</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="英语六级未通过" />英语六级未通过</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="计算机二级" />计算机二级</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="相关技能未展示" />相关技能未展示</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="普通话不达标" />普通话不达标</label></dd>
  				<dt>三，个人能力</dt>
					<dd><label class="checkbox"><input type="checkbox" value="语言表达能力还需提高" />语言表达能力还需提高</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="简历中未体现出特长" />简历中未体现出特长</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="动手能力不强" />动手能力不强</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="需提升团队合作能力" />需提升团队合作能力</label></dd>		
  				<dt>四、实习经验</dt>
 					<dd><label class="checkbox"><input type="checkbox" value="没有实习经验" />没有实习经验</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="缺乏实践能力" />缺乏实践能力</label></dd>
  				<dt>五、薪资</dt>
 					<dd><label class="checkbox"><input type="checkbox" value="不能满足期望薪资" />不能满足期望薪资</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="不愿意调整高薪" />不愿意调整高薪</label></dd>
  				<dt>六、其他</dt>
  					<dd><label class="checkbox"><input type="checkbox" value="性别不符合" />性别不符合</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="身高不达标" />身高不达标</label></dd>
  					<dd><label class="checkbox"><input type="checkbox" value="其他" />其他</label></dd>
					<dd><input type="text"  style="width:300px;" maxlength="20" /></dd>
  			</dl>
  		<form>
  		<input type="hidden" name="nid" value="<%=nid %>" />
  		<input type="hidden" name="_s" value="<%=_s %>" />
  		<input type="hidden" name="content" style="width:320px;" /> 
  		<input name="status" value="3" type="hidden"/>
  		<input name="sid" value="<%=student_id%>" type="hidden"/>
  		<input name="oid" value="<%=order_id%>" type="hidden"/>
  		</form>
  		</div>
  		</div>
  	</div>
<!--面试通过  -->
  	<div id="dlg_reinterview" style="display:none;">
  		<form style="line-height:25px;">
  		<input type="hidden" name="nid" value="<%=nid %>" />
  		<input type="hidden" name="_s" value="<%=_s %>" />
  		<input name="status" value="4" type="hidden"/>
  		<input name="sid" value="<%=student_id%>" type="hidden"/>
  		<input name="oid" value="<%=order_id%>" type="hidden"/>
  		姓名：<%=student.get("name") %><br/>
  		<%if(!"".equals(recruit)){%>
  			投递岗位：<%=recruit %></br>
  		<%}else{%>
			<select name="jobId">
            	<c:forEach var="row" items="${recruitlist}">
            	<option value="${row.job_id }">${row.job_name }</option>
            	</c:forEach>
			</select><br/>
  		<%} %>
  		<textarea  id="content" name="content" cols="50" rows="5" style="width:440px;">    <%=student.get("name") %>您好，恭喜您通过面试！请您尽快与我们联系确认相关信息，联系方式：<%=comtel %>
  		</textarea>
   			<%if("0".equals(sms_count)){%>
  				<label>
  					<input type="checkbox" name="system" value="2" checked="checked"/>
  					发送系统消息
  				</label>
  				<label>
  		  			<input type="checkbox" name="sms"  value="-1" disabled="disabled"/>
  					<span style="color:#999;">发送短信通知</span><span  style="color:#e03919;">(短信余额不足，无法同时发送短信通知，请联系客服充值！)</span>
  				</label>
  		  	<%}else{ %>
  		  		<label>
  		  			<input type="checkbox" name="system" value="2" checked="checked"/>
  		  			发送系统消息
  		  		</label>
  		  		<label>
  					<input type="checkbox" name="sms" value="1" />
  					发送短信通知(<span style="font-size:12px;color:red;">剩余短信数：<%=sms_count %>条</span>)
  				</label>
  			<%} %>
  		</form>
  	</div>
<!--通知复试  -->
  	<div id="dlg_offer" style="display:none;">
  		<form style="line-height:25px;">
  		<input type="hidden" name="nid" value="<%=nid %>" />
  		<input type="hidden" name="_s" value="<%=_s %>" />
  		<input name="status" value="5" type="hidden"/>
  		<input name="sid" value="<%=student_id%>" type="hidden"/>
  		<input name="oid" value="<%=order_id%>" type="hidden"/>
  		姓名：<%=student.get("name") %><br/>
  		<%if(!"".equals(recruit)){%>
  			投递岗位：<%=recruit %></br>
  		<%}else{%>
			<select name="jobId">
            	<c:forEach var="row" items="${recruitlist}">
            	<option value="${row.job_id }">${row.job_name }</option>
            	</c:forEach>
			</select><br/>
  		<%} %>
  		<textarea id="content" name="content" cols="50" rows="5" style="width:440px;"><%=student.get("name") %>您好，恭喜您已被我司录用！请您尽快与我们联系确认相关信息，联系方式：<%=comtel %>
  		</textarea>
  			<%if("0".equals(sms_count)){%>
  				<label>
  					<input type="checkbox" name="system" value="2" checked="checked"/>
  					发送系统消息
  				</label>
  				<label>
  		  			<input type="checkbox" name="sms"  value="-1" disabled="disabled"/>
  					<span style="color:#999;">发送短信通知</span><span  style="color:#e03919;">(短信余额不足，无法同时发送短信通知，请联系客服充值！)</span>
  				</label>
  		  	<%}else{ %>
  		  		<label>
  		  			<input type="checkbox" name="system" value="2" checked="checked"/>
  		  			发送系统消息
  		  		</label>
  		  		<label>
  					<input type="checkbox" name="sms" value="1" />
  					发送短信通知(<span style="font-size:12px;color:red;">剩余短信数：<%=sms_count %>条</span>)
  				</label>
  			<%} %>
  		</form>
  	</div>
	
<!--基本信息  -->
	<table class="table table-bordered" >
    	<thead>
        	<tr><th colspan="5"> 
            	基本信息
            	<a style="float:right;" href="<%="/company/resumeDetail.do?"+request.getQueryString() %>" target="_blank" > [在新窗口浏览]</a>
            </th></tr>
        </thead>
        <tbody>
        	<tr>
            <td>姓名：</td><td><%=student.get("name") %></td><td>性别</td><td><%=student.get("sex") %></td>
            <td rowspan="4">
            	<c:choose>
            	<c:when test="${not empty student.get('head_pic') }">
            	<img style="height:156px;width:114px;" src="/upload/headpic/<%=student.get("head_pic") %>" />
            	</c:when>
            	<c:otherwise>
            	<img style="height:156px;width:114px;" src="/static/images/personal_center/user.png" />
            	</c:otherwise>
            	</c:choose>
            </td>
            </tr>
        	<tr>
            <td>出生年月</td><td><%=student.get("birth") %></td><td>民族</td><td>--</td>
            </tr>
        	<tr>
            <td>户口所在地</td><td><%=student.get("home_areas") %></td><td>现所在地</td><td><%=student.get("areas") %></td>
            </tr>
        	<tr>
            <td>毕业学校</td><td><%=student.get("school_name") %></td><td>最高学历</td><td><%=student.get("educations") %></td>
            </tr> 
        	<tr>
            <td>专业</td><td colspan="4"><%=student.get("profession") %></td>
            </tr>            
        </tbody>
    </table>
<!--求职意向,自我评价,教育背景  -->
	<table class="table table-bordered" >
		<tr><th>求职意向</th></tr>
        <tr>
            <td>
            	工作性质：<%=student.get("hope_type") %><br/>
            	工作地点：<%=student.get("hope_areas") %><br/>
            	求职岗位：<%=student.get("hope_positions") %><br/>
            	从事行业：<%=student.get("hope_industrys") %><br/>
            	期望月薪：<%=student.get("hope_salary") %>
            </td>
		</tr>
        <tr><th>自我评价</th></tr>
        <tr>
            <td>
            	<%=student.get("introduce") %>
            </td>
        </tr>
        <tr><th>教育背景</th></tr>
        <tr>
            <td>
            	<% if(edu!=null && edu.size()>0){ 
            		for(Iterator it=edu.iterator();it.hasNext();){
            			HashMap row=(HashMap)it.next();
            	%>
   			<table id="school_list" class="table table-condensed">
    		<tr>
    			<td><%=row.get("begin_date")%>-<%=row.get("end_date")%>
    			</td>
    			<td><%=row.get("school_name")%>
    			</td>
    			<td><%=row.get("profession")%>
    			</td>
    			<td><%=row.get("education")%>
    			</td>
    		</tr>
    		</table>
            	<%  } } %>
            </td>
		<tr><th>工作或实习经历</th></tr>
		<tr>
			<td>
				<%
					if (work != null && work.size() > 0) {
						for (Iterator it = work.iterator(); it.hasNext();) {
							HashMap row = (HashMap) it.next();
				%>
				<table id="work_tpl" class="table table-condensed">
					<tr>
						<td colspan="7"><%=row.get("begin_date")%>-<%=row.get("end_date")%>&nbsp;&nbsp;&nbsp;&nbsp;<%=row.get("company_name")%>
						</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td style="width:80px;">职位：</td>
						<td><%=row.get("position")%></td>
<%-- 						<td>月薪：</td>
						<td><%=row.get("salary")%></td>
						<td>工作性质：</td>
						<td><%=row.get("work_type")%></td> --%>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>工作描述：</td>
						<td colspan="5"><%=row.get("introduce")%></td>
					</tr>
				</table> 
				<%}}else{%>
 					暂无信息！
 				<%} %>
			</td>
		</tr>
		<!--status=0  ---------------------->
        	<%
        	if(company!=null && isPaid && interviewStatus<2  ){
        	%>  
	        <tr><td style="background:##ff9;text-align:center;">
	        	<span style="margin-top:3px;">
	        		<!--网络招聘会查看简历，一键面试  -->
	        		<%if("netcom".equals(netViewResume)) {%>
	        			<a href="javascript:;" style="background:#01B5FF;" class="btn btn-info btn-medium" onclick="interview('<%=student.get("hx_user")%>','<%=student.get("head_pic")==null?"":student.get("head_pic")%>','<%=student.get("name")%>');">一键面试</a>&nbsp;&nbsp;
	        		<%} %>
	        		
	        		<% if( interviewStatus>=0 ){ %>
	        		<a href="javascript:;" class="btn btn-info btn-medium" onclick="deal_resume(1);">简历未通过</a>&nbsp;&nbsp;
	        		&nbsp;&nbsp;
	        		<% } %>
	        		<% if( isPaid ){ %>
	        		<a href="javascript:;" class="btn btn-warning btn-medium" onclick="deal_resume(2);">
	        		发送面试通知
	        		</a>
	        		<%}else{ %>
	        		<a href="javascript:;" class="btn btn-warning btn-medium" onclick="buy_resume('<%=student_id%>');">
	        		发送面试通知
	        		</a>
	        		<%}  %>
	        	</span>
	        	</td></tr>
	    	<%} %>
        	<tr><th>
            	联系信息
            	<%--if(!isPaid){ %> 
            	 <span style="font-weight:normal;color:red;">(下载简历后查看)</span>
            	<%} --%>
            </th></tr>
        	<tr>
            <td>
            <table class="table table-condensed"><tr><td>电话：</td><td>
            <%if( isPaid ){ %>
            	<%=student.get("contact_tel") %>
            <%}else{ 
            	String contact_tel=(String)student.get("contact_tel");
            	if(contact_tel==null || contact_tel.length()<=3 ){
            		%>
            		--
            		<%
            	}else{
            		%>
            		<%=contact_tel.substring(0,3)+"********" %>
            		<%
            	}
            %>
            <%} %>
            </td>
            <td>邮件：</td><td>
            <%  if( isPaid ){ %>
            	<%=student.get("contact_email") %>
            <%}else{ 
            	String contact_email=(String)student.get("contact_email");
            	if(contact_email==null || contact_email.indexOf("@")==-1 ){
            		%>
            		--
            		<%
            	}else{
            		%>
            		<%="********"+contact_email.substring( contact_email.indexOf("@") ) %>
            		<%
            	}
            %>
            <%} %>
            </td></tr></table>
              
            </td></tr>
            <%
            	String resume_path=(String)request.getAttribute("resume_path");
            	if(resume_path!=null && !"".equals(resume_path) && isPaid ){ %>
            	<tr><th>
            	简历附件：
            	</th></tr>
            	<tr><td>
            		<a href="<%=request.getContextPath() %>/upload/download.jsp?path=<%=resume_path %>&name=<%=student.get("name") %>" target="_blank">
            		点击下载简历附件
            		</a>
            	</td></tr>	
            	<%}%>
    </table>   
    <div style="margin:20px auto;text-align:center;">
    <%
       if(company!=null && "3".equals( chargetype ) 
             			&& !isPaid 
             			&& interviewStatus<1 
             			&& price > 0 
             	){
             %>
             <%--
             <button class="btn btn-small btn-info" onclick="buy_resume('<%=student_id %>');">下载简历</button>
              --%>
             <button class="btn btn-small btn-info" onclick="download_resume();">下载简历</button>
             <%
             }
    
     %>
    </div>
    <div style="text-align:center;margin:35px auto;width:90%;">
<!--status=0  -------------->
	<%if( interviewStatus>=2 ){ %>
		<!--网络招聘会查看简历，一键面试  -->
    	<%if("netcom".equals(netViewResume)) {%>
	    	<a href="javascript:;" style="background:#01B5FF;" class="btn btn-info btn-medium" onclick="interview('<%=student.get("hx_user")%>','<%=student.get("head_pic")==null?"":student.get("head_pic")%>','<%=student.get("name")%>');">一键面试</a>&nbsp;&nbsp;
	    <%} %>
	    
    	<% if( interviewStatus <2 ){ %>
    	<a href="javascript:;" class="btn btn-info btn-medium" onclick="deal_resume(1);">简历未通过</a>&nbsp;&nbsp;
    	<a href="javascript:;" class="btn btn-warning btn-medium" onclick="deal_resume(2);">通知面试</a>&nbsp;&nbsp;
    	<% }else{ %>
    	<a href="javascript:;" class="btn btn-info btn-medium" onclick="deal_resume(3);">面试未通过</a>&nbsp;&nbsp;
    	<a href="javascript:;" class="btn btn-warning btn-medium" onclick="deal_resume(4);">面试通过</a>&nbsp;&nbsp;  
    	 <% } %> 	
    	<a href="javascript:;" class="btn btn-success btn-medium" onclick="deal_resume(5);">通知录用</a>&nbsp;&nbsp;
    	<!-- <a href="javascript:;" class="btn btn-medium" onclick="cancel_layer()">关闭</a> -->
	<% }else{ %>
    	<a style="display:none;line-height:35px;border:1px solid #266844;padding:2px 5px;" href="javascript:;" onclick="cancel_layer()">关闭</a>
 	<% } %>
    </div>
    
<!--消息记录部分  -->
    <% List<HashMap> resumeLog = (List<HashMap>)request.getAttribute("resumeLog");
     if( resumeLog!=null && resumeLog.size()>0 ) {%>
    <div style="padding-left:20px;margin:0 auto 30px auto;width:772px;">
    	<ul>
    	<% for(HashMap row : resumeLog){ %>
    		<li style="<%=("today".equals(row.get("today"))?"font-weight:bold;color:green;":"") %>"><%=row.get("add_time") %>&nbsp;&nbsp;<%=row.get("remark") %></li>
    	<% } %>
    	</ul>
    </div>
    <% } %>
  </body>
</html>
