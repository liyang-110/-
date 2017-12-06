<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%
	String base_dir =request.getContextPath()+"/";
    String area_id =request.getAttribute("area_id")==null?"":(String)request.getAttribute("area_id");
	String area_name=com.zhaopin.Station.getStationName( area_id );
	if( "".equals(area_name) ){
			area_name="全国";
	}
%>
<div class="heard">
    <div class="heard_top">
        <p>
<%=Station.getStat().get("time") %>,
企业<span ><%=Station.getStat().get("company_size") %></span>家.
高校<span ><%=Station.getStat().get("school_size") %></span>	所.
招聘会<span ><%=Station.getStat().get("job_fair") %></span>	场.
本月新增企业<span ><%=Station.getStat().get("today_company") %></span>家.
本月新增简历<span ><%=Station.getStat().get("month_student") %></span>份

        </p>     
        <ul>                         
          <li><a href="<%=base_dir%>shaanxi">陕西</a></li>
            <li><a href="<%=base_dir%>beijing">北京</a></li>
            <li><a href="<%=base_dir%>zhejiang">浙江</a></li>
            <li><a href="<%=base_dir%>hubei">湖北</a></li>
            <li><a href="<%=base_dir%>shanxi">山西</a></li>
            <li><a href="<%=base_dir%>henan">河南</a></li>
            <li><a href="<%=base_dir%>gansu">甘肃</a></li>

        </ul>
        <div class="clear"></div>
     </div>
</div>
<!--heard完成-->
<div class="midder">
    <div class="midder_left">
        <div class="logo">
            <img src="img/logo.png" height="83" width="234" />
        </div>
        <div class="madder_m">
            <img src="img/qiye.png" height="70" width="5" />
        </div>
        <div class="midder_r">
            <h1><%=area_name %>站<img src="img/sanjiao.jpg"/></h1>
            <p>创校园招聘会第一品牌</p>
        </div>
        <div class="clear"></div>
    </div>
    <div class="midder_right">
        <div  id="latest_log" style="height:60px;overflow:hidden;margin-bottom:10px;">
        <ul>   
                <%
                    List latest_log = Station.queryLatestLog();
                    for(Iterator it=latest_log.iterator();it.hasNext();){
                    	HashMap row=(HashMap)it.next();
                    	%>
                    	<li>
                    	<%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %><br/>
                    	</li>
                    	<%
                    }     
                %>
        </ul>
        </div>
          <script type="text/javascript"> 
                        var box2=document.getElementById("latest_log"),can=true; 
                        box2.innerHTML+=box2.innerHTML; 
                        box2.onmouseover=function(){can=false}; 
                        box2.onmouseout=function(){can=true}; 
                        $(function (){ 
                            var stop=box2.scrollTop%60==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%60?10:2000); 
                        }); 
                </script>

        <div class="bg">
       	<img src="/jobFair/img/biankuang1.png" />
            <ul>
                <li><a href="<%=base_dir %>">首页</a><span>/</span></li>
                <li><a href="<%=base_dir %>jobfair.do?&a=<%=area_id %>">招聘会</a><span>/</span></li>
                <li><a href="/subStationJobs.do?a=<%=area_id %>">招聘职位</a><span>/</span></li>
                <li><a href="http://www.211zph.com/newsDetail.do?id=201511160026144" target="_blank">广告招商</a></li>

            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--midder完成-->
<!--container-->
 <div class="width" style="width: 100%;
  height: 5px;
  background: #fe8c19;">
	
</div>

<div class="container">
	<div class="main">
        <div class="bg_top">
            <p>2小时前，&nbsp;&nbsp;西安xxxxx软件公司发布了新职位！</p>
            <ul>
                <li><a href="first_firm.jsp" target="_blank">会员中心<span>|</span></a></li>
                <li><a href="#">安全退出</a></li>
                <li class="clear"></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <!--main完成-->
</div>
