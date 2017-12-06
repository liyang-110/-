<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="w1" class="easyui-window" title="专业选择（<font color='red'>最多可以选择100个专业</font>）" data-options="modal:true,closed:true,minimizable:false" style="width:520px;height:470px;padding:10px;">
		<div class="treeControl" style="margin:0 auto;height:30px;">
			<a class="easyui-linkbutton expandTree"  href="javascript:;">展开</a>
			<a class="easyui-linkbutton collapseTree" href="javascript:;">收起</a>
			&nbsp;&nbsp;&nbsp;<input name="filter" value="" /><a class="easyui-linkbutton chaxunBtn" href="javascript:;" >查询</a>
		</div>
		<iframe  frameborder="1" id="add"  scrolling="auto" src="" style="width:100%;height:350px;border:1px solid #95B8E7;"></iframe>
		<div class="treeControl" style="margin:5px auto 0 auto; text-align:right;">
			<a class="easyui-linkbutton saveTree" href="javascript:;">确定</a>
			<a class="easyui-linkbutton" href="javascript:;" onclick="closeProfessionalWindow();">取消</a>
		</div>
		<script type="text/javascript">
			function closeProfessionalWindow(){
				$('#w1').window('close');
			}
			$(document).ready(function(){
				/*
				key = $("input[name='filter']");
				key.bind("focus", focusKey)
				.bind("blur", blurKey)
				.bind("propertychange", searchNode)
				.bind("input", searchNode);
				*/
				$(".chaxunBtn").bind("click",searchNode);
			});
			function searchNode(e)
			{
				$("#add")[0].contentWindow.getNodesByParamFuzzy( $("input[name='filter']").val() );
			}
			function focusKey(e) {
				if (key.hasClass("empty")) {
					key.removeClass("empty");
				}
			}
			function blurKey(e) {
				if (key.get(0).value === "") {
					key.addClass("empty");
				}
			}
		</script>
</div>