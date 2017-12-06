<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.dao.factory.SchoolGraduationModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%
	String g_id = request.getParameter("id");
	if(g_id == null ){
		response.sendRedirect("/");	
	}
	SchoolGraduationModel model = new SchoolGraduationModel();
	DynaBean bean = model.find(g_id);
 %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>毕业生信息_添加</title>
<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/static/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/member/sc/js/adddate.js"></script>

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

<script type="text/javascript">
function saveDataForm()
{
	var ls_url = "/school/graduation.do?action=edit&date=" + new Date();
	$("#fm").form("submit",{
		url:ls_url,
		onSubmit:function(){
			return $(this).form("validate");;
		},
		success:function( data ){
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			console.info( re );
			if (re.length > 0 && re[0].returncode == "ok") {
				queryresult = re[0].queryresult;
				if( queryresult[0].ok == 'ok' ){
					msg_alert("提示信息","保存成功!","succeed",function(){
						$('body,html').animate({scrollTop:0},0);
						window.location.href="uploading.jsp";
					});
				}else{
					msg_alert("错误信息","保存失败","error");
				}
			}else{
				msg_alert("错误信息","保存失败,请稍后再试","error");
			}
		}
	});
}
</script>
<style>
.table {
	width: 665px;
}

.table .text_right {
	white-space: nowrap;
	width: 100px;
}
.edui-editor-breadcrumb{
	display:none !important;
}
</style>
</head>

<body>
	<!--当前位置-->
	<div class="row" style="width:1024px;margin:20px auto">
		<div class=".center-block">
			<div class="biankuang">
				<!----------------------------返回------------------------------------->
				<div class="form" style="margin:20px 0;padding-left:150px;">

					<form name="fm" id="fm" method="post">
						<input type="hidden" name="in_g_id" value="<%=g_id%>" />
						<table class="table">
							<tbody>
								<tr>
									<td class="text_right">标题：</td>
									<td class="text_left"><input id="in_title"
										value="<%=bean.get("g_title")%>" name="in_title"
										class=" form-control easyui-validatebox"
										data-options="required:true,missingMessage:'请输入标题' "
										type="text" placeholder=""></td>
								</tr>
								<tr>
									<td class="text_right">毕业年份：</td>
									<td class="text_left"><select id="in_year" value="2015"
										name="in_year" class="form-control width" style="width:100px;">
											<%
												java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
														"yyyy");
												String year = sf.format(new java.util.Date());
												try {
													int y = Integer.parseInt(year);
													int g_year = bean.get("g_year") == null ? y : Integer
															.parseInt(bean.get("g_year").toString());
													out.println(com.zhaopin.Help.getYearsOptinos(2000, y + 5,
															g_year));
												} catch (Exception e) {
												}
											%>
									</select></td>
								</tr>
								<tr>
									<td class="text_right">毕业人数：</td>
									<td class="text_left"><input type="text"
										value="<%=bean.get("g_total")%>"
										data-options="required:true,missingMessage:'请输入毕业生人数',invalidMessage:'只能输入数字' "
										name="in_num" id="in_num"
										class="form-control width easyui-numberbox " placeholder=""
										style="width:100px;"></td>
								</tr>
								<tr>
									<td colspan="2"><script type="text/plain" id="editor"
											name="content"><%=model.getContent(g_id)%></script> <script
											type="text/javascript">
												//实例化编辑器
												//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
												var ue = UE
														.getEditor(
																'editor',
																{
																	autoHeightEnabled : false,
																	enableAutoSave : false,
																	initialFrameWidth : 665 //初始化编辑器宽度,默认1000
																	,
																	initialFrameHeight : 565 //初始化编辑器高度,默认320
																	,
																	toolbars : [ [
																			'fullscreen',
																			'source',
																			'|',
																			'undo',
																			'redo',
																			'|',
																			'bold',
																			'italic',
																			'underline',
																			'fontborder',
																			'strikethrough',
																			'superscript',
																			'subscript',
																			'removeformat',
																			'formatmatch',
																			'autotypeset',
																			'blockquote',
																			'pasteplain',
																			'|',
																			'forecolor',
																			'backcolor',
																			'insertorderedlist',
																			'insertunorderedlist',
																			'selectall',
																			'cleardoc',
																			'|',
																			'rowspacingtop',
																			'rowspacingbottom',
																			'lineheight',
																			'|',
																			'customstyle',
																			'paragraph',
																			'fontfamily',
																			'fontsize',
																			'|',
																			'directionalityltr',
																			'directionalityrtl',
																			'indent',
																			'|',
																			'justifyleft',
																			'justifycenter',
																			'justifyright',
																			'justifyjustify',
																			'|',
																			'touppercase',
																			'tolowercase',
																			'|',
																			'link',
																			'unlink',
																			'anchor',
																			'|',
																			'imagenone',
																			'imageleft',
																			'imageright',
																			'imagecenter',
																			'|',
																			'simpleupload',
																			'emotion',
																			'template',
																			'background',
																			'|',
																			'horizontal',
																			'spechars',
																			'wordimage',
																			'|',
																			'inserttable',
																			'deletetable',
																			'insertparagraphbeforetable',
																			'insertrow',
																			'deleterow',
																			'insertcol',
																			'deletecol',
																			'mergecells',
																			'mergeright',
																			'mergedown',
																			'splittocells',
																			'splittorows',
																			'splittocols' ] ]
																});
											</script></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!--form------>
			</div>
		</div>
	</div>

</body>
</html>
