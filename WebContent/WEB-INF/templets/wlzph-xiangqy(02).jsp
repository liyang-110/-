<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title> 网络招聘会详情页（参会企业）</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    	<link href="/static/css/wlzph-xiangqy(02).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
</head>

 

<body> 

<!--头部架构开始-->
<div class="header_top"></div>
<div class="header">

     <div class="sub_nav">
         <div class="sub_nav_inner">
             <ul >
				<li><a href="#">登录 /</a> </li>
				<li><a href="#">注册</a> </li>
				<li class="myrecord"><a href="#">投递记录</a></li>
                <li class="myresume"><a href="#">我的简历</a></li>
			</ul>
           
          </div> 
       </div>
       
     <div class="nav">
          <div class="nav_inner">
          
               
              <span class="logo">
                   <img src="/static/images/LOGO.png" width="240" height="60"/>
              </span>
              
              <span><p class="province">陕西</p></span>
              
              <span>
               <a class="switch" href="#"><p class="city">切换城市</p><img  class="arrow_w_d" src="/static/images/03/arrow_w_d.png" width="32" height="12"></a>
              </span>
              
              <div class="main_nav">
              <ul >
				<li><a  class="nav_shouye" href="index.html">首页</a> </li>
                <li>|</li>
				<li><a class="nav_wlzph" href="wlzph.html">网络招聘会</a> </li>
                <li>|</li>
				<li ><a class="nav_zcxjh" href="zcxjh.html">专场宣讲会</a></li>
                <li>|</li>
                <li><a class="nav_xyzph" href="xyzph.html">校园招聘会</a></li>
                <li>|</li>
                <div style="clear:both"></div>
			</ul>
              </div>
                                                          
           </div>
      </div>  

</div>
<!--头部架构结束-->
<div class="main">

 <div class="news">
           <ul class="info">
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
          </ul>
       <div style="clear:both"></div>
      </div> 

<div class="banner">
<img src="/static/images/04/w_banner_01.png" width="1024" height="274">
<div style="clear:both"></div>

</div>


<p class="position">当前所在位置：<a href="index.html">首页</a>》<a href="wlzph.html">网络招聘会</a>》陕西互联网IT人才网络招聘会</p>



<div class="main_mid"> 
<p class="main_mid biaoti">陕西互联网IT人才网络招聘会</p> 
<div class="main_mid content">
<div class="main_mid_l">
<img src="/static/images/04/w_pic_01_29.png" width="287" height="184"/>
<div class="main_mid_l_an">
 <a class="an1" href="#">企业订展</a>
 <a class="an2" href="#">进入会场</a>
 <div style="clear:both"></div>
</div>
</div>
<div class="main_mid_r">
<p class="main_mid_r_message message1">举办单位：211校招网；</p>
<p class="main_mid_r_message">主办单位：长安区就业服务局</p>
<p class="main_mid_r_message">时    间：2016年7月29日  上午9:00到下午17:00</p>
<p class="main_mid_r_message">招聘会规模：企业200家 求职者1800人</p>
<p class="main_mid_r_message">招聘会层次：研究生/本科生/大专生/高职生</p>
<p class="main_mid_r_message">招聘会特色：综合类</p>

<div class="main_mid_r djs"><span>倒计时</span><span>22</span>天<span>18</span>时<span>36</span>分</div>


</div>
<div style="clear:both"></div>
</div>
</div>




<div class="main_but">
  <div class="main_but content">
  <div class="main_but_nav">
     <ul>
      <li><a  class="yaoqinghan" href="wlzph-xiangqy(01).html">邀请函</a></li>
      <li><a class="canhiuqiye" href="wlzph-xiangqy(02).html">参会企业</a></li>
      <div style="clear:both"></div>
     </ul>
    </div>
 <div class="main_but_qiye">
 <ul class="main_but_qiye1" >
 <li class="xuhao">序号</li>
 <li class="gongsimingchen">公司名称</li>
 <li class="gongsidizhi">公司地址</li>
 <li class="toudijianli">投递简历址</li>
 <div style="clear:both"></div>
 </ul>
 
 
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 <ul>
 <li class="xuhao">01</li>
 <li class="gongsimingchen">陕西新华信息科技有限公司</li>
 <li class="gongsidizhi">西安高新区科技二路清华园</li>
 <li class="toudijianli"><a href="#">投递简历</a></li>
 <div style="clear:both"></div>
 </ul>
 
 
 
 </div>

  </div> 
</div>




<div style="clear:both"></div>



</div>









<!--footer区架构结束-->
<div class="footer">
    <div class="footer_top"></div>
    <div class="footer_down">
         <div class="footer_inner">
             <div class="footer_content">
             
              <div class="footer_l">
                 <ul>
                     <li><img class="logo" src="/static/images/LOGO.png" width="170" height="40"></li>
                     <li><img class="ewm" src="/static/images/ewm_03.png" width="110" height="110"></li>
                     <li><a href="#"><i class="fa fa-weixin" aria-hidden="true"></i>    关注211校招网官方微信获取更多信息</a></li>
                     <li><a href="#"><i class="fa fa-weibo" aria-hidden="true"></i>    @211校招网</a></li>
                 </ul>
              
              </div>
              
              <div class="footer_r">
              
              <div class="footer_r_top">
                   <ul>
                      <li><a class="ljgd" href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>了解更多</a><a class="gywm" href="#">关于我们</a></li>
                        <li>地址：西安高新区科技二路65号清华科技园清扬大厦A410</li>
                  <li>工信部备案号：陕ICP备13006318号-3</li>
                  <li>西安市人力资源服务许可证编号：610100120105</li>
                   <li class="dh">联系电话：<strong>029-8888—888</strong></li>
                   
                  <li class="bq">西安大秦人力资源有限公司版权所有</li>
                   </ul>
                   
              </div>
               
              

              </div>
              
              
              </div>
              <div class="copyright">&copy;陕西新才科技有限公司</div>
         </div>
    
    
    </div>



</div>

<!--footer区架构结束-->


</body>
</html>