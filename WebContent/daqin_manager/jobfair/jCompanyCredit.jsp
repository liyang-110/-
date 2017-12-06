<%@ page language="java" import="java.util.*" contentType="text/html;GBK"  pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<textarea style="width:100%;height:100%;overflow:auto;"><%
	String job_fair_id = request.getParameter("id");
	String sql=" select 'http://www.211zph.com/'||path pic_path from ( select c.file_path || c.file_newname path "+
			" from tbl_company_jobfair a left join tbl_company b on a.company_id = b.company_id "+ 
			" left join tbl_base_save_file c on nvl(b.company_img,b.company_pic )=c.file_id "+ 
			" where a.job_fair_id ='"+job_fair_id+"' and b.company_id is not null ) where path is not null "; 
	List company = new Model().queryMap(sql);
	if( company != null ){
		for(Iterator it = company.iterator();it.hasNext();){
			HashMap row = (HashMap)it.next();
			out.println( row.get("pic_path") );
		}
	}

%></textarea>
</body>
</html>