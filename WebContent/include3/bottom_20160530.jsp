<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.service.JobfairService" %>
<%@ page import="com.zhaopin.dao.CacheModel" %>

<%
String area_id=new com.zhaopin.StationSwitch(request,response).getSiteId();
JobfairService service = new JobfairService(new CacheModel() );
List<HashMap> todayJobfairList = service.getTodayJobfairList(area_id);
%>
<style type="text/css">
.network{ width:100%;
background:#81b21b;
height:70px;
position:fixed;
bottom:0;
z-index:1;
}
.network_bg{ width:980px;margin:0 auto;}
.man{ margin-top: -40px;margin-right:15px;}
.right_ul ul {margin-bottom:0;}
.right_ul li a{ color:#fff;font-size:24px;
background:url(/statics/img/trumpet.png) no-repeat 0px center;
padding-left:50px;
line-height:40px;
width:620px;
display:block;
text-overflow:ellipsis;
overflow:hidden;
white-space:nowrap;
}
</style>
<%if( todayJobfairList!=null && todayJobfairList.size()>0){%>
<div class="network">
	<div class="clearfix network_bg">
       <div class="pull-left" style="width:310px;">
          <div class="man">
          	<img src="/statics/img/man.png">
          </div>
       </div>
       <div class="pull-right right_ul" style="width:670px;">
          <div  id="todayJobfairList" style="height:40px;overflow:hidden;margin-bottom:15px; margin-top:15px; line-height:40px;">
            <ul>
                 <%for(HashMap row : todayJobfairList ){%>
                 	<% if("netcongress".equals(row.get("job_fair_type")) ){ %>
                <li><a  title="<%=row.get("job_fair_name") %>"
                		href="/netcongress/start.do?id=<%=row.get("job_fair_id") %>" target="_blank">
                	<%=row.get("begin_time") %>-<%=row.get("end_time") %>
                	&nbsp;<%=row.get("job_fair_name") %>
                	</a>
                </li>
                	<%}else{ %>
                <li><a title="<%=row.get("job_fair_name") %>"
                	   href="/jobfairInfo.do?id=<%=row.get("job_fair_id") %>" target="_blank">
                	<%=row.get("begin_time") %>-<%=row.get("end_time") %>
                	&nbsp;<%=row.get("job_fair_name") %>
                	</a>
                </li>
                	<%} %>
                <%} %>
            </ul>
          </div>
          <script type="text/javascript"> 
              var bottomAd=document.getElementById("todayJobfairList"),bottomCan=true; 
              bottomAd.innerHTML+=bottomAd.innerHTML; 
              bottomAd.onmouseover=function(){bottomCan=false;}; 
              bottomAd.onmouseout=function(){bottomCan=true;}; 
              $(function (){ 
                  var stop=bottomAd.scrollTop%40==0&&!bottomCan; 
                  if(!stop)bottomAd.scrollTop==parseInt(bottomAd.scrollHeight/2)?bottomAd.scrollTop=0:bottomAd.scrollTop++; 
                  setTimeout(arguments.callee,bottomAd.scrollTop%40?10:1000); 
              }); 
           </script>
       </div>
    </div>
</div>
<!---->
<%} %>
		<style type="text/css">
			#bottom_contact .navbar ul.nav	{float:none;}
			#bottom_contact .navbar ul.nav>li {
				float:none;
				display: inline-block;
			}
		</style>
		<div style="height:15px; margin-top:15px;">
		</div>

        <div id="bottom_contact">
        		  <div class="navbar" style="clear: both;text-align:center;
        		  border-top:2px solid #22B14C;margin-bottom:10px;padding-top:3px;">
                                    <ul class="nav" style="margin:0 auto;">
                                    <li><a href="/page.do?id=201407210000321">关于我们</a></li>
                                    <li class="divider-vertical">/</li>
                                    <%-- 
                                    <li><a href="/page.do?id=201407210000326">广告投放</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000328">法律声明</a></li>
                                    <li class="divider-vertical">/</li>
                                    <li><a href="/page.do?id=201407210000329">人才招聘</a></li>
                                    <li class="divider-vertical">/</li>
                                    --%>
                                    <li><a href="/page.do?id=201407210000327">联系方式</a></li>
                                  </ul>
                          		  <div class="clearfix"></div>
                </div>
                <div class="container">
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
	             <div style="text-align:center;margin-top:12px;">
				 <a href="http://wljg.xags.gov.cn/bscx.do?method=hddoc&id=61011300000328" target="_blank">
	                         <img src="/statics/i_lo2.gif"/>
				 </a>
				<a id="_pingansec_bottomimagelarge_shiming" href="http://si.trustutn.org/info?sn=537160415021285523738&certType=1" target="_blank">
				<img src="http://v.trustutn.org/images/cert/bottom_large_img.png"/>
				</a>
				</div>
                <div style="text-align:center;">
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
                </div>
                <div style="height:80px;">
				</div>
        </div>
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
     <%--
     function popAdvertisment()
     {
	   	  if( !$.cookie("site-index-ad" )  ){
				var expiresDate= new Date();
				expiresDate.setTime(expiresDate.getTime()+15*60*1000 ); 
				$.cookie("site-index-ad", 'true', {
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
         	  	/*
	       	if( $.cookie ){
	    	  	popAdvertisment();
	    	}else{	
				$.getScript('/statics/jquery/jquery.cookie.js',function(){
			 		popAdvertisment();
				});
	    	} 
    		*/
     });
     --%>
      $(function(){   
      //	 setTimeout("popAdvertismentMini();",2000 );
      });
      </script>
<style type="text/css">
#code,#code_hover,#gotop{width:36px;
height:48px;
background:url(/statics/img4/weixin.png) no-repeat;
position:fixed;
right:50px;
cursor:pointer;
_position:absolute;
_bottom:auto;
_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));
}
#code{background-position:-276px -258px;
bottom:127px;
_margin-bottom:127px;
}
#code_hover{background-position:-316px -258px;
bottom:127px;
_margin-bottom:127px;
}
#gotop{background-position:-276px -310px;
bottom:77px;
_margin-bottom:77px;
} 
#code_img{width:270px;
height:355px;
background:url(/statics/img4/weixin.png) -4px -3px no-repeat;
position:fixed;
right:90px;
bottom:77px;
cursor:pointer;
display:none;
_position:absolute;
_bottom:auto;
_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));
_margin-bottom:77px;
}
</style>
<script type="text/javascript">
function b(){
	h = $(window).height();
	t = $(document).scrollTop();
	if(t > h){
		$('#gotop').show();
	}else{
		$('#gotop').hide();
	}
}

$(document).ready(function(e) {
	
	b();
	
	$('#gotop').click(function(){
		$(document).scrollTop(0);	
	});
	
	$('#code').hover(function(){
		$(this).attr('id','code_hover');
		$('#code_img').show();
	},function(){
		$(this).attr('id','code');
		$('#code_img').hide();
	})

});

$(window).scroll(function(e){
	b();		
});
</script>
<div id="code"></div>
<div id="code_img"></div>
<a id="gotop" href="javascript:void(0)"></a>

<script src="http://code.54kefu.net/kefu/js/b94/885294.js" type="text/javascript" charset="utf-8"></script>
