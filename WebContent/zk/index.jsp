<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/checkLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
<title>211校招网精准就业管理系统</title>
<link rel="stylesheet" type="text/css" href="easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="css/wu.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/1.3.4/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
</head>
<body class="easyui-layout">
	<br><br><!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>211校招网精准就业管理系统</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong <% /*class="easyui-tooltip" title="2条未读消息" */ %>><%=user_id %></strong>，欢迎您！</p>
            <p><a href="http://www.211zph.com" target="_blank">网站首页</a>|<a href="help.jsp">帮助中心</a>|<a href="login.do?action=logout">安全退出</a></p>
        </div>
    </div>
    <!-- end of header -->
    <!-- begin of sidebar -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false,fit:true"> 
            <%--
            <div title="企业管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="company/jCompanySearch.jsp" iframe="1">企业信息管理</a></li>
                    <% /*
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="company/jCompanyMessage.jsp" iframe="1">企业消息查询</a></li>
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="company/jEntPointsInfo.jsp" iframe="1">企业点数查询</a></li>
                	*/ %>
                 </ul>
            </div>
             --%>
            <div title="学生管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="student/jStudentSearch.jsp" iframe="1">学生信息管理</a></li>
                 </ul>
            </div>
            <div title="注册推广" data-options="iconCls:'icon-cart'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                   <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="ad/jSetting.jsp" iframe="1">推广说明</a></li>
                   <%-- 
                   <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="ad/jAdCompany.jsp" iframe="1">推广企业</a></li>
                   --%>
                   <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="ad/jAdStudent.jsp" iframe="1">推广学生</a></li>
                   
                   <% /* 
                    <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="temp/layout-3.html" iframe="0">推广日志</a></li>
                    <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="temp/layout-3.html" iframe="0">推广统计</a></li>
                	*/ %>
                </ul>
            </div>
            <%-- if("second".equals(zk_type)) { %>
            <div title="结算中心" data-options="iconCls:'icon-chart-curve'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="charge/jEntBillSearch.jsp" iframe="1">佣金明细</a></li>
                	<% /*
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="charge/jSubCheckSearch.jsp" iframe="1">结算查询</a></li>
                    */ %>
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="charge/jPaymentSearch.jsp" iframe="1">支付记录</a></li>
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="charge/jAccountInfo.jsp" iframe="1">账户查询</a></li>
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="readme.jsp" iframe="0"> 指导师收益</a></li>

                </ul>
            </div>
            <%} --%>
            <div title="个人中心" data-options="iconCls:'icon-wrench'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="user/jLoginEdit.jsp" iframe="1">账户资料</a></li>
                    <!--
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="temp/layout-3.html" iframe="0">分站设置</a></li>
                     
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="editPass();" iframe="3">修改密码</a></li>
                    <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="login.do?action=logout" iframe="2">退出系统</a></li>
             		-->
              </ul>
            </div>
        </div>
    </div>	
    <!-- end of sidebar -->    
    <!-- begin of main -->
    <div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">  
            <%/* 
            <div title="首页" data-options="href:'readme.jsp',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        	
            <div title="企业信息管理"  data-options="closable:false,iconCls:'icon-tip',cls:'pd3'">
	        	 <div class="easyui-panel" data-options="fit:true,border:false" style="padding:0;margin:0;overflow:hidden;">
	        	 	<iframe src="company/jCompanySearch.jsp" width="100%" height="100%" frameborder="0"></iframe>
	        	 </div>
        	</div>
        	*/ %>
        </div>
    </div>
    <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">
    	&copy; 2014 <a href="http://www.211zph.com/" target="_blank">www.211zph.com</a> All Rights Reserved
    </div>
    <!-- end of footer -->  
    <script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe');
				addTab(title,url,iconCls,iframe);
			});	
			var tabPanel = $('#wu-tabs');
			/*
			if(!tabPanel.tabs('exists','企业信息管理')){
                var content ='<div class="easyui-panel" data-options="fit:true,border:false" style="padding:0;margin:0;overflow:hidden;"><iframe src="company/jCompanySearch.jsp" width="100%" height="100%" frameborder="0"></iframe></div>';  
				tabPanel.tabs('add',{
					title:'企业信息管理',
					content:content,
					iconCls:'icon-chart-organisation',
					fit:true,
					cls:'pd3',
					closable:false
				});
			}// 初始化首页选项卡
			*/
			if(!tabPanel.tabs('exists','学生信息管理')){
                var content ='<div class="easyui-panel" data-options="fit:true,border:false" style="padding:0;margin:0;overflow:hidden;"><iframe src="student/jStudentSearch.jsp" width="100%" height="100%" frameborder="0"></iframe></div>';  
				tabPanel.tabs('add',{
					title:'学生信息管理',
					content:content,
					iconCls:'icon-chart-organisation',
					fit:true,
					cls:'pd3',
					closable:false
				});
			}// 初始化首页选项卡
		});
		/**
		* Name 载入树形菜单 
		*/
		$('#wu-side-tree').tree({
			url:'temp/menu.php',
			cache:false,
			onClick:function(node){
				var url = node.attributes['url'];
				if(url==null || url == ""){
					return false;
				}
				else{
					addTab(node.text, url, '', node.attributes['iframe']);
				}
			}
		});
		
		/**
		* Name 选项卡初始化
		*/
		$('#wu-tabs').tabs({
			tools:[{
				iconCls:'icon-reload',
				border:false,
				handler:function(){
					var tab = $('#wu-tabs').tabs('getSelected');
					console.info(tab.panel("options").content);
					tab.panel("refresh");
					// $('#wu-datagrid').datagrid('reload');
				}
			}]
		});
				
		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/	
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				// var content = '<iframe frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
                var content ='<div class="easyui-panel" data-options="fit:true,border:false" style="padding:0;margin:0;overflow:hidden;"><iframe src="'+href+'" width="100%" height="100%" frameborder="0"></iframe></div>';  
				if(iframe==1){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else if(iframe==0){
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}else if(iframe==2){
					window.location=href;
				}else if(iframe==3){
					eval( href );
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
        function msgShow(title,msg,icom)
        {
        	$.messager.alert(title,msg,icom);
        }
		function editPass()
		{
			$('#editPassw').window('open');
		}
        function serverEditPass() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请再输入一次密码！', 'warning');
                return false;
            }
            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_user_update&in_user_code=<%=user_code%>&date=" + new Date();
            $.post(ls_url, {in_user_pass:$newpass.val() }, function(data, textStatus){
            	data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
	                msgShow('系统提示', '恭喜，密码修改成功！' , 'info');
	                $newpass.val('');
	                $rePass.val('');
	                $('#editPassw').window('close');
				}else{
	                msgShow('系统提示', '未知错误！' , 'error');
				}
            });
        }
		$(function(){
            $('#editPassw').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 170,
                resizable:false
            });
		    $('#btnEp').click(function() {
		                serverEditPass();
		    });
			$('#btnCancel').click(function(){$('#editPassw').window('close');});
        });
	</script>
<div id="editPassw" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" 
        maximizable="false" icon="icon-save"  style="width: 300px; height: 175px; padding: 5px;
        background: #fafafa;">
      <div class="easyui-layout" fit="true">
    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
          <table cellpadding=3>
        <tr>
              <td>新密码：</td>
              <td><input id="txtNewPass" type="Password" class="txt01" /></td>
            </tr>
        <tr>
              <td>确认密码：</td>
              <td><input id="txtRePass" type="Password" class="txt01" /></td>
            </tr>
      </table>
        </div>
	    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 20px;">
	    <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" > 确定</a>
	    <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
	    </div>
	  </div>
</div>
</body>
</html>
