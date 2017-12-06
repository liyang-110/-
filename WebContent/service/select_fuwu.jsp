<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.Model" %>
<%@ include file="../company/inc/checkLogin.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String job_fair_id=request.getParameter("job_fair_id");
		
String job_fair_name=null;
String job_fair_date=null;
String points1=null;
String points=null;
if(job_fair_id==null || user==null )
{
	%>
		<script type="text/javascript">
			window.location.href='<%=request.getContextPath()%>/';
		</script>
	<%
	// response.sendRedirect( request.getContextPath()+"/");
}else{

	String sql=" select * from (select job_fair_name,school_id,to_char(job_fair_time,'YYYY\"年\"fmMM\"月\"DD\"日\"') job_fair_date "+
				" from tbl_job_fair where job_fair_id='"+job_fair_id.split(",")[0]+"' "+
				" ) a left join (select points1 from tbl_config where rownum=1) b on 1=1 "+
				" left join ( select decode(points,null,0,points) points from tbl_login where user_code='"+user_code+"') c on 1=1";
	Model model  = new Model();
	HashMap map = model.findMap(sql);
	if(map!=null){
		job_fair_name=(String)map.get("job_fair_name");
		points1= ( (java.math.BigDecimal)map.get("points1") ).toString();
		job_fair_date = (String)map.get("job_fair_date");
		points = ( (java.math.BigDecimal)map.get("points") ).toString();
	}
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select_fuwu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=request.getContextPath() %>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/styles/global.css" />

<script src="<%=request.getContextPath() %>/assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/jquery/jquery.form.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/company/css/main.css"/>

<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<style type="text/css">
table.price td,table.price {
	margin-bottom:0;
}
table.price td,table.price td {
	text-align: left !important;
	vertical-align: middle;
	font-size:14px;
	line-height:120%;
}
table.price thead th {
	padding-left: 0;
	padding-right: 0;
	text-align: center;
	font-size:14px;
}
table.price tbody th {
	width: 50px !important;
}
span.points { font-weight:bolder;color:#2A6C48;}
</style>
 <script type="text/javascript">
  	function recalculate()
  	{
  		$("#points_last").text( parseInt( $("#points_accounts").text() )-parseInt( $("#total_points").text() ) );
  		if( $("#points_last").text()<0 ){
  			$("#not_enough").show();
  			$("#points_last").css("color","#F00");
  		}else{
  			$("#not_enough").hide();
  			$("#points_last").css("color","#2A6C48");
  		}
  	}
	function msg_alert(title,msg,icon,in_func)
	{
			art.dialog({
				title: title , // '提示信息',
				content: msg,
				icon: icon, // 'face-smile',
				fixed: true,
				lock:false,
				id:'alert',
				ok: function(){
						if(in_func!=undefined){
							in_func();
						}
						this.close();
					}
			});
	}
  	function selectFuwu(taocan,points ){
  		$("#total_points").text( parseInt( $("#jobfair_counts").text() )*parseInt(points)+parseInt( $("#jobfair_points").text() ) );
  		recalculate();
  	}
  	$(function(){
  		recalculate();
  	});
  </script>
  </head>
  
  <body style="background:#FFF;">
  <%
  	String[] job_fair = job_fair_id.split(",");
  %>
<div style="width:650px;margin:0 auto;"  class="main_body">
 <p>您选择了<span class="points" id="jobfair_counts"><%=job_fair.length %></span>场招聘会，
 需支付<span class="points" id="jobfair_points"><%=job_fair.length*Integer.parseInt(points1) %></span>点。您还可以选择以下招聘会服务套餐：</p>

<form name="fm" id="fm" method="post" style="margin-bottom:5px;">
<input name="job_fair_id" value="<%=job_fair_id %>" type="hidden"/>
<table class="table table-striped table-bordered price" width="705"  id="select_fuwu">
	<colgroup>
		<col width="110" />
		<col width="460" />
		<col width="80" />
	</colgroup>
	<thead>
		<tr>
			<th>
				服务套餐
			</th>
			<th>
				服务内容
			</th>
			<th>
				需要点数
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th><label><input type="radio" name="fuwu_id" value="taocan_01" onclick="selectFuwu( 'taocan_01',40 );"/>套餐一</label></th>
			<td valign="top">
				1、招聘海报设计,制作(尺寸80*100)；2、招聘海报 现场展位布置
			</td>
			<th>
				40点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu_id" value="taocan_02" onclick="selectFuwu(  'taocan_02',400 );"/>套餐二</label></th>
			<td valign="top">
			  1、文件袋1个；
			  2、简历表100份；
			  3、签字笔5支；
			  4、胶带1卷；
			  5、标准面试通知单1本；
			  6、红白板笔2支；
			  7、招聘海报设计,制作(尺寸80&times;100)1份；
			  8、空白海报纸（尺寸50*70）5张；
			  9、招聘会横幅设计，制作5米；
			  10、教室桌椅摆放、卫生清理1次；
			  11、协助调试宣讲教室电脑、投影；
			  12、纯净水5瓶；
			  13、海报横幅现场悬挂1次。</td>
			<th>400点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu_id" value="taocan_03" onclick="selectFuwu( 'taocan_03', 1000 );"/>套餐三</label></th>
			<td valign="top">
				1、套餐二全部服务;2、专人全程跟踪服务;
				3、酒店预订（费用自理）;4、机场接送机（费用自理）。
			</td>
			<th>
				1000点
			</th>
		</tr>
		<tr>
			<th colspan="3"><label><input type="radio" name="fuwu_id" value="" checked="checked" onclick="selectFuwu( '',0 );"/>不需要服务</label></th>
		</tr>
	</tbody>
</table>
</form>
<script>
(function () {
		var parent = art.dialog.parent;		// 父页面window对象
		var api = art.dialog.open.api;		//art.dialog.open扩展方法
		//	 $ = function (id) {return document.getElementById(id)};
		if (!api) return;
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		api.title('招聘会预定')
			// 自定义按钮
			.button(
				{
					name: '确定',
					callback: function () {
						if ( $("#points_last").text()<0 ){
							msg_alert("提示信息","点数不足！","face-sad");
						}else{
							saveOrder(function(){art.dialog.close();});
						}
						return false;
					},
					focus: true
				},
				{
					name: '取消'
				}
			);
		var saveOrder =function(closePage) {
			var url= "<%=request.getContextPath()%>/sheet/apply.do";
			$.post(url, $("#fm").serialize(), function(r){
				if(r.ok){
					var data = r.data;
					var succ = 0;
					var error =""
					for( var i=0 ;i<data.length ;i++){
						if( data[i].indexOf('succ')>=0 ){
							succ++;
							switch (data[i].split("@")[1] ){
								case "fail" : 
									error+="<br/>服务套餐申请失败！";break;
							}
						}else{
							error+='<br/>'+decodeErrors( data[i].split("@")[1]  );
						} 
					}
					if(data.length>1){
						msg_alert("提示信息","成功申请"+succ+"场招聘会，请等待审核!"+error,"succeed",closePage);
					}else if(data.length==1 && succ==1){
						msg_alert("提示信息","申请提交成功，请等待审核！"+error,"succeed",closePage);
					}else {
						msg_alert("提示信息","申请失败"+error,"face-sad");
					}
				}else{
					msg_alert("提示信息",r.message,"face-sad");
				}
				parent.submitCallback();
			}); 
		};
		var decodeErrors= function( code ){
			var msg ="";
			switch( code ){
				case "attended":
					msg="您已预定招聘会，请不要重复申请！";
					break;
				case "applied":
					msg="您已申请该招聘会，请等待学校审核！";
					break;
				case "invited":
					msg="学校已向你发出邀请，请及时审核！";
					break;
				case "nologin":
					msg="请用企业账号登陆后预约！";
					break;
				case "noaudit":
					msg="您的账号未通过审核，不能申请招聘会！";
					break;
				case "nomoney":
					msg="账号点数不足，无法申请招聘会！";
					break;
				case "over":
					msg="该招聘会展位已满，请选择其他招聘会！";
					break;
				case "end":
					msg="预定已经结束，请选择其他招聘会！";
					break;
				defalut:
					msg="预订失败！";
			}
			return msg;
		};
})();
</script>
</div>
<div style="width:650px;margin:0 auto;"  class="main_body">
<table class="table table-striped table-bordered price" width="705">
	<colgroup>
		<col width="110" />
		<col width="460" />
		<col width="80" />
	</colgroup>
	<tbody>
		<tr style="display:none;">
			<th>招聘会预定</th>
			<td>
			<a href="<%=request.getContextPath() %>/jobfairInfo.do?id=<%=job_fair_id %>" target="_blank">
			<%=job_fair_date%> &nbsp;<%=job_fair_name %>
			</a>
			</td>
			<th>	
			<span id="jobfair_points2">40</span>点<br/>
			</th>
		</tr>
		<tr>
			<th colspan="2" style="text-align:center;">
			账户点数：<span class="points" id="points_accounts"><%=points %></span>点，
			本次支付点数：<span class="points" id="total_points"><%=job_fair.length*Integer.parseInt(points1) %></span>点，
			账户余额：<span class="points" id="points_last"><%=points %></span>点
			<span id="not_enough" style="display:hidden;color:#F00;font-weight:bolder;">（点数不足）</span>。
			</th>
		</tr>
		</tbody></table>
  </body>
</html>
	<%
}
%>