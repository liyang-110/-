<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="fenlan"></div>
     <script>
     function popAdvertismentMini()
     {
			art.dialog.open("/ad/popover-small.html", 
								{title:false,
								 height:'230px',
								 width:'330px',	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:false,
								 padding:0,
								 background:'#000',
								 opacity:0.3,
								 left: '0',
							     top: '100%',
								 },false);
     }
     function popAdvertisment()
     {
   	  	if( !$.cookie("com-index-ad" )  ){
			var expiresDate= new Date();
			expiresDate.setTime(expiresDate.getTime()+30*60*1000 ); 
			$.cookie("com-index-ad", 'true', {
				  path : '/',//cookie的作用域
				  expires : expiresDate
			});
			art.dialog.open("/ad/popover-big.html", 
								{title:false,
								 height:'100%',
								 width:'100%',	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:false,
								 padding:0,
								 background:'#000',
								 opacity:0.3
								 },false);
   	  	}
     }
     
      $(function(){
      	 // 	setTimeout("popAdvertismentMini();",2000 );
      });
     
      </script>
     <script><%--
     function popAdvertisment()
     {
     //	  if( !$.cookie("site-index-ad" )  ){
			var expiresDate= new Date();
			expiresDate.setTime(expiresDate.getTime()+60*1000 ); 
			$.cookie("site-index-ad", 'true', {
				  path : '/',//cookie的作用域
				  expires : expiresDate
			});
			art.dialog.open(cur_path +"/ad/popover20160226.html", 
								{title:false,
								 height:'230px',
								 width:'330px',	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:false,
								 padding:0,
								 background:'#000',
								 opacity:0.3,
								 left: '0',
							     top: '100%',
								 },false);
		// 	}
     }
      $(function(){
       	  if( $.cookie ){
      	  		popAdvertisment();
      	  }else{	
				$.getScript('/statics/jquery/jquery.cookie.js',function(){
		 			popAdvertisment();
				});
      	  } 
      });
      --%></script>
<div class="foot" style="background:#e37f1f;color:#FFF;">
	<style>
		.footer a, .footer p {color:#FFF; }
		.footer a:hover{text-decoration:underline;color:#FFF;}
	</style>
    <div class="footer">
        <p class="text" style="display:none;">
        <a href="http://www.211zph.com/page.do?id=201407210000321">关于我们</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000326">广告投放</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000328">法律声明</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000329">人才招聘</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000327">联系方式</a></p>
        <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410  电话：029-88662468 / 87240519</p>
        <p>工信部备案号：陕ICP备13006138号-3  西安市人力资源服务许可证编号：610100120105 </p>
        <p>西安大秦人力资源有限公司 版权所有</p>
        <p>
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
        </p>
    </div> 
</div>