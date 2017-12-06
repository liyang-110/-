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
			"bdSize" : 16,
			"bdText" : "只服务大学生的211校招网，你注册简历了吗？"
		},{
			"tag" : "share_2",
			"bdSize" : 16,
			"bdText" : "上211校招网注册简历，公益HR帮你免费修改，点击注册！"
		},{
			"tag" : "share_3",
			"bdSize" : 16,
			"bdText" : "无经验不挑，有经验更强。211校招网简历注册绿色通道！进入！"
		},{
			"tag" : "share_4",
			"bdSize" : 16,
			"bdText" : "快速注册211校招网求职会员，在家也能参加网络视频招聘会！进入！"
		},{
			"tag" : "share_5",
			"bdSize" : 16,
			"bdText" : "拒绝等待，就来211校招网网络视频招聘会，注册成功直接进入！"
		},{
			"tag" : "share_6",
			"bdSize" : 16,
			"bdText" : "足不出户，一天面试10家企业，尽在211校招网网络视频招聘会，进入！"
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
			
				<div style="display:none;">
				 通过本链接地址，注册的企业会员与求职者简历，将归入您的数据库中，审核通过后，予以计算费用。
				</div>	
				<table>
				<tr>
					<td colspan="2">
					1.只服务大学生的211校招网，你注册简历了吗？
					</td>
				</tr>
				<tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_1">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					
				</div>
				</td></tr>
				</table>
				
				<table>
				<tr>
					<td colspan="2">
					2.上211校招网注册简历，公益HR帮你免费修改，点击注册！
					</td>
				</tr>
				<tr>
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
					
				</div>
				</td></tr>
				</table>
				
				<table>
				<tr>
					<td colspan="2">
					3.无经验不挑，有经验更强。211校招网简历注册绿色通道！进入！
					</td>
				</tr>
				<tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_3">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					
				</div>
				</td></tr>
				</table>
				
				<table>
				<tr>
					<td colspan="2">
					4.快速注册211校招网求职会员，在家也能参加网络视频招聘会！进入！
					</td>
				</tr>
				<tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_4">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					
				</div>
				</td></tr>
				</table>
				
				<table>
				<tr>
					<td colspan="2">
					5.拒绝等待，就来211校招网网络视频招聘会，注册成功直接进入！
					</td>
				</tr>
				<tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_5">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					
				</div>
				</td></tr>
				</table>
				<table>
				<tr>
					<td colspan="2">
					6、足不出户，一天面试10家企业，尽在211校招网网络视频招聘会，进入！
					</td>
				</tr>
				<tr>
				<td>
				一键分享：		</td><td>
				<div class="bdsharebuttonbox" data-tag="share_6">
					<a class="bds_mshare" data-cmd="mshare"></a>
					<a class="bds_qzone" data-cmd="qzone" href="#"></a>
					<a class="bds_tsina" data-cmd="tsina"></a>
					<a class="bds_baidu" data-cmd="baidu"></a>
					<a class="bds_renren" data-cmd="renren"></a>
					<a class="bds_tqq" data-cmd="tqq"></a>
					<a class="bds_weixin" data-cmd="weixin"></a>
					<a class="bds_more" data-cmd="more">更多</a>
					
				</div>
				</td></tr>
				</table>
</div>
		<!-- 
			<label class="reference">http://www.211zph.com/register.jsp?tuid=<%=user_code %> </label>
		 -->
<script>
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>
</body>
</html>
