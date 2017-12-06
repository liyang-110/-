<%@page import="org.apache.commons.beanutils.DynaBean"%>
<%@page import="com.zhaopin.dao.CacheModel"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String area_names="重庆、四川、贵州、云南、广西、陕西、甘肃、青海、宁夏、西藏、新疆、内蒙古";
String area_ids="6,21,23,24,25,26,27,28,29,30,31,32";

String mutiple_sql =
" select job_fair_id,school_id,job_fair_name,job_fair_sponsor,"+
" job_fair_addr, job_fair_company_num,area_id,"+
" job_fair_type, to_char(job_fair_time,'yyyy-mm-dd hh24:mi:ss')  job_fair_time, "+
" to_char(job_fair_time,'YYYY\"年\"fmmm\"月\"dd\"日\"') job_fair_date,"+
" to_char(job_fair_endtime,'yyyy-mm-dd hh24:mi:ss') job_fair_endtime, "+
" decode(school_name,null,'空',school_name) school_name,"+
//" fun_codename(job_fair_feature,'job_fair_feature') job_fair_feature,"+
" fun_area_name(area_id) area_name,"+
" (select job_fair_company_num-count(*) from tbl_company_jobfair  where job_fair_id=n.job_fair_id) last_num,front_sign "+
" from  ( "+
"  select a.job_fair_id,a.school_id,job_fair_name,job_fair_sponsor, job_fair_addr, job_fair_bus_route, b.school_name,  job_fair_time,job_fair_endtime,job_fair_type,job_fair_feature,  job_fair_company_num ,a.area_id,a.front_sign "+ 
"   from tbl_job_fair a left join tbl_school b on a.school_id=b.school_id "+
"   where 1=1 and  a.flag=0  and (a.school_id is null or b.status=1) "+
"   and ( job_fair_time>=trunc(sysdate,'DD') or job_fair_overtime>=trunc(sysdate,'DD') )  "+
" and exists ( select * from (select column_value area_id from table ( "+
" ( select fn_split('6,21,23,24,25,26,27,28,29,30,31,32',',') from dual ) "+
" ) ) where regexp_instr(a.area_id,'(,|^)'||area_id||'(,|$)+')>0  ) "+
" and job_fair_type='multiple' order by front_sign desc, job_fair_time asc ) n  where rownum<=10 ";

String netcongress_sql =
" select job_fair_id,school_id,job_fair_name,job_fair_sponsor,"+
" job_fair_addr, job_fair_company_num,area_id,"+
" job_fair_type, to_char(job_fair_time,'yyyy-mm-dd hh24:mi:ss')  job_fair_time, "+
" to_char(job_fair_time,'YYYY\"年\"fmmm\"月\"dd\"日\"') job_fair_date,"+
" to_char(job_fair_endtime,'yyyy-mm-dd hh24:mi:ss') job_fair_endtime, "+
" decode(school_name,null,'空',school_name) school_name,"+
//" fun_codename(job_fair_feature,'job_fair_feature') job_fair_feature,"+
" fun_area_name(area_id) area_name,"+
" (select job_fair_company_num-count(*) from tbl_company_jobfair  where job_fair_id=n.job_fair_id) last_num,front_sign "+
" from  ( "+
"  select a.job_fair_id,a.school_id,job_fair_name,job_fair_sponsor, job_fair_addr, job_fair_bus_route, b.school_name,  job_fair_time,job_fair_endtime,job_fair_type,job_fair_feature,  job_fair_company_num ,a.area_id,a.front_sign "+ 
"   from tbl_job_fair a left join tbl_school b on a.school_id=b.school_id "+
"   where 1=1 and  a.flag=0  and (a.school_id is null or b.status=1) "+
"   and ( job_fair_time>=trunc(sysdate,'DD') or job_fair_overtime>=trunc(sysdate,'DD') )  "+
" and exists ( select * from (select column_value area_id from table ( "+
" ( select fn_split('6,21,23,24,25,26,27,28,29,30,31,32',',') from dual ) "+
" ) ) where regexp_instr(a.area_id,'(,|^)'||area_id||'(,|$)+')>0  ) "+
" and job_fair_type='netcongress' order by front_sign desc, job_fair_time asc ) n  where rownum<=10 ";
String recruit_sql =" select job_id, job_name, job_person_num ," +
//"(select wm_concat(fun_professional_name(column_value)) " +
//" from table (select fn_split(professional, ',') from dual) where rownum<20) professional," +
//" case when education is not null then fun_codename(education,'job_fair_level') else '不限' end  education," +
//" case when education is not null then fun_codename(money,'money') else '不限' end money, " +
" case when job_area_id is null then fun_area_name(area_id)  "+
" else  fun_concat_decode(job_area_id,'hopeArea',-4) end areas,job_type," +
" company_id,fun_companyid_name(company_id) company_name,introduction,requirement, " +
" fun_area_name(area_id) area_name,area_id from (select * from  tbl_company_recruit a " +
" where decode(job_area_id,null,substr('0000'||area_id,-4),substr(job_area_id,0,4) ) in ( " +
" select substr('0000'||id,-4) from tbl_area where instr( " +
" '重庆、四川、贵州、云南、广西、陕西、甘肃、青海、宁夏、西藏、新疆、内蒙古',name) >0 ) order by add_time desc ) n where rownum<=20";

CacheModel model = new CacheModel();
 List<DynaBean> mutiple_list=(List<DynaBean>) model.queryBean(mutiple_sql);
 List<DynaBean> netcongress_list=(List<DynaBean>) model.queryBean(netcongress_sql);
 List<DynaBean> recruit_list=(List<DynaBean>) model.queryBean(recruit_sql);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>2016年西部地区(面向高校毕业生)网上招聘月 - 211校招网</title>

<meta name="Keywords" content="211校招网,校园招聘，校园招聘会，校招网,招聘会,宣讲会,双选会,校园招聘会,应届生招聘会,毕业生招聘会,就业洽谈会">
<meta name="Description" content=" 211校招网是一个免费为高校和企业开展校园招聘，提供校园招聘会在线发布、预订、宣传、管理的平台。在全国30个省市设立了分站，服务中小企业和大学生。">

<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="statics/jquery/jquery.form.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script type="text/javascript" src="/statics/jquery/jquery.jcarousellite.min.js"></script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>


<style type="text/css">
	.left_a_outter {margin:0 -5px;}
	.left_a_outter .left_a {margin-left:5px;margin-right:5px;}
	.left_a_outter .left_a h1 { white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}
</style>
</head>
<body>
<div class="header">
	<div class="head">
        <div class="left_a">
        	<a href="http://www.211zph.com/" target="_blank">
            <img src="img/logo.png">
            </a>
        </div>
        <div class="left_b">
            <ul>
                <li><a href="http://www.211zph.com/" target="_blank">211校招网首页</a></li>
                <li><a href="/jobfair.do" target="_blank">招聘会</a></li>
                <li><a href="/subStationJobs.do" target="_blank">招聘职位</a></li>
                
                <li><a href="http://www.ncss.org.cn/wlzph/2016nxbdqwszpy/" target="_blank">进入主会场</a></li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="right_a">
            <a href="/" target="_blank">登录</a>
            <span>|</span>
            <a href="/register.jsp" target="_blank">免费注册</a>
        </div>
        <div class="clear"></div>	
    </div>
</div>
<!--header完成-->
<div class="banner">
	<img src="img/banner.jpg">
</div>
<!--banner完成-->
<div class="container">
	<div class="left">
        <div class="left_top">
            <div class="list_a">
            	<div class="text_a">
                	<h1><img src="img/xiaoyuan.png">网络招聘会</h1>
                </div>
                <div class="text_b">
                	<a href="/jobfair.do?jobfairType=netcongress" target="_blank">更多&gt;&gt;</a>
                </div>
                <div class="clear"></div>
            </div>
<div class="left_a_outter">
<%
	// List jobfair=(List)request.getAttribute("jobfair0");
	if(netcongress_list!=null && netcongress_list.size()>0){ 
		for(Iterator it=netcongress_list.iterator();it.hasNext();)
		{
			DynaBean temp=(DynaBean)it.next();
%>
             <div class="job left_a">
                <h1><%=temp.get("job_fair_name") %></h1>
                <p>举办时间：<%=temp.get("job_fair_time") %></p>
                <p>剩余展位：<%=temp.get("last_num") %>个  
                   <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=temp.get("job_fair_id") %>" target="_blank">查看详情&gt;&gt;</a></p>
                <ul>
                    <li><a href="javascript:;" onclick="ComApply('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')">企业订展</a></li>
                    <li><a href="javascript:;" onclick="openOrder('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')">投递简历</a></li>    
                </ul>
                <div class="clear"></div>
            </div>
<%
		} // for
	} // if 			
%>
	
            <div class="clear"></div>
</div>
        </div>
        <!--xiaoyuan-->
        <div class="left_bottom">
        	 <div class="list_a list_b">
            	<div class="text_a">
                	<h1><img src="img/xiaoyuan.png">校园招聘会</h1>
                </div>
                <div class="text_b">
                	<a href="/jobfair.do?jobfairType=mutiple" target="_blank">更多&gt;&gt;</a>
                </div>
                <div class="clear"></div>
            </div>
<div class="left_a_outter">
<%
	// List jobfair=(List)request.getAttribute("jobfair0");
	if(mutiple_list!=null && mutiple_list.size()>0){ 
		for(Iterator it=mutiple_list.iterator();it.hasNext();)
		{
			DynaBean temp=(DynaBean)it.next();
%>
             <div class="job left_a">
                <h1><%=temp.get("job_fair_name") %></h1>
                <p>举办时间：<%=temp.get("job_fair_time") %></p>
                <p>剩余展位：<%=temp.get("last_num") %>个  
                   <a href="<%=request.getContextPath()%>/jobfairInfo.do?id=<%=temp.get("job_fair_id") %>" target="_blank">查看详情&gt;&gt;</a></p>
                <ul>
                    <li><a href="javascript:;" onclick="ComApply('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')">企业订展</a></li>
                    <li><a href="javascript:;" onclick="openOrder('<%=temp.get("job_fair_id")%>','<%=temp.get("school_id")%>')">投递简历</a></li>    
                </ul>
                <div class="clear"></div>
            </div>
<%
		} // for
	} // if 			
%>
	
            <div class="clear"></div>
</div>
        </div>
       
        <!--wangluo-->
    </div>
    <div class="right">
    	<div class="list_c">
            <div class="text_a">
                <h1><img src="img/huo.png">最新招聘职位</h1>
            </div>
            <div class="text_b">
                <a href="/subStationJobs.do" target="_blank">更多&gt;&gt;</a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="zhiwei">
<%
	// List jobfair=(List)request.getAttribute("jobfair0");
	if(recruit_list!=null && recruit_list.size()>0){ 
		for(Iterator it=recruit_list.iterator();it.hasNext();)
		{
			DynaBean temp=(DynaBean)it.next();
%>
        	<ul class="tab">
            	<li><a target="_blank" href="/company/jobDetail.do?id=<%=temp.get("job_id") %>">
            		<span style="color:#F30;">诚聘：</span>
            		<%=temp.get("job_name") %>
            		</a></li>
                <li><a target="_blank" href="/company/info.do?id=<%=temp.get("company_id") %>">
                	<%=temp.get("company_name") %>
                	</a></li>
                <li class="last">
                	<a href="javascript:;" onclick="openOrderJob('<%=temp.get("company_id") %>','<%=temp.get("job_id") %>');">
                	投递简历
                	</a>
                </li>
            </ul>
<%		
		} // for
	} // if 			
%>

		</div>
        <div style="margin-top:10px;background:url(top_bg_a.jpg);line-height:40px;">
        	<a style="display:block;text-align:center;" href="http://www.ncss.org.cn/wlzph/2016nxbdqwszpy/" target="_blank">
        		<span style="color:#FFF;font-size:16px;letter-spacing:2px;">
        		进入主会场
        		</span>
        	</a>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--container完成-->
<div class="fenlan"></div>
<div class="footer">
	<p class="text"><a href="http://www.211zph.com/page.do?id=201407210000321">关于我们</a><span>/</span>
    <a href="http://www.211zph.com/page.do?id=201407210000326">广告投放</a><span>/</span>
    <a href="http://www.211zph.com/page.do?id=201407210000328">法律声明</a><span>/</span>
    <a href="http://www.211zph.com/page.do?id=201407210000329">人才招聘</a><span>/</span>
    <a href="http://www.211zph.com/page.do?id=201407210000327">联系方式</a></p>
    <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410  电话：029-88662468 / 87240519</p>
    <p>工信部备案号：陕ICP备13006138号-3  西安市人力资源服务许可证编号：610100120105 </p>
    <p>西安大秦人力资源有限公司 版权所有</p>
    <p><a href="#"><img src="img/secure.png" /></a></p>
   <p>
	<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
	</p>
</div> 
<!--footer完成-->
</body>
</html>