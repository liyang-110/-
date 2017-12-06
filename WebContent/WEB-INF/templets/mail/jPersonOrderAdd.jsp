<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.StudentModel" %>
<%@ page import="com.zhaopin.bean.Member"%>
<%@ page import="com.zhaopin.bean.ComUserBean"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

HashMap studentMap=(HashMap)request.getAttribute("student");
HashMapFactory student;
if(studentMap==null){
	//response.sendRedirect( path+"/");
	out.println("学生简历不存在或已删除！");
	return;
}else{
	student=new HashMapFactory(studentMap,"");
}
List edu=(List)request.getAttribute("edu");
List work=(List)request.getAttribute("work");
HashMap order = (HashMap)request.getAttribute("orderInfo");

String student_id=(String)request.getAttribute("student_id");
String order_id=(String)request.getAttribute("order_id");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>【211校招网】<%=order.get("name") %>应聘职位<%=order.get("job_name") %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
  </head>
  <body>
  	<!-- 
  	<Email><%=order.get("email") %></Email>
	-->
	<style type="text/css">
	.table-bordered th, .table-bordered td {
	border-left: 1px solid #ddd;
	}
	.table th, .table td {
	padding: 8px;
	line-height: 20px;
	text-align: left;
	vertical-align: top;
	border-top: 1px solid #ddd;
	}
	user agent stylesheettd, th {
	display: table-cell;
	vertical-align: inherit;
	}
	.table-bordered thead:first-child tr:first-child>th:last-child, .table-bordered tbody:first-child tr:first-child>td:last-child, .table-bordered tbody:first-child tr:first-child>th:last-child {
	-webkit-border-top-right-radius: 4px;
	border-top-right-radius: 4px;
	-moz-border-radius-topright: 4px;
	}
	.table-bordered thead:first-child tr:first-child>th:first-child, .table-bordered tbody:first-child tr:first-child>td:first-child, .table-bordered tbody:first-child tr:first-child>th:first-child {
	-webkit-border-top-left-radius: 4px;
	border-top-left-radius: 4px;
	-moz-border-radius-topleft: 4px;
	}
	.table-bordered caption+thead tr:first-child th, .table-bordered caption+tbody tr:first-child th, .table-bordered caption+tbody tr:first-child td, .table-bordered colgroup+thead tr:first-child th, .table-bordered colgroup+tbody tr:first-child th, .table-bordered colgroup+tbody tr:first-child td, .table-bordered thead:first-child tr:first-child th, .table-bordered tbody:first-child tr:first-child th, .table-bordered tbody:first-child tr:first-child td {
	border-top: 0;
	}
	.table caption+thead tr:first-child th, .table caption+thead tr:first-child td, .table colgroup+thead tr:first-child th, .table colgroup+thead tr:first-child td, .table thead:first-child tr:first-child th, .table thead:first-child tr:first-child td {
	border-top: 0;
	}
	.table thead th {
	vertical-align: bottom;
	}
	.table th {
	background-color: #f9f9f9;
	}
	.table-bordered th, .table-bordered td {
	border-left: 1px solid #ddd;
	}
	.table th {
	font-weight: bold;
	}
	.table th, .table td {
	padding: 8px;
	line-height: 20px;
	text-align: left;
	vertical-align: top;
	border-top: 1px solid #ddd;
	}
	user agent stylesheetth {
	font-weight: bold;
	}
	user agent stylesheettd, th {
	display: table-cell;
	vertical-align: inherit;
	}
	Inherited from table.table.table-bordered
	.table-bordered {
	border-collapse: separate;
	}
	table {
	border-collapse: collapse;
	border-spacing: 0;
	}
	user agent stylesheettable {
	white-space: normal;
	line-height: normal;
	font-weight: normal;
	font-size: medium;
	font-variant: normal;
	font-style: normal;
	color: -webkit-text;
	text-align: start;
	}
	user agent stylesheettable {
	border-collapse: separate;
	border-spacing: 2px;
	border-color: gray;
	}
	</style>
<table>
    <tbody>
    
        <tr>
            <td width="720" valign="center">
            <table>
                <tbody>
                    <tr>
                        <td width="720" valign="center">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="http://www.211zph.com" target="_blank">
                        <img src="http://www.211zph.com/static/images/LOGO.png" alt="211校招网" />
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <a href="http://www.211zph.com" target="_blank">登录会员请点击</a>
                        </p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p>&nbsp;</p>
            <table>
                <tbody>
                    <tr>
                        <td width="700" valign="center">
                        <p>尊敬的211校招网用户：</p>
                        <p>您好！贵公司收到来自<%=order.get("name") %>的简历，投递职位：<%=order.get("job_name") %>下载简历，请登录<a href="http://www.211zph.com" target="_blank">211校招网会员中心</a>。</p>
	<table class="table table-bordered" style="width:90%;">
    	<thead>
        	<tr><th colspan="4" align="left"> 
            	基本信息 
            </th></tr>
        </thead>
        <tbody>
        	<tr>
            <td>姓名：</td><td><%=student.get("name") %></td><td>性别</td><td><%=student.get("sex") %></td>
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
            <td>专业</td><td colspan="3"><%=student.get("profession") %></td>
            </tr>            
        </tbody>
    </table>


	<table class="table table-bordered" style="width:90%;">
	<tbody>
			<tr>
        	<th align="left">
            	求职意向
            </th>
            </tr>
        	<tr>
            <td>
            工作性质：<%=student.get("hope_type") %><br/>
            工作地点：<%=student.get("hope_areas") %><br/>
            求职岗位：<%=student.get("hope_positions") %><br/>
            从事行业：<%=student.get("hope_industrys") %><br/>
            期望月薪：<%=student.get("hope_salary") %>
            </td>
            </tr>
            <tr>
        	<th align="left">
            	自我评价
            </th>
            </tr>
        	<tr>
            <td>
            	<%=student.get("introduce") %>
            </td>
            </tr>
            <tr>
        	<th align="left">
            	教育背景
            </th></tr>
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
            		
            	<%  } 
            	  } 
            	%>
            </td>
            
        	<tr><th align="left">
            	工作或实习经历
            </th></tr>
        	<tr>
            <td>
            	<% if(work!=null && work.size()>0){ 
            		for(Iterator it=work.iterator();it.hasNext();){
            			HashMap row=(HashMap)it.next();
            	%>
   <table id="work_tpl" class="table table-condensed">
    		<tr>
    			<td colspan="7"><%=row.get("begin_date")%>-<%=row.get("end_date")%>&nbsp;&nbsp;&nbsp;&nbsp;<%=row.get("company_name")%>
    			</td>
</tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    			<td style="width:80px;">职位：</td><td><%=row.get("position")%></td>		
    			<td>月薪：</td><td><%=row.get("salary")%></td>		
    			<td>工作性质：</td><td><%=row.get("work_type")%></td>
    			<td>&nbsp;</td>
    		</tr><tr>
    			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    			<td>工作描述：</td>
    			<td colspan="5"><%=row.get("introduce")%></td>
    			
    		</tr>
    </table>
            		
            	<%  } 
            	  } 
            	%>
            </td></tr>
                            </tbody>
                        </table>
			<!-- -->

<p style="margin-left:50px;">本邮件由用户从211校招网<a href="http://www.211zph.com"  target="_blank">http://www.211zph.com</a>发送，下载简历请<a href="http://www.211zph.com" target="_blank">登录会员中心</a>。</p> 
                        </td>
                    </tr>
                </tbody>
            </table>
            
            </td>
        </tr>
    </tbody>
</table>

  </body>
</html>
