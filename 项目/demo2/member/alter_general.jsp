<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if(true){
		response.sendRedirect("/student/stuCenter.do");
		return;
	}
	String path = request.getContextPath()+"/member/";
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	StudentSessionBean userInfo = (StudentSessionBean)User.getUser("student", session);
	String head_logo = userInfo!=null?userInfo.getLogo():null;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改简历</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/alter_general.css"/>
<script type="text/javascript" src="<%=path %>js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var student_id="${student.student_id}";
</script>
<script type="text/javascript" src="js/uploadhead.js" charset="utf-8"></script>

<link rel="stylesheet" href="../js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>
<link href="../js/layer/skins/default.css" rel="stylesheet" />
<!--
<script src="../js/layer/artDialog.min.js" type="text/javascript"></script>
-->
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="../js/school_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layer/jobjss.js" charset="utf-8"></script>

<script type="text/javascript" src="js/alter_general.js" charset="utf-8"></script>

<script type="text/javascript" src="../assets/My97DatePicker/WdatePicker.js"  charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$("#menu_1_1").addClass("on");
		$("#menu_1_1 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>

</head>
<body>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
		<jsp:include page="inc/menu.jsp" flush="true" />
        <div class="right">
        	<div class="right_top logo">
            	<img src="img/images/wanshan_03.gif" />
                <p>完善简历：<span>*</span> 为必填项。<br />
				简历是您向招聘单位展示个人情况的重要载体，请您认真填写。 
				
				<span class="red">简历完整度${percent}% 
					<a href="javascript:void(0);" onclick="window.location.reload();">[刷新]</a>
				<!--
				<a href="javascript:;" onclick="Resume.setOpen(1);">[公开简历]</a>
				-->
				<a id="open_switch_btn" href="javascript:;"></a>
				
				</span>
				</p>
                <div class="clear"></div>
                <div class="xian"></div>
            </div>
            <!--right_top完成-->
            <div class="right_midder">
            	<div class="middle_left">
                	<ul class="ul_left">
                    	<li class="dui"><a href="#info" >基本资料</a></li>
                        <li class="dui"><a href="#hope" >求职意向</a></li>
                    </ul>
                    <ul class="ul_left">
                    	<li class="dui"><a href="#work" >工作经历</a></li>
                    	<li class="dui"><a href="#contact" >联系方式</a></li>
                    	<!-- 
                        <li class="cuo"><a href="#" >联系方式</a></li>
                    	-->
                    </ul>
                    <div class="img">
                        <p>完整的个人资料<br />
						会受到HR的青睐</p>
                    </div>
                    <div class="clear"></div>
                    <p class="list">为了获得更多的面试几率，请认真将所有选项填写完整吧！</p>
                </div>
                <div class="middle_right ">
                	<!-- 
                	<p class="color">请上传照片< !--  或用摄像头拍照 -- ></p>
                	-->
                	<table style="width:116px;margin-top:15px;">
                	<tr><td colspan="2">
                    <img class="head_pic" src="<%=head_logo!=null?head_logo:"img/wei.png"%>" height="156" width="114" />
                    </td><tr><td>
                    
                    	<!-- 
                    	<div class="photo"  style="float:left;">
                    	<p><a href="#">浏览</a>未选择文件</p>
                    	<p style="color:#F00;"><a href="#" style="color:#999">上传照片</a>最多可上传一张照片</p>
                    	</div>
                    	-->
        	<div id="logo_file_upload_btn" style="height:21px; width:46px;overflow:hidden;margin:0;">
        		<input id="logo_file_upload" name="logo_file_upload" type="file" />
        	</div>
        	<div id="logo_file_relaod_btn" style="display:none;height:21px; width:46px;overflow:hidden;margin:auto;">
        		<input onclick="logo_file_reload()" style="height:21px;width:46px;text-align:center;  vertical-align: top;" type="button"  value="取消"/>
        	</div>
        	</td><td>
        	<div  id="logo_file_save_btn"  style="height:21px; width:46px;overflow:hidden;margin:auto;">
        		<input onclick=" logo_file_save()" disabled="disabled" style="height:21px;width:46px;text-align:center;  vertical-align: top;" type="button"  value="保存"/>
        	</div>
        	</td><tr><td colspan="2">
        	<div id="logo_file_upload_queue" style="display:none;"></div>
			</td></tr>
                	</table>
                    
                     <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="xian"></div>
            </div>
            <!--right_midder完成-->
            <div class="right_bottom">
            	<div class="bottom_a">
            		<a name="info"></a>
                	<h1>基本信息
                	<a href="javascript:;" id="stu_info_form_btn" onclick="edit_stu_info(true)">[编辑]</a>
                	<a href="javascript:;" id="stu_info_card_btn"  style="display:none;" onclick="edit_stu_info(false)">[取消]</a>
                	</h1>
                	<form id="stu_info_card">
 <table width="560" border="0">
                      <tr>
                        <td width="108" class="tda">姓名：</td>
                        <td width="442" class="tdb" ><input name="in_name" readonly="readonly" value="${student.name}" />
                        </td>
                      </tr>
                      <tr>
                        <td class="tda">性别：</td>
                        <td class="tdb"><input name="in_sex" readonly="readonly" value="${student.sex}" />
                         </td>
                      </tr>
                      <tr>
                         <td class="tda">出生年月：</td>
                        <td class="tdb"><input name="in_birth" readonly="readonly" value="${student.birth}" />
                        </td>
                      </tr>
                       <tr>
                         <td class="tda">户籍所在地：</td>
                        <td class="tdb"><input name="in_home_areas" readonly="readonly" value="${student.home_areas}" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">现居地址：</td>
                        <td class="tdb"><input name="in_areas" readonly="readonly" value="${student.areas}" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">最高学历：</td>
                        <td class="tdb"><input name="in_educations" readonly="readonly" value="${student.educations}" />
                         </td>
                      </tr>
                       <tr>
                         <td class="tda">毕业院校：</td>
                        <td class="tdb"><input name="in_school_name" readonly="readonly" value="${student.school_name }"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda">专业：</td>
                        <td width="442" class="tdb"><input name="in_profession" readonly="readonly" value="${student.profession}" />
                        </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda">毕业年份：</td>
                        <td width="442" class="tdb"><input name="in_grad_year" readonly="readonly" value="${student.grad_year }"/>年
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">到岗时间：</td>
                        <td class="tdb"><input name="in_work_status" readonly="readonly" value="${student.work_status}"/>
                        </td>
                      </tr>
                    </table>
                	</form>
                	<form id="stu_info_form"  name="stu_info_form" style="display:none;" method="post" action="/member/ajaxForm.do">
                	<input name="methodId" value="ajax_form" type="hidden"/>
                	<input name="in_buss_id" value="stu_info" type="hidden" />
                	<input name="in_r" value="su" type="hidden" />
                    <table width="560" border="0">
                      <tr>
                        <td width="108" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>姓名：</td>
                        <td width="442" class="tdb">
                        	<input class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入姓名' "
                        		value="${student.name}" type="text"  name="in_name"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>性别：</td>
                        <td class="tdb">
                        <input type="radio" value="男" name="in_sex"  ${student.sex=="男"?"checked":""}><span>男</span>
                        <input type="radio" value="女" name="in_sex"  ${student.sex=="女"?"checked":""}><span>女</span>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>出生年月：</td>
                        <td class="tdb">
                        	<select name="in_birth_year" 	style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
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
                            —
							<select name="in_birth_month" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
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
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>户籍所在地：</td>
                        <td class="tdb">
			 <input class="text easyui-validatebox" data-options="required:true,missingMessage:'请选择户籍所在地' "  value="${student.home_areas}" name="home_areas" type="text" onclick="JumpSearchLayer(6,'stu_info_form','in_home_area','home_areas',1);" id="home_areas" value="" size="30" readonly="" class="input" />
			<input type="hidden" name="in_home_area" id="in_home_area" value="${student.home_area}" />
                        </td>
                       </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>现居地址：</td>
                        <td class="tdb">
                        	<select name="in_area_id" class="validate-combobox" data-options="required:true" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
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
							</select>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>最高学历：</td>
                        <td class="tdb">
                        	<select  name="in_education" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
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
							</select>
                         </td>
                      </tr>
                       <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>毕业院校：</td>
                        <td class="tdb">
       	<!-- 选择学校  -->
       	<input type="hidden" name="in_school_id" id="in_school_id" value="${student.school_id }" />
		<input type="text" name="in_school_name" id="in_school_name" value="${student.school_name }" onclick="pop();" onfocus="pop();" readonly="readonly" class="text" />
		<div id="choose-box-wrapper">
			  <div id="choose-box">
				<div id="choose-box-title">
					<span>选择学校</span>
				</div>
				<div id="choose-a-province">
				</div>
				<div id="choose-a-school">
				</div>
				<div id="choose-box-bottom">
					<a class="input-school-name-btn" 
						 href="javascript:$('.input-school-name-btn').hide();$('.input-school-name').show();" 
						 style="text-decoration:underline;float:left;margin-top:10px;margin-left:20px;color:#636363;">
						找不到，点击这里输入
					</a>
					<input type="text"  placeholder="请输入学校名称" name="new_school_name" class="input-school-name" style="display:none;float:left;height:20px;padding:2px 3px;background:#FFF;color:#286A46;width:200px;line-height:20px;" />
					<input type="button" onclick="inputSchoolName()" class="input-school-name" style="display:none;float:left;" value="确定"/>
					<input type="botton" onclick="hide()" value="关闭" />
				</div>
			  </div>
		</div>
	<!--  选择学校  -->
                        </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>专业：</td>
                        <td width="442" class="tdb">
                        		<input value="${student.profession}" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入专业' " name="in_profession"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>毕业年份：</td>
                        <td width="442" class="tdb">
               			<select name="in_grad_year" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
									<option value="-1">--年--</option>
									<c:forEach var="year" items="${gradYearList}">
									<c:choose>
										<c:when test="${student.grad_year eq year}">
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
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>到岗时间：</td>
                        <td class="tdb">
                        	<select  name="in_work_status" style="width:100px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
								<option value="可立即上岗"  ${student.work_status eq "可立即上岗"?"selected":""}>可立即上岗</option>
								<option value="一周内上岗" ${student.work_status eq "一周内上岗"?"selected":""}>一周内上岗</option>
								<option value="二周内上岗" ${student.work_status eq "二周内上岗"?"selected":""}>二周内上岗</option>
								<option value="一月内上岗" ${student.work_status eq "一月内上岗"?"selected":""}>一月内上岗</option>
								<option value="已入职" ${student.work_status eq "已入职"?"selected":""}>已入职</option>
				     		</select>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"></td>
                        <td class="tdb">
                        	<a class="form_submit" href="javascript:;">保存</a>
                        	<a href="javascript:;" onclick="edit_stu_info(false)">取消</a></td>
                      </tr>
                    </table>
                    </form>
                    <!---------------------------------------------------->
 					<a name="edu"></a>
 					<h1 class="yell">教育培训背景
					
<a href="javascript:;" id="stu_edu_form_add_btn" onclick="Education.add();">[添加]</a>
<a href="javascript:;"  style="display:none;" id="stu_edu_form_close_btn"  onclick="Education.close();">[取消]</a>
					</h1>
  <div style="margin:5px 10px 20px 0;width:640px;">
    	<table id="school_list_table">
    		<thead>
    		<tr>
    			<td>时间</td><td>学校</td><td>学历</td><td>专业</td><td>&nbsp;</td>
    		</tr>
    		</thead>
    		<tbody  id="school_list" >
    		</tbody>
    	</table>
    </div>
    
     <form class="stu_edu_form"  style="display:none;" 
     			action="<%=request.getContextPath()%>/member/ajaxForm.do?in_r=su&methodId=student_edu&in_student_id=${student.student_id}" 
     			method="post">
     <input type="hidden" value="add" name="in_action" />
     <input type="hidden" value="" name="in_edu_id" />
	<table width="560" border="0">
    <tr><td class="tda">日期：</td>
    	  <td class="tdb">	
				<input name="in_begin_date" type="text" onClick="WdatePicker()" readonly class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " />
				至
				<input name="in_end_date" type="text" onClick="WdatePicker()" readonly class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入截止日期' " />
			</td>
	</tr>
    <tr><td class="tda">学校或培训机构：</td>
      <td class="tdb">
			<input class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入学校或培训机构名称'" type="text" name="in_school_name" id="in_school_name" value="" />
        </td>
	</tr>
    <tr>
                         <td class="tda">学历：</td>
                    <td class="tdb">
                    <select class="text" name="in_education" id="in_education">
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
     				</select>
                    </td>
	</tr>
    <tr>
                         <td class="tda">专业或培训项目：</td>
                        <td class="tdb">
			<input  class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入专业名称'" type="text" name="in_profession" id="in_profession" value="" />
			</td>
			</tr>
                      <tr>
                         <td class="tda"></td>
                        <td class="tdb">
                        	<a href="javascript:;" onclick="Education.save();">保存</a>
                        	<a href="javascript:;" onclick="Education.close();">取消</a></td>
                      </tr>
                    </table>
     </form>
					<!--  ----------------------------------------------  -->
					<a name="work"></a>
					<h1 class="yell">工作/实习经历
					
<a href="javascript:;" id="stu_work_form_add_btn" onclick="Work.add();">[添加]</a>
<a href="javascript:;"  style="display:none;" id="stu_work_form_close_btn"  onclick="Work.close();">[取消]</a>
					</h1>
					<!-- StudentEdit3 -->
<table style="display:none;" id="work_tpl">
    		<tr>
    			<th colspan="7">{$begin_date}-{$end_date}&nbsp;&nbsp;&nbsp;&nbsp;{$company_name}
    			</th>
<th>
<a href="javascript:;" onclick="Work.edit('{$work_id}');">编辑</a>
<a href="javascript:;" onclick="Work.del('{$work_id_2}');">删除</a>
</th>
</tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    			<td style="width:80px;">职位：</td><td>{$position}</td>		
    			<td>月薪：</td><td>{$salary}</td>		
    			<td>工作性质：</td><td>{$work_type}</td>
    			<td>&nbsp;</td>
    		</tr><tr>
    			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    			<td>工作描述：</td>
    			<td colspan="5">{$introduce}</td>
    			<td>&nbsp;</td>
    			
    		</tr>
    </table>
    <div style="margin:5px 10px 20px 0;width:640px;">
    	<table  id="work_list" class="table table-striped table-hover table-bordered table-condensed">

    	</table>
    </div>
					<!-- /StudentEdit3 -->
     <form class="stu_work_form"  style="display:none;" 
     			action="<%=request.getContextPath()%>/member/ajaxForm.do?in_r=su&methodId=student_work&in_student_id=${student.student_id}" 
     			method="post">
     <input type="hidden" value="add" name="in_action" />
     <input type="hidden" value="" name="in_work_id" />
                    <table width="560" border="0">
                      <tr>
                        <td width="108" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>单位名称：</td>
                        <td width="442" class="tdb">
                        	<input name="in_company_name" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入单位名称' " /></td>
                      </tr>
                      <tr>
                        <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作性质：</td>
                        <td class="tdb">
                        	<input name="in_work_type"  type="radio" value="全职" checked><span>全职</span>
                            <input name="in_work_type"  type="radio" value="兼职"><span>兼职</span>
                            <input name="in_work_type"  type="radio" value="兼职"><span>实习</span>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>岗位名称：</td>
                        <td class="tdb">
                        	<input name="in_position" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入岗位名称' " />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作时间：</td>
                        <td class="tdb">
                        	<input onClick="WdatePicker()"  name="in_begin_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入开始日期' " style="width:100px;" />
                            —
                        	<input onClick="WdatePicker()"  name="in_end_date" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入截至日期' " style="width:100px;" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>薪资：</td>
                        <td class="tdb">
                        	<input name="in_salary" type="text" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入薪资' " style="width:100px;" />
                         </td>
                      </tr>
                      <tr>
                         <td class="tda" valign="top"><span><img src="img/images/wanshan_15.gif" /></span>工作描述：</td>
                         <td class="tdb">
                        	<textarea name="in_introduce" cols="40" rows="4" style="border-radius:5px; border:1px #666666 solid;" class="text easyui-validatebox" data-options="required:true,missingMessage:'请输入工作内容' "></textarea>	
                         </td>
                      </tr>
                      <tr>
                         <td class="tda"></td>
                        <td class="tdb">
                        	<a href="javascript:;" onclick="Work.save();">保存</a>
                        	<a href="javascript:;" onclick="Work.close();">取消</a>
                        </td>
                      </tr>
                    </table>
                    </form>
					<!-- ----------------------------------- -->
					<a name="hope"></a>
                    <h1 class="yell">求职意向
<a href="javascript:;" id="stu_hope_position_form_btn" onclick="Position.edit(true);">[编辑]</a>
<a href="javascript:;" id="stu_hope_position_card_btn" style="display:none;" onclick="Position.edit(false);">[取消]</a>
                    </h1>
			<form id="stu_hope_position_card" >
                    <table width="560" border="0">
                      <tr>
                        <td class="tda">工作类型：</td>
                        <td class="tdb"><input  readonly="readonly" name="in_hope_type"  value="${position.hope_type}" class="text"/>
                         </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda">工作行业：</td>
                        <td width="442" class="tdb">
                        <input  readonly="readonly" name="hope_industrys"  value="${position.hope_industrys}" class="text"/>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">工作职位：</td>
                        <td class="tdb">
		   	<input name="hope_positions" type="text" value="${position.hope_positions}" size="30"  readonly="readonly" class="text" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">工作地点：</td>
                        <td class="tdb">
			 <input name="hope_areas" type="text" value="${position.hope_areas}"  size="30" readonly="readonly" class="text" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">期望月薪：</td>
                        <td class="tdb">
                        	<input  readonly="readonly" value="${position.hope_salary}"  name="in_hope_salary" type="text" class="text" style="width:100px;" />元
                        </td>
                      </tr>
                      <tr>
                         <td class="tda" valign="top">自我评价：</td>
                         <td class="tdb">
                        	<textarea class="auto-height" readonly="readonly" name="in_introduce"  cols="60" rows="4"">${student.introduce}</textarea>	
                         </td>
                      </tr>
                    </table>
             </form>
             <script type="text/javascript">
             	$(function(){
             		$(".auto-height").each(function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=30;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").bind("propertychange",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             		$(".auto-height").bind("change",function(){
             			var height=$(this)[0].scrollHeight;
             			if(height<30)height=50;
             			$(this).css( {height:height} );
             		});
             	});
             </script>
			<form id="stu_hope_position_form" name="stu_hope_position_form" style="display:none;" method="post" action="/member/ajaxForm.do">
                	<input name="methodId" value="ajax_form" type="hidden">
                	<input name="in_buss_id" value="stu_hope_position" type="hidden">
                	<input name="in_r" value="su" type="hidden">
                	
                    <table width="560" border="0">
                      <tr>
                        <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作类型：</td>
                        <td class="tdb">
                        	<input name="in_hope_type"  type="radio" value="全职" ${position.hope_type eq "全职"?"checked":""}><span>全职</span>
                            <input name="in_hope_type" type="radio" value="兼职" ${position.hope_type eq "兼职"?"checked":""}><span>兼职</span>
                            <input name="in_hope_type"  type="radio" value="实习" ${position.hope_type eq "实习"?"checked":""}><span>实习</span>
                        </td>
                      </tr>
                      <tr>
                        <td width="108" class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作行业：</td>
                        <td width="442" class="tdb">
 	<select  class="text"  name="in_hope_industry" style="width:200px;margin-bottom:0px;padding:0px;height:25px;line-height:25px;">
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
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作职位：</td>
                        <td class="tdb">
		   	<input name="hope_positions" type="text" onclick="JumpSearchLayer(1,'stu_hope_position_form','in_hope_position','hope_positions',3);" id="hope_positions" value="${position.hope_positions}" size="30" readonly="" class="text" />
			<input type="hidden" name="in_hope_position" id="in_hope_position" value="${position.hope_position}" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>工作地点：</td>
                        <td class="tdb">
			 <input name="hope_areas" type="text" onclick="JumpSearchLayer(2,'stu_hope_position_form','in_hope_area','hope_areas',3);" id="hope_areas" value="${position.hope_areas}"  size="30" readonly="readonly" class="text" />
			<input type="hidden" name="in_hope_area" id="in_hope_area"  value="${position.hope_area}" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>期望月薪：</td>
                        <td class="tdb">
                        	<input value="${position.hope_salary}"  name="in_hope_salary" type="text" class="text" style="width:100px;" />元
                        </td>
                      </tr>
                      <tr>
                         <td class="tda" valign="top"><span><img src="img/images/wanshan_15.gif" /></span>自我评价：</td>
                         <td class="tdb">
                        	<textarea class="auto-height" name="in_introduce"  cols="60" rows="4" style="border-radius:5px; border:1px #666666 solid;"
                        	onkeydown="checkMaxInput(this,500)"  
				            onkeyup="checkMaxInput(this,500)" 
				            onfocus="checkMaxInput(this,500)" 
				            onblur="checkMaxInput(this,500);resetMaxmsg()">${student.introduce}</textarea>	
                         </td>
                      </tr>
                      <tr>
                         <td class="tda"></td>
                        <td class="tdb">
                        		<a href="javascript:;" onclick="Position.save();">保存</a>
                        		<a href="javascript:;" onclick="Position.cancel();">取消</a>
                        </td>
                      </tr>
                    </table>
             </form>
                    <!-- ---------------------- ---------------- -->
                    <a name="contact"></a>
                    <h1 class="yell">联系方式
<a href="javascript:;" id="stu_contact_form_btn" onclick="Contact.edit(true);">[编辑]</a>
<a href="javascript:;" id="stu_contact_card_btn" style="display:none;" onclick="Contact.edit(false);">[取消]</a>
                    </h1>
              <form id="stu_contact_card">
 					<table width="560" border="0">
                      <tr>
                         <td class="tda">手机：</td>
                        <td class="tdb">
                        	<input readonly="readonly" name="in_contact_tel" value="${contact.contact_tel }" type="text" class="text" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">QQ：</td>
                        <td class="tdb">
                        	<input readonly="readonly"  name="in_bind_qq"  value="${contact.bind_qq}" type="text" class="text" />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda">E-mail：</td>
                        <td class="tdb">
                        	<input readonly="readonly"  name="in_contact_email" value="${contact.contact_email }"  type="text" class="text" />
                        </td>
                      </tr>
                    </table>
            </form>        
                    
			<form id="stu_contact_form" style="display:none;" method="post" action="/member/ajaxForm.do">
                	<input name="methodId" value="ajax_form" type="hidden">
                	<input name="in_buss_id" value="stu_contact" type="hidden">
                	<input name="in_r" value="su" type="hidden">
                	
                    <table width="560" border="0">
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>手机：</td>
                        <td class="tdb">
                        	<input name="in_contact_tel" value="${contact.contact_tel }" type="text" class="text easyui-numberbox" data-options="required:true,missingMessage:'请输入手机号' "   />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>QQ：</td>
                        <td class="tdb">
                        	<input name="in_bind_qq"  value="${contact.bind_qq}" type="text" class="text easyui-numberbox" data-options="required:true,missingMessage:'请输入QQ号码' "   />
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"><span><img src="img/images/wanshan_15.gif" /></span>E-mail：</td>
                        <td class="tdb">
                        	<input name="in_contact_email" value="${contact.contact_email }"  type="text" class="text easyui-validatebox" data-options="required:true,validType: 'email',invalidMessage:'请输入正确的邮箱地址',missingMessage:'请输入邮箱' "/>
                        </td>
                      </tr>
                      <tr>
                         <td class="tda"></td>
                         <td class="tdb">
			                         <a href="javascript:;" onclick="Contact.save();">保存</a>
			                         <a href="javascript:;" onclick="Contact.cancel();">取消</a>                 
                        </td>
                      </tr>
                    </table>
            </form>
                </div>
            </div>
            <!--right_bottom完成-->
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<jsp:include page="inc/footer.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
