<%@page import="cn.com.zhaopin.base.pub.cCharControl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String area_id=(String)request.getAttribute("area_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>最新名企招聘</title>
<link type="text/css" rel="stylesheet" href="/statics/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/statics/css/newslist.css" />
<script src="/statics/laydate/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/statics/laydate/bootstrap.min.js"></script>
<script type="text/javascript" src="/statics/laydate/laydate.js" charset="utf-8"></script>
</head>

<body>
<jsp:include  page="/include/headerAndTop.jsp" flush="true"/>
<div class="width">
	
</div>
<!--hengxian-->
<div class="container_main">
	<p>当前位置：<a href="http://www.211zph.com" style="color:#F30">首页</a> > 最新名企招聘</p>
	<div class="xinwen">
    	<img src="img/join.jpg" class="img-thumbnail">
    </div>
    <!--xinwen-->
    <div class="cont">
    	 <div class="clearfix">
           <div class="pull-left cont_left">
              <div class="list">
              	<h1>最新名企招聘</h1>
              </div>
              <div class="search">
              	<p>共搜索到1024条信息</p>
              </div>
              <div class="tab">
              	<table class="table table-striped" >
                   <tbody>
<%
	List newsList =(List)request.getAttribute("newsList");
	if(newsList!=null && newsList.size()>0){
   			for(Iterator it=newsList.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next();
				String news_title = cCharControl.strip_tags( (String)row.get("news_title"), "utf-8", 100);                 
 %>
      <tr>                           
         <td>[<%=row.get("area_name") %>]</td>
         <td class="title">
			<a title="<%=news_title%>" href="<%=request.getContextPath()%>/newsDetail.do?id=<%=row.get("news_id")%>&area_id=<%=area_id%>" target="_blank">
			<%=news_title%>
			</a>                         
          </td>
          <td><%=row.get("add_time") %></td>
       </tr>
<%
			}
	}
%>
                   </tbody>
                </table>
              </div>
              <!--fenye开始-->
            <div class="fenye">
                <%=request.getAttribute("pagenation") %>
            </div>  
            <!--fenye开始-->
           </div>
           <!--pull-left结束-->
           <div class="pull-right cont_right">
              <div class="list_top">
              	  <div class="list_a">
                	 <h1>快速搜索</h1>
                  </div>
              	  <!--search开始-->
                  <div class="search">
                   <form class="form-inline" role="form">
                   		<div class="form-group">
                          <span>请选择地区：</span>
                           <select class="form-control">
                             <option value="2">北京</option>
                             <option value="3">天津</option>
                             <option value="4">河北</option>
                             <option value="5">山西</option>
                             <option value="6">内蒙古</option>
                             <option value="7">辽宁</option>
                             <option value="8">吉林</option>
                             <option value="9">黑龙江</option>
                             <option value="10">上海</option>
                             <option value="11">江苏</option>
                             <option value="12">浙江</option>
                             <option value="13">安徽</option>
                             <option value="14">福建</option>
                             <option value="15">江西</option>
                             <option value="16">山东</option>
                             <option value="17">河南</option>
                             <option value="18">湖北</option>
                             <option value="19">湖南</option>
                             <option value="20">广东</option>
                             <option value="21">广西</option>
                             <option value="22">海南</option>
                             <option value="23">重庆</option>
                             <option value="24">四川</option>
                             <option value="25">贵州</option>
                             <option value="26">云南</option>
                             <option value="27">西藏</option>
                             <option value="28">陕西</option>
                             <option value="29">甘肃</option>
                             <option value="30">青海</option>
                             <option value="31">宁夏</option>
                             <option value="32">新疆</option>
                          </select>
                        </div>
                        
                        <div class="box">		
                            <div class="demo3">
                                <ul class="inline">
                                	<span>开始日期：</span>
                                	<li class="inline laydate-icon" id="start" placeholder="YYYY-MM-DD"  style="width:230px; height:30px; margin-right:10px;" value=""></li>
                                	<span>结束日期：</span>
                                	<li class="inline laydate-icon" id="end"  placeholder="YYYY-MM-DD" style="width:230px; height:30px;" value=""></li>
                                </ul>
                            </div>        
                        </div>
                        
                        <div class="form-group">
                          <input type="text" class="form-control f" id="name"  placeholder="请输入关键字">
                          <button type="submit" class="pull-right btn btn-default">提交</button>
                        </div>
                        
                    </form>
                    <script>
						function selectArea(areaId,areaName){
							$("input[name='in_area_id']").val(areaId);
							$("#selectArea").val(areaName);
							art.dialog({id:'selectArea'}).close();
						}
						function submitForm( obj ){
							$( obj ).submit();
						} 
					  $(function(){
							$('#selectArea').click(function(e){
									e.preventDefault();
									art.dialog({
										follow:"#selectArea",
										id: 'selectArea',
										title:false,
										content:'加载中... ...',
										fixed:true,
										close:function(){this.hide(); return false;},
										show:false,
										esc:true,
										padding:"2px 6px 10px 6px"
									});
									var url ='/service/selectArea.jsp';
									var pageContentBody =$(art.dialog({id: 'selectArea'}).content());
									pageContentBody.parents(".aui_dialog").find(".aui_close").addClass("site_select_panel_close");
							
									$.post(url, {}, function (res) {
													pageContentBody.html(res);
													art.dialog({id: 'selectArea'}).show();
									});		
									
								});
					  });
					!function(){
						laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
						// laydate({elem: '#demo'});//绑定元素
					}();
					//日期范围限制
					var start = {
						elem: '#start',
						format: 'YYYY-MM-DD',
						// min: laydate.now(), //设定最小日期为当前日期
						max: '2099-06-16', //最大日期
						istime: false,
						istoday: true,
						choose: function(datas){
							 end.min = datas; //开始日选好后，重置结束日的最小日期
							 end.start = datas //将结束日的初始值设定为开始日
							 $("input[name='in_begin_date']").val( datas );
						}
					};
					var end = {
						elem: '#end',
						format: 'YYYY-MM-DD',
						// min: laydate.now(),
						max: '2099-06-16',
						istime: false,
						istoday: true,
						choose: function(datas){
							start.max = datas; //结束日选好后，充值开始日的最大日期
							$("input[name='in_end_date']").val( datas );
						}
					};
					laydate(start);
					laydate(end);
          			</script>
                  </div>
                  <!--search结束-->
              </div>
              
              <div class="list_top list_bottom">
              	  <div class="list_a">
                	 <h1>新闻资讯</h1>
                  </div>
                  <div class="ul">
                  	<ul class="list-unstyled">
                    	<li>
                        	<a href="#" title="关于举办陕西省2016届普通高校毕业生网络视频招聘会的通知">关于举办陕西省2016届普通高校毕业生网络视频招聘会的通知</a>
						</li>
                        <li>
                        	<a href="#" title="	陕西高校就业联盟2016届毕业生春季大型就业洽谈会（综合类）参会单位录">陕西高校就业联盟2016届毕业生春季大型就业洽谈会（综合类）参会单位录</a>		
                        </li>
                        <li>
                        	<a href="#" title="	西北工业大学明德学院2016届毕业生网络视频招聘会成功举办">西北工业大学明德学院2016届毕业生网络视频招聘会成功举办</a>
						</li>
                        <li>
                        	<a href="#" title="西安职业技术学院2016年春季校园招聘会成功举办">西安职业技术学院2016年春季校园招聘会成功举办</a>		
                        </li>
                        <li>
                        	<a href="#" title="211校招网咸阳分公司成立">211校招网咸阳分公司成立</a>
						</li>
                        <li>
                        	<a href="#" title="211校招网咸阳公司诚聘英才">211校招网咸阳公司诚聘英才</a>		
                        </li>
                        <li>
                        	<a href="#" title="西安财经学院2016年毕业生双选会成功举办">西安财经学院2016年毕业生双选会成功举办</a>
						</li>
                        <li>
                        	<a href="#" title="西咸新区“西部云谷网络专场”招聘会成功举办">西咸新区“西部云谷网络专场”招聘会成功举办</a>		
                        </li>
                        <li>
                        	<a href="#" title="腾讯·大秦网：4月份西安有38场大型招聘会">腾讯·大秦网：4月份西安有38场大型招聘会</a>
						</li>
                        <li>
                        	<a href="#" title="延安大学2016届毕业生综合类供需洽谈会成功举办">延安大学2016届毕业生综合类供需洽谈会成功举办</a>		
                        </li>
                        <li>
                        	<a href="#" title="西京学院2016届毕业生综合类校园招聘会成功举办">西京学院2016届毕业生综合类校园招聘会成功举办</a>
						</li>
                        <li>
                        	<a href="#" title="西安思源学院综合类招聘会成功举办">西安思源学院综合类招聘会成功举办</a>		
                        </li>
                        <li>
                        	<a href="#" title="西安文理学院2016届毕业生教育师范类专场招聘会成功举办">西安文理学院2016届毕业生教育师范类专场招聘会成功举办</a>
						</li>
                        <li>
                        	<a href="#" title="西安外事学院大型人才交流洽谈会成功举办">	西安外事学院大型人才交流洽谈会成功举办</a>		
                        </li>
                    </ul>
                  </div>
                  <div class="more">
                  	<a href="index.html">更多>></a>
                  </div>
              </div>   
           </div>
           <!--pull-right结束-->
        </div>
    </div>   
</div>
<!--container_main完成-->
<jsp:include page="/include3/bottom.jsp" flush="true" />   

<!--footer完成-->

</body>
</html>
