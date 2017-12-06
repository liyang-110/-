<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%
AdvertisementModel AdM=new AdvertisementModel();
String base_dir =request.getContextPath()+"/";

NewsModel newsModel = new NewsModel();

String area_id="";
String news_str="";
if(request.getParameter("area_id")!=null && !"".equals(request.getParameter("area_id") ) ){
	area_id = request.getParameter("area_id");
	news_str="&model_type=subsite&owner_id="+area_id+"&area_id="+area_id;
}else{
	news_str="&model_type=&owner_id=&area_id=";
}

%>
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
	</script>
	

    <div class="container border-3A614C">
    	<div class="f_login pull-left">
            <ul class="nav nav-tabs" id="loginTab">
              <li class=" active"><a href="#login1">企业登录</a></li>
              <li class=""><a href="#login2">高校登录</a></li>
            </ul>
            <div class="tab-content">            
              <div class="tab-pane active form" id="login1">
              	<form class="company_login" novalidate="novalidate" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" name="user_type" value="company" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right"> 
                        <input type="text" name="user_id" placeholder="账号" errorcontent="请输入用户名！"/><i class="icon-user"></i>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right">
                        <input type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/><i class="icon-lock"></i>
                        </div>
                    </div>
                  </div>
                <div class="control-group">
                    <div class="controls">
						<label class="inline"><input class="checkbox" name="remember" type="checkbox">保存密码
                        </label>
                        <a href="<%=request.getContextPath() %>/forget.do">忘记密码</a>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input id="btnComLogin" type="submit" value="登&nbsp;&nbsp;&nbsp;录" class="btn-primary">
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <a href="<%=request.getContextPath()%>/register.jsp" class="btn btn-primary register">注&nbsp;&nbsp;&nbsp;册</a>
                    </div>
                  </div>
                  </form>
              </div>
              <div class="tab-pane" id="login2">
              	<form class="school_login" novalidate="novalidate" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" name="user_type" value="school" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right"> 
                        <input type="text"  name="user_id" placeholder="账号" errorcontent="请输入用户名！" /><i class="icon-user"></i>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right">
                        <input type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/><i class="icon-lock"></i>
                        </div>
                    </div>
                  </div>
                <div class="control-group">
                    <div class="controls">
						<label class="inline"><input class="checkbox" type="checkbox">保存密码
                        </label>
                        <a href="#">忘记密码</a>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input id="btnSchLogin" type="submit" value="登&nbsp;&nbsp;&nbsp;录" class=" btn-primary">
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <a href="<%=request.getContextPath()%>/register.jsp" class="btn btn-primary register">注&nbsp;&nbsp;&nbsp;册</a>
                    </div>
                  </div>
                  </form>
              </div>
            </div>
            <script type="text/javascript">
			jQuery(document).ready(function() {     
					$('#loginTab a').click(function (e) {
					  e.preventDefault();
					  $(this).tab('show');
					})
					$('#loginTab a:first').tab('show');
					Login.init();
			  });
			</script>
        </div>
        <div class="f_carousel pull-left">
				<div id="slide" style="position: relative;"></div>
				<script type="text/javascript">
				            
                $("#slide").jdSlide(
                {width:496,
                height:319,
                pics:	
                [
                	  <%= AdM.getAdPlayHtml("play_496x319",area_id,6,base_dir) %>
                ]
                })
                </script>
      </div>    
      <div class="f_news pull-left">
            <ul class="nav nav-tabs" id="newsTab">
              <li class="active"><a href="#new1" data-toggle="tab">新闻</a></li>
              <li><a href="#new2" data-toggle="tab">公告</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="new1">
              	<ul>
              	
              	      <%
              	    List list1 = newsModel.getNews("news_type01","siteindex","");//新闻
				    if(list1 != null && list1.size()>0 ){

				    for(Iterator Iter1 = list1.iterator();Iter1.hasNext();){
	                    List tempList1 = (List)Iter1.next();
	                    String title=tempList1.get(1).toString();
	                    if (title.length()>14){
	                    	title=title.substring(0,14)+"...";
	                    }
	                    String add_time=tempList1.get(2).toString();
	                    String today= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				 %>
                	<li>
                	<a title="<%=tempList1.get(1).toString() %>" href="<%=request.getContextPath()%>/newsDetail.do?id=<%=tempList1.get(0).toString() %>&area_id=<%=area_id %>" target="_blank">
                	<%=title%>
                	</a><% if( add_time.equals( today )){%>
                				<i class="new-icon"></i>
                			<%} %>
                	</li>
                	 <%}
                	 }%>

                </ul>
                <a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&news_type=news_type01<%=news_str %>" class="pull-right" style="margin:2px 20px 0 0;"><small>更多&gt;&gt;</small></a>
			  </div>
              <div class="tab-pane" id="new2">
              	<ul>
                	              	          <%
              	    list1 = newsModel.getNews("news_type02","siteindex","");//公告
				    if(list1 != null && list1.size()>0 ){
				    for(Iterator Iter1 = list1.iterator();Iter1.hasNext();){
	                    List tempList1 = (List)Iter1.next();
	                    String title=tempList1.get(1).toString();
	                    if (title.length()>14){
	                    	title=title.substring(0,14)+"...";
	                    }
	                    String add_time=tempList1.get(2).toString();
	                    String today= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				 %>
                	<li>
                	<a href="<%=request.getContextPath()%>/newsDetail.do?id=<%=tempList1.get(0).toString() %>&area_id=<%=area_id%>">
                	<%=title%>
                	</a><% if( add_time.equals( today )){%>
                				<i class="new-icon"></i>
                			<%} %>
                	</li>
                	 <%}
                	 }%>
                </ul>
                 <a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&news_type=news_type02<%=news_str %>" class="pull-right" style="margin:2px 20px 0 0;"><small>更多&gt;&gt;</small></a>

              </div>
            </div>
      </div>

    </div>
