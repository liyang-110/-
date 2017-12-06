<%@page import="com.zhaopin.dao.factory.CompanyRecruitModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("GBK");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
CompanyRecruitModel model = new CompanyRecruitModel();
List<Map> recruitList = model.companyRecruitList(1,20, "201509160009947" );
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>双林生物制药</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>temp/company/custom/201509160009947/css/core.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript">
	var cur_path="<%=request.getContextPath()%>";
</script>
<script src="<%=request.getContextPath()%>/assets2/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets2/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/flow.js" charset="utf-8"></script>

  </head>
  
  <body>
   <div class="head">
	<img src="<%=basePath%>temp/company/custom/201509160009947/img/y_02.gif" height="150" width="835"  />                                                       
</div>
<div class="menu">
	<ul>
    	<li><a href="<%=basePath%>temp/company/custom/201509160009947/" >招聘首页</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('intro').scrollIntoView();">公司简介</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('job').scrollIntoView();" >招聘职位</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('welfare').scrollIntoView();"  >福利待遇</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('preach').scrollIntoView();"  >宣讲行程</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('recruitment').scrollIntoView();" >招聘流程</a></li>
        <li><a href="javascript:void(0)" onclick="document.getElementById('contacts').scrollIntoView();"  >联系我们</a></li>
    </ul>
    <div class="clear"></div>
</div>
<div class="cont">
    <div class="list">
    <h1 id="intro">公司简介</h1>
    <p>广东双林生物制药有限公司座落在美丽的海滨城市—湛江，成立于1995年，是专业从事血液制品研发和生产的国家级重点高新技术企业，是首批通过国家GMP认证的生物医药企业，是上市公司“振兴生化”（股票代码000403）的核心企业，净资产超7亿元，拥有11家全资控股子公司。</p>
    <p>自2007年起，公司经营状况呈阶梯状快速增长，跻身于国内行业前列。2012年销售收入4.29亿元，利税2.2亿元；2013年销售收入4.38亿元，利税2.0亿元；2014年销售收入4.8亿元，利税2.1亿元。2015年计划销售收入5亿元。
公司主要生产血液制品，主打产品是人血白蛋白、静注人免疫球蛋白(pH4)、人免疫球蛋白、狂犬病人免疫球蛋白、乙型肝炎人免疫球蛋白、破伤风人免疫球蛋白共6个品种16个规格。</p>
	<p>公司拥有4个研发中心，先后承担国家、省、市科研项目20余项，拥有国家发明专利6项，目前在研品种10余项。
公司占地近15万平方米的采用国内外先进设备的现代化医药产业园已建成，2014年2月国家药监局颁发了GMP认证证书，2014年3月正式开始生产。</p>
	<p>公司总投资8亿元的二期血液制品生产基地项目和猪肺生产基地项目正在筹备建设。
即将再次腾飞的双林已迈开了步伐，期待与您携手共创未来！</p>
	<p>（欢迎登陆公司网站详细了解：<a href="http://www.zjslbio.com">http://www.zjslbio.com</a>）</p>
    </div>
    <div class="list_a" id="job" name="job">
    	<h1>招聘职位</h1>
        <table width="560" border="0">
          <tr>
            <td colspan="6" style="font-weight:bold; font-size:16px;">2016双林生物制药有限公司招聘计划</td>
          </tr>
          <tr>
            <td>序号</td>
            <td>岗位</td>
            <td>招聘人数</td>
            <td>需求专业</td>
            <td>学历</td>
            <td>投递简历</td>
          </tr>
          <%
		  if( recruitList!=null && recruitList.size()>0 ) {
			   int i=1;
			   for(Map map : recruitList ){
					 %>
			         <tr>
			         <td><%=i %></td>
			         <td><a style="color: #494949;" target="_blank" href="/company/jobDetail.do?id=<%=map.get("job_id") %>">
			         <%=map.get("job_name") %></a>
			         </td>
			         <td><%=map.get("job_person_num") %></td>
			         <td><%=map.get("profession")==null?"不限":map.get("profession") %></td>
			         <td><%=map.get("education")==null?"不限":map.get("education") %></td>
			         <td  class="bag">
				            <a href="javascript:;" onclick="openOrderJobSetTop('<%=map.get("company_id") %>','<%=map.get("job_id") %>',0);" class="but" style="font-size:12px !important;" >投递简历</a>
			         </td>
			         </tr>
					 <%
					 i++;	
					 		}
		 }else{
	             		%>
	             		<tr><td colspan="6">还没有发布招聘职位！</td></tr>
	             		<%
		}
	    %>  
	    </tr>
	    
        </table>
    </div>
     <div class="list_b" id="welfare">
     	<h1>福利待遇</h1>
        <div class="text">
        	<p>薪资：</p>
            <p>总薪酬=薪资+福利+年终奖+年中奖  应届生总薪酬：6-8万/年</p>
            <p>本科4.5k起飞，硕士7.5k起飞，博士1w起飞，13薪，纯薪资！</p>
            <p style="padding-top:20px;">福利：看下表是不是你已经开始畅想世界了？</p>
            <img src="<%=basePath%>temp/company/custom/201509160009947/img/y_13.gif"  style="padding:15px 0;" /> 
            <p style="color:#000; font-weight:bold;">奖金：绩效奖、项目奖、年终奖、年中奖。。。。。。任你想把！</p>
            <p style="color:#000; font-weight:bold; padding-top:20px;">福利详情：</p> 
            <p style="color:#333;">1.五险二金（社保﹢住房公积金﹢企业年金），转正购买住房公积金。 <br />
            	2.每年13个月基本工资<br />
                3.子女教育津贴500-2000不等<br />
                4.教育培训补贴等其他补贴，1000-5000不等<br />
                5.提供食宿<br />
                6.过节费500-1000元/节/人,转正后过节费5500元/年<br />
                7.公司设有图书馆、羽毛球、乒乓球、篮球等设施，定期组织活动<br />
                8.每年组织员工旅游一次<br />
                9.定期组织学习培训<br />
                10.出差补贴
              
            </p>     
        </div>  
     </div>
     <div class="list_c" id="preach">
     	<h1>宣讲行程</h1>
        <p>宣讲时间和地点：地址时间待定</p>	
        <p style="color:#F00; font-weight:bold; padding-top:20px;">温馨提示：心动不如行动，深入了解公司，要从宣讲会开始噢！参加宣讲会的同学记得一定要携带简历、笔，宣讲会结束后直接进入面试。</p>
        <table width="835" border="0">
          <tr>
            <td width="312">宣讲高校</td>
            <td width="260">时间</td>
            <td width="249">地址</td>
          </tr>
           <tr>
            <td>西安财经学院</td>
            <td>10月21日 下午 14：00-16:00</td>
            <td>财经学院长安校区第二教学楼206教室</td>
          </tr>
           <tr>
            <td>陕西中医药大学</td>
            <td>10月22日 下午 14:00-16:00</td>
            <td>南校区</td>
          </tr>
          <tr>
            <td>陕西科技大学</td>
            <td>10月23日 下午 14：00-16:00</td>
            <td>未央校区 三号教学楼101教室</td>
          </tr>
         
         
          <tr>
            <td>西安医学院</td>
            <td>10月（待定）	</td>
            <td>待定</td>
          </tr>
        </table>
     </div>
      <div class="list_d" id="recruitment">
     	<h1>招聘流程</h1>
        <ul>
        	<li><a href="javascript:;">简历投递→参加宣讲会→初面→职业测评→终面→Offer</a></li>
            <li><a href="javascript:;">提前发送个人简历至校招专用邮箱：slzyzp@163.com</a></li>
            <li><a href="javascript:;">简历格式“学校—应聘职位—学历—专业—姓名”</a></li>
        </ul>
      </div>
      <div class="list_f" id="contacts">
     	<h1>联系我们</h1>
        <p>公司全称：广东双林生物制药有限公司</p>
        <p>公司简称：双林生物</p>
        <p>英文名称：GUANG DONG SHUANG LIN BIO-PHARMACY CO.,LTD.</p>
        <p>邮     编：524009</p>
        <p>电     话：15829462815</p>
        <p>联 系 人：殷先生</p>
        <p>网   址：http://www.zjslbio.com</p>
        <p>E-mail: slzyzp@163.com（简历投递邮箱）</p>
        <p>公司地址：湛江市东海岛新丰东路1号</p>
		<div class="ma">
        	<img src="<%=basePath%>temp/company/custom/201509160009947/img/y_21.gif" /><br />
            <span>扫描二维码 了解更多信息</span>
        </div>    
      </div>

</div>
  <div style="height:30px; clear:both;"></div>
    <div class="foot">
<p>Copyright &copy 2015 · 211校招网版权所有</p>
</div>

  </body>
</html>
