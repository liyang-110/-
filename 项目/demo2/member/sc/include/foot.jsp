<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
     function popAdvertismentMini()
     {
			art.dialog.open("/ad/popover-small-stu.html", 
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
    	  if( !$.cookie("stu-index-ad" )  ){
  			var expiresDate= new Date();
  			expiresDate.setTime(expiresDate.getTime()+15*60*1000 ); 
  			$.cookie("stu-index-ad", 'true', {
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
      	  //	setTimeout("popAdvertismentMini();",2000 );
      });
     
</script>
<div class="foot">
	<div class="footer">
        <div class="foot">
            <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410 电话：029-88662468 / 87240519</p>
            <p>工信部备案号：陕ICP备13006138号-3 西安市人力资源服务许可证编号：610100120105 </p>
            <p>西安大秦人力资源有限公司 版权所有</p>
            <p> 
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
            </p>
        </div>
    </div>
</div>