<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@page import="com.zhaopin.dao.factory.PlaceModel" %>
<%@page import="com.zhaopin.dao.factory.SchoolGraduationModel" %>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<%@page import="com.zhaopin.Station"%>
<% 
	BaseCodeModel baseCodeM= new BaseCodeModel(); 
	String school_id = request.getParameter("school_id");
	String job_fair_id=request.getParameter("id");
%>
<%@include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<script type="text/javascript" src="JobFairUpdate.js" charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	
   	function toOpen(){
   		if( $("input[name=in_job_fair_level]").val() =="" ){
   		   		     $.messager.alert('提示信息','请先选择招聘会学历！','info');
   		   		     return;
   		 }
   		 var level=$("input[name=in_job_fair_level]").val();
   		 var professional=$("input[name=in_professional]").val();
   		 $(".expandTree").show();
   		 $(".collapseTree").show();
   		 $(".treeControl").css("padding-left",0);
		$('#w1').window('open');
		$('#add').attr("src","<%=request.getContextPath()%>/service/jProfessional.jsp?&level="+level+"&professional="+professional );
		$('#w1').window('window').window('center');  
	}
   	function toOpen2(){
   		var professional=$("input[name=in_professional]").val();
   		$(".expandTree").hide();
   		$(".collapseTree").hide();
   		$(".treeControl").css("padding-left","330px");
		$('#w1').window('open');
		$('#add').attr("src","<%=request.getContextPath()%>/service/jProfessional_sch.jsp?&school_id="+school_id+"&professional="+professional );
		$('#w1').window('window').window('center');  
	}
   	function toOpen3(){
		$('#jobfair_place').window('open').window("move",{top:50});//.window('window').window('center');  
	}
   	function toOpen4(){
		$('#grad_info').window('open').window("move",{top:50});//.window('window').window('center');  
	}
</script>
<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('poster_pic_upload_btn', '' ,"in_poster_pic","in_poster_pic_name","pic","uploader",function(d){
	var temp = d.split("|");
		var path = temp[2];
		$("#in_poster_path").val( path );
	});

});
</script>      
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">招聘会类型：</td>
		<td><input id="in_job_fair_type" name="in_job_fair_type" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">招聘会名称：</td>
		<td><input id="in_job_fair_name" name="in_job_fair_name" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">承办单位：</td>
		<td><input id="in_job_fair_organizer" name="in_job_fair_organizer" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">协办单位：</td>
		<td><input id="in_cooperate_organizer" name="in_cooperate_organizer" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">显示分站：<br/>
			<a href="javascript:void(0);" onclick="checkFullArea('.area_id_list',true);return false;">全选</a>
			<a href="javascript:void(0);" onclick="checkFullArea('.area_id_list',false);return false;">全否</a>
			<span>&nbsp;&nbsp;</span>
		</td>
		<td>
			<input type="hidden" id="in_area_id" name="in_area_id" />
			<style>
				ul.area_id_list {margin:0;padding:3px 0 3px 0;}
				ul.area_id_list li {list-style:none;float:left;margin-right:10px;line-height:20px;}
				ul.area_id_list li input {vertical-align: bottom; }
			</style>
			<script>
			 	function checkFullArea( pnode , check )
			 	{
			 		var pdom = $(pnode);
			 		if( check ){
			 			pdom.find("input[type='checkbox']").attr("checked",true);
			 		}else{
			 			pdom.find("input[type='checkbox']").attr("checked",false);
			 		}
			 		resetAreaIdValue();
			 	}
			 	function resetAreaIdValue()
			 	{
			 		$("#in_area_id").val("");
			 		var area_id="";
			 		$(".area_id_list").find("input[type='checkbox']:checked").each(function(){
			 			area_id+=$(this).val()+',';
			 		});
			 		$("#in_area_id").val( area_id );
			 	}
			 	$(function(){
			 		$(".area_id_list input[type='checkbox']").change(function(){
			 			resetAreaIdValue();
			 		});
			 	});
			</script>
		  	 <ul class="area_id_list">
		    <% 
		    AreaModel areaModel =new AreaModel();
		    List area_list=areaModel.getProvionce();
		    if (area_list!=null && area_list.size()>0){
		    	for(Iterator iter=area_list.iterator();iter.hasNext();){
			    	List templist=(List)iter.next();
			    	%>
			    	<li>
			    	<label class="checkbox"><input name="area_id" type="checkbox" value="<%=templist.get(0)%>"/><%=templist.get(1) %></label>
			    	</li>
			    	<%		
			    }
		    }
		     %> <li style="clear:both;"></li>
		     </ul>
		</td>
	</tr>
	<tr>
		<td class="tabright">招聘会时间：</td>
		<td><input id="in_job_fair_time" name="in_job_fair_time" class="easyui-datetimebox" showSeconds="false" required="true"/>
				至
				<input id="in_job_fair_overtime" name="in_job_fair_overtime" class="easyui-datetimebox" showSeconds="false"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">预订截止时间：</td>
		<td><input id="in_job_fair_endtime" name="in_job_fair_endtime" class="easyui-datetimebox" showSeconds="false" /></td>
	</tr>

	<tr>
		<td class="tabright">招聘会学历：</td>
		<td>
		<script type="text/javascript">
			function levelChanged()
			{
				var tempVal ="";
				$("input[name=job_fair_level]").each(function(){
					if(  $(this).attr("checked")=="checked" ){
						tempVal+=$(this).val()+",";
					}
				});
				$("input[name=in_job_fair_level]").val( tempVal );
				$("#professional_name").val("");
				$("#in_professional").val("");
			}
		</script>
		<%
                    List job_fair_level = baseCodeM.codeArray("job_fair_level");
                    for( Iterator it=job_fair_level.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                     %>
					<label>
						<input name="job_fair_level" onclick="levelChanged();" type="checkbox" value="<%=row.get(0) %>" /><%=row.get(1) %>
					</label>
                     <%
                     }
                      %>
                      
		<input id="in_job_fair_level" name="in_job_fair_level" class="easyui-validatebox" required="true" style="border:none;width:0px;" />

		
		</td>
	</tr>
	<!-- 
	<tr>
		<td class="tabright">所需专业：</td>
		<td>
		<input id="professional_name" name="professional_name" type="text"  onfocus="$(this).blur();" style="cursor:default;"/>
		<input  type="button" class="button" value="全部专业 " onClick="toOpen()"/>
		<input  type="button" class="button" value="快速选择毕业生专业 " onClick="toOpen2()"/>
		<input id="in_professional" name="in_professional" class="easyui-validatebox" required="true" style="border:none;width:0;"/>

		</td>
	</tr>
	 -->
	<tr>
		<td class="tabright">毕业生信息：</td>
		<td>
			<input type="hidden" id="in_grad_info_id" name="in_grad_info_id" />
			<input style="width:400px;" id="in_grad_info" name="in_grad_info" class="easyui-validatebox" maxlength="160"/>
			<button onclick="toOpen4();">&nbsp;选&nbsp;择&nbsp;</button>
		</td>
	</tr>
	<tr>
		<td class="tabright">招聘会特色：</td>
		<td><input id="in_job_fair_feature" name="in_job_fair_feature" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">计划单位数：</td>
		<td><input id="in_job_fair_company_num" name="in_job_fair_company_num" class="easyui-numberspinner" data-options="increment:1"  required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">只有本校学生参会：</td>
		<td>
		<script type="text/javascript">
			function intoChanged()
			{
				if($("input[name=into_flag]").attr("checked")=="checked" ){
					$("input[name=in_into_flag]").val($("input[name=into_flag]").val() );
				}else{
					$("input[name=in_into_flag]").val(0);
				}
			}
		</script>
		<label>
			<input name="into_flag" onclick="intoChanged();" type="checkbox" value="1" />
		</label>
		<input id="in_into_flag" name="in_into_flag" class="easyui-validatebox" style="border:none;width:0px;" />
		</td>
	</tr>
	<tr style="display:none;">
		<td class="tabright">招聘会务费：</td>
		<td><input id="in_job_fair_cost" name="in_job_fair_cost"  value="0" class="easyui-numberspinner" data-options="increment:1" /></td>
	</tr>
	<tr  style="display:none">
		<td class="tabright">招聘会简介：</td>
		<td><textarea  cols="60" rows="7" id="in_job_fair_content" name="in_job_fair_content" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td class="tabright">邀请函：</td>
		<td>
		<script id="job_fair_invitation"  name="job_fair_invitation"  type="text/plain" style="width:100%;height:280px;"><%
				String content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id, true );
					out.println( content );
				%></script>
		</td>
	</tr>
	<tr>
		<td class="tabright">招聘会海报：</td>
		<td>		
			<table><tr><td>
				<input name="in_poster_pic_name" type="text" readonly id="in_poster_pic_name" />
				<input type="hidden" name="in_poster_pic" id="in_poster_pic"/>
				<input type="hidden" name="in_poster_path" id="in_poster_path" />
				</td>
				<td><div id="poster_pic_upload_btn" style="line-height:1em;"></div></td>
				<td><span class="red">格式：305px*195px ，大小:<500KB。</span></td>
				</tr>
			</table>
		</td>
    </tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
	<input type="hidden" name="in_place_id" id="in_place_id"/>
</form>
<div id="grad_info" class="easyui-window" title="请选择毕业生信息" data-options="modal:true,closed:true,border:false,maximizable:false,minimizable:false">
	<%
		SchoolGraduationModel gradM=new SchoolGraduationModel();
		List grad_info= gradM.getGradInfoList(school_id);
		if(grad_info!=null && grad_info.size()>0){
	%>
 	<table class="easyui-datagrid" style="width:520px;height:250px"
            data-options="border:false,singleSelect:true,collapsible:false,fitColumns:true,onClickRow:function(index,row){

            			$('#in_grad_info').val( '['+row.g_year+']'+row.g_title );
            			$('#in_grad_info').validatebox('validate');
            			$('#in_grad_info_id').val( $(row.g_id).val() );
            			$('#grad_info').window('close');
            		}">
        <thead>
            <tr>
                <th data-options="field:'g_id',width:20"></th>
                <th data-options="field:'g_year',width:100">场地</th>
                <th data-options="field:'g_title',width:100">乘车路线</th>
            </tr>
        </thead>
        <tbody>
	<%
			for(Iterator it=grad_info.iterator();it.hasNext();){
				HashMap map=(HashMap)it.next();
	%>
				<tr>
				<td><input name="g_id" type="radio" value="<%=map.get("g_id") %>" /></td>
				<td><%=map.get("g_year") %></td>
				<td><%=map.get("g_title") %></td>
				</tr>
	<%
			}
	%>
        </tbody>
    </table>
	<%
		}else{
	%>
	<div style="width:520px;height:250px;padding:30px;text-align:center;">您尚未添加毕业生信息！</div>
	<%
		}
	%>
</div>
<div id="jobfair_place" class="easyui-window" title="请选择招聘会场地" data-options="modal:true,closed:true,border:false,maximizable:false,minimizable:false">
 	<table class="easyui-datagrid" style="width:520px;height:250px"
            data-options="border:false,singleSelect:true,collapsible:false,fitColumns:true,onClickRow:function(index,row){
            			$('#in_job_fair_addr').val( row.title );
            			$('#in_job_fair_bus_route').val( row.bus_route );
            			$('#in_place_id').val( $(row.place_id).val() );
            			$('#jobfair_place').window('close');
            		}">
        <thead>
            <tr>
                <th data-options="field:'place_id',width:20"></th>
                <th data-options="field:'title',width:100">场地</th>
                <th data-options="field:'bus_route',width:100">乘车路线</th>
            </tr>
        </thead>
        <tbody>
	<%
		PlaceModel placeM = new PlaceModel();
		List list= placeM.getPlaceList(school_id);
		if(list!=null && list.size()>0){
			for(Iterator it=list.iterator();it.hasNext();){
				HashMap map=(HashMap)it.next();
	%>
				<tr>
				<td><input name="place_id" type="radio" value="<%=map.get("place_id") %>" /></td>
				<td><%=map.get("title") %></td>
				<td><%=map.get("bus_route") %></td>
				</tr>
	<%
			}
		}
	%>
        </tbody>
    </table>

</div>
<%@include file="../../service/jProfessional_include.jsp" %>
 <script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('job_fair_invitation', {
    	autoHeightEnabled:false
    	,enableAutoSave: false 
    	,initialFrameWidth:525  //初始化编辑器宽度,默认1000
        ,initialFrameHeight:255  //初始化编辑器高度,默认320
    	,toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'emotion','template', 'background', '|',
            'horizontal', 'spechars', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols'
        ]]
	});
</script>
</body>
</html>
