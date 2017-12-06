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

	<jsp:include  page="./include/north_region.jsp" flush="true">
		<jsp:param name="page" value="main" />
	</jsp:include>
    
	<div data-options="region:'west',split:false,border:false,title:'功能列表',collapsible:false" style="width:220px;padding:0px;">
    <div id='easyui-accordion' class="easyui-accordion" data-options="fit:true,border:false">
		<div title="数据统计" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		   		<div onclick="addTab('企业招聘会预定排行' , 'stat/jCompanyAttendJobfair.jsp')"  >
                企业招聘会预定排行</div>       
		   		<div onclick="addTab('企业下载简历排行' , 'stat/jCompanyOrdersDown.jsp')"  >
                企业下载简历排行</div>
		   		<div onclick="addTab('企业接收简历排行' , 'stat/jCompanyOrdersReceive.jsp')"  >
                企业接收简历排行</div>       
		   		<div onclick="addTab('招聘会企业预定排行' ,'stat/jJobfairCompany.jsp')"  >
                招聘会企业预定排行</div>
		   		<div onclick="addTab('学校企业参会排行' , 'stat/jSchoolCompany.jsp')"  >
                学校企业参会排行</div>
		   		<div onclick="addTab('学校发布招聘会排行' , 'stat/jSchoolJobfair.jsp')"  >
                学校发布招聘会排行</div>
                <div onclick="addTab(' 专业注册学生排行' , 'stat/jProfessionStudent.jsp')"  >
                专业注册学生排行</div>
		   		<div onclick="addTab('学校注册学生排行' , 'stat/jSchoolStudent.jsp')"  >
                学校注册学生排行</div>
                <div onclick="addTab('学历层次期望薪资' , 'stat/jEducationSalary.jsp')"  >
                学历层次期望薪资</div> 
		   		<div onclick="addTab('招聘顾问企业数排行' , 'stat/jAdminCompany.jsp')"  >
                招聘顾问企业数排行</div> 
        

        </div> 
		<div title="走势图统计" data-options="iconCls:'icon-unit'" style=" padding:10px;">
		   		<div onclick="addTab('学生注册与简历投递和下载' , '../esbServer.do?method=execProc&methodId=statistics_query&in_i=true')"  >
                学生注册与简历投递和下载</div>       

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
