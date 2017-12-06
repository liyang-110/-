<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.zhaopin.dao.factory.ProfessionalModel" %>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@page import="com.zhaopin.dao.factory.AreaModel" %>
<% ProfessionalModel model = new ProfessionalModel(); %>
<% BaseCodeModel baseCodeM= new BaseCodeModel(); %>
<% AreaModel areaM= new AreaModel(); %>
<div class="row f_sec_x  pull-left">
<form action="<%=request.getContextPath() %>/search.do" method="get" style="margin:0;">
      <input type="hidden" name="action" value="search"/>
            <script type="text/javascript">
            	function hiddenLevel()
            	{
            		$(".s_panel.level").find("a[data]").each(function(){
							var level  =  $(this).attr("data");
							$(".job_fair_"+level).hide();
					});
            	}
				$(function(){
					hiddenLevel();
					$('#select_professional_btn').bind("click",function(){
						$(".s_panel").hide();
						$(".close_btn_for_spanl").hide();
						var level= $("#in_level").val();
						if(level==""){
							$(".s_panel.level").find(".error_msg").show();
							$('#select_level_btn').trigger("click");
						}else{
							hiddenLevel();
							$(".job_fair_"+level).show();
							$(".s_panel.professional").show();
							// $(".close_btn_for_spanl").show();
							$("#professional_tabs a:first").tab("show");
							$(".job_fair_"+level+":visible").first().find("a").trigger("click");
						}
						
					});
					$('#select_level_btn').bind("click",function(){
						$(".s_panel").hide();
						$(".s_panel.level").show();
						$(".close_btn_for_spanl").show();
						
						$("input[name=s_professional]").val("选择专业");
						$("input[name=s_professional]").attr("title","选择专业");
						$("input[name=in_professional]").val("");
						
					});
					$('#select_city_btn').bind("click",function(){
						$(".s_panel").hide();
						$(".s_panel.city").show();
						$(".close_btn_for_spanl").show();
					});
					$(".close_btn_for_spanl").bind("click",function(){
						$(".s_panel").hide();
						$(".close_btn_for_spanl").hide();
					});
					$(".close_button_for_spanl").bind("click",function(e){
						e.preventDefault();
						$(".s_panel").hide();
						$(".close_btn_for_spanl").hide();
					});
					$(".s_panel.level a").bind("click",function(e){
						e.preventDefault();
						$(".s_panel.level").find(".error_msg").hide();
						$("input[name=s_level]").val( $(this).text() );
						$("input[name=in_level]").val( $(this).attr("data") );
						$(".close_btn_for_spanl").trigger("click");
					});
					$(".s_panel.city a").bind("click",function(e){
						e.preventDefault();
						$("input[name=s_city]").val( $(this).text() );
						$("input[name=in_city]").val( $(this).attr("data") );
						$(".close_btn_for_spanl").trigger("click");
					});
					$("#professional_tabs a").bind("click",function(e){
						e.preventDefault();
						$(this).tab("show");
					});
					$("#professional_tab_content dt label input").bind("click",function(){
							if( $(this).attr("checked") =="checked" ){
								$("#professional_tab_content").find("input[type=checkbox]").attr("checked",false);
								$(this).attr("checked",true);
								$(this).parent().parent().siblings("dd").each(function(index, element) {
                                    $(this).find("input[type=checkbox]").attr("checked",true);
                                });;
							}else if( $(this).attr("checked") !="checked" ){
								$(this).parent().parent().siblings("dd").each(function(index, element) {
                                    $(this).find("input[type=checkbox]").attr("checked",false);
                                });;
							}
							professional_selected( $(this) );
					});
					$("#professional_tab_content dd label input").bind("click",function(){
							if( $(this).attr("checked") =="checked" ){
								$(this).parent().parent().parent().siblings("dl").each(function(index, element) {
                                    $(this).find("input[type=checkbox]").attr("checked",false);
                                });
							}else if( $(this).attr("checked") !="checked" ){
								$(this).parent().parent().siblings("dt").each(function(index, element) {
                                    $(this).find("input[type=checkbox]").attr("checked",false);
                                });;
							}
							professional_selected( $(this) );
					});
				});
				function professional_selected( checkbox )
				{
					var label="";
					var value="";
					if (checkbox.attr("ref") =="type" ){
						if( checkbox.attr("checked") =="checked"){
							label=checkbox.parent().text();
							// value=checkbox.val();
							var dl = checkbox.parent().parent().parent();
							dl.find("dd input").each(function(){
								 if(  $(this).attr("checked")=="checked" ){
								 	value+=$(this).val()+",";
								 }
							});
						}else{
							label="";
							value="";
						}
					}else if (checkbox.attr("ref") =="item" ){
						var dl = checkbox.parent().parent().parent();
						dl.find("dd input").each(function(){
							 if(  $(this).attr("checked")=="checked" ){
							 	label+=$(this).parent().text()+",";
							 	value+=$(this).val()+",";
							 }
						});
					}
					$("input[name=s_professional]").val(label);
					$("input[name=s_professional]").attr("title",label);
					$("input[name=in_professional]").val(value);
				}
			</script>
             <div class="input-append" style="width:134px; height:30px;" id="select_level_btn">
            <input type="text" id="s_level" name="s_level"  class="uneditable-input" value="<%=request.getAttribute("s_level")==null? "选择学历":request.getAttribute("s_level").toString() %>"  title=""  style="width:120px;" />
            <input type="hidden" id="in_level" name="in_level" value="<%=request.getAttribute("in_level")==null? "":request.getAttribute("in_level").toString() %>" />
            <button class="btn" type="button">&nbsp;<span class="caret"></span>&nbsp;</button>
             </div>
           <div class="input-append" style="width:234px; height:30px;" id="select_professional_btn">
            <input type="text" id="s_professional" name="s_professional"  class="uneditable-input " value="<%=request.getAttribute("s_professional")==null? "选择专业":request.getAttribute("s_professional").toString() %>"
            	 title="<%=request.getAttribute("s_professional")==null? "选择专业":request.getAttribute("s_professional").toString() %>"   style="width:220px;"/>
            <input type="hidden" id="in_professional" name="in_professional" value="<%=request.getAttribute("in_professional")==null? "":request.getAttribute("in_professional").toString() %>" />
            <button class="btn" type="button">&nbsp;<span class="caret"></span>&nbsp;</button>
             </div>
             <div class="input-append" style="width:134px; height:30px;" id="select_city_btn">
            <input type="text" id="s_city" name="s_city"  class="uneditable-input" value="<%=request.getAttribute("s_city")==null? "选择地市":request.getAttribute("s_city").toString() %>" style="width:120px;"/>
             <input type="hidden" id="in_city" name="in_city" value="<%=request.getAttribute("in_city")==null? "":request.getAttribute("in_city").toString() %>" />
             <button class="btn" type="button">&nbsp;<span class="caret"></span>&nbsp;</button>
             </div>
            <div style="clear:both;"></div>
            <div style="position:absolute; height:0; overflow:visible; margin-top:-40px; padding-top:30px; width:510px; ">
            		<div class="s_panel professional tabs-left">
            		<%
            		 List proList = model.getProfessionalTree();
            		 %>
                    	<ul class=" nav-tabs" id="professional_tabs">
                    	<%
							for(Iterator iter = proList.iterator(); iter.hasNext(); )
							{
								List title=(List)iter.next();
                    	 %>
                    	 		<li class="job_fair_<%=title.get(3)%>"><a href="#pro_<%=title.get(0) %>" title="<%=title.get(1) %>"><%=title.get(1) %></a></li>
                    	 <%
                    	 	}
                    	  %>
                        </ul>
<div class="tab-content" id="professional_tab_content">
<%
    
	for(Iterator it = proList.iterator(); it.hasNext(); )
	{
		List row = (List)it.next();
		%>
		<div class="tab-pane" id="pro_<%=row.get(0) %>">
		<%
		//out.println( row.get(1) );	
		if(row.size()>4 && row.get(4) instanceof List){
			List list2 = (List)row.get(4);
			for(Iterator it2 = list2.iterator(); it2.hasNext(); )
			{
				List row2=(List)it2.next();
				%>
				<dl class="job_fair_<%=row2.get(3)%>"><dt><label class="checkbox"><input value="<%=row2.get(0) %>" type="checkbox" ref="type" /><%=row2.get(1) %></label></dt>
				<%
				// out.println( row2.get(1) );	
				if(row2.size()>4 && row2.get(4) instanceof List){
					List list3=(List)row2.get(4);
					for(Iterator it3=list3.iterator(); it3.hasNext(); )
					{
						List row3=(List)it3.next();
						%>
						<dd><label class="checkbox"><input type="checkbox" value="<%=row3.get(0) %>" ref="item" /><%=row3.get(1)  %></label></dd>
						<%
						//out.println( row3.get(1) );	
					}
				}
				%>
				</dl>
				<%
			}
		}
		%>
		</div>
		<%
	}
%>
		<div style="position:absolute;top:8px;right:-23px;">
			<button class="btn btn-warning btn-mini close_button_for_spanl" style="heigth:26px;width:20px;padding:0;font-size:13px">确定</button>
		</div>
</div>
                     	 <div style="clear:both;"></div>   
                    </div>
                    <div class="s_panel level">
                    <ul>
                    <li><a href="" data="">不限</a></li>
                    <%
                    List job_fair_level = baseCodeM.codeArray("job_fair_level");
                    for( Iterator it=job_fair_level.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                     %>
					<li>
						<a href="#" data="<%=row.get(0) %>"><%=row.get(1) %></a>
					</li>
                     <%
                     }
                      %>
                      <li class="error_msg" style="display:none;color:red;">←请选择学历！</li>
                      </ul>
                		<div style="clear:both;"></div>
                    </div>
                    <div class="s_panel city">
					<a href="" data="">不限</a>
                    <%
                    List areaList = areaM.getProvionce();
                    for( Iterator it=areaList.iterator();it.hasNext();)
                    {
                    	List row =(List)it.next();
                     %>
                     <a href="" data="<%=row.get(0) %>"><%=row.get(1) %></a>
                     <%
                     }
                      %>

                        <div style="clear:both;"></div>
                    </div>
                    <div class="close_btn_for_spanl"><a hef="#">X</a></div>
            </div>
            <div style="clear:both;"></div>
            <input type="text" id="in_key" name="in_key" style="width:358px;" placeholder="请输入学校或招聘会名称" 
             	value="<%=request.getAttribute("in_key")==null? "":request.getAttribute("in_key").toString() %>" />
            <button class="btn btn-success " style="font-size:16px; font-family:simhei; font-weight:100;width:135px; height:30px; margin-bottom:10px; letter-spacing:2px;" >搜招聘会</button>
            
             <div style="clear:both;"></div>
      </form>
</div>
<!-- f_sec_4 -->
            <div class="row f_sec_4  pull-left" style="margin-left:-40px;font-size:13px;width:90px;overflow:hidden;">
            	<style type="text/css">
            		.f_sec_4 a {color:#52A552;} 
            		.f_sec_4 a:hover {font-weight:bold;}
            	</style>
            	<div style="padding-top:16px;color:#99BD43;">
            	<a href="/shaanxi">陕西站</a>
            	<a href="/beijing">北京站</a>
            	<a href="/sichuan">四川站</a>
            	<a href="/guangdong">广东站</a>
            	<a href="/guangxi">广西站</a>
            	</div>
            </div>