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
		var role_id = "<%=role_id%>";
		var querystr="&in_role_id="+role_id;
	</script>
	<script type="text/javascript" src="/js/js_common.js" charset="utf-8"></script>
	<script type="text/javascript" src="CompanyRechargeOrder.js" charset="utf-8"></script>
  	<style>
	.green {color:green;}
	.red {color:red;}
	</style>
  </head>
  
  <body>
		<div class="easyui-layout" style="width: 100%; height: 330px;" data-options="fit:true,border:false">
			<div data-options="region:'north',border : false" style="background:#F4F4F4;">
		        <div style="padding:10px 0 0 20px;">
		  <form id="fm" name="fm" method="post">  
		  			<%-- 
		  			<input type="hidden" name="method" value="execProc" />
		  			<input type="hidden" name="in_r" value="ad" />
		  			<input type="hidden" name="methodId" value="ad_trade_order_query" />
		  			--%>
		      订单状态：
		      		<select name="in_order_status" class="easyui-combobox">
		      			<option value="">请选择</option>
		      			<option value="OK">待付款</option>
		      			<option value="SUCCESS">已完成</option>
		      			<option value="CLOSE">已关闭</option>
		      		</select>
		      支付状态：
		      		<select name="in_pay_status" class="easyui-combobox">
		      			<option value="">请选择</option>
		      			<option value="NOTPAY">未付款</option>
		      			<option value="SUCCESS">已付款</option>
		      		</select>
		      订单号：
		        	<input id="in_trade_no" name="in_trade_no" class="easyui-validatebox"/>
		       公司名称：
		            <input id="in_company_name" name="in_company_name" class="easyui-validatebox"/>
		       		 <br/>
		       订单时间： <input  id="in_time_start_1" name="in_time_start_1" class="easyui-datebox" style="width:100px" />
		            -- <input id="in_time_start_2" name="in_time_start_2" class="easyui-datebox" style="width:100px" />

		            <a href="#" id="searchAndreloadData" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		   </form>       
		        </div>
	    
			</div>
			
			<div data-options="region:'center',border:false">
				<table id="resultId" name='resultId'>
				</table>
			</div>
	    </div>
		<div id="dlg_deal" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_deal" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		<div id="dlg_check" style="display:none">
		</div>
		
		<div id="dlg_view" class="easyui-dialog" fit="true" style="width: 100%; height: 100%; padding: 0px 0px" closed="true" buttons="#dlg-buttons">
			<iframe scrolling="auto" id="if_view" frameborder="0" src="" style="width: 100%; height: 100%;"></iframe>
		</div>
		
		<div id="dlg_orderstatus" style="display:none">
			<div class="easyui-layout" fit="true">
   			 <div region="center" border="false" style="padding:15px;">
				<form id="orderStatusForm" method="post">
				<input type="hidden" name="in_action" value="edit" />
				<table>
					<tr>
						<td><label>订单编号：</label></td>
						<td>
							<input readonly="readonly" name="in_trade_no" size="40" class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td><label>客户名称：</label></td>
						<td>
							<input readonly="readonly" name="company_name" size="40" class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td><lable>订单状态：</lable></td>
						<td>
						    <select name="in_order_status" class="easyui-combobox">
					      		<option value="">请选择</option>
					      		<option value="OK">待付款</option>
					      		<option value="SUCCESS">已完成</option>
					      		<option value="CLOSE">已关闭</option>
					      	</select>
						</td>
					</tr>
					<tr>
						<td><label>付款状态：</label></td>
						<td>
					      	<select name="in_pay_status" class="easyui-combobox">
					      		<option value="">请选择</option>
					      		<option value="NOTPAY">未付款</option>
					      		<option value="SUCCESS">已付款</option>
					      	</select>
					     </td>
					</tr>
					<tr>
						<td><label>付款金额：</label></td>
						<td>
					    	<input name="in_pay_amount" id="in_pay_amount" class="easyui-numberbox" precision="2"  data-options="required:true,missingMessage:'请输入付款金额'"/>
					    </td>
					</tr>
					<tr>
						<td><label>修改原因：</label></td>
						<td>
			 				<textarea name="in_mem" id="in_mem" cols="36" rows="3"  class="easyui-validatebox" data-options="required:true,missingMessage:'请输入修改原因'"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			</div>
		</div>
		
		<div id="dlg_orderamount" style="display:none">
			<div class="easyui-layout" fit="true">
   			 <div region="center" border="false" style="padding:15px;">
				<form id="orderAmountForm" >
				<table>
					<tr>
						<td><label>订单编号：</label></td>
						<td>
							<input readonly="readonly" name="in_trade_no"  size="40" class="easyui-validatebox"/>
						</td>
					</tr>
					<tr>
						<td><label>客户名称：</label></td>
						<td>
							<input readonly="readonly" name="company_name" size="40" class="easyui-validatebox"/>
						</td>
					</tr>
					<tr>
						<td><label>付款状态：</label></td>
						<td>
					      	<select name="in_pay_status" class="easyui-combobox">
					      		<option value="">请选择</option>
					      		<option value="NOTPAY">未付款</option>
					      		<option value="SUCCESS">已付款</option>
					      	</select>
					     </td>
					</tr>
					<tr>
						<td><label>付款金额：</label></td>
						<td>
					    	<input name="in_pay_amount" id="in_pay_amount" class="easyui-numberbox" precision="2"/>
					    </td>
					</tr>
					<tr>
						<td><label>修改原因：</label></td>
						<td>
			 				<textarea name="in_mem" id="in_mem" cols="36" rows="3"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			</div>
		</div>
		
  </body>
</html>
