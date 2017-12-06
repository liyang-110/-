<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="footer">
	<p>本站信息版权归西安大秦人力资源有限公司所有，不得采集，违者必究</p>
	<p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A座410 客服:千先生 电话:029-88662468 87240519 传真:029-88662468</p>
</div>

<div class="modal fade" id="wellcomeModalDiialog"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:480px;">
    <div class="modal-content" style="background-color:#fff;">

      <div class="modal-body">
        	<div style="margin:auto;width:329px;padding:0;background:#fff;">
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

<c:if test="${currentUser.userType eq 'admin' }">
<div style="position:fixed;bottom:0 ; right:20px;background-color:#041F2A; height:30px;width:111px;">
	<a href="javascript:;"  id="view-report-btn" style="color:#FEFEFE;display:block;line-height:30px;text-align:center;" >查看统计</a>
</div>
<script type="text/javascript">
	$(function(){
		$("#view-report-btn").bind("click",function(){
				art.dialog.open("ext/jStaticsInfo.jsp?id=${param.id}", 
								{title:"统计",
								 height:360,
								 width:680,	
								 top:10,
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
</c:if>
<iframe src="/netcongress/cnzz.html" style="height:0;border:none;"></iframe>