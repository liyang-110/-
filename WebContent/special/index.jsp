<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%
	String base_dir =request.getContextPath()+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>会员专享 1000元西装免费送 <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="../assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="../assets2/styles/global.css" />

<script src="../assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="../assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

<script src="../assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="../assets2/scripts/login.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="../assets2/slide/slide.css" />
<script type="text/javascript" src="../assets/slide/g.base.js"></script>

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
</script>
<script type="text/javascript" src="../assets2/scripts/front.js"></script>
<style type="text/css">
#main-content {
	line-height:26px;
	font-size:14px;
}
#main-content p {
	text-justify:inter-word;
	text-indent:2em;
}
#member_type,#member_type td {
	border:none;
}
</style>
</head>
<body>
	<jsp:include  page="../include2/head.jsp" flush="true"/>
    <div style="clear:both; height:10px;"></div>
	<div id="main-content" style="background:;width:1000px;margin:auto; padding:10px 50px; border-right:1px solid #CCC; border-left:1px solid #CCC;">
    <h3 align="center">会员专享 1000元西装免费送</h3>
	  <p>凡在2015年6月15日-6月30日期间，成功购买211校招网半年会员赠送价值500元雅智时尚职业装一套，购买年会员及以上会员赠送价值1000元雅智时尚职业装一套。（数量有限，送完截止！） </p>
	  <table width="80%" border="1" style="margin:auto auto 15px auto;">
	    <tr>
	      <td rowspan="5">
          <div>
          <table id="member_type" width="100%" height="100%" border="1" border="0"  style="border:none; text-align:center;">
          <tbody>
	        <tr>
	          <td>VIP半年会员</td>
            </tr>
	        <tr>
	          <td>VIP年会员</td>
            </tr>
	        <tr>
	          <td>黄金会员</td>
            </tr>
	        <tr>
	          <td>白金会员</td>
            </tr>
            </tbody>
          </table>
          </div>
          </td>
	      <td rowspan="5" align="center">会员专享</td>
	      <td>下载简历</td>
        </tr>
	    <tr>
	      <td>免费发布招聘信息</td>
        </tr>
	    <tr>
	      <td>免费参加校园招聘</td>
        </tr>
	    <tr>
	      <td>免费赠送公众微信平台宣传</td>
        </tr>
	    <tr>
	      <td>免费享有招聘会现场服务（免费设计海报、制作海报、提供办公用品）</td>
        </tr>
      </table>

      <p>2015年6月,211校招网与雅智正装定制强强联手，将高品质的专属定制套装赠给最有品味的您。	  </p>

	  <table><tr><td>
      <img src="211_03.jpg" style="max-height:160px;" />
      <img src="211_07.jpg" style="max-height:160px;" style="margin-left:5px;" />   
      </td><td style="padding-top:10px;">
	  <p >O2O模式招聘，网络招聘与线下校园招聘会同时进行； </p>
	  <p >陕西省教育厅重点推介的大学生就业招聘网站； </p>
	  <p >中国最大校园招聘企业数据库，用人单位首选第一品牌； </p>
	  <p >中国最大高校就业数据库，覆盖全国所有2544所普通高校会员； </p>
	  <p >10年专业团队，熟练掌握所有校园招聘会流程，强大的组织与接待能力。 </p>
	  </td>
      </tr></table>
      <p >&nbsp;&nbsp;&nbsp;&nbsp; </p>
	  <div>
      <img style="float:right; padding-left:10px; padding-top:10px;margin-right:0;" width="316" height="161" src="index_wpsA2A3.png" />
	  
	  <p >
      <span style="font-size:20px;color:#000; font-weight:bolder; font-family:楷体;">明礼为雅，知止为智。</span>
      
      “量身定制、工艺考究、面料上乘，企业首选高性价比职业装品牌”是雅智的品牌定位，这也是小智多年来稳稳扎根于定制市场的根本原因，那么，雅智究竟是一个什么样的公司呢？ </p>
	  <p >&#8220;雅智&#8221;是一家集研发、设计、加工、销售为一体的新型现代化品牌服饰公司，是江苏虎豹、上海培蒙、北京红都、VALLINO、MONTI、KERRY&#160;KNOLL&#160;等知名品牌在陕西地区的特约经销商。公司相关技术人员有20余年的服装制作、经销、服务经验,力求为广大中小企业提供优质的产品和服务。 </p>
	  <p >从业十余年来，公司服务的知名企业有：中国银行、北京银行、紫薇地产、雨润集团、中航西飞工业、保利影业、开元地产、世纪金花、西安秋林、广瑞物业、西咸新区、中铁一局、陕建集团、中交集团、等，&#8220;雅智&#8221;凭借过硬的产品品质和优良的服务受到了客户的一致好评。 </p>
	</div>
<table style="margin:auto;"><tr><td>
      <img width="278" height="204" src="index_wpsA2A4.png" />
      </td><td>
      <img width="281" height="206" src="index_wpsA2B5.png" />
      </td></tr><tr><td>
      <img width="278" height="204" src="index_wpsA2C5.png" />
      </td><td>
      <img width="279" height="205" src="index_wpsA2C6.png" />
	  </td></tr></table>
<p>&nbsp;</p>
	  <p style=" font-weight:bolder;color:#09F;font-size:18px;">为什么西服要量身定做？</p>
	    <p>1、为体现其社会地位和身份，在材料、色彩、服装款式上追求个性化、时尚化、高档化;</p>
	    <p>	    2、为满足自身体型尺寸的需要，追求更合体的服装造型;</p>
	    <p>	    3、出于解决特体购衣难的需要，或者为了弥补体型缺陷;</p>
	    <p>	    4、为规范行业着装，展示企业、学校、机关等单位良好的集体形象和精神风貌，对商务西服进行统一加工;</p>
	    <p>
	    5、因社交活动、重大仪式等一时的个人或集体形象需要等。 </p>
	    </p>
      <p style="font-weight:bolder;color:#09F;font-size:18px;">为什么要选择&#8220;雅智时尚职业装&#8221;？ </p>
	  <p >1、质量相同，价格最低；价格相同，服务真好。面料上乘，货真价实，款式经典又紧贴时尚。 </p>
	  <p >2、专业服装设计师、量体师、制版师，为您量体裁衣，使您穿着舒适，自信十足。 </p>
	  <p >3、公司化经营，具有二十多年正装定制经验，采用整套日本先进制衣设备，意大利标准面料，满足高品位人士的穿着需要。 </p>
	  <p >4、省去了明星代言费用和大额的广告费用，降低成本，为客户节约。 </p>
<p >5、拥有完善的城市服务体系，您只需要打个电话，就能为您提供置衣咨询、上门选料量体设计等一系列服务，并且还能为您送货上门。 </p>
<p >通过对雅智的了解，您是不是心有所动，那就赶快定制一套自己的西装吧。</p>
<p style="margin-left:50px;">&nbsp;&nbsp;<br/>
	  人工客服：029-88662468&nbsp;&#160;&nbsp;&#160;&nbsp;&#160; <br/>
	  客服QQ：2283642202 <br/>
	  地址：中国陕西省西安高新技术开发区科技二路65号清华科技园（东区）清扬国际大厦A座410 <br/>
公交路线：可乘坐251路、29路、908路在清华科技园站下车即到；262路，608路在西安软件园站下车，马路对面即为清华科技园。<br/>
自驾路线：西高新方向，沣惠南路与科技二路十字往西陕西联通大厦西侧即到。 </p>
	</div>
<jsp:include  page="../include2/footer.jsp" flush="true"/>
</body>
</html>