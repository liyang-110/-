<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
StudentSessionBean userInfo = (StudentSessionBean)User.getUser("student", session);
String head_logo = userInfo!=null?userInfo.getLogo():null;
%>
    	<div class="left">
        	<div class="left_top">
            	<div class="ren">
                	<div class="left_ren" style="float:none;margin:auto;">
                    	<img class="head_pic" src="<%=head_logo!=null?head_logo:"img/ren.png"%>" height="122" width="90" />
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="weixin" style="display:none;">
                    <ul>
                    	<!--  
                        <li><a href="#"><img src="img/shouji.png" /><br /><span class="yellow">未验证</span></a></li>
                        <li><a href="#"><img src="img/weixin.png" /><br /><span>已绑定</span></a></li>
						-->
                        <li><a href="#"><img src="img/xinfeng.png" /><br /><span class="yellow">未验证</span></a></li>
                        <li><a href="#"><img src="img/qq_a.png"/><br /><span>已绑定</span></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="left_midder">
            	<h1>基本信息</h1>
                <ul>
                	<li id="menu_1_1"><a href="/member/home.do">修改简历</a></li>
                    <li id="menu_1_2"><a href="jUploadResume.jsp" >上传简历</a></li>
                    <li><a href="preview_general.jsp"  target="_blank">简历预览</a></li>
                    <li id="menu_1_4"><a href="account_general.jsp" >账户管理</a></li>
                </ul>
                <h1>职位管理</h1>
                <ul>
                	<li id="menu_2_1"><a href="post_general.jsp" >搜索职位</a></li>
                    <li id="menu_2_2"><a href="record_general.jsp" >投递记录</a></li>
                </ul>
                <h1>招聘会管理</h1>
                <ul>
                    <li id="menu_3_1"><a href="search_general.jsp" >搜索招聘会</a></li>
                    <!-- 
                    <li id="menu_3_2"><a href="fair_general.jsp" >招聘会订阅</a></li>
                	-->
                </ul>
                <h1>通知管理</h1>
                <ul>
                	<!--
                    <li id="menu_4_1"><a href="urgency_general.jsp" >紧急通知</a></li>
                    -->
                    <li id="menu_4_2"><a href="interview_general.jsp" >面试通知</a></li>
                    <li id="menu_4_3"><a href="hire_general.jsp" >录用通知</a></li>
                </ul>
            </div>
            <div class="left_bottom">
            	<img src="img/images/wanshan_29.gif" />
                <p>211校招网官方微信</p>
            </div>
        </div>
        <!--left完成-->