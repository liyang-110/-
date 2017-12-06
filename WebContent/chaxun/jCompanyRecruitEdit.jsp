<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="CompanyRecruitEdit.js"  charset="utf-8"></script>

<link href="../js/layer/skins/default.css" rel="stylesheet" />
<script src="../js/layer/artDialog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/layer/getprovince211.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layer/getposition.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/layer/jobjss.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>


<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
   	function toOpen(){
   		 var level=$("input[name=in_education]").val();
   		if(""==level){
   		   	//$.messager.alert('提示信息','请先选择一种学历, 以显示相对应的专业！','info');
   		   	// return;
   		   	level="level_all";
   		}
		$('#w1').window('open');
		$('#add').attr("src","<%=request.getContextPath()%>/service/jProfessional_com.jsp?level="+level );  
	}
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">岗位名称：</td>
		<td><input onclick="alert('岗位名称不可以编辑!');" id="in_job_name" name="in_job_name" class="easyui-validatebox inputbox" required="true" readonly/></td>
	</tr>
	<tr>
		<td class="tabright">招聘类别：</td>
		<td>
		<label>
		<input type="radio" checked="checked" value="全职" name="in_job_type" />全职</label>
		<label>
		<input type="radio" value="兼职" name="in_job_type" />兼职</label>
		<label>
		<input type="radio" value="实习" name="in_job_type" />实习</label>
		</td>
	</tr>
	<tr>
		<td class="tabright">工作地区：</td>
		<td>
		<input name="areas" id="areas" type="text" class="easyui-validatebox inputbox" required="true"  readonly/>
		<input name="in_area" type="hidden"  id="in_area"/>
		<input  type="button" class="button" value="请选择 " onclick="JumpSearchLayer(2,'fm','in_area','areas',1);" />

		</td>
	</tr>
	<tr>
		<td class="tabright">岗位类别：</td>
		<td>
		<input name="positions" id="positions" type="text" class="easyui-validatebox inputbox" required="true"  readonly/>
		<input id="in_position" name="in_position" type="hidden" />
		<input  type="button" class="button" value="请选择 " onclick="JumpSearchLayer(1,'fm','in_position','positions',1);" />
		
		</td>
	</tr>
	<tr>
		<td  class="tabright">需求人数：</td>
		<td><input id="in_job_person_num" name="in_job_person_num"  required="true" class="easyui-numberspinner" data-options="increment:1,min:1,max:100"/></td>
	</tr>
	<tr>
		<td  class="tabright">性别：</td>
		<td><input id=in_sex name="in_sex" class="easyui-validatebox" editable="false" /></td>
	</tr>
	<tr>
		<td  class="tabright">要求学历：</td>
		<td><input id="in_education" name="in_education" class="easyui-validatebox" editable="false"/></td>
	</tr>
	<tr id="selectProfession" style="display:none;">
		<td class="tabright">招聘专业：</td>
		<td><input id="in_professional" name="in_professional" type="hidden" class="easyui-validatebox" />
		<input onClick="toOpen()" id="professional_name" name="professional_name" type="text"  class="inputbox" readonly />
		<input  type="button" class="button" value="请选择 " onClick="toOpen()"/>
		<a href="javascript:;" onclick="inputProfession();">点击这里输入招聘专业</a>
		</td>
	</tr>
	<tr id="inputProfession">
		<td class="tabright">招聘专业：</td>
		<td><input id="in_profession" name="in_profession" style="width:300px;"/><a href="JavaScript:;" onclick="selectProfession();">点击这里选择专业</a></td>

	</tr>
	<script type="text/javascript">
	function selectProfession()
	{
		$("#inputProfession").hide();
		$("#selectProfession").show();
		$("#in_profession").val("");
	}
	function inputProfession()
	{
		$("#inputProfession").show();
		$("#selectProfession").hide();
		$("#in_professional").val("");
		$("#professional_name").val("");
	}
</script>
	<tr>
		<td  class="tabright">薪资待遇：</td>
		<td>
		<input id="in_money_1" name="in_money_1" class="easyui-numberbox text" style="width:100px;" value="4000" 
                            	data-options="missingMessage:'请输入月薪范围',invalidMessage:'请输入整数',min:0,required:true"/>
                            	-
        <input id="in_money_2" name="in_money_2" class="easyui-numberbox text" style="width:100px;" value="5000" 
                            	data-options="missingMessage:'请输入月薪范围',invalidMessage:'请输入整数',min:0,required:true"/>
                            	
		<input id="in_money" name="in_money" type="hidden"  value="4000-5000" />
		
		<label>
        &nbsp;&nbsp;
        <input id="in_money_cus" type="checkbox" name="in_money_cus" value="1"/>&nbsp;面议
        </label>
		</td>
	</tr>
	<tr>
		<td class="tabright">职位要求：</td>
		<td><textarea cols="60" rows="5" id="in_requirement" name="in_requirement" onkeyup="this.value = this.value.substring(0, 1000)" onmouseout="$(this).trigger('keyup')"></textarea></td>
	</tr>
	
	<tr>
		<td class="tabright">职位描述：</td>
		<td><textarea cols="60" rows="5" id="in_introduction" name=in_introduction onkeyup="this.value = this.value.substring(0, 1000)" onmouseout="$(this).trigger('keyup')"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
<div id="w1" class="easyui-window" title="专业选择（<font color='red'>最多可以选择5个专业</font>）" data-options="modal:true,closed:true,minimizable:false" style="width:520px;height:470px;padding:10px;">
		<div class="treeControl" style="margin:0 auto;height:30px;">
			<a class="easyui-linkbutton expandTree"  href="javascript:;">展开</a>
			<a class="easyui-linkbutton collapseTree" href="javascript:;">收起</a>
			<a class="easyui-linkbutton saveTree" href="javascript:;">确定</a>
			<a class="easyui-linkbutton closeTree" href="javascript:;" onclick="closeProfessionalWindow();">取消</a>
		</div>
		<iframe  frameborder="1" id="add"  scrolling="auto" src="" style="width:100%;height:350px;border:1px solid #95B8E7;"></iframe>
		<div class="treeControl" style="margin:5px auto 0 auto;">
			<a class="easyui-linkbutton expandTree"  href="javascript:;">展开</a>
			<a class="easyui-linkbutton collapseTree" href="javascript:;">收起</a>
			<a class="easyui-linkbutton saveTree" href="javascript:;">确定</a>
			<a class="easyui-linkbutton" href="javascript:;" onclick="closeProfessionalWindow();">取消</a>
		</div>
		<script type="text/javascript">
			function closeProfessionalWindow(){
				$('#w1').window('close');
			}
		</script>
</div>
</body>
</html>
