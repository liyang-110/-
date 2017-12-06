<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ page import="com.zhaopin.dao.Model" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%
	UserInterface user = User.currentUser(session);
	if(!( user instanceof AdUserBean )){
		response.sendRedirect("/");
	}
	Model model = new Model();
	List res;
	String job_fair_id = request.getParameter("id");
	if( job_fair_id == null ){
		response.sendError(404);
	}
	HashMap jobfair= new JobFairModel().getJobFairInfo(job_fair_id, false );
	if( jobfair == null ){
		response.sendError(404);
	}
	String[] params=new String[1];
	params[0]=job_fair_id;
	res = model.queryProcMap("pro_netcongress_report",params );
	
	HashMap m = new HashMap();
	if( res != null && res.size()>0 ){
		for(Iterator it=res.iterator();it.hasNext();){
			HashMap row = (HashMap)it.next();
			m.put( row.get("key"), row.get("value") );
		}
	}
	HashMapFactory map = new HashMapFactory( m,"0");
	String job_fair_name =jobfair.get("job_fair_date").toString()
				+jobfair.get("job_fair_name").toString();
 %>
<%@ page import="java.util.*" %>
<%@ page import="com.zhaopin.dao.CacheModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css">

<style>
	body {
		font-size: 14px; 
	}
	.table.table-bordered td {text-align:center;vertical-align:middle;}
</style>
</head>
<body style="background-color:#fff;margin:0;">
<%


%>
<table class="table table-bordered" width="560" border="0" cellpadding="0" cellspacing="0">
  <colgroup>
  <col width="140" span="4"/>
  </colgroup>
  <tbody>
  <tr height="28">
    <td height="28" width="560" colspan="4">
    	<%=job_fair_name %>
    	<a style="margin-right:20px;" href="/netcongress/ext/report.jsp?id=<%=job_fair_id %>" target="_blank">导出报表</a>
    </td>
  </tr>
  <tr height="28">
    <td height="140" rowspan="5">参会企业</td>
    <td rowspan="5"><%=map.get("company_num")%></td>
    <td>国企</td>
    <td><%=map.get("nature_01")%></td>
  </tr>
  <tr height="28">
    <td>事业单位</td>
    <td><%=map.get("nature_05")%></td>
  </tr>
  <tr height="28">
    <td>私企</td>
    <td><%=map.get("nature_02")%></td>
  </tr>
  <tr height="28">
    <td>外企</td>
    <td><%=map.get("nature_03")%></td>
  </tr>
  <tr height="28">
    <td>其他</td>
    <td>
    <%
		try{
			int company_num = Integer.parseInt( map.get("company_num").toString() );
			int nature_01 = Integer.parseInt( map.get("nature_01").toString() );
			int nature_05 = Integer.parseInt( map.get("nature_05").toString() );
			int nature_02 = Integer.parseInt( map.get("nature_02").toString() );
			int nature_03 = Integer.parseInt( map.get("nature_03").toString() );
			out.println( company_num-nature_01-nature_05-nature_02-nature_03 );
		}catch(Exception e){
			out.println("--");
		}
    %>
    </td>
  </tr>
  <%-- 
  <tr height="28">
    <td height="28">招聘职位</td>
    <td><%=map.get("recruit_count")%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  --%>
  <tr height="28">
    <td height="28">就业岗位</td>
    <td><%=map.get("person_num")%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  <tr height="28">
    <td height="140" rowspan="5">入场求职</td>
    <td rowspan="5"><%=map.get("resume_size")%></td>
    <%
    String boyS="--";
    String girlS="--";
    try{
		String student = map.get("student").toString();
		String boy = map.get("男").toString();
		String girl = map.get("女").toString();
		double boyPercent = Double.parseDouble( boy ) / Double.parseDouble( student );
		double girlPercent = Double.parseDouble( girl ) / Double.parseDouble( student );
		java.text.DecimalFormat df = new java.text.DecimalFormat();
		df.applyPattern("##.##%"); 
		//男
		boyS =  df.format( boyPercent ) ;
		//女
		girlS = df.format( girlPercent ) ;
	}catch(Exception e){
		
	}
    %>
    <td>男</td>
    <td>
    <%=boyS%>
    </td>
  </tr>
  <tr height="28">
    <td>女</td>
    <td><%=girlS%></td>
  </tr>
  <%
  String level01 = "--";
  String level02 = "--";
  String level03 = "--";
  try{
		String level = map.get("level").toString();
		String level_01= map.get("level_01").toString();
		String level_02=map.get("level_02").toString();
		double level01Percent = Double.parseDouble(level_01)/Double.parseDouble(level);
		double level02Percent =	Double.parseDouble(level_02)/Double.parseDouble(level);
		double level03Percent =	1-level01Percent-level02Percent;
		java.text.DecimalFormat df = new java.text.DecimalFormat();
		df.applyPattern("##.##%"); 
		
		//研究生
		level01 = df.format( level01Percent );
		//本科
		level02 = df.format( level02Percent );
		//高职
		level03 = df.format( level03Percent );
		
	}catch(Exception e){
		
	}
  %>
  <tr height="28">
    <td>研究生</td>
    <td><%=level01 %></td>
  </tr>
  <tr height="28">
    <td>本科</td>
    <td><%=level02 %></td>
  </tr>
  <tr height="28">
    <td>高职</td>
    <td><%=level03 %></td>
  </tr>
  
  <tr height="28">
    <td height="28" rowspan="1">累计投递简历</td>
    <td rowspan="1"><%=map.get("status_6") %></td>
    <td><%--  简历未通过--%></td>
    <td><%-- =map.get("status_1") --%></td>
  </tr>
  <%-- 
  <tr height="28">
    <td>简历通过审核</td>
    <td>
    <% 
    try{
    	int status_6=Integer.parseInt( map.get("status_6").toString() );
    	int status_1=Integer.parseInt( map.get("status_1").toString() );
    	int status_0=Integer.parseInt( map.get("status_0").toString() );
    	out.println( status_6-status_1-status_0 );
    }catch(Exception e){
    	out.println("--");
    }	
    %>
    </td>
  </tr>
  <tr height="28">
    <td>简历待处理</td>
    <td><%=map.get("status_0") %></td>
  </tr>
  --%>
  <%--
  <tr height="28">
    <td height="84" rowspan="3">达成就业意向</td>
    <td rowspan="3">
    <%=map.get("view_6") %>
    </td>
    <td>进入初试</td>
    <td><%=map.get("view_2") %></td>
  </tr>
  <tr height="28">
    <td>进入复试</td>
    <td><%=map.get("view_4") %></td>
  </tr>
  <tr height="28">
    <td>当场录用</td>
    <td><%=map.get("view_5") %></td>
  </tr>
  --%>
    <tr height="28">
    <td height="84" rowspan="3">达成就业意向</td>
    <td rowspan="2">
    <%=map.get("view_6") %>
    </td>
    <td>本校</td>
    <td><%=map.get("school_1") %></td>
  </tr>
  <tr height="28">
    <td>非本校</td>
    <td><%=map.get("school_0") %></td>
  </tr>
  </tbody>
</table>
<div style="height:30px;"></div>
<%
	// com.zhaopin.bean.UserInterface user = User.currentUser(session);
	if( ( user instanceof AdUserBean ) && 
			( "manager".equals( user.getUserId() )  
		 ||   "tangbo".equals( user.getUserId()  ) ) ){ %>
<%
	if(job_fair_id==null){
		%>
		参数错误！
		<%
	}else{
		HashMap jobfairInfo = new JobFairModel().getJobFairInfo(job_fair_id, false );
		if( jobfairInfo==null || !"netcongress".equals( jobfairInfo.get("job_fair_type") ) ){
			%>
				招聘会不存在或已删除！
			<%
		}else{
			String school_id = (String)jobfairInfo.get("school_id");
			String sql="";
			%>
			<div style="height:15px;"></div>
			<div id="info-more" style="margin:10px;padding:10px;background-color:#dcdcdc;">
			<%-- 
			<h5>参与招聘会情况</h5>
			--%>
			<%--
			sql=" select * from  ( " +
					" select count(*) company_num from tbl_company_jobfair a left join tbl_company b on a.company_id=b.company_id " +
					" where a.job_fair_id='"+job_fair_id+"' and b.company_id is not null " +
					" ) a left join ( " +
					" select count(*) position_num,sum(JOB_PERSON_NUM) job_person_num from tbl_company_recruit a left join tbl_company_jobfair b on a.company_id = b.company_id" +
					" where b.job_fair_id='"+job_fair_id+"' " +
					" ) b on 1=1 left join (" +
					" select resume_size,order_size from tbl_netcongress where job_fair_id='"+job_fair_id+"') c on 1=1 ";
			HashMap statistics =  model.findMap(sql);
			if( statistics!=null ){
				%>
	       	   <p>本会场共有企业<span><%=statistics.get("company_num") %></span>家
	       	   &nbsp;&nbsp;&nbsp;&nbsp;
	       	   招聘职位<span><%=statistics.get("position_num") %></span>个
	       	   &nbsp;&nbsp;&nbsp;&nbsp;
	       	   就业岗位<span><%=statistics.get("job_person_num") %></span>人
	       	   &nbsp;&nbsp;&nbsp;&nbsp;
	       	   入场求职人员<span><%=statistics.get("resume_size") %></span>人</p>
				<%
			}
			--%>
			<h5>达成就业意向<span><%=map.get("view_6") %></span></h5>
			<p> 初面：<span><%=map.get("view_2") %></span>
				复试：<span><%=map.get("view_4") %></span>
				录用：<span><%=map.get("view_5") %></span></p>
			<h5>学生投递简历</h5>
			<%
			sql="select * from (select nvl(a.status,6 ) rn, case when a.status=0 then '待处理' "+
					" when a.status=1 then '简历未通过'   when a.status=2 then  '通知面试' "+
					" when a.status=3 then  '面试未通过'   when a.status=4 then  '通知复试' "+
					" when a.status=5 then  '通知录用'  else '投递简历' end status,count(*) num from "+
					" tbl_person_order a left join tbl_company_jobfair b on a.company_id=b.company_id  "+
					" left join tbl_job_fair c on b.job_fair_id =c.job_fair_id "+
					" where b.job_fair_id='"+job_fair_id+"' "+
					" and a.add_time between c.add_time and c.job_fair_overtime "+
					" group by rollup(a.status)) order by rn desc";
			List<HashMap> orderStatus = model.queryMap(sql);
			if(orderStatus!=null){
				%><p><%
				for(HashMap row :orderStatus ){
				%>
				<%=row.get("status") %><span><%=row.get("num") %></span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p><%
			}
			%>
			<h5>企业处理简历</h5>
			<%
			sql="  select * from ( "+
					" select nvl(a.status,0) rn,case when a.status=1 then '简历未通过'  "+
					" when a.status=2 then  '通知面试'  "+
					" when a.status=3 then  '面试未通过'  "+
					" when a.status=4 then  '通知复试'  "+
					" when a.status=5 then  '通知录用'  else '处理简历' end status, "+
					" count(*) num from  "+
					" tbl_person_interview a left join tbl_company_jobfair b on a.company_id=b.company_id  "+
					" left join tbl_job_fair c on b.job_fair_id =c.job_fair_id  "+
					" where b.job_fair_id='"+job_fair_id+"'  "+
					" and a.add_time between c.add_time and c.job_fair_overtime  "+
					" group by rollup(a.status) ) order by rn asc "; 
			List<HashMap> list = model.queryMap(sql);
			if(list!=null){
				%><p><%
				for(HashMap row :list ){
				%>
				<%=row.get("status") %><span><%=row.get("num") %></span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p><%
			}
			%>
			<h5>性别比例</h5>
			<%
			sql=" select sex ,count(*) num from tbl_netcongress_log a left join tbl_student b on a.operuser=b.login_id "+
					" where sex is not null and  log_type='IN' and opertype='student' and job_fair_id='"+job_fair_id+"' "+
					" group by b.sex ";
			list = model.queryMap(sql);
			if(list!=null){
				%><p><%
				for(HashMap row :list ){
				%>
				<%=row.get("sex") %><%=row.get("num") %>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p><%
			}
			%><h5>学历比例</h5><%
			sql = " select decode( education,null,'其他',fun_codename(education,'job_fair_level') ) education,count(*) num from tbl_netcongress_log a left join tbl_student b on a.operuser=b.login_id "+
					" where b.education is not null and log_type='IN' and opertype='student' and job_fair_id='"+job_fair_id+"' "+ 
					" group by b.education ";
			list = model.queryMap(sql);
			if(list!=null){
				%><p><%
				for(HashMap row :list ){
				%>
				<%=row.get("education") %><%=row.get("num") %>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p><%
			}
			%>
			<%-- 
			<h5>校内校外学生比例</h5><%
			sql=" select school,count(*) num from ( "+
					" select b.school_id,case when b.school_id='"+school_id+"' then '本校' else '外校' end school  "+
					" from tbl_netcongress_log a left join tbl_student b on a.operuser=b.login_id   "+
					" where log_type='IN' and opertype='student' and a.job_fair_id='"+job_fair_id+"'   "+
					" ) group by school ";
			list = model.queryMap(sql);
			if(list!=null){
				%><p><%
				for(HashMap row :list ){
				%>
				<%=row.get("school") %><%=row.get("num") %>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p><%
			}
			%>
			--%>
			<h5>企业类型</h5><%
			sql=" select case when company_nature is null then '其他' else fun_codename(company_nature,'company_nature') end nature, "+
					" count(*) num from tbl_company_jobfair a left join tbl_company b on a.company_id=b.company_id "+
					" where a.job_fair_id='"+job_fair_id+"' group by company_nature ";
			list = model.queryMap(sql);
			if(list!=null){
				%><p><%
				for(HashMap row :list ){
				%>
				<%=row.get("nature") %><%=row.get("num") %>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
				%></p>
				</div>
				<%
			}
		}
	} 
%>
<% } %>
</body>
</html>