<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>UMEDITOR 完整demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor/umeditor.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor/lang/zh-cn/zh-cn.js"></script>
	<style>
		.main-container {
			width:1000px;
			margin:0 auto;
		}
	</style>
	<script type="text/javascript">
	  	$(function(){
  		$('#myEditor').load("templet2.html");
  	});
	</script>
  </head>

  <body>
  <div class="main-container">
<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor" style="width:1000px;height:100%;">
<div class="myEditor">
<div class="content-top">
	<p>top</p>
</div>
<div class="content-body">
	<p>body</p>
	<p align="center">这里我可以写一些输入提示</p>
	<h3>公司简介</h3>
	<ul>
		<li>第一项</li>
		<li>第二项</li>
	</ul>
</div>
<div class="content-bottom">
	<p>bottom</p>
</div>
</div>
    	<style>
		.myEditor {
			font-size:14px;
			width:1000px;
			margin:0 auto;
		}
		.myEditor ul li{
			list-style:none;
		}
		.myEditor .content-top{
			display:block;
			height:150px;
			background:#B22D28;
			color:#FFF;
		}
		.myEditor .content-bottom{
			display:block;
			height:100px;
			background:#7F292B;
		}
	</style>
</script>
 </div>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor', {
	   toolbar:[
            'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
            'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
            '| justifyleft justifycenter justifyright justifyjustify |',
            ' emotion image ', 'formula',
            '| horizontal print preview','fullscreen'
        ] });
</script>
  </body>
</html>
