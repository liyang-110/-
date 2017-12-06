<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
String job_fair_id=jobfairMap.get("job_fair_id").toString();
String user_type="";
%>
<div class="footer">
    <div class="foot">
    	<p>本站信息版权归西安大秦人力资源有限公司所有，不得采集，违者必究</p>
        <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A座410 客服:千先生 电话:029-88662468 87240519 传真:029-88662468 </p>
        <p> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
        </p>
    </div>
</div>
<% 	UserInterface user = User.currentUser(session);
	if( user instanceof AdUserBean ){ %>
<div style="position:fixed;bottom:0 ; right:20px;background-color:#041F2A; height:30px;width:111px;">
	<a href="javascript:;"  id="view-report-btn" style="color:#FEFEFE;display:block;line-height:30px;text-align:center;" >查看统计</a>
</div>
<script>
	$(function(){
		$("#view-report-btn").bind("click",function(){
				art.dialog.open("ext/jStaticsInfo.jsp?id=<%=job_fair_id%>", 
								{title:"统计",
								 height:360,
								 width:680,	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:true,
								 cancelVal:'关闭',
								 padding:0,
								 background:'#000',
								 opacity:0.3,
								 },false);
		});
	});
</script>
<% } %>
<script type="text/javascript">
$(function() {
	  $(window).scroll(function() {
	    if($(this).scrollTop() != 0) {
	      $("#toTop").fadeIn(); 
	    } else {
	      $("#toTop").fadeOut();
	    }
	  });
	  $("body").append("<div id=\"toTop\" style=\"border:1px solid #444;background:#333;color:#fff;text-align:center;padding:10px 13px 7px 13px;position:fixed;bottom:10px;right:10px;cursor:pointer;display:none;font-family:verdana;font-size:22px;\">^</div>");
	  $("#toTop").click(function() {
	    $("body,html").animate({scrollTop:0},800);
	  });
	});
</script>
<script type="text/javascript">
<%--
$(function(){
	var job_fair_id="<%=job_fair_id%>";
	if( !$.cookie("<%=user_type%>into+"+job_fair_id ) ){
		$.cookie("<%=user_type%>into+"+job_fair_id,true);
		open_agree_layer("wellcome",'<%=user_type%>');
	}
});
--%>
</script>
     <script type="text/javascript">
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
      $(function(){   
      //	 setTimeout("popAdvertismentMini();",2000 );
      });
</script>
      

<div class="modal fade" id="wellcomeModalDiialog"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:480px;">
    <div class="modal-content" style="background-color:#fff;">

      <div class="modal-body">
        	<div style="margin:auto;width:410px;padding:0;background:#fff;">
				<img src="img/app-download.png" />
        	</div>
      </div>
      <div class="modal-footer" style="text-align:center;padding:0;border-top:none;">
        <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
      	<p style="font-size:10px;text-align:center;padding:0;">
      		&nbsp;<!-- (<span class="djs">15</span>秒自动关闭)  -->
      	</p>
      </div>
    </div>
  </div>
</div>