<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="inc/checkLogin_c.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 企业会员中心首页</title>
<link rel="stylesheet" href="style/bootstrap.nav.css" type="text/css"></link>

<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="img2/core.css" />

<link type="text/css" rel="stylesheet" href="style/first_firm.css" />
<link href="/static/css/csshub-loading.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="/statics/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
<script type="text/javascript" src="../statics/artDialog/plugins/iframeTools.js" charset="utf-8"></script>
<script type="text/javascript">
	var cur_path="<%=request.getContextPath()%>";
	var allresume="${count.allresume}";
	var untreated="${count.untreated}";
</script>
<script type="text/javascript" src="js/front.js" charset="utf-8"></script>

<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=co" charset="utf-8"></script>

<script type="text/javascript" src="/js/flow.js" charset="utf-8"></script>
<script type="text/javascript" src="js/first_firm.js" charset="utf-8"></script>

<!--五星评价 -->
<link rel="stylesheet" type="text/css" href="/member/style/zzsc.css">
<script src="/member/js/jquery-pingjia.js" type="text/javascript" charset="utf-8"></script>
<script src="/member/js/zzsc.js" type="text/javascript" charset="utf-8"></script>
<!--五星评价end  --> 
</head>
<body>
<jsp:include page="inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
			<div class="right_top">
				<ul style="margin-top:15px;">
					<li>
                   		<div class="company_name">
                   		<img src="img2/icon_ccc.png" /><%=company_name==null?"":company_name %>
                   		</div>
					</li>
                   <%--
                   <li>
                   	<p>会员类型：<%=member_type_name %></p>
                   </li>
                   <!--
                   <li>
                   	<p>剩余点数：<%=cur_points%></p>
                   </li>
                   -->
                   <li>
                   	<p>会员截至：<%=end_date%></p>
                   </li>
                   --%>
                   <%-- <%
                   if("1".equals( user.getStatus() ) 
                		   ){
                   %>
 					<li>
                   	<div class="qiandao"><button class="qiandao_btn" onclick="sign();">签到</button></div>
					</li>
                   <%}%> --%>
                </ul>
                <div class="clear"></div>
            </div>
            <div style="text-align:center;padding:10px 10px 0 10px;">
            	<a href="/company/rencai.do">
            		<img src="/member/img2/free_resume_ad.png" />
            	</a>
            </div>
		<!--招聘顾问  -->
            <c:if test="${not empty jobfairCounselor.user_name }" >
            <div class="recruit_person">
            	<div class="person_head">
            		<img alt="" width="126" height="146" src="${ empty jobfairCounselor.head_path ? 'icon/kefu.png': jobfairCounselor.head_path }">
            	</div>
            	<div class="person_info">
            		<ul>
            			<li class="info-one">联系客服</li>
            			<li><img alt="" src="icon/info_01.png">专属客服  :  <span>${jobfairCounselor.user_name }</span></li>
            			<li><img alt="" src="icon/info_02.png">联系电话  :  <span>${jobfairCounselor.user_tel }</span></li>
            			<li><img alt="" src="icon/info_03.png">投诉电话  :  <span>13709267332</span></li>
            		</ul>
            	
            	</div>
            	<div class="person_appraise">
            		<div class="appraise_top">&nbsp;&nbsp;服务评价</div>
            		<div class="appraise_footer">
            			<div class="appraise_fs">
            				<div id="xzw_starSys">
							<div id="xzw_starBox">
								<p class="biaoti">服务态度：</p>
									<ul class="star" id="star1">
										<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
										<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
										<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
										<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
										<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
									</ul>
								<input type="hidden" id="star_num_1" name="in_star1" value="0"/>
								<div class="current-rating" id="showb1"></div>
							</div>
						<!-- <div class="description dc1"></div> -->
						</div>  
						<div id="xzw_starSys">
						<div id="xzw_starBox">
							<p class="biaoti">专业能力：</p>
								<ul class="star" id="star2">
									<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
									<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
									<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
									<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
									<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
								</ul>
							<input type="hidden" id="star_num_2" name="in_star2" value="0"/>
							<div class="current-rating" id="showb2"></div>
						</div>
						<!-- <div class="description dc2"></div> -->
						</div>
						<div id="xzw_starSys">
							<div id="xzw_starBox">
							<p class="biaoti">综合素质：</p>
								<ul class="star" id="star3">
									<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
									<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
									<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
									<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
									<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
								</ul>
								<input type="hidden" id="star_num_3" name="in_star3" value="0"/>
								<div class="current-rating" id="showb3"></div>
							</div>
							<!-- <div class="description dc3"></div> -->
						</div>
            			</div><!--appraise_fs  end  -->
            			<!--个人意见：  -->
            			<div class="appraise_ts">	
            				<textarea rows="6" id="introduce" cols="26" class="introduce" placeholder="个人意见：我们的服务还有那些需要改进的地方吗？请告诉我们，让我们更好地为您服务吧!"></textarea>
						</div>
						<!--提交评价  -->
            			<div class="appraise_tj" onclick="sendAppraise();"><div style="padding-top:26px;padding-left:4px;font-size: 14px;font-weight: bold;">提交评价</div></div>
            		</div>
            	</div>
            </div>
            </c:if>
            <div style="clear:both;"></div>
            
            <style>
            	.list_a h1 {width:854px; margin:auto;}
            	.list_a h1 a { float:right;margin-right:30px;color:#666;}
            	.list_a h1 a:hover {text-decoration:underline;}
            	.datagrid {width:854px;margin:0 auto;}
            	.datagrid td {
            		border-collapse:collapse;
            		border:1px solid #ccc;
            		padding:5px 10px;
            		text-align:center;
            		line-height:30px;
            	}
           		.datagrid td.time, .datagrid td.content {
           			vertical-align:top;
           			text-align:left;
           		}
           		.datagrid .content a {color:#666;}
           		.datagrid .content a:hover{text-decoration:underline;}
           	</style>
<!--right_top完成-->
            <div class="list_a">
            	<h1>预订成功招聘会
            		<a href="/jobfair/search.do?type=search_jobfair" target="_blank">查看全部</a>
            	</h1>
					<table class="datagrid" width="750" border="0" cellpadding="0"
						cellspacing="0">
						<tr style="background:#CCC;font-size:16px;">
							<td>日期</td>
							<td>招聘会名称</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
						<c:if test="${empty lastestJobfair }">
							<tr>
								<td colspan="4">暂无数据!</td>
							</tr>
						</c:if>
						<c:forEach var="r" items="${lastestJobfair }">
							<tr class="${r.begin eq 1?'begin':'' }">
								<td class="time nowrap">
									<c:if test="${r.begin eq 1}">
										#正在进行#
									</c:if>
									<c:if test="${r.begin eq 0}">
										${r.job_fair_time }
									</c:if>
								</td>
								<td class="content">
						<c:if test="${not empty r.job_fair_name }">
							<c:if test="${r.begin eq 1}">
 								<div style="width:40px;height: 0px;">
  									<div class="csshub-loading">
    									<div></div><div></div><div></div><div></div><div></div>
  									</div>
  								</div>
  							</c:if>
										<a class="${r.begin eq 1?'zphname':'' }" title="${r.job_fair_name }"
											href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank">${r.job_fair_name }</a>
									</c:if>
								<td class="nowrap"><c:choose>
										<c:when test="${r.applied eq 1 }">
                    		预订待审
                    		</td>
								<td class="nowrap"><a title="${r.job_fair_name }"
									href="javascript:;" target="_blank" class="btn btn-error">等待审核</a>
									</c:when> <c:when test="${r.invited eq 1 }">
                    		邀请待审
                    		</td>
								<td><a href="/member/audit_firm.jsp" class="btn-success">审核邀请</a>
									</c:when> <c:when test="${r.attend eq 1 }">
                    		预订成功
                    		</td>
								<td class="nowrap">
									<c:if
										test="${r.job_fair_type eq 'netcongress' }">
										<a href="/netcongress/start.do?id=${r.job_fair_id }"
											target="_blank" class="btn btn-success ${r.begin eq 1?'jrhc':'' }">进入会场</a>
									</c:if> 
									<c:if test="${r.job_fair_type eq 'multiple' }">
										<a title="${r.job_fair_name }"
											href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank"
											class="btn btn-success">查看详情</a>
									</c:if> </c:when> <c:otherwise>
                    		未预订
                    		</td>
								<td class="nowrap"><a href="javascript:;"
									onclick="ComApply('${r.job_fair_id}')"
									class="btn btn-warning btn-small ${r.begin eq 1?'jrhc':'' }">企业订展</a> </c:otherwise> </c:choose></td>

							</tr>
						</c:forEach>
					</table>
				</div>
            <div class="list_a">
            	<h1>精品招聘会推荐
            		<a href="/jobfair/search.do?type=search_jobfair" target="_blank">查看全部</a>
            	</h1>
               <table class="datagrid" width="750" border="0" cellpadding="0" cellspacing="0">
                  <tr style="background:#CCC;font-size:16px;">
                    <td>日期</td>                                               
                    <td>招聘会名称</td>
                    <td>操作</td>
                  </tr>
                   <c:if test="${empty goodJobfair }">
                  <tr>
                  	<td colspan="3">暂无数据!</td>
                  </tr>
                  </c:if>
				  <c:forEach var="r" items="${goodJobfair }">
                  <tr>                           
                    <td class="time">${r.job_fair_time }</td>
                    <td class="content">
                    <c:if test="${not empty r.job_fair_name }">
                        	<a title="${r.job_fair_name }" href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank">${r.job_fair_name }</a>
                    </c:if>
                    </td>
                    <td class="caozuo"><a href="javascript:;" onclick="ComApply('${r.job_fair_id}')" class="btn btn-warning btn-small">企业订展</a></td>
                  </tr>
                  </c:forEach>
                </table>
            </div>
            <!--list_a完成-->
            <div class="list_a">
            	<h1>收到简历
            		<a href="/member/receive_firm.jsp">查看全部</a>
            	</h1>
               <table  class="datagrid"  width="750" border="0" cellpadding="0" cellspacing="0">
                  <tr style="background:#CCC; height:30px; font-size:16px;">
                        <td>投递日期</td>
                        <td>姓名</td>
                        <td>学校</td>
                        <td>专业</td>
                        <td>投递岗位</td>
                  </tr>
                   <c:if test="${empty resumes }">
                  <tr>
                  	<td colspan="6">暂无数据</td>
                  </tr>
                  </c:if>
				  <c:forEach var="r" items="${resumes }">
                  <tr>                           
   						<td class="nowrap time">${r.add_time }</td>
	                  	<td class="content nowrap ">
	                  	<c:choose>
							<c:when test = "${r.paid!=0 or r.indate==1 }">
								<a onclick="open_resume('/company/resumeDetail.do?oid=${r.order_id}')" href="javascript:;" target="_blank">${r.name }</a>
							</c:when>
							<c:otherwise>
								<button onclick="openMemberTip()" style="color:red;">开通会员</button>';
							</c:otherwise>
	                  	</c:choose>
	                  	</td>
	                  	<td class="nowrap">${r.school_name }</td>
	                  	<td>${r.profession }</td>
	                  	<td>
	                  	<%-- <c:if test="${not empty r.job_fair_name }">
	                  		<a href="/jobfairInfo.do?id=${r.job_fair_id }" target="_blank">${r.job_fair_name }</a>
	                  	</c:if>
	                  	<c:if test="${empty r.job_fair_name }"> --%>
	                  		${r.job_name }
	                  	<%-- </c:if> --%>
	                  	</td>
                  </tr>
                  </c:forEach>
                </table>
            </div>
            <!--list_a完成-->
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer_c.jsp" flush="true" />
<!--footer完成-->
</body>
</html>
