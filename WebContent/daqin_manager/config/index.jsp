<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>211校招网管理平台</title>
	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
		var cur_path = "<%=request.getContextPath()%>";
	</script>
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui/themes/icon.css">
<script src="../js/jquery-easyui/jquery.min.js"></script>
<script src="../js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main.css">

</head>
<body class="easyui-layout" >
	<jsp:include  page="../include/north_region.jsp" flush="true"/>
	<div data-options="region:'west',split:true,border:false,title:'功能列表'" style="width:220px;padding:0px;">
    <div id='easyui-accordion' class="easyui-accordion" data-options="fit:true,border:false">
        <div title="网站设置" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		   		<div  onclick="addTab('uploadLogo', './jUploadLogo.jsp')"  >网站LOGO</div>
		   		<div  onclick="addTab('pageContent','./page/jBottomContent.jsp')"  >单页管理</div>
		   		<div  onclick="addTab('siteConfig' ,'./jSetting.jsp')"  >基本设置</div>
				<div  onclick="addTab('memberType','./member/')"  >企业会员设置</div>
				<div  onclick="addTab('zkSetting','zk/jSetting.jsp')"  >招客系统选项</div>

         </div>
        <div title="基础数据" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		   		<div onclick="addTab('procMethods','./jBaseProcMethod.jsp')"  >存储管理</div>
		   		<div onclick="addTab('adminMenu' , './user/jMenuSearch.jsp')"  >
                操作管理</div>
	   		<div onclick="addTab('mailTemplate' , './mail/jMailTemplate.jsp')"  >
                邮件模版</div>
	   		<div onclick="addTab('fuwuDefine' , './fuwu/index.jsp')"  >
                服务套餐</div>
         </div>
	</div>

    </div>
	<div data-options="region:'south',border:false" style="height:20px; background-image:url(img/bottom-bg.png);padding:10px;"></div>
	<div data-options="region:'center',border:false" " style="overflow:hidden;">
    <div class="easyui-tabs" data-options="fit:true,border:false" id="tt" style="overflow:hidden;">
		<div title="首页" style="padding:10px"  data-options="iconCls:'icon-desktop',fit:true" style="overflow:hidden;">
			<!-- 
			目前共有<span class="salient"> <%=application.getAttribute("numSessions")%> </span>人在线
			-->
		</div>
	</div>
    </div>
<div id="dlg" title="Main Dialog" style="height:100%"></div>
<div id="win" title="Main Window"></div>
</body>

<script type="text/javascript">  
        var index = 'error';
        function addTab(index,url){  
		   var txtTitle;
		   var icon;
		   switch(index)
		   { 
			    case "siteConfig":
			    	txtTitle ="信息设置";
					icon = "icon-desktop";
			    	break;
			    case "uploadLogo":
			    	txtTitle ="上传LOGO";
					icon = "icon-desktop";
			    	break;
			    case "procMethods":
			    	txtTitle ="存储管理";
					icon = "icon-desktop";
			    	break;
			    case "pageContent":
			    	txtTitle ="单页管理";
					icon = "icon-desktop";
			    	break;
			    case "memberType":
			    	txtTitle ="企业会员设置";
			    	icon ="icon-desktop";
			    	break;
			    case "adminMenu":
			    	txtTitle ="操作管理";
					icon = "icon-desktop";
			    	break;
			    case "zkSetting":
			    	txtTitle ="招客系统选项";
					icon = "icon-desktop";
			    	break; 
			    case "mailTemplate":
			    	txtTitle ="系统邮件模板";
					icon = "icon-desktop";
			    	break; 
			    case "fuwuDefine":
			    	txtTitle ="招聘会服务套餐";
					icon = "icon-desktop";
			    	break; 
				default: 
					index = 'error';
					break;
		   }
		   if(index=='error'){alert("无效的请求！");return;}
			var e =$('#tt').tabs('exists',txtTitle);
			 if(e==true){
			  $('#tt').tabs('select',txtTitle);
			  return ;
			 }
			var height = $('#easyui-accordion').height()+15; 
            $('#tt').tabs('add',{  
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
