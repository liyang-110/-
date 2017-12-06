<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<%
	String path = request.getContextPath()+"/member/";
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	StudentSessionBean userInfo = (StudentSessionBean)User.getUser("student", session);
	String head_logo = userInfo!=null?"/upload/headpic/"+userInfo.getLogo():null;
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。" />
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。" />
<meta name="author" content="">
<title>个人中心</title>
 	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var student_id="${student.student_id}";
	</script>
	
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/s_resume.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/validatebox.css" rel="stylesheet" type="text/css"></link>
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/js/jquery.easyui.min.js" rel="stylesheet"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	
	<script src="/js/school_data_js_array.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/getprovince211.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/getposition.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/layer/jobjss.js" type="text/javascript" charset="utf-8"></script>
	
	<script src="/static/js/s_resumet.js" type="text/javascript" charset="utf-8"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	
	<link rel="stylesheet" href="/static/Huploadify/Huploadify.css" type="text/css"></link>
	<script type="text/javascript" src="/static/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/Huploadify/autouploadfile-headpic.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/js/progresst.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		Huploadify_file('card_img_upload_btn', '' ,"in_card_img","card_img_name","img","student",function(d){
			var temp = d.split("|");
			var path = temp[2];
			$("#in_card_img_path").val( path );
			$(".head_pic").attr("src","/upload/headpic/"+path );
		});
	});
	</script>

<script type="text/javascript">
             	$(function(){
             		$(".auto-height").each(function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=30;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("propertychange",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("change",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").on("click",function(){
             			var height=$(this)[0].scrollHeight;
             			$(this).css( {height:height} );
             		});
             	});
             </script>
<style type="text/css">
.main_l_margin{
	margin-left:324px;}
.uploadify-button {
	margin: 0;
	background: #efefef;
	color: #9e9e9e;
	text-decoration: none;
	border: 1px solid #ddd;
}

.cus-edui-sec {
	margin: 5px;
	padding: 5px;
}

ul {
	list-style: none;
	padding: 0px;
}

body {
	
}

.sub_nav {
	height: 30px;
	mix-width: 1024px;
	background: #505050;
	color: #FFF;
}

.sub_nav_ul {
	float: right;
	font-family: "微软雅黑";
	font-size: 14px;
	font-weight: bold;
}
.sub_nav_ul li{
	float: left;
	line-height: 30px;
	margin-right:5px;
    			
			}
.sub_nav_ul li a{
	color: #fff;
	margin-left: 8px;
	margin-right:5px;
}
.top_nav {
	min-width: 1024px;
	background: #fff;
	height: 60px;
	font-family: "微软雅黑";
	font-size: 18px;
	box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1)
}

.nav_inner {
	width: 1024px;
	margin: 0 auto;
}

.top_nav .nav_inner .logo {
	margin: 10px;
}

.top_nav .nav_inner div {
	float: left;
}

.top_nav .main_nav ul {
	float: right;
	font-weight: bold;
	margin-bottom: 0px;
}

.main_nav ul {
	margin-left: 50px;
}

.top_nav .main_nav li {
	float: left;
	margin-left: 10px;
	line-height: 60px;
	color: #d0d0d0;
	list-style-type: none;
}

.top_nav a.switch {
	display: block;
}

.top_nav .province {
	color: #333;
	line-height: 60px;
	width: 100px;
}

.top_nav a.switch i.arrow {
	display: inline-block;
	width: 0;
	height: 0;
	border-left: 5px solid #fff;
	border-right: 5px solid #fff;
	border-top: 10px solid #e03919;
}
</style>

</head>
<body>
<!--头部架构开始-->
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
    <div class="main_r">
    	<div>
		<!-- <a class="main_r_down" href="/student/stuPreview.do"><i class="fa fa-download" ></i>下载简历到本地</a> -->
<%-- 		<p style="float:left;">简历完整度 : </p><div class="pro" style="float:left;margin: 5px;"></div><span> ${percents }%</span>
 --%>    	<script>
        window.onload = function(){
            var pro = new progress({
                width : 150,//进度条宽度
                height: 10,//进度条高度
                bgColor : "#fff",//背景颜色
                proColor : "#02c084",//前景颜色
                fontColor : "#fff",//显示字体颜色
                val : 0,//默认值
                text:"",//进度条显示文字信息
                showPresent : true
            });
            document.getElementsByClassName('pro')[0].appendChild(pro.getBody());
            setTimeout(function(){
                pro.update(${percents});
                if(${percents}==100){
                	$(".proPre").css("border-radius","20px");
                }
                
            });
        };
    </script>
    
    	</div>
        <div class="main_r_nav">
        	<dl>
        		 <dd style="height:70px; padding: 20px 0 0 20px;"><p style="float:left;">简历完整度 : </p><div class="pro" style="float:left;margin: 5px;"></div><span> ${percents }%</span></dd>
                 <dd><a class="baceinfo" href="#details_info" style="border-top:1px solid #efefef; border-right:4px solid #02c08e;"> <i class="fa fa-bookmark-o"></i>    基本信息<br></a></dd>
                 <dd><a class="educations" href="#details_info"><i class="fa fa-folder-open-o"></i>    教育经历</a></dd>
                 <dd><a class="expect" href="#details_edu"><i class="fa fa-heart-o"></i>    期望职业</a></dd>
                 <dd><a class="work_exprience" href="#details_hope"><i class="fa  fa-paperclip"></i>    工作经历</a></dd>
                <!--  <dd><a class="review" href="#details_review"><i class="fa fa-comment-o"></i>    自我评价</a></dd>  -->           
                 <dd><a  class="return" href="/student/sCenter.do" style="margin-top:20px; border-top:1px solid #efefef; line-height:40px;"><i class="fa fa-undo"></i>返回个人中心</a></dd>
         	</dl>
     	</div>
	</div><!--mian_r  end  -->
	<div class="main_l">
			<div class="main_l_top">
				<ul>
					<li style="border-left: none;"><a href="javascript:;" onclick="upload_resume()"; style="color:#02c08e;">上传本地简历</a></li>
					<li>下载简历</li>
					<li><input type="radio" id="open_switch_btn" style="color:#02c08e;position: absolute;margin: 30px 0 0 -15px;">隐藏简历
					</li>
					<li><a href="javascript:void(0);" onclick="window.location.reload();" style="color:#02c08e;">刷新简历</li>
				</ul>
			</div>
			<div style="clear:both"></div>
			<dl class="details">
<!--基本信息  ------------------------------>
        	<div class="details_info" id="details_info">     
           		<div id="baseinfo">
           			<div class="bj" style="position: absolute;margin: 15px 0 0 640px;">
						<a href="javascript:;" id="stu_info_form_btn"
								onclick="edit_stu_info(true)">[编辑]</a> 
						<a href="javascript:;" id="stu_info_card_btn" style="display:none;"
								onclick="edit_stu_info(false)">[取消]</a>
					</div>
						<div class="mr_top_bg">
    					<img id="userpic" class="head_pic" src="<%=head_logo!=null?head_logo:"/static/images/personal_center/user.png"%>" alt="默认头像" width="120" height="120" class="mr_headimg" >       
        				<div id="card_img_upload_btn" style="line-height:1em; text-align:center; margin-top:5px;"></div>
					</div>
   
					<div class="summary">
						<h2>${student.name}</h2>
						${student.sex}<span class="ver-line">|</span>${student.age}岁<span class="ver-line">|</span>
						<c:choose>
						<c:when test="${student.work_date le 0}">										
							<c:out value="工作经验：不足1年"/>	
						</c:when>
						<c:otherwise>
							<c:out value="工作经验：${student.work_date}年"/>	
						</c:otherwise>
						</c:choose></br>到岗时间 : ${student.work_status }</br>户籍 : ${student.home_areas}<span class="ver-line">|</span>现居 : ${student.areas}<br>
						电话 : ${student.contact_tel }</br>
						Q Q : ${student.bind_qq}</br>
						邮箱 : ${student.contact_email }
					</div>
					<div style="clear:both"></div>
				</div>
				<!--基本信息编辑-------------------->       	
        		<form id="stu_info_form"  name="stu_info_form" style="display:none;padding:20px 0 10px 0;" method="post" action="/member/ajaxForm.do" onsubmit="return false;">
            	<input name="methodId" value="ajax_form" type="hidden"/>
                <input name="in_buss_id" value="stu_info" type="hidden" />
                <input name="in_r" value="su" type="hidden" />
                
            	<dd><p><span>*</span>姓名  :</p>
            		<input class="text easyui-validatebox" data-options="required:true,validType:'isBlank',missingMessage:'请输入姓名' "
                        value="${student.name}" type="text"  name="in_name"/><div style="clear:both"></div></dd>  
                <dd><p><span>*</span>性别  :</p><div>
                	<label class="radio inline" style="margin-left:20px;display:inline-block;float: left;margin-top:0px;">
                		<input class="radio" type="radio"  name="in_sex" ${student.sex=="男"?"checked":""} value="男" style="vertical-align:text-bottom;margin-top:-2px;">
                                                   男</label>
                	<label class="radio inline" style="margin-left:40px;display:inline-block;float: left;margin-top: 0px;">
                		<input class="radio" type="radio"  name="in_sex" ${student.sex=="女"?"checked":""} value="女" style="vertical-align:text-bottom;margin-top:-2px;">
                                                  女</label>
                	</div><div style="clear:both"></div></dd>
                <dd><p><span>*</span>出生年月  :</p>
                	<select name="in_birth_year" style="width:80px;">
									<option value="">--年--</option>
									<c:forEach var="year" items="${birthYearList}">
									<c:choose>
										<c:when test="${student.birth_year eq year}">
											<option value="${year}" selected="selected">
											<c:out value="${year}"/>
											</option>		
										</c:when>
										<c:otherwise>
											<option value="${year}">
											<c:out value="${year}"/>
											</option>		
										</c:otherwise>
									</c:choose>
									</c:forEach>
							</select>
                            <div class="zhi">-</div>
							<select name="in_birth_month" style="margin-left:0px;width:80px;">
									<option value="">--月--</option>
									<c:forEach begin="1" end="12" step="1" var="i">
									<c:choose>
										<c:when test="${student.birth_month eq i}">
											<option value="${i}" selected="selected">
											<c:out value="${i}"/>
											</option>		
										</c:when>
										<c:otherwise>
											<option value="${i}">
											<c:out value="${i}"/>
											</option>		
										</c:otherwise>
									</c:choose>
									 </c:forEach>
					</select>
                	<div style="clear:both"></div>
                </dd>
                <dd><p><span>*</span>户籍所在地  :</p>
                	<input class="text easyui-validatebox" data-options="required:true,missingMessage:'请选择户籍所在地' "  value="${student.home_areas}" name="home_areas" type="text" onclick="JumpSearchLayer(6,'stu_info_form','in_home_area','home_areas',1);" id="home_areas" />
					<input type="hidden" name="in_home_area" id="in_home_area" value="${student.home_area}" />
             		<div style="clear:both"></div></dd>
                <dd><p><span>*</span>现居地址  :</p>
                	<select name="in_area_id" class="validate-combobox" data-options="required:true">
                                <option value="">--请选择--</option>
									<c:forEach var="p" items="${provionceList}">
									<c:choose>
										<c:when test="${student.area_id eq p[0] }">
											<option value="${p[0]}" selected="selected">
											<c:out value="${p[1]}"  />
											</option>		
										</c:when>
										<c:otherwise>
											<option value="${p[0]}" >
											<c:out value="${p[1]}"  />
											</option>		
										</c:otherwise>
									</c:choose>
									</c:forEach>
							</select><div style="clear:both"></div></dd>
                <dd><p><span>*</span>选择学校  :</p>
                	<input type="hidden" name="in_school_id" id="in_school_id" value="${student.school_id }" />
					<input class="text easyui-validatebox" name="in_college" id="in_college" value="${student.school_name }" onclick="pop();" onfocus="pop();" readonly="readonly"  />
					<div id="choose-box-wrapper">
			  			<div id="choose-box">
						<div id="choose-box-title">
							<span>选择学校</span>
						</div>
						<div id="choose-a-province"></div>
						<div id="choose-a-school"></div>
						<div id="choose-box-bottom">
							<a class="input-school-name-btn" href="javascript:$('.input-school-name-btn').hide();$('.input-school-name').show();" style="text-decoration:underline;float:left;margin-top:10px;margin-left:20px;color:#636363;">
								找不到，点击这里输入
							</a>
							<input type="text"  placeholder="请输入学校名称" name="new_school_name" class="input-school-name" style="display:none;float:left;height:25px;padding:2px 3px;background:#FFF;color:#333;width:200px;line-height:20px;border-radius:0px;border:1px solid #333;" />
							<input type="button" onclick="inputSchoolName()" class="input-school-name" style="display:none;float:left;" value="确定"/>
							<input type="botton" onclick="hide()" value="关闭" />
						</div>
			  			</div>
					</div>
                	<div style="clear:both"></div></dd>
                <dd><p><span>*</span>专业  :</p>
                	<input class="text easyui-validatebox" value="${student.profession}" type="text"  data-options="required:true,validType:'isBlank',missingMessage:'请输入专业' " name="in_profession"/>
                <div style="clear:both"></div></dd>
                <dd><p><span>*</span>最高学历  :</p>
                	<select  name="in_education">
									<option value="">--请选择--</option>
									<c:forEach var="p" items="${educationList}">
									<c:choose>
										<c:when test="${student.education eq p[0] }">
											<option value="${p[0]}" selected="selected">
											<c:out value="${p[1]}"  />
											</option>		
										</c:when>
										<c:otherwise>
											<option value="${p[0]}" >
											<c:out value="${p[1]}"  />
											</option>		
										</c:otherwise>
									</c:choose>
									</c:forEach>
							</select><div style="clear:both"></div></dd>   
                <dd><p><span>*</span>毕业年份  :</p>
                	<select name="in_grad_year">
									<option value="-1">--年--</option>
									<c:forEach var="year" items="${gradYearList}">
									<c:choose>
										<c:when test="${student.grad_year eq year}">
											<option value="${year}" selected="selected">
											<c:out value="${year}年"/>
											</option>		
										</c:when>
										<c:otherwise>
											<option value="${year}">
											<c:out value="${year}年"/>
											</option>		
										</c:otherwise>
									</c:choose>
									</c:forEach>
							</select><div style="clear:both"></div></dd>    
                <dd><p><span>*</span>到岗时间  :</p>
                	<select  name="in_work_status" style="width:120px;">
								<option value="可立即上岗"  ${student.work_status eq "可立即上岗"?"selected":""}>可立即上岗</option>
								<option value="一周内上岗" ${student.work_status eq "一周内上岗"?"selected":""}>一周内上岗</option>
								<option value="二周内上岗" ${student.work_status eq "二周内上岗"?"selected":""}>二周内上岗</option>
								<option value="一月内上岗" ${student.work_status eq "一月内上岗"?"selected":""}>一月内上岗</option>
								<option value="已入职" ${student.work_status eq "已入职"?"selected":""}>已入职</option>
				    </select><div style="clear:both"></div></dd>             
                <dd><p><span>*</span>手机  :</p>
                	<input name="in_contact_tel" value="${contact.contact_tel }" type="text" class="text easyui-numberbox" data-options="required:true,missingMessage:'请输入手机号' "   /><div style="clear:both"></div></dd>
                <dd><p><span>*</span>QQ  :</p>
                	<input name="in_bind_qq"  value="${contact.bind_qq}" type="text" class="text easyui-numberbox" data-options="required:true,missingMessage:'请输入QQ号码' "   /><div style="clear:both"></div></dd>
                <dd><p><span>*</span>邮箱  :</p>
                	<input name="in_contact_email" value="${contact.contact_email }"  type="text" class="text easyui-validatebox" data-options="required:true,validType: 'email',invalidMessage:'请输入正确的邮箱地址',missingMessage:'请输入邮箱' "/><div style="clear:both"></div></dd>            
                <dd>
                	<input style="background: #e03919;" type="button" class="confirm form_submit" value="确定">
              		<input style="background: #6E5C52;" type="button" class="cansal" value="取消" onclick="edit_stu_info(false)">
                	<div style="clear:both"></div></dd>             
        		</form>    
			</div>	
<!--教育经历 ------------------------------->
			<div class="details_edu" id="details_edu">
				<div id="educations">
					<dt>
 						<span class="biaoti bt">教育经历</span>
  						<span class="bianji"><i class="fa fa-plus" aria-hidden="true" style="color:#02c08e;"></i>&nbsp;&nbsp;
  						<a href="javascript:;" id="stu_edu_form_add_btn" onclick="Education.add();">[添加]</a>
  						<a href="javascript:;"  style="display:none;" id="stu_edu_form_close_btn"  onclick="Education.close();">[取消]</a></span>
 					</dt>
		
					<div class="preview_edu">
        				<div class="edu_two"></div>
        				<div style="clear:both"></div>
					</div>
					<div style="clear:both"></div> 
			
			
				</div>
				<!--教育编辑  ------------->
				<form class="stu_edu_form"  style="display:none;padding-bottom:30px;" method="post" action="/member/ajaxForm.do?in_r=su&methodId=student_edu&in_student_id=${student.student_id}" onsubmit="return false;">
     				<input type="hidden" value="add" name="in_action" />
     				<input type="hidden" value="" name="in_edu_id" />
            		<dd><p><span>*</span>毕业院校</p>
            			<input class="text easyui-validatebox" data-options="required:true,validType:'isBlank',missingMessage:'请输入学校或培训机构名称'" type="text" name="in_school_name" id="in_school_name" value="" />
            			<div style="clear:both"></div>
            		</dd>
            		<dd><p><span>*</span>所学专业</p>
            			<input  class="text easyui-validatebox" data-options="required:true,validType:'isBlank',missingMessage:'请输入专业名称'" type="text" name="in_profession" id="in_profession" value="" />
            			<div style="clear:both"></div>
            		</dd>
            		<dd><p><span>*</span>时间</p>
                  		<input onClick="WdatePicker()"  name="in_begin_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;" readonly/>
             	  		<div class="zhi" style="margin-left:5px;">至</div>
                  		<input onClick="WdatePicker()"  name="in_end_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;margin-left:5px;" readonly/>
                  		<div style="clear:both"></div>
					</dd>                 	
                	<dd><p>学历</p>
                  		<select class="text" name="in_education" id="in_education">
							<option value="">--请选择--</option>
							<c:forEach var="p" items="${educationList}">
								<c:choose>
									<c:when test="${student.education eq p[0] }">
										<option value="${p[0]}" selected="selected">
											<c:out value="${p[1]}" />
										</option>		
									</c:when>
									<c:otherwise>
										<option value="${p[0]}" >
											<c:out value="${p[1]}"  />
										</option>		
									</c:otherwise>
								</c:choose>
							</c:forEach>
     					</select>
                    	<div style="clear:both"></div>
                	</dd>
                	<dd>
            			<input class="confirm" type="button" onclick="Education.save();" value="确定">
            			<input class="cansal"  type="button" onclick="Education.close();" value="取消">
						<div style="clear:both"></div>    
            		</dd> 
        		</form>            
			</div>	
<!--自我评价  --------------------------->
			<div class="details_review" id="details_review">
				<div id="review">
					<dt>
 						<span class="biaoti">自我评价</span>
  						<span class="bianji"><i class="fa fa-pencil-square-o" style="color:#02c08e;"></i>&nbsp;&nbsp;
  						<a href="javascript:;" id="stu_review_form_btn" onclick="Review.edit(true);">[编辑]</a>
						<a href="javascript:;" id="stu_review_card_btn" style="display:none;" onclick="Review.edit(false);">[取消]</a></span>
 					</dt>
 					<%-- <dd class="stu_review" style="margin-left:195px;text-align:left;width:430px;">${student.introduce}</dd> --%>
 					<textarea class="stu_review auto-height" style="border:none;float:left; margin-left:20px;font-size:14px;color:#999;" readonly="readonly" name="in_introduce" cols="80" rows="2">${student.introduce}</textarea>	
 					<div style="clear:both"></div>
 				</div>
 				<!--综合评述编辑  --------------->
 				
        		<form id="stu_review_form" name="stu_review_form" style="display:none;padding-bottom: 20px;" method="post" action="/member/ajaxForm.do">
         		<input name="methodId" value="ajax_form" type="hidden">
            	<input name="in_buss_id" value="stu_review" type="hidden">
            	<input name="in_r" value="su" type="hidden">
        		<dd>
        			<textarea class="miaoshu auto-height " name="in_introduce"  cols="80" rows="4" style="border-radius:5px; border:1px #666666 solid;float:left;margin-left:20px;padding-left:10px;margin-top:23px;"
                        	onkeydown="checkMaxInput(this,500)"  
				            onkeyup="checkMaxInput(this,500)" 
				            onfocus="checkMaxInput(this,500)" 
				            onblur="checkMaxInput(this,500);resetMaxmsg()">${student.introduce}
				            </textarea>
				    <div style="clear:both"></div>
				</dd>
        		<dd>
					<input class="confirm" type="button" onclick="Review.save();" value="确定">				
					<input class="cansal" type="button" onclick="Review.cancel();" value="取消">
					<div style="clear:both"></div>    
        		</dd>
        	</form>
			</div><!--综合评述end  --> 
<!--期望职业  ------------------------------>
	       	<div class="details_hope" id="details_hope">
	        	<div id="work_exprience">
 					<dt>
 						<span class="biaoti bt">求职意向</span>
 						<span class="bianji"><i class="fa fa-pencil-square-o" style="color:#02c08e;"></i>&nbsp;&nbsp;
 						<a href="javascript:;" id="stu_hope_position_form_btn" onclick="Position.edit(true);">[编辑]</a>
						<a href="javascript:;" id="stu_hope_position_card_btn" style="display:none;" onclick="Position.edit(false);">[取消]</a></span>
 					</dt>
 
 					<dd class="preview_hope" >
 						<ul style="padding-left:215px;">
 						<li><span class="biaoti">工作性质 : </span><span>${position.hope_type}</span></li>
 						<li><span class="biaoti">工作地区 : </span><span>${position.hope_areas} </span></li>
						<li><span class="biaoti">岗位名称 : </span><span>${position.hope_positions}</span></li>
						<li><span class="biaoti">期望薪资 : </span><span>${position.hope_salary}&nbsp;元/月</span></li>
 						<li><span class="biaoti">行业类别 : </span><span>${position.hope_industrys}</span></li>
 						</ul>
	 				</dd>
				</div>
				<!--期望职业编辑  --------------->
        		<form id="stu_hope_position_form" name="stu_hope_position_form" style="display:none;" method="post" action="/member/ajaxForm.do">
         		<input name="methodId" value="ajax_form" type="hidden">
            	<input name="in_buss_id" value="stu_hope_position" type="hidden">
            	<input name="in_r" value="su" type="hidden">
         		<dd><p><span>*</span>工作性质</p>
         		<div>
                	<label class="radio inline" style="margin-left:20px;display:inline-block;float: left;margin-top:0px;">
                		<input class="radio" type="radio"  name="in_hope_type" ${position.hope_type eq "全职"?"checked":""} value="全职" style="vertical-align:text-bottom;margin-top:-2px;margin-left:35px;">
                                                   全职</label>
                	<label class="radio inline" style="margin-left:40px;display:inline-block;float: left;margin-top: 0px;">
                		<input class="radio" type="radio"  name="in_hope_type" ${position.hope_type eq "兼职"?"checked":""} value="兼职" style="vertical-align:text-bottom;margin-top:-2px;margin-left:35px;">
                                                  兼职</label>
                    <label class="radio inline" style="margin-left:40px;display:inline-block;float: left;margin-top: 0px;">
                		<input class="radio" type="radio"  name="in_hope_type" ${position.hope_type eq "实习"?"checked":""} value="实习" style="vertical-align:text-bottom;margin-top:-2px;margin-left:45px;">
                                                 实习生</label>                              
                	</div>
           	 		<%-- 全职<input name=""  type="radio" value="" /><br/>               
                                                  兼职<input name="in_hope_type" type="radio" value="" /><br/>               
                                                  实习生<input name="in_hope_type" style="margin-left:230px;"  type="radio" value="" /> --%>
            		<div style="clear:both"></div>
            	</dd>
            	<dd><p><span>*</span>工作地区</p>
            		<input name="hope_areas" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入期望工作地区,可选三个!' " onclick="JumpSearchLayer(2,'stu_hope_position_form','in_hope_area','hope_areas',3);" id="hope_areas" value="${position.hope_areas}"  size="30" readonly style="width:227px;"/>
					<input type="hidden" name="in_hope_area" id="in_hope_area"  value="${position.hope_area}" />            
            		<div style="clear:both"></div>
            	</dd>
            	<dd><p><span>*</span>行业类别</p>
            		<select  class="text"  name="in_hope_industry" style="width:227px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
						<option value="">--请选择--</option>
							<c:forEach var="p" items="${industryList}">
								<c:choose>
									<c:when test="${position.hope_industry eq p[0] }">
										<option value="${p[0]}" selected="selected">
											<c:out value="${p[1]}"  />
										</option>		
									</c:when>
									<c:otherwise>
										<option value="${p[0]}" >
											<c:out value="${p[1]}"  />
										</option>		
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
					<div style="clear:both"></div>
				</dd>
            	<dd><p><span>*</span>职位名称</p>
 					<input class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入岗位名称!' " name="hope_positions" id="hope_positions" type="text" readonly size="30" style="width:227px;"
						   value="${position.hope_positions}" onclick="JumpSearchLayer(1,'stu_hope_position_form','in_hope_position','hope_positions',3);" />
 
 					<input type="hidden" name="in_hope_position" id="in_hope_position" value="${position.hope_position}" />          
					<div style="clear:both"></div>
				</dd>
        		<dd><p><span>*</span>期望薪资</p>
<%--         			<input class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入期望薪资!' " value="${position.hope_salary}"  name="in_hope_salary" type="text" class="text" style="width:100px;float: none;margin-left:-238px"/>&nbsp;&nbsp;元/月
 --%>        			<select  name="in_hope_salary" style="width:120px;">
								<option value="2000-3000"  ${position.hope_salary eq "2000-3000"?"selected":""}>2000-3000</option>
								<option value="3000-5000" ${position.hope_salary eq "3000-5000"?"selected":""}>3000-5000</option>
								<option value="5000-8000" ${position.hope_salary eq "5000-8000"?"selected":""}>5000-8000</option>
								<option value="8000-10000" ${position.hope_salary eq "8000-10000"?"selected":""}>8000-10000</option>
								<option value="10000以上" ${position.hope_salary eq "10000以上"?"selected":""}>10000以上</option>
				    </select>
        			<div style="clear:both"></div>
        		</dd>
        		
        		<dd>
					<input class="confirm" type="button" onclick="Position.save();" value="确定">				
					<input class="cansal" type="button" onclick="Position.cancel();" value="取消">
					<div style="clear:both"></div>    
        		</dd>
        	</form>
			</div>

<!--工作经历 ------------------------------->
			<div class="details_work" id="details_work">
				<div id="working_exprience">
 	     			<dt>
 					<span class="biaoti bt" style="width:130px;">实习/工作经历</span>
 					<span class="bianji"><i class="fa fa-plus" aria-hidden="true" style="color:#02c08e;"></i>&nbsp;&nbsp;
 					<a href="javascript:;" id="stu_work_form_add_btn" onclick="Work.add();">[添加]</a>
					<a href="javascript:;"  style="display:none;" id="stu_work_form_close_btn"  onclick="Work.close();">[取消]</a></span>
 					</dt>

 					<div>
        				<div class="work_two"></div>    	   		
        				<div style="clear:both"></div>
					</div>
				</div>
				<!--工作经历编辑开始  -->
				<form class="stu_work_form"  style="display:none;padding-bottom:30px;" method="post"
     					action="/member/ajaxForm.do?in_r=su&methodId=student_work&in_student_id=${student.student_id}">
     					<input type="hidden" value="add" name="in_action" />
     					<input type="hidden" value="" name="in_work_id" />
         			<dd><p><span>*</span>公司名称</p>
         				<input name="in_company_name" type="text" class="text easyui-validatebox" data-options="required:true,validType:'isBlank',missingMessage:'请输入公司名称' " />
         				<div style="clear:both"></div>
         			</dd>
       				<dd><p><span>*</span>职位名称</p>
						<input name="in_position" type="text" class="text easyui-validatebox" data-options="required:true,validType:'isBlank',missingMessage:'请输入岗位名称' " />
						<div style="clear:both"></div>
					</dd>
       				<dd><p><span>*</span>时间</p>
                  		<input onClick="WdatePicker()"  name="in_begin_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;" readonly />
             	  		<div class="zhi" style="margin-left:5px;">至</div>
                  		<input onClick="WdatePicker()"  name="in_end_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:130px;margin-left:5px;" readonly />
                  		<div style="clear:both"></div>
					</dd>
       				<!-- <dd><p><span>*</span>工资待遇</p>
       					<input name="in_salary" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入薪资' " style="width:70px;float: none;margin-left:-273px" />&nbsp;&nbsp;元/月
       					<div style="clear:both"></div>
       				</dd> -->
       				<dd><p>工作描述</p>
       					<textarea name="in_introduce" class="auto-height" cols="35" rows="6" style="border-radius:5px; border:1px #666666 solid;margin-left:20px;"  data-options="required:true,missingMessage:'请输入工作内容' "
       					
       					onkeydown="checkMaxInput(this,500)"  
				            onkeyup="checkMaxInput(this,500)" 
				            onfocus="checkMaxInput(this,500)" 
				            onblur="checkMaxInput(this,500);resetMaxmsg()">
       					</textarea>	
       					<div style="clear:both"></div>
       				</dd>
       				<dd>             		
              			<input class="confirm" type="button" onclick="Work.save();" value="保存"/>
                    	<input class="cansal"  type="button" onclick="Work.close();" value="取消"/>
              			<div style="clear:both"></div>   
            		</dd>
           		</form>        
			</div>


		</dl>
	</div><!--mian_l  end  -->

    
	<div style="clear:both"></div> 
</div><!--main end  -->
<!--main区架构结束-->
<script type="text/javascript">
function fixedmain_nav(){
	var s = $(document).scrollTop();
	var m = $("body").height();
	var f = 335; // $(".footer").height();
	var h = 368; //$('.main_r_nav').height();滚动菜单高度
	// var y = $('.main_r_nav').offset().top;
	var b = 335 - ( m - ( s+$(window).height() ) );
	if( s < 170 ){
		$('.main_r_nav').removeClass("main_r_fixed");
		$('.main_r_nav').removeClass("main_r_fixed2");
		$('.main_l').removeClass("main_l_margin");
	}else if( s>=170 && s < m-f-h-170 ){
		$('.main_l').addClass("main_l_margin");
		$('.main_r_nav').addClass("main_r_fixed");
		$('.main_r_nav').removeClass("main_r_fixed2");
		$('.main_r_nav').css("bottom","initial");
	}else{
		$('.main_r_nav').removeClass("main_r_fixed");
		$('.main_r_nav').addClass("main_r_fixed2");
		$('.main_r_nav').css({bottom: b });
	}
}
$(window).scroll(function(e){
	fixedmain_nav();
});
</script>   
<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->
</body>
	<script src="/assets/My97DatePicker/WdatePicker.js"  type="text/javascript" charset="utf-8"></script>

</html>