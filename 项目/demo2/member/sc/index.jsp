<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="include/checkLogin.jsp" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>高校会员中心</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/artDialog.notice.js?r=sc" charset="utf-8"></script>

<script type="text/javascript" src="js/audit.js" charset="utf-8"></script>
</head>
<body>
<div id="dlg_audit" style="display:none;">
 		<form>
 		<textarea name="content" cols="50" rows="5" style="width:320px;"></textarea>
 		<br/>
 		(不同意,请输入原因 )
 		</form>
</div>

<jsp:include page="include/head.jsp" flush="true"/>
<!--menu完成-->
<div class="hy">
	<p>当前位置：首页 &gt; <a href="/member/sc/home.do" style="color:#5a9707;">会员中心</a> </p>
</div>
<!--当前位置-->
<div class="header_main">
	<div class="clearfix">
        <div class="pull-left">
            <div class="pull_left">
                <!--折叠-->
                <jsp:include page="include/menu.jsp" flush="true"/>
            </div>
        </div>
    	<!--pull-left结束-->
        <div class="pull-right">
            <div class="pull_right">
                <div class="list">
                    <ul class="list-inline" style="margin-right:-15px;">
                      <li>
                        <div class="list_top">
                        	<a href="issue_network.jsp" style="display:block;">
                            <img src="img/diannao.png">
                            </a>
                        </div>
                        <div class="list_bottom"><a href="issue_network.jsp">发布网络招聘会</a></div>
                      </li>
                      <li>
                        <div class="list_top">
                        	<a href="issue_school.jsp" style="display:block;">
                            <img src="img/mao.png">
                            </a>
                        </div>
                        <div class="list_bottom"><a href="issue_school.jsp">发布校园招聘会</a></div>
                      </li>
                      <li>
                        <div class="list_top">
                        	<a href="audit.jsp" style="display:block;">
                            <img src="img/xing.png">
                            </a>
                        </div>
                        <div class="list_bottom"><a href="audit.jsp">审核企业申请</a><span style="color:#F00;display:none;">（123）</span></div>
                      </li>
                      <li>
                        <div class="list_top">
                        	<a href="system.jsp" style="display:block;">
                            <img src="img/laba.png">
                            </a>
                        </div>
                        <div class="list_bottom"><a href="system.jsp">系统消息</a><span style="color:#F00;display:none;">（123）</span></div>
                      </li>
                    </ul>
                
                </div>
                <!-- -->
                <div class="biankuang">
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">审核企业申请</span>
                        </div>
                        <div class="pull-right">
                         	<a href="audit.jsp">更多&gt;&gt;</a>
                        </div>
                    </div>
                   	<div class="tal" style="padding-top:0;">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">	                                       	     				
                                 <th>序号</th>
                                 <th>申请时间</th>
                                 <th>企业名称</th> 
                                 <th>审核状态</th>                          	 	                               
                              </tr>
                           </thead>
                           <tbody>
                           	<c:set var="data" value="${requestScope.undofile}" />
					  	   	<c:forEach var="r" items="${data }">
                              <tr>                                                              
                                 <td>${r.rn }</td>
                                 <td>${r.add_time }</td>
                                 <td>
                                 
                                 <c:if test="${r.company_pic != 'no' }">
                                 <a title="组织机构代码证" href="jImage.jsp?file_id=${r.company_pic}" target="_blank"><span class="green">[代]</span></a>
                                 </c:if>
                                 <c:if test="${r.company_img != 'no' }">
								<a title="营业执照" href="jImage.jsp?file_id=${r.company_img}" target="_blank"><span class="red">[执]</span></a>
                                 </c:if>
                                 
                                 <a href="/company/info.do?id=${r.apply_personid }" target="_blank" class="dianji">${r.apply_person }</a>
                                 </td>
                                 <td>
                                 <c:choose>
                                 	<c:when test="${r.status == '未审核' }">
                                 	<button onClick="audit('${r.processid}','apply','0','${r.last_company_num }','${r.permit}','${r.apply_person } 申请  ${r.job_fair_name }');" 
                                 			type="button" class="btn btn-default green">
                                 	审核
                                 	</button>

                                 	</c:when>
                                 	<c:otherwise>
                                 	<span>${r.status }</span>
                                 	</c:otherwise>
                                 </c:choose>
                                 
                                 </td> 
                              
                              </tr>
                            </c:forEach>
                           
                           </tbody>
                        </table>
                    </div>
                </div>
            	<!-- -->
            	<div style="height:10px;"></div>
            	<div class="biankuang">
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">系统消息</span>
                        </div>
                        <div class="pull-right">
                         	<a href="system.jsp">更多&gt;&gt;</a>
                        </div>
                    </div>
                    <!----------------------------标题------------------------------------->
                     <div class="tal">
                    	<table class="table">
                           <thead>	       	                 	                                         	
                              <tr class="active">
                              	 <th class="time_a">序号</th>		 
                                 <th class="time_a">时间</th> 
                                 <th class="time_a">企业名称</th>
                                 <th class="time_a">招聘会名称</th>
                                 <th class="time_a">反馈内容</th>                        	 	                               
                              </tr>
                           </thead>
                           <tbody>
                           <c:set var="data" value="${requestScope.message}" />
					  	   <c:forEach var="r" items="${data }">
                              <tr> 
                                 <td class="time_a">${r.rn }</td>
                                 <td class="time_a">${r.add_time }</td>    
                                 <td class="companyflow">${r.company_name}</td>    
                                 <td class="jobfairflow">
									<c:if test="${r.job_fair_name!='no' }">
										<a title="${r.job_fair_name}" href="/jobfairInfo.do?id=${r.job_fair_id}" target="_blank">${r.job_fair_name}</a>
									</c:if>
								</td>
								<td class="companyflow">${r.message_content }</td>  
                              </tr>
                            </c:forEach>
                          
                           </tbody>
                        </table>
                    </div>
                </div>
           
            </div>
            <!--pull-right结束-->
        </div>
	</div>	
</div>
<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
