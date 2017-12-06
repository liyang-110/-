<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。">
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。">
<meta name="author" content="">
<title>个人中心</title>
 
	<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="static/css/stu_center(commen).css" rel="stylesheet" type="text/css">
    <link href="static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="static/jquery/1.11.3/jquery.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <script src="statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
	<script src="statics/artDialog/plugins/iframeTools.js"></script>
	<script src="static/js/flow.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!--头部架构开始-->


<!-- 
<div class="header_top"></div> 
-->
<style>
	.main_nav ul{
		margin-left:50px;
	}
</style>
<div class="header">
	 <!--sub_nav结构开始  -->
     <div class="sub_nav">
         <div class="sub_nav_inner">
            <p style="float:left;line-height:40px;">
            2016年09月08日,
			企业<span style="font-weight:bold;font-style:italic;color:#FF5F00;">117345</span>家.
			高校<span style="font-weight:bold;font-style:italic;color:#FF5F00;">2804</span>所.
			招聘会<span style="font-weight:bold;font-style:italic;color:#FF5F00;">4091</span>场.
			本月新增会员企业<span style="font-weight:bold;font-weight:bold;color:#FF5F00;">338</span>家.
			
			</p>
         
         	
			 <span id="login_qq_info" style="float:right;display:none;">
            	<a class="login_qq_info" href="" style="max-width:115px;overflow:hidden;text-overflow:ellipsis;display:inline-block;white-space:nowrap;">
            	</a>
            	<a style="margin-left:10px;display: inline-block; vertical-align: top;" href="/loginOut.do?method=exitData">退出</a>
	        </span>
			
	        <ul id="login_user_info">
	            <li><a href="/jobfair/login.do">[&nbsp;<span>登录</span>&nbsp;|</a></li>
	            <li><a href="/register.jsp">&nbsp;<span>免费注册</span>&nbsp;]</a></li>
	            <li>
	            <a style="color:#76746F;" target="_blank" href="http://www.211zph.com/auth/index.do">
	            		<img src="/auth/img/connect_logo_7.png"></a>
	            </li>
	        </ul>
	         <script type="text/javascript">
				$(function(){
						$.get( '/login.do?check=true&date='+new Date(),function(data){
						if(data.login){
							var login = data.login;
							if( login.nickname ){
								var path="/auth/bind_qq.jsp";
								if( login.user_id ){
									path="/member/home.do";
								}
								var link = $("#login_qq_info").find(".login_qq_info");
								link.attr("href",path );
								var str='<img style="width:20px;height:20px;" src="'+login.avatar+'"  />'+login.nickname;
								link.html( str );
								$("#login_user_info").hide();
								$("#login_qq_info").show();
							}else{
								var user_id=(login.user_id.length>10)?login.user_id.substring(0,7)+'...':login.user_id;
								var str='<li>'+'<a title="'+login.user_id+'" style="text-decoration:none;">'+user_id+'</a>';
									 str+='&nbsp;&nbsp;<a href="/member/home.do" >'+login.user_type_name+'中心</a>';
									 str+="</li><li>";
									 str+='&nbsp;&nbsp;<a href="/loginOut.do?method=exitData">退出</a>';
									 str+="</li>";
							   $("#login_user_info").html(str);
							}
						}
					});
				});
				</script>
				<div class="clear"></div>
          </div>
          <div class="clear"></div> 
      </div>
      <div class="clear"></div> 
      <!--sub_nav结构结束  -->
      <!--nav结构开始  -->
      <div class="top_nav">
          <div class="nav_inner">
              <div class="logo">
                   <img src="/static/images/LOGO.png">
              </div>              
              <div><a class="province switch" href="javascript:;" id="site_select_btn">
              		陕西
              		<span><i class="arrow"></i></span>
              		</a>
              </div>
              <div class="main_nav">
              	<ul>
					<li><a class="nav_shouye" href="/jobfair/index.do?a=28" title="首页">
						首页</a>
					</li>
                	<li>|</li>
					<li><a class="nav_wlzph" href="/jobfair/wlzph.do" title="网络招聘会">
						网络招聘会</a>
					</li>
                	<li>|</li>
					
                	<li><a class="nav_xyzph" href="/jobfair/xyzph.do" title="校园招聘会">
                		校园招聘会</a>
                	</li>
                    
                    <li>|</li>
                    <li><a class="personal_center" href="/jobfair/xyzph.do" title="个人中心">
                		个人中心</a>
                	</li>
				</ul>                 
              </div>                                                          
           </div>
      </div> 
       <!--nav结构结束  --> 
      <div style="clear:both"></div>    
</div>
 <script>
		$(function(){
			$('#site_select_btn').click(function(e){
				e.preventDefault();
				art.dialog({
					follow:"#site_select_btn",
					id: 'site_select_btn',
					title:false,
					content:'abc',
					fixed:true,
					close:function(){this.hide(); return false;},
					show:false,
					esc:true,
					padding:"2px 6px 10px 6px"
				});
				var url ='/service/select_site.jsp';
				var pageContentBody =$(art.dialog({id: 'site_select_btn'}).content());
				pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");
				/*
				$.post(url, {}, function (res) {
								pageContentBody.html(res);
								art.dialog({id: 'site_select_btn'}).show();
				});
				*/
				pageContentBody.html( $("#site_select_content").text() );
				art.dialog({id: 'site_select_btn'}).show();
				
			});
		});
</script>

<script id="site_select_content" type="text/plain">
	<div class="site_select_link">
		<!-- 
		<a href="/">全国站</a>
		-->	
    	<p></p>   
    	<a href="/beijing">北京</a><a href="/tianjin">天津</a><a href="/hebei">河北</a><a href="/shanxi">山西</a><a href="/neimenggu">内蒙古</a><a href="/liaoning">辽宁</a><a href="/jilin">吉林</a><a href="/heilongjiang">黑龙江</a><a href="/shanghai">上海</a><a href="/jiangsu">江苏</a><a href="/zhejiang">浙江</a><a href="/anhui">安徽</a><a href="/fujian">福建</a><a href="/jiangxi">江西</a><a href="/shandong">山东</a><a href="/henan">河南</a><a href="/hubei">湖北</a><a href="/hunan">湖南</a><a href="/guangdong">广东</a><a href="/guangxi">广西</a><a href="/hainan">海南</a><a href="/chongqing">重庆</a><a href="/sichuan">四川</a><a href="/guizhou">贵州</a><a href="/yunnan">云南</a><a href="/xizang">西藏</a><a href="/shaanxi">陕西</a><a href="/gansu">甘肃</a><a href="/qinghai">青海</a><a href="/ningxia">宁夏</a><a href="/xinjiang">新疆</a> 
	</div>
</script>
<script type="text/javascript">
function fixedNav(){
	var t = $(document).scrollTop();
	if(t > 40 ){
		$('.top_nav').addClass("fixed");
	}else{
		$('.top_nav').removeClass("fixed");
	}
}
$(window).scroll(function(e){
	fixedNav();
});
</script>

<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
     <div id="latest_log" class="news">
        <ul class="info">   
       		
                    	  <li>2分钟前，&nbsp;&nbsp;北京欧朋兰博企业投资管理有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>4分钟前，&nbsp;&nbsp;深圳市德奥美科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>4分钟前，&nbsp;&nbsp;海西商品交易所有限公司成都销售分公司注册了企业会员！</li>   
                    	
                    	  <li>5分钟前，&nbsp;&nbsp;西安创润商贸有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>5分钟前，&nbsp;&nbsp;名城商务广告有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;西安深洋软件信息技术有限公司下载了陈大隆的简历</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;智远教育发布职位:客服人员</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;小蜗置家科技有限责任公司发布职位:全屋定制电话顾问</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;北京华信智原教育技术有限公司陕西分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;山东易达利化工有限公司发布职位:储备干部</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;山东易达利化工有限公司发布职位:生产操作员</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;智远教育发布职位:客服人员</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;中汐资产管理有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>8分钟前，&nbsp;&nbsp;秦都旭东文化培训学校申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>8分钟前，&nbsp;&nbsp;西安宇诺信息科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>9分钟前，&nbsp;&nbsp;陕西华之源商贸有限公司发布职位:客户专员</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;深圳市银雁金融服务有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;西安欧威商贸有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;陕西新才网络技术有限公司下载了任守朝的简历</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;西安智高诚软件科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                  	  <li>12分钟前，&nbsp;&nbsp;西安深壹信息科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>13分钟前，&nbsp;&nbsp;成都万空网络科技有限公司注册了企业会员！</li>   
                    	
                    	  <li>13分钟前，&nbsp;&nbsp;百胜咨询（上海）有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>14分钟前，&nbsp;&nbsp;西安润年电子商务有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>14分钟前，&nbsp;&nbsp;西安酷奇网络科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>15分钟前，&nbsp;&nbsp;上海观谷科技有限公司发布职位:机械设计师</li>   
                    	
                    	  <li>16分钟前，&nbsp;&nbsp;小蜗置家科技有限责任公司发布职位:家居顾问</li>   
                    	
                    	  <li>16分钟前，&nbsp;&nbsp;上海观谷科技有限公司发布职位:C++软件工程师</li>   
                    	
                    	  <li>17分钟前，&nbsp;&nbsp;西安深洋软件信息技术有限公司下载了武云刚的简历</li>   
                    	
                    	  <li>19分钟前，&nbsp;&nbsp;成都百合居装饰有限公司注册了企业会员！</li>   
                    	
        </ul>
       <div style="clear:both">
       </div>
        <script type="text/javascript"> 
                        var box2=document.getElementById("latest_log"),can=true; 
                        box2.innerHTML+=box2.innerHTML; 
                        box2.onmouseover=function(){can=false}; 
                        box2.onmouseout=function(){can=true}; 
                        $(function (){ 
                            var stop=box2.scrollTop%30==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%30?10:2000); 
                        }); 
                </script>
        <ul class="info">   
       		
                    	  <li>2分钟前，&nbsp;&nbsp;北京欧朋兰博企业投资管理有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>4分钟前，&nbsp;&nbsp;深圳市德奥美科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>4分钟前，&nbsp;&nbsp;海西商品交易所有限公司成都销售分公司注册了企业会员！</li>   
                    	
                    	  <li>5分钟前，&nbsp;&nbsp;西安创润商贸有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>5分钟前，&nbsp;&nbsp;名城商务广告有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;西安深洋软件信息技术有限公司下载了陈大隆的简历</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;智远教育发布职位:客服人员</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;小蜗置家科技有限责任公司发布职位:全屋定制电话顾问</li>   
                    	
                    	  <li>6分钟前，&nbsp;&nbsp;北京华信智原教育技术有限公司陕西分公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;山东易达利化工有限公司发布职位:储备干部</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;山东易达利化工有限公司发布职位:生产操作员</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;智远教育发布职位:客服人员</li>   
                    	
                    	  <li>7分钟前，&nbsp;&nbsp;中汐资产管理有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>8分钟前，&nbsp;&nbsp;秦都旭东文化培训学校申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>8分钟前，&nbsp;&nbsp;西安宇诺信息科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>9分钟前，&nbsp;&nbsp;陕西华之源商贸有限公司发布职位:客户专员</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;深圳市银雁金融服务有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;西安欧威商贸有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;陕西新才网络技术有限公司下载了任守朝的简历</li>   
                    	
                    	  <li>10分钟前，&nbsp;&nbsp;西安智高诚软件科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                  	  <li>12分钟前，&nbsp;&nbsp;西安深壹信息科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>13分钟前，&nbsp;&nbsp;成都万空网络科技有限公司注册了企业会员！</li>   
                    	
                    	  <li>13分钟前，&nbsp;&nbsp;百胜咨询（上海）有限公司西安分公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>14分钟前，&nbsp;&nbsp;西安润年电子商务有限公司申请参加西安科技大学高新学院2017届校园综合招聘会未通过</li>   
                    	
                    	  <li>14分钟前，&nbsp;&nbsp;西安酷奇网络科技有限公司申请参加西安科技大学高新学院2017届校园综合招聘会已通过</li>   
                    	
                    	  <li>15分钟前，&nbsp;&nbsp;上海观谷科技有限公司发布职位:机械设计师</li>   
                    	
                    	  <li>16分钟前，&nbsp;&nbsp;小蜗置家科技有限责任公司发布职位:家居顾问</li>   
                    	
                    	  <li>16分钟前，&nbsp;&nbsp;上海观谷科技有限公司发布职位:C++软件工程师</li>   
                    	
                    	  <li>17分钟前，&nbsp;&nbsp;西安深洋软件信息技术有限公司下载了武云刚的简历</li>   
                    	
                    	  <li>19分钟前，&nbsp;&nbsp;成都百合居装饰有限公司注册了企业会员！</li>   
                    	
        </ul>
       <div style="clear:both">
       </div>
        <script type="text/javascript"> 
                        var box2=document.getElementById("latest_log"),can=true; 
                        box2.innerHTML+=box2.innerHTML; 
                        box2.onmouseover=function(){can=false}; 
                        box2.onmouseout=function(){can=true}; 
                        $(function (){ 
                            var stop=box2.scrollTop%30==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%30?10:2000); 
                        }); 
                </script>
      </div>  
      
 <div class="main_l">
<ul>

<li><a href="#" class="my_resume"> <i class="fa fa-file-text-o"></i>   我的简历</a></li>
<li><a href="#" class="my_account"> <i class="fa fa-gear "></i>    账号管理</a></li>
<li><a href="#" class="my_resume"> <i class="fa fa-bell-o"></i>    面试通知</a></li>
<li><a href="#" class="my_resume"> <i class="fa fa-bell-o"></i>    录用通知</a></li>
<li><a href="#" class="my_resume"> <i class="fa fa-desktop"></i>    搜索职位</a></li>
<li><a href="#" class="my_resume"> <i class="fa fa-files-o"></i>    参会记录</a></li>
<li><a href="#" class="my_resume" style="border-bottom:1px solid #efefef;"> <i class="fa fa-send-o"></i>    投递记录</a></li>

</ul>

</div>
 
 <div class="main_r"> 
  
 <div style="clear:both"></div>    
 </div>
 
  
   <div style="clear:both"></div> 
    
 </div>   
    
    
 
<!--main区架构结束-->



<!--footer区架构开始-->
<div class="footer">
    <div class="footer_top"></div>
    <div class="footer_down">
         <div class="footer_inner">
             <div class="footer_content">             
              <div class="footer_l">
                 <ul>
                     <li><img class="logo" src="/static/images/LOGO2.png" width="170" height="40"></li>
                     <li><img class="ewm" src="/static/images/ewm_03.png" width="110" height="110"></li>
                     <li><a href="#"><i class="fa fa-weixin" aria-hidden="true"></i>    关注211校招网官方微信获取更多信息</a></li>
                     <li><a href="#"><i class="fa fa-weibo" aria-hidden="true"></i>    @211校招网</a></li>
                 </ul>              
              </div>
              <div class="footer_r">
              	<div class="footer_r_top">
                   <ul>
                      <li><a class="ljgd" href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>了解更多</a><a class="gywm" href="http://www.211zph.com/page.do?id=201407210000321">关于我们</a></li>
                      <li>地址：西安高新区科技二路65号清华科技园清扬大厦A410</li>
                  	  <li>工信部备案号：陕ICP备13006318号-3</li>
                      <li>西安市人力资源服务许可证编号：610100120105</li>
                      <li class="dh">联系电话：<strong class="phone">029-8866-2468</strong></li>
                      <li class="bq">西安大秦人力资源有限公司版权所有</li>
                   </ul>            
              	</div>
              </div>
              <div style="clear:both;"></div>
              </div>
              <div class="copyright">
              		 <p style="text-align:center;">
			            <a target="_blank" href="http://wljg.xags.gov.cn/bscx.do?method=hddoc&amp;id=61011300000328">
			            	<img src="/statics/img/gongshang.png">
			            </a>
			            <a id="_pingansec_bottomimagelarge_shiming" target="_blank" href="http://si.trustutn.org/info?sn=537160415021285523738&amp;certType=1">
			            	<img src="/statics/img/renzheng.png">
			            </a>
			         </p>

              </div>

         </div>
    </div>
</div>


<!--footer区架构结束-->



</body></html>