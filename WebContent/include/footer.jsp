<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
    	<%
    	String base_dir =request.getContextPath()+"/";
     	%>
    <div id="bottom_contact">
    	<div class="container">
        	<div class="pull-left" style="margin-top:25px;">
            <img src="<%=base_dir %>assets2/images/tel_400.png" />
            </div>
            <div class="pull-left" style="margin-top:25px; width:550px; text-align:center;">
            <img src="<%=base_dir %>assets2/images/110.gif"  width="355" height="65"/>
            </div>
            <div class="pull-right" style="margin-top:15px;">
            <img src="<%=base_dir %>assets2/images/weixin.jpg"/>
        	</div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div id="bottom_declare">
    	<div class="container">
        		<div class="navbar">
                    <ul class="nav">
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000321">关于我们</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000326">公司广告</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000328">法律声明</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000329">人才招聘</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000327">联系方式</a></li>
                  </ul>
                  </div>
        </div>
        <div class="container">
        	<%=com.zhaopin.Config.getSiteBottomHtml() %>
       </div>
        <div style="margin:auto;text-align:center;">
			<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</div>
    </div>
     <script>
     function popAdvertisment()
     {
     	  if( !$.cookie("home-index-ad" )  ){
			var expiresDate= new Date();
			expiresDate.setTime(expiresDate.getTime()+60*1000 ); 
			$.cookie("home-index-ad", 'true', {
				  path : '/',//cookie的作用域
				  expires : expiresDate
			});
			art.dialog.open(cur_path +"/ad/popover20151128.html", 
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

		 	}
     }
      $(function(){
/*       	  if( $.cookie ){
      	  		popAdvertisment();
      	  }else{	
				$.getScript('/statics/jquery/jquery.cookie.js',function(){
					popAdvertisment();
				});
      	  } */
      });
      </script>
<script language="JavaScript" src="http://code.54kefu.net/kefu/js/b94/885294.js" type="text/javascript" charset="utf-8"></script>