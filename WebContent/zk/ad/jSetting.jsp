<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link href="../../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.zclip.js" charset="utf-8"></script>
<script type="text/javascript" src="Setting.js" charset="utf-8"></script>
<style type="text/css">
	.reference {
	/*
		background-color:#D8F5BA;
		border:1px solid #FFFF99;
	*/
		padding:10px;
		display:block;
		width:500px;
}
.line , .bdsharebuttonbox{display:inline;float:none;}
/* 复制提示 */
.copy-tips{position:fixed;z-index:999;bottom:50%;left:50%;margin:0 0 -20px -80px;background-color:rgba(0, 0, 0, 0.2);filter:progid:DXImageTransform.Microsoft.Gradient(startColorstr=#30000000, endColorstr=#30000000);padding:6px;}
.copy-tips-wrap{padding:10px 20px;text-align:center;border:1px solid #F4D9A6;background-color:#FFFDEE;font-size:14px;}
</style>
<script>
	window._bd_share_config = {
		common : {		
			bdText : 'http://www.211zph.com/register.jsp?tid=<%=user_id %>',	
			bdDesc : 'http://www.211zph.com/register.jsp?tid=<%=user_id %>',	
			bdUrl : 'http://www.211zph.com/register.jsp?tid=<%=user_id %>', 	
			bdPic : 'http://www.211zph.com/upload/webroot/2014/07/ftp_20140723000442.png',
		},
		share : [{
			"tag" : "share_1",
			"bdSize" : 32,
		},{
			"tag" : "share_2",
			"bdSize" : 16,
		}]
	}
</script>
</head>

<body>

<div style="margin:30px;">
			<div>
			推广地址：
			</div>
			<div class="reference">
				<a href="#none" class="copy">http://www.211zph.com/register.jsp?tid=<%=user_id %></a> 
	
				<div class="line">
					<a href="#none" class="copy-input">点击复制</a>
					<input type="hidden" class="input" value="http://www.211zph.com/register.jsp?tid=<%=user_id %>" />
				</div>
			</div>
				<%-- 
				<div style="">
				 通过本链接地址，注册的企业会员与求职者简历，将归入您的数据库中，审核通过后，予以计算费用。
				</div>
				--%>
				<div style="">
				 通过本链接地址，注册的求职者简历，将归入您的数据库中，审核通过后，将显示在企业后台，企业可以免费下载。
				</div>		
				<table><tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_2">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					<a class="bds_count" data-cmd="count"></a>
				</div>
				</td></tr>
				</table>
				<div><!-- --------------- -->
<p style="text-indent: 2em;">
	<br/>
</p>
<% /* 
<p style="text-indent: 2em;font-weight:bold;">
    企业审核标准为：
</p>
<p style="text-indent: 2em;">
    1.注册的企业名称与营业执照相同；
</p>
<p style="text-indent: 2em;">
    2.上传营业执照和代码证，或三证合一；
</p>
<p style="text-indent: 2em;">
    3.注册信息中提供招聘单位准确联系人和联系电话，邮箱。
</p>
<p style="text-indent: 2em;">
    4.完善了企业简介信息；
</p>
<p style="text-indent: 2em;">
    5.至少发布2个招聘职务。
</p>
*/ %>
<p>
    <br/>
</p>
<p style="text-indent: 2em;font-weight:bold;">
    个人简历审核标准：
</p>
<p style="text-indent: 2em;">
    1.正确注册了个人会员，其中必须填写个人的真实姓名，联系方式，邮箱，QQ号码等。
</p>
<p style="text-indent: 2em;">
    2.简历各项均为需要填写的内容，整体完整度不低于80%。
</p>
<p style="text-indent: 2em;">
    3.简历错误的，不找工作的，不予审核通过。
</p>
<%--
<p style="text-indent: 2em;">
    4.一份简历审核后，获得费用1元。
</p>
 --%>
<p style="text-indent: 2em;">
    <span class="Apple-tab-span" style="white-space: pre;">					</span>
</p>
<p>
    <br/>
</p>
					<!-- --------------- -->
				</div>
</div>



		<!-- 
		或者
			<label class="reference">http://www.211zph.com/register.jsp?tuid=<%=user_code %> </label>
		 -->
<script>
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>
</body>
</html>
