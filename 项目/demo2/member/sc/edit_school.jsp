<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SchUserBean user=(SchUserBean)User.getUser("school",session);
if( user ==null ){
	response.sendRedirect( request.getContextPath()+"/");
	return;
}
String school_id= user.getId();
String job_fair_id=request.getParameter("id");
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>校园招聘会_添加</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/all.css" />
<link type="text/css" rel="stylesheet" href="style/form.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/adddate.js" charset="utf-8"></script>

<link rel="stylesheet" href="/js/jquery-easyui/themes/metro/validatebox.css" type="text/css"></link>
<script type="text/javascript" src="/js/jquery-easyui/jquery.easyui.min.js"></script>

<script src="/assets/artDialog/artDialog.js?skin=green"></script>
<script src="/assets/artDialog/plugins/iframeTools.js"></script>

<!-- ueditor -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- /ueditor -->

<script type="text/javascript" src="/js/select_data_js_array.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/front.js" charset="utf-8"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript">
var school_id ='<%=user.getId()%>';
var area_id='<%=user.getAreaId()%>';
var user_code = '<%=user.getUserCode()%>';
var id = '<%=request.getParameter("id")%>';
$(function(){
	linkSelectCode('job_fair_feature','in_job_fair_feature',false);
	setTimeout("setData()", 500);
});
function setData() {	
	var ls_url = "/esbServer.do?method=execProc&methodId=ad_job_fair_view&in_id=" + id + "&date=" + new Date();
	$.ajax({
		url:ls_url, 
		type:"post", 
		dataType:"text", 
		success:function (data) {
		if (!data) {
			return false;
		}
		data = decodeURIComponent(data);
		var re = eval("[" + data + "]");
		console.info( re );
		if (re.length > 0 && re[0].returncode == "ok") {
			initdata= re[0].queryresult;
			$("#fm").form("load", initdata[0]);
			$("input[name=job_fair_level]").each(function(){
					if(  initdata[0].in_job_fair_level.indexOf( $(this).val() )>=0 ){
						$(this).attr("checked",true);
					}
			});
		}
	}});
}
function saveForm( form_id )
{
	var ls_url = "/esbServer.do?method=execProc&methodId=ad_job_fair_edit&in_r=sc&in_id=" + id+"&date=" + new Date();
	$("#"+form_id ).form("submit",{
		url:ls_url,
		onSubmit:function(){
			var job_fair_time=$("#in_job_fair_time").val() ;
			var job_fair_overtime=$("#in_job_fair_overtime").val() ;
			if( initdatetime()>=job_fair_time ){
				msg_alert("提示信息","招聘会开始时间必须大于当前时间","warning");
				$("#in_job_fair_time").focus();
				return false;
			}else if( job_fair_time>=job_fair_overtime ){
				msg_alert("提示信息","招聘会结束时间必须大于开始时间","warning");
				$("#in_job_fair_overtime").focus();
				return false;
			}
			return $(this).form("validate");;
		},
		success:function( data ){
		  	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var res = re[0].queryresult;
            	 if( res[0].ok!='ok'){
            		 msg_alert("提示信息",res[0].msg,"error");
            		 return;
            	 }
            	 var l_message="";
        		 if( re[0].sendSheet =="succ"){
        		 	l_message="成功发布招聘会，<br/>并成功提交审核.";
        		 }else if( re[0].sendSheet =="false"){
        		 	l_message="招聘会保存成功，<br/>提交审核失败.";
        		 }else{
        		 	l_message="招聘会保存成功";
        		 }
                 msg_alert('提示信息',l_message,undefined,function(){//提示信息
                 	window.location.href="issue_school.jsp";
            	});
            } else {
                msg_alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
		}
	});
}
</script>    
</head>

<body>
<jsp:include page="include/head.jsp" flush="true"/>
<!--menu完成-->
<div class="hy">
	<p>当前位置：首页 &gt; <a href="/member/sc/home.do" style="color:#5a9707;">会员中心</a>
	</p>
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
                <div class="biankuang">
                	<div class="list_alter fanhui">
						<div class="pull-left">
                         	<span style="color:#FFF; font-weight:bold; font-size:16px;">修改校园招聘会</span>
                        </div>
                        <div class="pull-right">
                         	<a href="issue_school.jsp"><img src="img/fanhui.png"></a>
                        </div>
                    </div>
                    <!----------------------------返回------------------------------------->
                    <div class="form" style="width:780px;margin:20px 0; padding-left:50px;">
                    	<form id="fm" name="fm" method="post">
						<input value="multiple" type="hidden" id="in_job_fair_type" name="in_job_fair_type" />

                    	<table class="table">
                           <tbody>
                              <tr>
                                 <td class="text_right">招聘会名称：</td>
                                 <td class="text_left" >
                                   <input type="text" class="form-control easyui-validatebox" data-options=" validType:length[2,20],required:true,missingMessage:'请输入招聘会名称,不超过20个字符' " id="in_job_fair_name" name="in_job_fair_name" placeholder="">
                                 </td>
                              </tr>
                               <tr>
                                 <td class="text_right">承办单位：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_job_fair_organizer" name="in_job_fair_organizer" class="form-control easyui-validatebox" data-options="required:false,missingMessage:'' " placeholder="">
                                 </td>
                              </tr>
                               <tr>
                                 <td class="text_right">协办单位：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_cooperate_organizer" name="in_cooperate_organizer" class="form-control easyui-validatebox" data-options="required:false,missingMessage:'' " placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">招聘会时间：</td>
                                 <td class="text_left">
                                    <input type="text" id="in_job_fair_time" name="in_job_fair_time" value="" class="time easyui-validatebox" data-options="required:true,missingMessage:'招聘会开始时间' " onclick="SelectDate(this,'yyyy-MM-dd hh:mm')"/>
                                    --
                                    <input type="text" id="in_job_fair_overtime" name="in_job_fair_overtime" value="" class="time easyui-validatebox" data-options="required:true,missingMessage:'招聘会结束时间' " onclick="SelectDate(this,'yyyy-MM-dd hh:mm')"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">预订截止时间：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_job_fair_endtime" name="in_job_fair_endtime" value="" class="time easyui-validatebox" data-options="required:true,missingMessage:'招聘会预定截止时间' " onclick="SelectDate(this,'yyyy-MM-dd hh:mm')"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">招聘会地点：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_job_fair_addr" name="in_job_fair_addr" class="form-control easyui-validatebox" data-options="required:true,missingMessage:'招聘会地点' "" placeholder="">
                                 </td>
                                 <!-- 
                                 <td class="text_lefta"><button type="submit" class="btn btn-default btn_a">选择</button></td>
                                  -->
                              </tr>
                               <tr>
                                 <td class="text_right">乘车路线：</td>
                                 <td class="text_left">
                                   <input type="text" id="in_job_fair_bus_route" name="in_job_fair_bus_route" class="form-control easyui-validatebox" data-options="required:true,missingMessage:'乘车路线' " placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">招聘会学历：</td>
                                 <td class="text_left">
                                   <div>
<script type="text/javascript">
	function levelChanged()
	{
		var tempVal ="";
		$("input[name='job_fair_level']:checked").each(function(){
				tempVal+=$(this).val()+",";
		});
		$("input[name='in_job_fair_level']").val( tempVal );
	}
</script>
<%
	List job_fair_level = new com.zhaopin.dao.factory.BaseCodeModel().codeArray("job_fair_level");
	for( Iterator it=job_fair_level.iterator();it.hasNext();)
	{
		List row =(List)it.next();
	 %>
	<label class="checkbox-inline" onclick="levelChanged();">
	    <input type="checkbox" name="job_fair_level"  value="<%=row.get(0) %>" /><%=row.get(1) %>
	</label>
	 <%
	}
 %>
<input id="in_job_fair_level" name="in_job_fair_level" class="easyui-validatebox" required="true" style="border:none;width:0px;" />           
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">毕业生信息：</td>
                                 <td class="text_left">
								<input type="hidden" id="in_grad_info_id" name="in_grad_info_id" />
								<input type="text"  readonly="readonly" onclick="select_grad_info();" id="in_grad_info" name="in_grad_info" class="form-control easyui-validatebox" data-options="required:false,missingMessage:'请选择毕业生信息' "/>

                                 </td>
                                 <td class="text_lefta">
                                 	<button type="button" onclick="select_grad_info();" class="btn btn-default btn_a">选择</button>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">招聘会特色：</td>
                                 <td class="text_left">
                                   <select class="form-control width" id="in_job_fair_feature" name="in_job_fair_feature" >
                                     <option value="">请选择</option>

                                   </select>
                                 </td>
                              </tr><tr>
                                 <td class="text_right">计划单位数：</td>
                                 <td class="text_left">
                                 	<input type="text" id="in_job_fair_company_num" name="in_job_fair_company_num" class="form-control width easyui-numberbox" placeholder="">
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text_right">招聘会邀请函：</td>
                                 <td class="text_left">&nbsp;
                                 </td>
                              </tr>
                              <tr><td colspan="3">
		<script id="job_fair_invitation"  name="job_fair_invitation"  type="text/plain" style="width:100%;height:280px;"><%
				String content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id,true);
					out.println( content );
				%></script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('job_fair_invitation', {
    	autoHeightEnabled:false
    	,enableAutoSave: false 
    	,initialFrameWidth:720  //初始化编辑器宽度,默认1000
        ,initialFrameHeight:280  //初始化编辑器高度,默认320
    	,toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload',  'attachment','emotion','template', 'background', '|',
            'horizontal', 'spechars', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols'
        ]]
	});
</script>
                              	  </td>
                              </tr>
                              <tr>
                              	 <td class="text_right"></td>
                                 <td class="text_left">
                                 	<a onclick="saveForm('fm');" href="javascript:;" class="btn btn-default anniu_a">保存</a>
                                    <a href="issue_school.jsp" class="btn btn-default anniu_a">取消</a>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        </form>
                    </div>
                    <!--form------>
                </div>
            </div>
            <!--pull-right结束-->
        </div>
	</div>	
</div>
<div id="dlg_check" style="display:none">
<jsp:include page="include/graduation.jsp" flush="true">
	<jsp:param value="<%=school_id %>" name="school_id"/>
</jsp:include>
</div>
<!--footer-->
<jsp:include page="include/foot.jsp" flush="true" />

</body>
</html>
