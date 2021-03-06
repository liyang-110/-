<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.service.JobfairCompanyService" %>
<%
		String job_fair_id="201607070008982";
		int pageNum =1;
		try{
			pageNum = Integer.parseInt(  request.getParameter( "page" ) );
		}catch(NumberFormatException e){	
		}
		JobfairCompanyService service = new JobfairCompanyService();
		List companyList = service.companyList(pageNum, 50, job_fair_id);
		request.setAttribute("companyList", companyList );
		String pagenation = service.getPagenation(pageNum,50, job_fair_id);
		request.setAttribute("pagenation", pagenation );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2016年离校未就业高校毕业生网上招聘会（陕西） -  211校招网</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/core.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>
<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript">
	var cur_path = "";
</script>
<script type="text/javascript" src="/statics/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>
<style>
	.navbar {text-aglin:center;margin:-60px auto 0 auto;}
	.navbar li {display:inline;}
	.navbar li a {line-height:3em;font-size:20px;padding:6px 10px;color:#fff;
	border-radius:12px;margin:0 10px;}
	.btn-large {
		padding:5px 30px;
		letter-spacing:2px;
		font-size:16px;
		margin-right:20px;
	}
</style>
<% if(request.getParameter("id")!=null){ %>
<script>
	$(function(){
		$("a[href='#tab2']").trigger("click");
	});
</script>
<% } %>
</head>
<body>
<div class="banner">
	<img src="img/banner.jpg" height="315" width="1100">
</div>

<div style="position:relative;width:500px;margin:auto;">
	<div style="position:absolute;">
	<ul class="navbar">
		<li><a target="_blank" href="http://www.211zph.com" style="background:#EB6000;">211校招网</a></li>
		<!--
		<li><a target="_blank" href="http://www.ncss.org.cn/zp/zph/ncss/293305.shtml" style="background:#2478B5;">全国主会场</a></li>
		-->
		<li><a target="_blank" href="http://www.ncss.org.cn/wlzph/2016lxwjyzph/index.shtml?1467871086727=" style="background:#2478B5;">全国主会场</a></li>
		<li><a target="_blank" href="http://www.sxgxbys.com" style="background:#4A6A00 ;">陕西分会场</a></li>
	</ul>
	</div>
</div>
<div class="cont">
	<div class="list">
    	<h1>2016年离校未就业高校毕业生网上招聘会（陕西）</h1>
    	<style>
    		.table.info_card tbody tr td{
    			line-height:2em;
    		}
    		.table.info_card tbody tr td{padding:0;text-align:left;}
    	</style>
        <table class="table info_card">
           <tbody>
              <tr>
                 <td colspan="2">举办单位： <a href="http://www.211zph.com/">211校招网 </a></td>
                 <td colspan="2">举办时间：2016-07-14 09:00 至 2016-12-31 17:00 </td>
              </tr>
              
               <tr>
                 <td style="width:70px;">指导单位：</td>
                 <td>
                 	  <!-- 教育部学生司 <br/>  -->
                 	  全国高等学校大学生信息咨询与就业指导中心<br/>
                 	 陕西省高等学校毕业生就业服务中心
                 	  </td>
                 <td style="width:70px;">承办单位：</td>
                 <td>陕西省高校毕业生就业网 <br/>
                 	 211校招网 </td>
              </tr>
              
              <tr>
                 <td colspan="2">招聘会规模：600家</td>
                 <td colspan="2">预定截止：2016-07-31 18:01</td>
              </tr>
              <tr>
                 <td colspan="2">招聘会特色：综合类 </td>
                 <td colspan="2">招聘会层次：大专,高职,本科,研究生 </td>
              </tr>
             
           </tbody>
        </table>
  
    </div>
    <div style="margin:20px 0 20px 10px">
        <a class="btn btn-warning  btn-large" onclick="ComApply('201607070008982','201508181002142')" style="color:#fff;" href="javascript:;">企业订展</a>
        <a class="btn btn-success btn-large" target="_blank" style="margin-left:20px;color:#fff;" href="http://www.211zph.com/netcongress/start.do?id=201607070008982">进入会场</a>
    </div>
    <!-- 分享代码 -->
    <!--<div class="bdsharebuttonbox"  style="float:right">
        <a href="#" class="bds_more" data-cmd="more">分享到</a>
        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
        <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
    </div>
    <div class="clear"></div>
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>-->
	<!-- 分享代码结束 -->
	<!--标签页开始-->
    <!--标签页开始-->
                <div class="xinxi">
                    <div class="nav_tab">
                        <ul id="myTab" class="nav nav-tabs">
                           <li class="active"><a href="#tab1" data-toggle="tab">邀请函</a></li>
                           <li><a href="#tab2" data-toggle="tab">参会企业</a></li>
                           <li><a href="#tab3" data-toggle="tab">教育部文件</a></li>
                           <li><a href="#tab4" data-toggle="tab">陕西省教育厅文件</a></li>
                           <li><a href="#tab5" data-toggle="tab">其他网络招聘会</a></li>
                        </ul>
                    </div>
                    <style type="text/css">
						#tab1 .tab .text p {
							padding:0;
							margin-bottom:0;
							text-indent:2em;
						}
					</style>
                    <!--<div class="container tab-content tab-news">-->
                    <div id="myTabContent" class="tab-content">
                       <div class="tab-pane fade in active" id="tab1">
                          <div class="tab">
                          		<div class="text">
                          	
<p>&nbsp;</p>
                          		
                          		<p>各用人单位、未就业毕业生：</p>
                          		<p></p>
                          		<p>为贯彻落实《教育部关于做好2016届全国普通高等学校毕业生就业创业工作的通知》（教学[2015]12号）和《教育部办公厅关于促进2016届尚未就业高校毕业生就业创业工作的通知》（教学厅函[2016]42号）精神，切实做好尚未就业毕业生就业服务工作，进一步拓宽高校毕业生就业渠道，定于2016年7月14日—8月30日（第一阶段），8月31日—12月31日（第二阶段）举办&ldquo;2016年离校未就业高校毕业生网上招聘活动&rdquo;现将有关事项通知如下：</p>
                          		<p><strong>一．</strong><strong>活动内容</strong></p>
                          		<p>本次活动以全国大学生就业公共服务立体化平台为主会场，陕西省高校毕业生就业网和211校招网为陕西分会场，用人单位招聘信息将在上述网站免费发布，供高校毕业生浏览查询。</p>
                          		<p>主题：2016年离校未就业毕业生网上招聘会</p>
                          		<p>时间：2016年7月14日—12月31日</p>
                          		<p>规模：用人单位600家     求职人数：预计20万人</p>
                          		<p>网址：<a href="http://www.211zph.com/">www.211zph.com</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.sxgxbys.com/">www.sxgxbys.com</a></p>
                          		<p><strong>二．指导承办</strong></p>
                          		<p>指导单位：</p>
                          		<p>全国高等学校学生信息咨询与就业指导中心</p>
                          		<p>陕西省高等学校毕业生就业服务中心</p>
                          		<p>承办单位：</p>
                          		<p>陕西省高校毕业生就业网</p>
                          		<p>211校招网</p>
                          		<p>大秦人才网</p>
                          		<p><strong>三．参会对象</strong></p>
                          		<p>2016届离校尚未就业大学生，应往届有求职需求大学生<strong>。</strong></p>
                          		<p><strong>四．宣传推广</strong></p>
                          		<p>1）新职业网，陕西省高校毕业生就业网，211校招网，大秦人才网；</p>
                          		<p>2）全省各高校就业中心官网，全省各高校就业中心微信公众号；</p>
                          		<p>3）211校招网、大秦人才网微信公众号、全省高校微信公众号；</p>
                          		<p>4）中央各级网络媒体，全国各级政府网站，各大新闻门户；</p>
                          		<p>5）陕西省本地各级网络媒体，报纸，电视台。</p>
                          		<p><strong>五．使用方法</strong></p>
                          		<p><strong>求职者：</strong></p>
                          		<p>1.选择一个安静、整洁的场所，准备一台可上网电脑，须有摄像头、耳麦，可QQ视频；</p>
                          		<p>2.登录211校招网注册个人会员，完善简历，并绑定本人QQ号；</p>
                          		<p>3.进入会场后，可浏览招聘单位和招聘职位，对自己意向的职位点击投递简历，招聘单位HR会实时在线查看简历，并对合适的求职者发放面试通知书，收到面试通知书后点击企业的QQ并加好友，开始QQ视频面试；</p>
                          		<p>4.面试结束，企业会对求职者发放面试结果：复试通知，录用通 知，面试未通过。并进一步沟通，签订合同或进入复试。</p>
                          		<p><strong>用人单位：</strong></p>
                          		<p>1.选择一个安静、整洁的场所，准备一台可上网电脑，须有摄像头，耳麦，可QQ视频；</p>
                          		<p>2.提前5天登录211校招网，并注册企业会员，上传营业执照、组织代码证，发布招聘职位，绑定招聘专用QQ号码。并在线填写&ldquo;企业订展&rdquo;报名申请，等待审核。</p>
                          		<p>3.注册完毕，填写报名回执，发送至我邮箱，等待审核；审核通过后，企业可在招聘会当天进入网络会场。</p>
                          		<p>4.进入会场后，能看到所有入场的求职毕业生。企业可以发送面试邀请，也可以查看收到的求职简历，并向意向求职者发放面试通知书，加求职者QQ好友，启动QQ视频面试；</p>
                          		<p>5.面试结束，向求职者发放面试结果，继续下一个面试。</p>
                          		<p><strong>六．联系方式</strong></p>
                          		<p>服务热线：  029-88662468  </p> 
                          		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18821795779&nbsp;&nbsp;王老师  </p>   
                          		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15771778607&nbsp;&nbsp;肖老师   </p>
                          		<p>地址：陕西省西安市科技二路清华科技园清扬大厦A座410</p>
     							</div>
                          </div>
                       </div>
                       <div class="tab-pane fade" id="tab2">
                            <div class="tab">
                            <table class="table table-condensed">
                            	<thead>
                                  <tr>
                                     <th>序号</th>
                                     <th>企业名称</th>
                                     <th>公司地址</th>
                                     <!--  
                                     <th>&nbsp;</th>
                                     -->
                                  </tr>
                               </thead>
                               <tbody>
                               <%
                               if(companyList!=null &&companyList.size()>0){
               	          	    int i=0;
               	            	for(Iterator iter=companyList.iterator();iter.hasNext();){
               	            		HashMap row=(HashMap)iter.next();
               	            	%>
               	            		<tr  style="cursor:default;">
               	            		<td><%=row.get("rn") %></td>
               	            		<td style="text-align:left;">
               	            		<div  style="white-space:nowrap;">
               	            				<a href="/company/info.do?id=<%=row.get("company_id")%>" target="_blank">
               	            				<%=row.get("company_name")%>
               	            				</a>
               	            		</div></td>
               	            		<td style="text-align:left;" >
               	            		<div style="">
               	            		<%=row.get("company_addr")==null?"":row.get("company_addr")%>
               	            		</div>
               	            		</td>
               	            		<!--  
               	            		<td  class="bag">
               	            		<a href="/company/info.do?id=<%=row.get("company_id").toString() %>&jobs=1" target="_blank"  style="font-size:12px;">投递简历</a>

               	            		</td>
									-->
               						</tr>
               						<%
               	             	}
               	    }else{ %>
               	             	<tr><td colspan='3' style="text-align:center;">还没有企业申请参会！</td></tr>
               	             	<% 

               		}
                               %>
                                
                               </tbody>
                            </table>
                            
                          </div>
                        
							<div class=" pagination pagination-centered fenye">
			         			        <%=request.getAttribute("pagenation")==null?"":request.getAttribute("pagenation") %>
			         		</div>
                          <!--分页-->
                          <!--<div class="fenye">
                            <ul class="pagination">
                              <li><a href="#">上一页</a></li>
                              <li class="active"><a href="#">1</a></li>
                              <li><a href="#">2</a></li>
                              <li><a href="#">3</a></li>
                              <li><a href="#">4</a></li>
                              <li><a href="#">5</a></li>
                              <li><a href="#">下一页</a></li>
                            </ul>
                          </div>-->
                          <!--分页-->

                       </div>
                       <div class="tab-pane fade" id="tab3">
                            <div class="tab">
                           		<div class="img" style="text-align:center; padding-top:20px;">
                                	  <img src="img/a.png">
                                      <img src="img/b.png">
                                      <img src="img/c.png">
                                </div>
                            </div>

                       </div>
                       <div class="tab-pane fade" id="tab4">
                            <div class="tab">
                           		<div class="img" style="text-align:center; padding-top:20px;">
                                	  <img src="img/sx1.jpg"/>
                                      <img src="img/sx2-1.jpg"/>
                                      <img src="img/sx3.jpg"/>
                                      <img src="img/sx4.jpg"/>
                                </div>
                            </div>
                          <!--分页-->
                       </div>
                        <div class="tab-pane fade" id="tab5">
                            <div class="tab">
                            <table class="table table-condensed">
                            	<thead>
                                  <tr>
                                     <th>招聘会时间</th>
                                     <th>招聘会名称</th>
                                  </tr>
                               </thead>
                               <tbody>
                                  <tr>   
                                     <td>2016-07-15 09:30</td>                       
                                     <td><a href="http://www.211zph.com/netcongress/start.do?id=201607010008942" class="dianji">陕西通信互联网专场网络视频招聘会</a></td>
                                     
                                  </tr>
                                   <tr>     
                                   	<td>2016-08-16 09:30</td>                     
                                    <td><a href="http://www.211zph.com/netcongress/start.do?id=201605110008665" class="dianji">211校招网陕西金融财会专场网络视频招聘</a></td>
                                  </tr>
                               </tbody>
                            </table>
                            
                          </div>

                       </div>
                    </div>
                </div>
                <!--标签页-->    
 </div>  
 <!--footer-->
<div class="foot">
	<div class="footer">
        <div class="foot">
            <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410</p>
            <p>工信部备案号：陕ICP备13006138号-3 西安市人力资源服务许可证编号：610100120105 </p>
            <p>西安大秦人力资源有限公司 版权所有</p>
            <p> 
							<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>

            </p>
        </div>
    </div>
</div>   
</body>
</html>