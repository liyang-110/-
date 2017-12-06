<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="include/checkLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>211校招网管理平台</title>
	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
		var cur_path = "<%=request.getContextPath()%>";
		var id="<%=user_code%>"
	</script>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css">
<script src="js/jquery-easyui/jquery.min.js"></script>
<script src="js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript">
        //设置登录窗口
        function openPwd() {
            $('#editpassw').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 170,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#editpassw').window('close');
        }
        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_login_edit&r=ad&in_id=" + id+"&date=" + new Date();
            $.post(ls_url, {in_passwd:$newpass.val() }, function(data, textStatus){
            	data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
	                msgShow('系统提示', '恭喜，密码修改成功！' , 'info');
	                $newpass.val('');
	                $rePass.val('');
	                closePwd();
				}else{
	                msgShow('系统提示', '未知错误！' , 'error');
				}
            });
            
        }
        function msgShow(title,msg,icom)
        {
        	$.messager.alert(title,msg,icom);
        }
	    $(function(){
	           	openPwd();
	            $('#editpass').click(function() {
	                $('#editpassw').window('open');
	            });
		        $('#btnEp').click(function() {
		                serverLogin();
		        })
				$('#btnCancel').click(function(){closePwd();})
	     });
</script>
</head>
<body class="easyui-layout" >

	<jsp:include  page="./include/north_region2.jsp" flush="true">
		<jsp:param name="page" value="main" />
	</jsp:include>
    
	<div data-options="region:'west',split:false,border:false,title:'功能列表',collapsible:false" style="width:192px;padding:0px;">
    <div id='easyui-accordion' class="easyui-accordion" data-options="fit:true,border:false">
         <div title="资讯管理" data-options="iconCls:'icon-unit'" style=" padding:10px;">
             <div onclick="addTab('最新动态' ,'./news/jNewsSearch02.jsp')">
                 新闻资讯</div>
			 <div onclick="addTab('名企招聘' ,'./news/jNewsSearch01.jsp')">
       	名企招聘</div>
             <div onclick="addTab('招聘会现场' ,'./news/jNewsSearch05.jsp')">
                 招聘会现场</div>
       <%--
             <div onclick="addTab('招聘信息' ,'./news/jNewsSearch03.jsp')">
                招聘信息</div>
             <div onclick="addTab('简历模板' ,'./news/jNewsSearch06.jsp')">
                简历模板</div>
             <div onclick="addTab('网友投稿' ,'./news/jNewsSearch07.jsp')">
                网友投稿</div>
        --%>
         </div>
 <div title="企业资源" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		<%--
				<div onclick="addTab('机关事业' ,'<%=request.getContextPath() %>/spider/robot.do')">
                 机关事业</div>
				<div onclick="addTab('国企名企' ,'<%=request.getContextPath() %>/spider/zpxx.do')">
                 国企名企</div>
                 <div onclick="addTab('编辑发布' ,'spider/jPlaceSearch.jsp')">
                 编辑发布</div>
        
                 <div onclick="addTab('宣讲会' ,'<%=request.getContextPath() %>/spider/zpxx.do?type=jobfair')">
                 宣讲会</div>
        --%>
        
                 <div onclick="addTab('企业资源管理' ,'spider/jNewsCjSearch.jsp')">
                 企业资源管理</div>
        <!--          
                 <div onclick="addTab('企业资源统计' ,'spider/statistical.jsp')">
                 企业资源统计</div>
        -->        
                 <div onclick="addTab('地区资源统计' ,'spider/jStatisticalArea.jsp')">
                 地区资源统计</div>
                 <div onclick="addTab('学校资源统计' ,'spider/jStatisticalSchool.jsp')">
                 学校资源统计</div>
          </div>
	
		<div title="广告管理" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		   		<div onclick="addTab('广告管理' , 'advertisement/jNewAD.jsp')"  >
                广告管理</div>       
		   		<div onclick="addTab('友情链接' , 'advertisement/jADSearch.jsp')"  >
                友情链接</div> 
		   		<div onclick="addTab('文字广告' , 'advertisement/jTextADSearch.jsp')"  >
               文字广告</div>  
             <div onclick="addTab('微信推广任务' ,'./news/jWeixinPublishTask.jsp')">
                微信推广任务</div>
             <div onclick="addTab('微信推广记录' ,'./news/jWeixinPublishLog.jsp')">
                微信推广记录</div>
        </div> 

      
	</div>

    </div>
	<div data-options="region:'south',border:false" style="height:20px; background-image:url(img/bottom-bg.png);padding:10px;"></div>
	<div data-options="region:'center',border:false" " style="overflow:hidden;">
    <div class="easyui-tabs" data-options="fit:true,border:false" id="tt" style="overflow:hidden;">
		<div title="首页" style="padding:10px"  data-options="iconCls:'icon-desktop',fit:true" style="overflow:hidden;">
			<iframe src='statistical.jsp' frameborder="0" width="100%" height="100%" fit="true" style="padding:0;margin:0;">
			</iframe>
		</div>
	</div>
    </div>
    
 <div id="editpassw" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" 
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

<div id="dlg" title="Main Dialog" style="height:100%"></div>
<div id="win" title="Main Window"></div>
</body>

<script type="text/javascript">  
		$('#tt').tabs({
			tools:[{
				iconCls:'icon-reload',
				border:false,
				handler:function(){
						var tab = $('#tt').tabs('getSelected');
						var options = tab.panel('options');
						var index =  $('#tt').tabs('getTabIndex',tab);
						if(index!=0){
							$('#tt').tabs('close', index); 
							$('#tt').tabs('add', options);
						} else{
							window.location.reload();
						}
				}
			}]
		});

        function addTab(title,url){  
		   var txtTitle;
		   var icon;
			   	txtTitle = title;
				icon = "icon-desktop";
			var e =$('#tt').tabs('exists',txtTitle);
			 if(e==true){
			  $('#tt').tabs('select',txtTitle);
			  return ;
			 }
			var height = $('#easyui-accordion').height()+15; 
            var tabPanel =$('#tt');
            tabPanel.tabs('add',{  
                title: txtTitle,  
              //  href: 'index.php',
                content:'<div class="easyui-panel" data-options="fit:true,border:false" style="padding:0;margin:0;overflow:hidden;"><iframe src='+url+' width="100%" height='+height+' frameborder="0"></iframe></div>',  
                closable: true,
				fit:true,
				iconCls:icon,
				border:false,
				style:{overflow:"hidden"}
            });
             
        }  
</script>
<script type="text/javascript">
function loadwindow(title,url)
{
	$('#win').html('数据正在加载，请稍候……');
	$('#win').load(url);
	$('#win').css({height:$(window).height()-100,width:$(window).width()-160});
	$('#win').window({
		title:title,
		iconCls:'icon-search',
		modal:true,
		shadow:true,
		collapsible:false,  
		minimizable:false,  
		maximizable:true,
		resizable:true
	});
}
function openwindow(title,url,refresh)
{
	$('#win').css({height:$(window).height()-100,width:$(window).width()-260});
	$('#win').window({
		title:title,
		iconCls:'icon-search',
		modal:true,
		shadow:true,
		collapsible:false,  
		minimizable:false,  
		maximizable:true,
		resizable:true,
		cache:false,
		loadingMessage:'请稍候……'
	});
	if(refresh)$('#win').window({onClose:refreshCurTab});
	else $('#win').window({onClose:''});
	
	$('#win').window('refresh',url);
}
function opendialog(data)
{
	$('#dlg').css({width:"400px",height:"200px",padding:"10px"});
	$('#dlg').dialog({
				modal:true,
				title:'Message',
				closed:true,
				shadow:false,
				content:data['msg']
				});
	if(data['action']=='confirm'){
	$('#dlg').dialog({
				buttons:[{ 
						text:'确定',
						iconCls:'icon-ok',
						handler:function(){
								$('#dlg').dialog('close');
								data['confirm'](data);}
						},{
						text:'取消',
						handler:function(){
								$('#dlg').dialog('close');
							}
						}]
				});
	}else{
		$('#dlg').dialog({
			buttons:[{
					text:'关闭',
					handler:function(){
							$('#dlg').dialog('close');
						}
					}]
			});	
	}
	$('#dlg').dialog('open');
}
function refreshCurTab()
{
	var tab = $('#tt').tabs('getSelected');
	tab.panel('refresh');
}
</script>
</html>
