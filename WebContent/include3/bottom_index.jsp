<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<div style="height:15px; margin-top:15px;">
		</div>
        <div id="bottom_contact">
        		  <div class="navbar" style="clear: both;text-align:center;
        		  border-top:2px solid #22B14C;margin-bottom:10px;padding-top:3px;">
                                    <ul class="nav" style="margin:0 auto;float:none;width:380px;">
                                    <li><a href="/page.do?id=201407210000321">关于我们</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000326">广告投放</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000328">法律声明</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000329">人才招聘</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000327">联系方式</a></li>
                                  </ul>
                          		  <div class="clearfix"></div>
                </div>
                <div class="container">
                	<!--  
                    <div class="pull-left" style="padding-top:0;">
                    	<img src="/statics/img/tel4006606125.jpg" />
                    </div>
                    -->
                    <div style="margin-top:6px;">
                             <div style="clear:both;"></div>
                             <div style="text-align:center;line-height:1.8em;">
地址：西安高新区科技二路65号清华科技园清扬国际大厦A410&nbsp;&nbsp;电话：029-88662468 / 87240519<br/>
工信部备案号：陕ICP备13006138号-3&nbsp;&nbsp;西安市人力资源服务许可证编号：610100120105 <br/>
西安大秦人力资源有限公司 版权所有
                             </div>

                    </div>
                    <div style="clear:both;"></div>
                </div>
	             <div style="text-align:center;">
	                         <img src="/statics/img/secure.png" style="margin:auto; margin-top:12px;"/>
				</div>
                <div style="text-align:center;">
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
                </div>
        </div>
        
 	<% /*
	<script type="text/javascript" src="assets/artDialog/extend/notice.js"></script>
     <script  type="text/javascript">
     	$(function(){
	     	  if( !$.cookie("site-index-notice" )  ){
	     	  		showNotice("免费送招聘会了",
	     	  			"<p>喜迎211校招网“网络招聘会”项目内部测试圆满结束。"+
	     	  			"10月份，特送所有211校招网企业会员朋友招聘会一场，已经送至您的顾问手中，"+
	     	  			"从您从招聘顾问手中领取，详情请联系您的的招聘顾问！活动客服电话18292085667！</p>",
	     	  			false,
	     	  			function(){
	     	  				//$.cookie("site-index-notice" ,true) ;
	     	  		});
	     	  }
		});
		function showNotice(title,content,icon,callback)
		{
			content='<div style="color:#666;text-indent:2em;">'+content+'</div>';
			art.dialog.notice({
			    title: title,
			    width: 260,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
			    content: content,
			    icon: icon,
			    time: 60,
			    padding:'10px 15px',
			    close: function(){
			    	if( ( typeof callback) != undefined ){
			    		callback();
			    	}
			    }
			});	
		}
     </script>   
      	*/ %>
      <script>
      $(function(){
      	  if( !$.cookie("site-index-ad" )  ){
			art.dialog.open(cur_path +"/ad/popoverScreen.jsp", 
								{title:false,
								 height:'100%',
								 width:'100%',	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:false,
								 padding:0,
								 background:'#000',
								 opacity:0.3,
								 },false);
				var expiresDate= new Date();
				expiresDate.setTime(expiresDate.getTime()+60*1000 ); 
				$.cookie("site-index-ad", 'true', {
					  path : '/',//cookie的作用域
					  expires : expiresDate
				});
			}
      });
      </script>