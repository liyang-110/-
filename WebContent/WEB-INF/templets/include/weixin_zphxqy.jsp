<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="me.chanjar.weixin.common.bean.WxJsapiSignature" %>
<%@ page import="me.chanjar.weixin.common.exception.WxErrorException" %>
<%@ page import="me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage" %>
<%@ page import="me.chanjar.weixin.mp.api.WxMpService" %>
<%@ page import="me.chanjar.weixin.mp.api.impl.WxMpServiceImpl" %>
<%@ page import="com.util.weixin.WxMpInDbConfigStorage" %>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%
String agent = request.getHeader("user-agent"); 

if( agent.indexOf("MicroMessenger")>0 ){
	
	HashMap jobfairMap = (HashMap)request.getAttribute("jobfairInfo");
	HashMapFactory jobfair =new HashMapFactory(jobfairMap,"");

	HashMap statisticsMap = (HashMap)request.getAttribute("statistics");
	HashMapFactory statistics = new HashMapFactory(statisticsMap,"0");
	
	WxMpInDbConfigStorage wxconfig = WxMpInDbConfigStorage.getInstance();
	WxMpService wxService = new WxMpServiceImpl();
	wxService.setWxMpConfigStorage( wxconfig );
	String url=(String)request.getAttribute("wx-url");
	String appid="";
	String noncestr="";
	long timestamp=0;
	String link="";
	String signature="";
	try {
		WxJsapiSignature wx  = wxService.createJsapiSignature(url);
		appid=wx.getAppId();
		noncestr=wx.getNonceStr();
		timestamp=wx.getTimestamp();
		link=wx.getUrl();
		signature=wx.getSignature();
	} catch (WxErrorException e) {
		e.printStackTrace();
	}
%>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var title="<%=jobfair.get("job_fair_name")%>";
var desc="招聘会时间:<%=jobfair.get("job_fair_time")%>，共有招聘单位：<%=statistics.get("company_num") %>家，就业岗位<%=statistics.get("job_person_num") %>个";
var link="<%=link%>";
var imgUrl='http://www.211zph.com/images/logo211zph.png';
var debug =<%=(request.getParameter("debug")==null?"false":"true")%>;
wx.config({
    debug: debug,
    appId: '<%=appid%>',
    timestamp: <%=timestamp%>,
    nonceStr: '<%=noncestr%>',
    signature: '<%=signature%>',
    jsApiList: [
      'checkJsApi',
      'onMenuShareTimeline',
      'onMenuShareAppMessage',
      'onMenuShareQQ',
      'onMenuShareWeibo',
      'onMenuShareQZone',
      'hideMenuItems',
      'showMenuItems',
      'hideAllNonBaseMenuItem',
      'showAllNonBaseMenuItem',
      /*
      'translateVoice',
      'startRecord',
      'stopRecord',
      'onRecordEnd',
      'playVoice',
      'pauseVoice',
      'stopVoice',
      'uploadVoice',
      'downloadVoice',
      'chooseImage',
      'previewImage',
      'uploadImage',
      'downloadImage',
      'getNetworkType',
      'openLocation',
      'getLocation',
      'hideOptionMenu',
      'showOptionMenu',
      'closeWindow',
      'scanQRCode',
      'chooseWXPay',
      'openProductSpecificView',
      'addCard',
      'chooseCard',
      'openCard',
      */
      'addContact',
      'profile'
    ]
});
wx.ready(function(){
	wx.onMenuShareTimeline({
	    title: title, // 分享标题
	    link: link, // 分享链接
	    imgUrl: imgUrl, // 分享图标
	    success: function () { 
	        //alert("ok");
	    },
	    cancel: function () { 
	        //alert("cancel");
	    }
	});
	wx.onMenuShareAppMessage({
	    title: title, // 分享标题
	    desc: desc, // 分享描述
	    link: link, // 分享链接
	    imgUrl:imgUrl, // 分享图标
	    type: 'link', // 分享类型,music、video或link，不填默认为link
	    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	    success: function () { 
	    	//alert("okapp");
	    },
	    cancel: function () { 
	    	//alert("cancelapp");
	    }
	});
	wx.onMenuShareQQ({
	    title: title, // 分享标题
	    desc: desc, // 分享描述
	    link: link, // 分享链接
	    imgUrl: imgUrl, // 分享图标
	    success: function () { 
	       // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	       // 用户取消分享后执行的回调函数
	    }
	});
	wx.onMenuShareWeibo({
	    title: title, // 分享标题
	    desc:desc, // 分享描述
	    link: link, // 分享链接
	    imgUrl:imgUrl, // 分享图标
	    success: function () { 
	       // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	});
	wx.onMenuShareQZone({
	    title: title, // 分享标题
	    desc: desc, // 分享描述
	    link:link, // 分享链接
	    imgUrl: imgUrl, // 分享图标
	    success: function () { 
	       // 用户确认分享后执行的回调函数
	    },
	    cancel: function () { 
	        // 用户取消分享后执行的回调函数
	    }
	});
});
</script>
<%
}
%>