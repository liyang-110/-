<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript" src="/js/js_common.js"  charset="UTF-8"></script>
	<script type="text/javascript" src="JobFairSearch.js"  charset="UTF-8"></script>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
   <link rel="stylesheet" href="/js/jquery-easyui/themes/bootstrap/window.css" type="text/css"></link>
   <style type="text/css">
   		#dd p {
   			text-indent :2em;
   		}
   </style>
  </head>
  
  <body>
  
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border : false">
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
        
        <div style="padding:10px 0 0 20px;">
    <form name="fm" id="fm" method="post">
	地区：
   <input id="in_area_id" name="in_area_id" class="easyui-validatebox" />
       举办高校：
   <input id="in_school_name" name="in_school_name" class="easyui-validatebox"/> 
       招聘会名称：
   <input id="in_job_fair_name" name="in_job_fair_name" class="easyui-validatebox"/>
       招聘会时间: <input  id="in_job_fair_time_1" name="in_job_fair_time_1" class="easyui-datebox" style="width:100px" />
            -- <input id="in_job_fair_time_2" name="in_job_fair_time_2" class="easyui-datebox" style="width:100px" />
       		<label>
       		<input type="checkbox" name="in_flag" id="in_flag" value="1" />显示屏蔽</label>
       		<label>
       		<input type="checkbox" name="in_audited" id="in_audited" value="3" />仅显示待审</label>
       		<br/>
       招聘会类型：
            <input id="in_job_fair_type" name="in_job_fair_type" class="easyui-validatebox"/>
      招聘会学历: 
			<input id="in_job_fair_level" name="in_job_fair_level" class="easyui-validatebox" />
       招聘会特色: 
            <input id="in_job_fair_feature" name="in_job_fair_feature" class="easyui-validatebox"/>
      主办方: 
            <input id="in_job_fair_sponsor" name="in_job_fair_sponsor" class="easyui-validatebox"/>
  
            <a href="javascript:void(0);" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
            <a href="javascript:void(0);" id="exportSearchData" class="easyui-linkbutton" iconCls="icon-save">导出</a>
  </form>          
        </div>
    
		</div>
		
			<div data-options="region:'center',border : false">	
				<table id="resultId" name='resultId'>
				</table>
				
			</div>
	
	    </div>

		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		<div id="dlg_check" style="display:none">
				<div style="text-align:center; margin-bottom:12px;">
					<div style="text-align:left;width:290px;margin:auto;">备注：</div>
				 	 <textarea name="mem" id="mem" cols="45" rows="5"></textarea>
				</div>
		</div>
		<div id="dd">
		
		</div>
		<div id="ddSmsNotice">
			<iframe scrolling="auto" id="sms_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
  </body>
</html>
