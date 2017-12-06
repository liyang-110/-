<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% HashMap jobfairInfo=(HashMap)request.getAttribute("jobfairInfo");
	if(jobfairInfo ==null){
		response.sendRedirect(request.getContentType()+"/");
		return;
	}
	String job_fair_id=(String)jobfairInfo.get("job_fair_id");
	String base_dir = request.getContextPath()+"/";
	String sql=" select a.job_fair_id,a.job_fair_name,to_char(a.job_fair_time,'yyyy-mm-dd hh24:mi') job_fair_time "
			+" from tbl_job_fair a left join tbl_job_fair b on a.job_fair_time between b.job_fair_time and b.job_fair_overtime "
			+" where a.job_fair_id!='"+job_fair_id+"' and b.job_fair_id='"+job_fair_id+"' "
			+" order by a.job_fair_time asc ";
	List jobfairList = new com.zhaopin.dao.CacheModel().queryMap(sql);
	request.setAttribute("jobfairList", jobfairList );
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description"
	content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>${jobfairInfo.job_fair_name }- <%=com.zhaopin.Config.getSiteTitle() %></title>
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
	<img src="img/lywjy2017.png" height="315" width="1100">
</div>

<div style="position:relative;width:500px;margin:auto;">
	<div style="position:absolute;">
	<ul class="navbar">
		<li><a target="_blank" href="http://www.211zph.com" style="background:#EB6000;">211校招网</a></li>
		<!--
		<li><a target="_blank" href="http://www.ncss.org.cn/zp/zph/ncss/293305.shtml" style="background:#2478B5;">全国主会场</a></li>
		-->
		<li><a target="_blank" href="http://www.ncss.org.cn/wlzph/2017lxwjy/" style="background:#2478B5;">全国主会场</a></li>
		<li><a target="_blank" href="http://www.sxgxbys.com" style="background:#4A6A00 ;">陕西分会场</a></li>
	</ul>
	</div>
</div>
<div class="cont">
	<div class="list">
    	<h1>${jobfairInfo.job_fair_name }</h1>
    	<style>
    		.table.info_card tbody tr td{
    			line-height:2em;
    		}
    		.table.info_card tbody tr td{padding:0;text-align:left;}
    	</style>
        <table class="table info_card">
           <tbody>
              <tr>
                 <td colspan="2">举办单位：<a
								href="/jobfair/school.do?id=${jobfairInfo.school_id }"
								target="_blank">${jobfairInfo.school_name }</a></td>
                 <td colspan="2">举办时间：${jobfairInfo.job_fair_time } 至
								${jobfairInfo.job_fair_overtime } </td>
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
                 <td colspan="2">招聘会规模：企业 ${jobfairInfo.job_fair_company_num }家</td>
                 <td colspan="2">预定截止：${jobfairInfo.job_fair_endtime }</td>
              </tr>
              <tr>
                 <td colspan="2">招聘会特色：${jobfairInfo.job_fair_feature } </td>
                 <td colspan="2">招聘会层次：${jobfairInfo.job_fair_level } </td>
              </tr>
             
           </tbody>
        </table>
  
    </div>
    <div style="margin:20px 0 20px 10px">
        <a class="btn btn-warning  btn-large" onclick="ComApply('${jobfairInfo.job_fair_id }','${jobfairInfo.school_id }')" style="color:#fff;" href="javascript:;">企业订展</a>
        <a class="btn btn-success btn-large" target="_blank" style="margin-left:20px;color:#fff;" href="http://www.211zph.com/netcongress/start.do?id=${jobfairInfo.job_fair_id }">进入会场</a>
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
				<%
					String content=(String)jobfairInfo.get("job_fair_invitation");
					if( content==null ){
						content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id);
						out.println( content );
					}else{
						out.println( com.zhaopin.Help.textToHtml( content ) );
					}
 				%>
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
                               List companyList = (List)request.getAttribute("companyList") ;
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
								<div style="text-align:center;">${pagenation}</div>
							  <% if(  request.getParameter("page")!=null ) {%>
								<script type="text/javascript">
									$(function(){
										$(".companyList").trigger("click");
									});
								</script>
							  <% } %>
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
                                	  <img src="img/lxwjy-2017-1.jpg">
                                      <img src="img/lxwjy-2017-2.jpg">
                                      <img src="img/lxwjy-2017-3.jpg">
                                </div>
                            </div>

                       </div>
                       <div class="tab-pane fade" id="tab4">
                            <div class="tab">
                           		<div class="img" style="text-align:center; padding-top:20px;">
                                      <img src="img/lxwjy_20170720_1.png">
                                      <img src="img/lxwjy_20170720_2.png">
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
                                  <c:forEach var="jobfair" items="${jobfairList }">
                                  <tr>   
                                     <td>${jobfair.job_fair_time }</td>                       
                                     <td><a href="http://www.211zph.com/jobfair/detail.do?id=${jobfair.job_fair_id }" class="dianji" target="_blank">${jobfair.job_fair_name }</a></td>
                                     
                                  </tr>
                                  </c:forEach>
                                  
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