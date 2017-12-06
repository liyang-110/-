<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>首页</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/index-style.css" rel="stylesheet" type="text/css">
    <link href="/static/css/province_name.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
</head>



<body>

<!--头部架构开始-->
<div class="header_top"></div>
<div class="header">

     <div class="sub_nav">
         <div class="sub_nav_inner">
             <ul >
				<li><a href="#">登录</a> </li>
                <li>/</li>
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
              
              <a href="#"><span><p class="province">陕西</p></span></a>
              <div class="province_name">
              <h1>全国</h1>
              <ul>
              <li><a href="#">陕西</a></li>
               <li><a href="#">北京</a></li>
                <li><a href="#">天津</a></li>
                 <li><a href="#">河北</a></li>
                  <li><a href="#">山西</a></li>
                   <li><a href="#">辽宁</a></li>
                    <li><a href="#">上海</a></li>
                     <li><a href="#">江苏</a></li>
                      <li><a href="#">浙江</a></li>
                       <li><a href="#">安徽</a></li>
                        <li><a href="#">福建</a></li>
                         <li><a href="#">江西</a></li>
                          <li><a href="#">山东</a></li>
                          <li><a href="#">河南</a></li>
                           <li><a href="#">湖北</a></li>
                            <li><a href="#">湖南</a></li>
                             <li><a href="#">广东</a></li>
                              <li><a href="#">广西</a></li>
                               <li><a href="#">海南</a></li>
                               <li><a href="#">重庆</a></li>
                               <li><a href="#">四川</a></li>
                               <li><a href="#">贵州</a></li>
                               <li><a href="#">云南</a></li>
                               <li><a href="#">西藏</a></li>
                               <li><a href="#">甘肃</a></li>
                               <li><a href="#">青海</a></li>
                               <li><a href="#">宁夏</a></li>
                               <li><a href="#">新疆</a></li>
                               <li><a href="#">黑龙江</a></li>
                               <li><a href="#">内蒙古</a></li>
                
                
              
              
              </ul>
              
              
              
              
              </div>
              
              
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
       
     <div style="clear:both"></div>
     
</div>
<!--头部架构结束-->


<!--main区架构开始-->
<div class="main">

     <div class="news">
           <ul class="info">
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
              <li><p>五分钟@#@#@#@#@#</p></li>
          </ul>
       <div style="clear:both">
       </div>
      </div> 
      
     <!--搜索框构架开始-->
     <div class="search">
     <span class="search_left">
     <ul>
     <li><form>
     <select class="zph">
     <option>招聘会</option>
      <option>职位</option>
     </select></form></li>
     
     
     
     
     <li><form><input class="xjzph" type="test" value="|夏季招聘会"/></form></li>
     <li><form><input class="ss" type="submit" value="搜索"/></form></li>   
     </ul>
      <div style="clear:both"></div>
     </span>
    
     
     <span class="search_right">
      <a><form><input class="gjss" type="submit" value="高级搜索"/></form></a>
        <div style="clear:both"></div>
     </span>
   
     </div> 
     <!--搜索框构架结束-->
     
     <!--网络招聘会构架开始-->
     <div class="wlzph">
          <div class="title"><a href="#"><img class="bt_bj" src="/static/images/03/bt_bg.png"><p>网络招聘会</p></a></div>
          <div class="more"><a href="#">查看更多</a></div>
          <img class="plus" src="/static/images/03/plus_icon.png" width="10" height="10">
          
          <div class="wl_top">
          <ul>
          <li>
            <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_01.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             </a>  
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_02.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>
             </a>
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_03.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>


         </a>
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_04.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>
             
           </a>  
          </li>         
 
          <li>
            <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_05.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             </a>  
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_06.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>
             </a>
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_07.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>


         </a>
          </li>
          
           <li>
           <a href="#">
            <div class="pic"><img src="/static/images/03/s_w_pic_08.png" width="230" height="142"></div>
             
             <h1>陕西通信网络互联网专厂网络</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2>
             
           </a>  
          </li>
          </ul>
          
          
          </div>
           <div style="clear:both"></div>
     
     </div>
      <!--网络招聘会构架结束-->
      
      <!--广告构架开始--> 
    <div class="ads">
         <a href="#"><img  class="ad1" src="/static/images/03/s_w_ad_01.png" width="1024" height="80"></a>
         <a href="#"><img  class="ad2" src="/static/images/03/s_w_ad_02.png" width="506" height="80"></a>
         <a href="#"><img  class="ad3" src="/static/images/03/s_w_ad_03.png" width="506" height="80"></a>
         <div style="clear:both"></div>
    </div>
      <!--广告构架结束--> 
      
      
       <!--专场宣讲会构架开始-->
    <div class="zcxjh">
          <div class="title"><a href="#"><img class="bt_bj" src="/static/images/03/bt_bg.png"><p>专场宣讲会</p></a></div>
          <div class="more"><a href="#">查看更多</a></div>
          <img class="plus" src="/static/images/03/plus_icon.png" width="10" height="10">
          
          <div class="zc_top">
          <ul>
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>
          
          <li>
            <a href="#">
            <div class="zc_top_l"><img src="/static/images/03/s_z_pic_01.png" width="146" height="146"></div>
             <div class="zc_top_r">
             <h1>中国电信陕西分公司</h1>
             <h2>视频招聘会</h2>
             <h2>时间：2016年7月10日</h2> 
             <a class="zxws" href="#">在线网申</a>
             </div>
             </a>  
          </li>          
          
          </ul>              
          </div>
    <div style="clear:both"></div>
    </div>
       <!--专场宣讲会构架结束-->
         
       <!--广告构架开始-->   
    <div class="ads">
         <a href="#"><img  class="ad1" src="/static/images/03/s_z_ad_01.png" width="1024" height="80"></a>
         <a href="#"><img  class="ad2" src="/static/images/03/s_z_ad_02.png" width="506" height="80"></a>
         <a href="#"><img  class="ad3" src="/static/images/03/s_z_ad_03.png" width="506" height="80"></a>
          <div style="clear:both"></div>
    </div>
       <!--广告构架结束--> 
        
       <!--校园招聘会构架开始-->        
    <div class="xyzph">
          <div class="title"><a href="#"><img class="bt_bj" src="/static/images/03/bt_bg.png"><p>校园招聘会</p></a></div>
          <div class="more"><a href="#">查看更多</a></div>
          <img class="plus" src="/static/images/03/plus_icon.png" width="10" height="10">
          
          <div class="xy_top">
          <ul>
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (1).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (2).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (3).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
                
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (4).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (4).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (6).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (7).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (8).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (9).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
             
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (10).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (11).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
          <li>
            <a href="#">
            <div class="xy_top_l"><img src="/static/images/03/school_logo_92 (12).png" width="116" height="116"></div>
             <div class="xy_top_r">
             <h1>西安培华学院</h1>
             <h2>时间：20160715</h2>
             <h2>地址：西安培华学院</h2> 
             
             </div>
             </a> 
             <div class="ckxq"><a href="#"><p>在线网申</p></a> </div>
          </li>
          
      </ul>
                    
          </div>
          <div style="clear:both"></div>
    </div>
       <!--校园招聘会构架开始-->
       
       
      <!--广告构架开始-->   
    <div class="ads">
        
         <a href="#"><img  class="ad2" src="/static/images/03/s_x_ad_01.png" width="506" height="80"></a>
         <a href="#"><img  class="ad3" src="/static/images/03/s_x_ad_02.png" width="506" height="80"></a>
	     <div style="clear:both"></div>
    </div>
      <!--广告构架结束--> 
   
   
       <!--合作单位构架开始-->
     <div class="hezuojg">
          <div class="hzjg_nav">
            <ul>
               <li class="hzjg"><a href="#"><p>合作机构</p></a></li>
               <li><a href="#"><p>合作高校</p></a></li>
               <li><a href="#"><p>最近动态</p></a></li>
               <li><a href="#"><p>联系我们</p></a></li>
            </ul>

          </div>
          
          <div class="hzjg_content">
           <ul class="content1">
           <li><a href="#">陕西大秦人力资源有限公司</a></li>
            <li><a href="#">陕西大秦人力资源有限公司</a></li>
             <li><a href="#">陕西大秦人力资源有限公司</a></li>
             <li><a href="#">陕西大秦人力资源有限公司</a></li>
             
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
             
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               
                <li><a href="#">西安零距离</a></li>
                <li><a href="#">西安零距离</a></li> 
                <li><a href="#">西安零距离</a></li> 
                <li><a href="#">西安零距离</a></li> 
                 
                 <li><a href="#">陕西电视台</a></li>
                 <li><a href="#">陕西电视台</a></li>
                 <li><a href="#">陕西电视台</a></li>
                 <li><a href="#">陕西电视台</a></li>
                 
               <li><a href="#">陕西大秦人力资源有限公司</a></li>
            <li><a href="#">陕西大秦人力资源有限公司</a></li>
             <li><a href="#">陕西大秦人力资源有限公司</a></li>
             <li><a href="#">陕西大秦人力资源有限公司</a></li>
             
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            <li><a href="#">陕西电视台</a></li>
            
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
             <li><a href="#">三秦都市报</a></li>
            
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              <li><a href="#">华商报</a></li>
              
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               <li><a href="#">西安晚报</a></li>
               
            
           </ul>
           <div style="clear:both"></div>
          </div>

          <div class="hzjg_r">
          
          </div>
     
     <div style="clear:both"></div>
     </div>  
       
       <!--合作单位架构结束-->

</div>

<!--main区架构结束-->


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
