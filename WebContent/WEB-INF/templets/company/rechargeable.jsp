<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/member/inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id=company_id;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=company_name %> - 套餐充值</title>
	<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/bootstrap.nav.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
	<link type="text/css" rel="stylesheet" href="/member/img2/core.css" />
	
	<link type="text/css" rel="stylesheet" href="/member/style/first_firm.css" />

    <link rel="stylesheet" href="/static/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/jquery.spinner/css/bootstrap-spinner.min.css">

	<script type="text/javascript" src="/member/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/jquery.spinner/js/jquery.spinner.min.js"></script>
	<script type="text/javascript" src="/static/artDialog/artDialog.js?skin=green"></script>
	<script type="text/javascript" src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script> 
	
	<link rel="stylesheet" href="/static/css/rechargeable.css" type="text/css"></link>
	
	<style type="text/css">
		.table.datagrid>tbody>tr>td{
			vertical-align:middle;
		}
		.table.datagrid>tbody>tr>td.content{
			text-align:left;
		}
		.table.datagrid>tbody>tr>td>label{
			display:block;
		}
		.table.datagrid>tbody>tr>td.pay{
			text-align:right;padding-right:1em;
		}
		.table.datagrid>tbody>tr>td.pay p{
			margin:10px;
		}
	</style>
</head>

<body>
<jsp:include page="/member/inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="/member/inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
        	<div class="daohang" style="width:845px;height:40px;border-bottom:3px solid red;">
        		<a class="active" href="/company/rechargeable.do">套餐详情</a>
        		<a href="/company/rechargecombo.do">企业套餐</a>
        		<a href="/company/recharged.do">企业订单</a>
        	</div>
        	<div style="padding-left:5px;">
        		<h3>购买须知：</h3>
        		<p>【说明】</p>
        		<p>1、企业用户通过认证后即为网站会员，所有网站会员的服务有效期为90天（从认证通过时间开始计时）；</p>
        		<p>2、用户购买青铜会员套餐，服务时间为180天（从当日购买时间开始计时）；</p>
        		<p>3、用户购买白银、黄金、至尊会员套餐，服务时间为365天（从当日购买时间开始计时）；</p>
        		<p>4、用户购买“自定义套餐”内的服务，服务有效期不做调整，即为你当下现有的会员服务有效期；</p>
        		<p>5、如有其它有疑问，请在会员中心，联系您的专属招聘顾问；</p>
        		<p>【注意】</p>
        		<p>1、请在服务有效期内使用各项服务，逾期所有服务内容清零；</p>
        		<p>2、用户只可购买一种付费推荐套餐，在服务有效期内不能再购买其它推荐套餐；</p>
        	</div>
       		<img src="/member/img2/recommend.png" width="845" style="margin: 18px 0 20px 0;">
            
            <table class="self_combo" width="845" border="1" cellpadding="0" cellspacing="0">
        	<tr class="self_caption">
        		<th>会员类型</th>
        		<th>会员认证</br>/天</th>
        		<th>发布职位</br>/个</th>
        		<th>下载简历</br>/份</th>
        		<th>网络会</br>/场</th>
        		<th>急聘/日</th>
        		<th>职位刷新</br>/次</th>
        		<th>现场</br>招聘会</th>
        		<th>原价/元</th>
        		<th>优惠价/元</th>
        		<th>抢购</th>
        	</tr>
        	<tr class="bronze">
        		<td><img alt="" src="/member/img2/bronze.png"><br>青铜会员</td>
        		<td>180</td>
        		<td>10</td>
        		<td>200</td>
        		<td>1</td>
        		<td>10</td>
        		<td>不限</td>
        		<td>6</td>
        		<td>6400</td>
        		<td>2000</td>
        		<td>
        			<c:choose>
    					<c:when test="${membertype eq 'member_type_01'}">
     						<a href="/company/recharge.do?product=2001_1">
     						<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
     					<c:when test="${membertype eq 'member_type_12'}">
      						<a href="/company/recharge.do?product=2001_1">
      						<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
    					<c:otherwise>
      						<p class="nopay">不可购买</p>
    					</c:otherwise>
					</c:choose>
        		</td>
        	</tr>
        	<tr class="silver">
        		<td><img alt="" src="/member/img2/silver.png"><br>白银会员</td>
        		<td>365</td>
        		<td>15</td>
        		<td>400</td>
        		<td>2</td>
        		<td>20</td>
        		<td>不限</td>
        		<td>13</td>
        		<td>13350</td>
        		<td>2850</td>
        		<td>
        		<c:choose>
    					<c:when test="${membertype eq 'member_type_01'}">
     						<a href="/company/recharge.do?product=2002_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
     					<c:when test="${membertype eq 'member_type_12'}">
      						<a href="/company/recharge.do?product=2002_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
    					<c:otherwise>
      						<p class="nopay">不可购买</p>
    					</c:otherwise>
					</c:choose>
        		</td>	
        	</tr>
        	<tr class="gold">
        		<td><img alt="" src="/member/img2/gold.png"><br>黄金会员</td>
        		<td>365</td>
        		<td>20</td>
        		<td>800</td>
        		<td>3</td>
        		<td>30</td>
        		<td>不限</td>
        		<td>20</td>
        		<td>21900</td>
        		<td>3600</td>
        		<td>
        			<c:choose>
    					<c:when test="${membertype eq 'member_type_01'}">
     						<a href="/company/recharge.do?product=2003_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
     					<c:when test="${membertype eq 'member_type_12'}">
      						<a href="/company/recharge.do?product=2003_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
    					<c:otherwise>
      						<p class="nopay">不可购买</p>
    					</c:otherwise>
					</c:choose>
        		</td>
        	</tr>
        	<tr class="exterme">
        		<td><img alt="" src="/member/img2/exterme.png"><br>至尊会员</td>
        		<td>365</td>
        		<td>30</td>
        		<td>1000</td>
        		<td>4</td>
        		<td>40</td>
        		<td>不限</td>
        		<td>不限</td>
        		<td>30700</td>
        		<td>10000</td>
        		<td>
        			<c:choose>
    					<c:when test="${membertype eq 'member_type_01'}">
     						<a href="/company/recharge.do?product=2004_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
     					<c:when test="${membertype eq 'member_type_12'}">
      						<a href="/company/recharge.do?product=2004_1">
        					<img alt="" src="/member/img2/weixinpay.png"></a>
    					</c:when>
    					<c:otherwise>
      						<p class="nopay">不可购买</p>
    					</c:otherwise>
					</c:choose>
        		</td>
        	</tr>
        </table>
        
          <!--table完成-->
 <!--自助套餐           -->
          	<img src="/member/img2/self.png" width="845" style="margin: 40px 0 20px 0;">
            <div class="table">
                	<form action="/company/recharge.do" method="post">
						<table class="table table-bordered datagrid recommend_combo" width="750" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr class="recommend_caption" style="background:#CCC;font-size:16px;">
									<td>服务</td>
									<td>单价/元</td>
									<td>说明</td>
									<td>数量</td>
									<td>金额</td>
								</tr>
								<tr>
									<td>简历<br/>(份)</td>
									<td>8.00</td>
									<td>简历50份起卖；以50成倍数增加。</td>
									<td>
	<input type="hidden" name="product" id="product_1001" data-price="8" value="1001_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1001"
				  data-min="0" data-max="1000" data-step="50" data-precision="0"  id="spinner_1001"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr>
								<tr>
									<td>网络视频招聘会<br/>(场)</td>
									<td>600.00</td>
									<td>211校招网线上网络视频招聘会。</td>
									<td>
	<input type="hidden" name="product" id="product_1002" data-price="600" value="1002_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1002"
				  data-min="0" data-max="10" data-step="1" data-precision="0"  id="spinner_1002"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr>
								<tr>
									<td>现场招聘会<br/>(场)</td>
									<td>600.00</td>
									<td>211校招网代理人才市场世贸人才和西咸人西区人才市场。</td>
									<td>
	<input type="hidden" name="product" id="product_1003" data-price="600" value="1003_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1003"
				  data-min="0" data-max="10" data-step="1" data-precision="0"  id="spinner_1003"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr>
								<tr>
									<td>职位发布<br/>(个)</td>
									<td>10.00</td>
									<td>发布职位扣除一个职位数。</td>
									<td>
	<input type="hidden" name="product" id="product_1006" data-price="10" value="1006_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1006"
				  data-min="0" data-max="100" data-step="1" data-precision="0"  id="spinner_1006"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr>
								<tr>
									<td>急聘<br/>(日)</td>
									<td>50.00</td>
									<td>添加“急聘”标签，并优先显示。</td>
									<td>
	<input type="hidden" name="product" id="product_1007" data-price="50" value="1007_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1007"
				  data-min="0" data-max="100" data-step="1" data-precision="0"  id="spinner_1007"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr>
								<!-- <tr>
									<td>职位刷新<br/>(次)</td>
									<td>10.00</td>
									<td>更新职位发布时间，提交职位排名度。</td>
									<td>
	<input type="hidden" name="product" id="product_1008" data-price="10" value="1008_0"/>
	<div data-trigger="spinner" class="product_spinner" >
		<a href="javascript:;" data-spin="down">
			<i class="fa fa-minus-square-o fa-lg" aria-hidden="true"></i>
		</a>
		<input type="text" value="0" data-rule="quantity"   data-product="1008"
				  data-min="0" data-max="100" data-step="1" data-precision="0"  id="spinner_1008"/>
		<a href="javascript:;" data-spin="up">
			<i class="fa fa-plus-square-o fa-lg" aria-hidden="true"></i>
		</a>
	</div>
									</td>
									<td>--</td>
								</tr> -->
								
								<tr>
									<td>合计</td>
									<td colspan="2" style="color:#f24d68;">
										原价＜2800元---9折优惠</br>
										2800元≤原价＜5600元---7折优惠</br>
										5600元≤原价＜10600元---5折优惠</br>
										原价10600元以上---3折优惠</br>
									</td>
									<td colspan="2" class="pay">
										<p>原价：<input id="total_amount"/></p>
										<p>优惠(<span id="discount_rate"></span>折)：<input id="discount_amount"/></p>
										<p>应付：<input id="pay_amount"/></p>
										<p><button class="btn btn-success">确定</button></p>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
                </div>
         </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>

<script type="text/javascript">
$(function(){
	$(".product_spinner").spinner('delay', 200) //delay in ms
		  .spinner('changed', function(e, newVal, oldVal) {
				var product_id= $(this).attr("data-product");
				$("#product_"+product_id).val( product_id+"_"+newVal );
				canculateAmount();
				canculateAmount();
	}).spinner('changing', function(e, newVal, oldVal) {
			// trigger immediately
	});
});
function canculateAmount(){
	var total_amount=0;
	$("input[name='product']").each(function(){
			var arr = $(this).val().split("_");
			var product_id= arr[0];
			var product_amount = arr[1];
			var price = $(this).attr("data-price") ;
			total_amount+= product_amount*price;
	});
	$("#total_amount").val( total_amount );
	var discount_rate=1;
	if( total_amount < 2800 ){
		discount_rate=0.9;
	}else if( total_amount < 5600 ){
		discount_rate = 0.7;
	}else if( total_amount < 10600 ){
		discount_rate = 0.5;
	}else if( total_amount >= 10600 ){
		discount_rate = 0.3;
	}
	$("#discount_rate").text( discount_rate*10 );
	var pay_amount = Math.round( total_amount*discount_rate*100 )/100;
	$("#pay_amount").val( pay_amount );
	$("#discount_amount").val( total_amount - pay_amount );
}
canculateAmount();
</script>


<!--footer开始-->
<jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
