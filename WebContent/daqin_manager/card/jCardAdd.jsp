<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<!-- ueditor -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- /ueditor -->
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="CardAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var role_id ="<%=role_id%>";
	var user_code = "<%=user_code%>";
	var cur_path ='<%=request.getContextPath() %>';
</script>
<style type="text/css">
	#fm table .tabright {width:10%;vertical-align: middle;}
	.ztree li {float:left;width:102px;}
</style>
<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('card_img_upload_btn', '' ,"in_card_img","card_img_name","img","uploader",function(d){
		var temp = d.split("|");
		var path = temp[2];
		$("#in_card_img_path").val( path );
		$("#card_pic").attr("src","/"+path );
	});
});
</script>
<style type="text/css">
	.uploadify-button {
		margin:0;
	}
	.cus-edui-sec {
		margin:5px;
		padding:5px;
	}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
	<input type="hidden" name="in_r" value="ad" />
	<input type="hidden" name="in_action" value="add" />
	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">客户：</td>
		<td><input id="in_customer" name="in_customer" class="easyui-validatebox inputbox"  data-options="required:true,missingMessage:'请输入客户名称' "/></td>
		<td rowspan="8" style="vertical-align: top;">
			<div style="width:500px;">
				<div class="cus-edui-sec" data-target="#edui-tpl-4">
					<img src="/public/card/templet-4.png" />
				</div>
			</div>
		
		</td>
	</tr>
	<tr>
		<td  class="tabright">分类：</td>
		<td>
		<select name="in_type_id" class="easyui-combobox">
			<option value="ed78b28d-6c5a-4a6d-a8fc-965772a684f2">就业服务</option>
			<option value="c28854f5-0557-4b4a-8fd1-c500c8b2141b">技能培训</option>
			
			<option value="23eb4ee8-20c4-4a82-85a0-4c7089266b6e">其他</option>
		</select>
		</td>
	</tr>
	<tr>
		<td class="tabright" width="10%">名称：</td>
		<td width="90%">
		<input id="in_card_name" name="in_card_name" class="easyui-validatebox inputbox" data-options="required:true,missingMessage:'请输入卡券名称' "/></td>
	</tr>
	<tr>
		<td class="tabright">有效期：</td>
		<td>
		<input id="in_card_begin" name="in_card_begin" class="easyui-datebox" required="true"/>
		-
		<input id="in_card_end" name="in_card_end" class="easyui-datebox" required="true"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">图片：</td>
		<td>
        <table><tr><td>
		<input class="text" name="card_img_name" type="text" readonly id="card_img_name" />
		<input type="hidden" name="in_card_img" id="in_card_img"/>
		<input type="hidden" name="in_card_img_path" id="in_card_img_path" />
		</td><td>
		<div id="card_img_upload_btn" style="line-height:1em;"></div>
		</td>
		<td>
		<span class="red">格式：*.jpg;*.png，大小<1M。</span>
		</td>
		</tr></table>
		</td>
	</tr>
	<tr>
		<td class="tabright">&nbsp;</td>
		<td colspan="1">
			<img id="card_pic" src="" style="width:300px;height:100px;"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">详情页内容：</td><td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" >
		<div style="width:90%;margin:auto;">
		<script id="editor"  name="card_content"  type="text/plain" style="width:550px;height:600px;"></script>
		</div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
<div style="height:25px;"></div>
 <script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor', {
    	autoHeightEnabled:false
    	,enableAutoSave: false 
    	,initialFrameWidth:550  //初始化编辑器宽度,默认1000
        ,initialFrameHeight:600  //初始化编辑器高度,默认320
    	,toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'attachment', 'emotion','template', 'background', '|',
            'horizontal', 'spechars', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols'
        ]]
	});
    $(".cus-edui-sec").click(function(){
    	// ue.setContent(  $(this).html(),true );
    	var tpl = $(this).attr("data-target");
    	ue.setContent(  $(tpl).text() ,true );
    });
</script>
<script type="text/plain" id="edui-tpl-4">
<section style="background-color:#F2F2F2; line-height:25px;padding:10px;">
	<section style="font-weight:900;padding-bottom:10px;">
		英语四级培训班
	</section>

	<section >
		<section style="float:left;margin-top:3px;">
			<svg width="16" height="16" viewBox="0 0 16 16" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g class="transform-group"><g transform="scale(0.015625, 0.015625)"><path d="M529.521778 1024c-11.377778 0-22.755556 0-34.133333 0-35.953778-11.377778-56.433778-36.864-69.632-71.452444-8.647111-22.300444-20.024889-43.235556-30.492444-64.625778C329.272889 748.202667 262.826667 608.483556 197.745778 468.309333 125.383111 313.116444 202.752 112.867556 362.496 34.588444 402.545778 15.018667 445.326222 6.371556 488.561778 0c15.928889 0 31.857778 0 47.786667 0 3.640889 0.910222 7.736889 2.275556 11.377778 2.730667 90.112 8.647111 162.474667 50.062222 222.549333 116.053333 82.830222 91.022222 107.861333 241.208889 56.888889 350.890667-75.093333 161.109333-151.552 321.308444-226.645333 482.872889C585.045333 985.315556 566.385778 1012.622222 529.521778 1024zM512.682667 512.455111c95.573333 0 170.666667-75.093333 170.666667-171.121778 0-95.573333-75.548444-170.666667-171.121778-170.666667-95.573333 0-170.666667 75.548444-170.666667 171.121778C341.560889 436.906667 417.109333 512.455111 512.682667 512.455111z" fill="#eb4f38"></path></g></g></svg>
		</section>
		<section style="float:left;margin-left:5px;">
			西安大秦学院
		</section>
		<section style="clear:both;"></section>
	</section>
	
	<section>
		<section style="float:left; margin-top:3px;">
			<svg width="16.015625" height="16" viewBox="0 0 16.015625 16" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g class="transform-group"><g transform="scale(0.015625, 0.015625)"><path d="M512.26004 0.00367c281.929202-1.063884 511.728098 229.266954 512.26004 512.26004 0.531942 280.333376-228.735013 509.60033-511.196156 511.728098C231.394722 1025.587634 0 793.66097 0 510.667885 0 229.802567 229.798896 1.067554 512.26004 0.00367zM148.943729 511.199826c1.595826 203.733744 163.838102 365.444078 365.444078 364.380194 199.478209-1.063884 364.912136-167.029753 362.252427-363.848253-2.127768-203.733744-165.433928-364.912136-367.039904-363.316311C309.59018 150.543225 147.347903 313.317443 148.943729 511.199826zM513.323924 512.26371c0-72.344097 0-141.496543 0-210.648988 0-45.215061 0-45.215061 45.215061-45.215061 35.640107 0 38.831758 3.191651 38.831758 38.299816 0 88.834296 0 178.200533 0 267.034829 0 29.788746-4.787477 34.576223-35.108165 34.576223-62.237201 0-125.006344 0-187.243545 0-28.19292 0-32.980397-4.255535-32.980397-31.916513-0.531942-52.130305-0.531942-52.130305 51.066421-52.130305C432.468756 512.26371 471.300514 512.26371 513.323924 512.26371z" fill="#eb4f38"></path></g></g></svg>
		</section>
		<section style="float:left; margin-left:5px;">
			2016.7.15-2016.9.07
		</section>
		<section style="clear:both;"></section>
	</section>

	<section>
		<section style="float:left;margin-top:3px;">
			<svg version="1.1" id="图层_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve"><g>
			<g transform="scale(0.1953125, 0.1953125)">
			<path fill="#DB372C" d="M77.155,30.777L41.637,15.5c-0.217-0.092-0.447-0.14-0.677-0.14s-0.46,0.048-0.68,0.14L4.767,30.777
			c-0.75,0.32-1.245,1.135-1.245,2.045c0,0.915,0.495,1.73,1.245,2.055L40.28,50.15c0.22,0.095,0.45,0.14,0.68,0.14
			s0.46-0.045,0.677-0.14L69.25,38.272V50.42c-1.48,0.79-2.505,2.495-2.505,4.475c0,1.98,1.025,3.685,2.505,4.47v4.24h3.64v-4.24
			c1.475-0.785,2.51-2.49,2.51-4.47c0-1.98-1.035-3.69-2.51-4.475V36.71l4.265-1.832c0.745-0.325,1.24-1.14,1.24-2.055
			C78.395,31.912,77.9,31.097,77.155,30.777z M40.96,53.215c-0.542,0-1.077-0.11-1.587-0.325l-22.137-9.525V56.51
			c0,10.775,16.147,14,21.192,14h5.062c3.78,0,21.195-3.225,21.195-14V43.365l-22.14,9.525
			C42.037,53.105,41.505,53.215,40.96,53.215z"/>
			</g></g>
			</svg>
		</section>
		<section style="float:left; margin-left:5px;">
							12课时
		</section>
		<section style="clear:both;"></section>
	</section>

	<section>
		<section style="float:left;margin-top:3px;">
			<svg version="1.1" id="图层_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve"><g>
			<g transform="scale(0.1953125, 0.1953125)">
			<path fill="#DB372C" d="M38.345,63.195H18.782c-0.282-0.85-0.425-2.055-0.425-3.61c0-0.64,0.037-1.275,0.107-1.915
			c0.07-0.635,0.177-1.24,0.317-1.805h19.562v-9.36H18.782c-0.282-0.85-0.425-2.052-0.425-3.61c0-0.642,0.037-1.28,0.107-1.917
			c0.068-0.638,0.177-1.237,0.317-1.805h15.31L14.53,4.727c0.92-0.142,1.93-0.247,3.03-0.32c1.1-0.067,2.145-0.105,3.137-0.105
			c0.99,0,2.017,0.037,3.082,0.105c1.062,0.072,2.017,0.177,2.87,0.32l17.435,32.105L61.2,4.727c0.925-0.142,1.865-0.247,2.815-0.32
			c0.96-0.067,1.935-0.105,2.93-0.105c0.99,0,1.98,0.037,2.975,0.105c0.99,0.072,1.91,0.177,2.765,0.32L53.44,39.172H69.6
			c0.215,0.995,0.32,2.127,0.32,3.4c0,1.56-0.105,2.87-0.32,3.932H49.19v9.36H69.6c0.215,0.99,0.32,2.12,0.32,3.4
			c0,1.56-0.105,2.87-0.32,3.93H49.19V79.89c-0.85,0.14-1.735,0.245-2.66,0.32c-0.922,0.07-1.842,0.105-2.765,0.105
			c-0.92,0-1.842-0.035-2.765-0.105c-0.92-0.075-1.805-0.18-2.655-0.32V63.195L38.345,63.195z"/>
			</g></g>
			</svg>
		</section>
		<section style="float:left; margin-left:5px;">
			1200/学期
		</section>
		<section style="clear:both;"></section>
	</section>

<!-- 第二部分-------------------------------------------------------------->

	<section style="clear:both;"></section>
	<section style="float:left;width:100%;border:5px solid #ffffff;margin-left:-10px;"></section>
	
	<section>
	<section style="float:left;margin-top:3px;">
		<svg version="1.1" id="图层_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve"><g>
			<g transform="scale(0.1953125, 0.1953125)">
			<path fill="#DB372C" d="M40.96,26.925c-7.755,0-14.037,6.282-14.037,14.037C26.922,48.72,33.205,55,40.96,55
			s14.035-6.28,14.035-14.037C54.995,33.207,48.715,26.925,40.96,26.925L40.96,26.925z M72.33,37.452
			C70.715,22.82,59.1,11.205,44.467,9.592v-7.23H37.45v7.23C22.817,11.205,11.202,22.82,9.59,37.452H2.36v7.017h7.23
			c1.612,14.635,13.227,26.25,27.86,27.86v7.23h7.017v-7.23C59.1,70.72,70.715,59.105,72.33,44.47h7.225v-7.017H72.33L72.33,37.452z
			 M40.96,65.525c-13.58,0-24.562-10.985-24.562-24.562c0-13.58,10.982-24.562,24.562-24.562s24.565,10.982,24.565,24.562
			C65.525,54.54,54.54,65.525,40.96,65.525L40.96,65.525z"/>
			</g></g>
		</svg>
	</section>
	<section style="float:left; margin-left:5px;">
		培训地址
	</section>

	<section style="clear:both;"></section>
	<section style="float:left;width:100%;border:1px solid #bfbfbf;margin-left:-10px;"></section>
	<section style="clear:both;"></section>
	<section style="float:left;margin-left:2em;letter-spacing:0.5px;">
		清华科技园A座
	</section>
	<section style="clear:both;"></section>
	</section>

<!-- 第三部分----------------------------------------------------------------------------------------->

	<section style="clear:both;"></section>
	<section style="float:left;width:100%;border:5px solid #ffffff;margin-left:-10px;"></section>
					
	<section><section style="clear:both;"></section>
	<section>
	<section style="float:left;margin-top:3px;">
		<svg version="1.1" id="图层_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve"><g>
			<g transform="scale(0.1953125, 0.1953125)">
			<path fill="#DB372C" d="M49.225,0.875v20.302h20.52L49.225,0.66 M47.675,24.167c-0.795,0-1.44-0.647-1.44-1.442V0H9.882
			c-0.76,0-1.37,0.617-1.37,1.375V78.05c0,0.76,0.61,1.37,1.37,1.37H69.03c0.76,0,1.37-0.61,1.37-1.37V24.157L47.675,24.167
			L47.675,24.167z M23.985,19.21H35.9c0.662,0,1.322,0.66,1.322,1.325c0,0.665-0.66,1.322-1.322,1.322H23.985
			c-0.662,0-1.322-0.665-1.322-1.322C22.662,19.87,23.322,19.21,23.985,19.21L23.985,19.21z M23.985,38.405H54.43
			c0.665,0,1.33,0.665,1.33,1.322c0,0.665-0.665,1.332-1.33,1.332H23.985c-0.662,0-1.322-0.667-1.322-1.332
			C22.662,39.07,23.322,38.405,23.985,38.405L23.985,38.405z M55.76,58.93c0,0.66-0.665,1.32-1.33,1.32H23.985
			c-0.662,0-1.322-0.66-1.322-1.32c0-0.67,0.66-1.33,1.322-1.33H54.43C55.43,57.6,56.085,58.26,55.76,58.93L55.76,58.93z"/>
			</g></g>
			</svg>
	</section>
	<section style="float:left; margin-left:5px;">
		培训介绍
	</section>
	<section style="clear:both;"></section>
	<section style="float:left;width:100%;border:1px solid #bfbfbf;margin-left:-10px;"></section>
	<section style="float:left;padding:5px 2em 5px 2em;text-indent:2em;letter-spacing:0.5px;">
		211校招网（www.211zph.com）成立于2014年7月，由陕西新才网络技术有限公司开发。总部位于中国西安高新技术开发区，是国内首家按大学生所学专业，学历层次不同，服务高校大学生就业与企业招聘的全国性招聘门户。						
	</section>
	<section style="clear:both;"></section></section>
</section>
</script>
</body>
</html>
