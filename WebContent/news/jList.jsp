<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.vo.PageResVO"%>
<%@page import="com.zhaopin.database.cDataControlA"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%
AdvertisementModel AdM=new AdvertisementModel();
String base_dir =request.getContextPath()+"/";
	
request.setCharacterEncoding("GBK");
cDataControlA cdata = new cDataControlA();
String area_id=request.getParameter("area_id");
String area_name=""; 
area_name=com.zhaopin.Station.getStationName( area_id ); //cdata.GetFirfield("select name from tbl_area where id='"+area_id+"'");
if(area_name.equals("")){
	area_name="全国";
}
String ad_area_id=area_id==null?"0":area_id; 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=area_name %>站 -- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/styles/global.css">
<script src="statics/js/isPhoneSet.js"></script>
<script type="text/javascript">
//是否跳转手机页面
	mobile_device_detect('http://h5.211zph.com/mobile/newsList.jsp');
</script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/news/css/slide.css"/>
<link href="<%=request.getContextPath()%>/news/css/list.css" rel="stylesheet" type="text/css" />


</head>
	<body>
<jsp:include  page="../include/topnav.jsp" flush="true"/>
<jsp:include  page="../include/header_news.jsp" flush="true">
	<jsp:param name="area_id" value="<%=area_id%>" />
	<jsp:param name="area_name" value="<%=area_name%>" />
</jsp:include>

    <div class="container">
        <ul class="breadcrumb">
          <li>
            <a href="./">首页</a> <span class="divider">&gt;</span>
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/substation.do?method=<%=(area_id==null || "".equals(area_id) )?"siteIndex":"subindex&area_id="+area_id %>">
            <%=area_name %>站</a><span class="divider">&gt;</span>
          </li>
          <li class="active">新闻</li>
        </ul>
    </div>

	<div class="container">
    
   <div class="pull-left news_list">
      
   <div class="container f_panel_title">
			<%=area_name %>新闻
   </div>
   <div class="f_news_list">
   
   		<table class="table table-condensed">
            <colgroup>
            	<col width="20" />
                <col width="500" />
                <col width="100" />
            </colgroup>
        	<tbody>
       <%
    	PageResVO pageVO=(PageResVO)session.getAttribute("newSearch");
	  	if(pageVO!=null){
	          	List list=pageVO.getResList();
	          	if(list!=null&&list.size()>0){
	          	    int i=0;
	            	for(Iterator iter=list.iterator();iter.hasNext();){
	            		List temp=(List)iter.next();
	            		i++;
	            		String tempStr  = (String)temp.get(1);
	            		%>
	            		<tr><td>
	            		<div class='rightdirection'></div></td>
	            		<td><a title="<%=tempStr%>" href="<%=request.getContextPath()%>/newsDetail.do?id=<%=temp.get(0)%>&area_id=<%=area_id%>" target="_blank">
	            		<%
	            			if( tempStr.length()>30)tempStr=tempStr.substring(0,30)+"...";
	            		 %>
	            		 <%=tempStr%>
	            		</a>
	            		</td>
	            		<td><%=temp.get(2)%></td></tr>
	            		<%
	             	}
	             }else{
	             	out.print("没有数据，请稍后查看！");
			     }
		}
	    %>
             </tbody>
        
        </table>
   		
   	
   </div>
   		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	     	<tr>
					<td align="center">
					<span>总共<%=pageVO.getPageCount()%>页&nbsp;当前第<%=pageVO.getCurrentPage() + 1%>页</span>
					<span> 
					    <a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&flush=flush&directflag=-2">首页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&flush=flush&directflag=-1">上一页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&flush=flush&directflag=1">下一页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=newSearch&queryType=newSearch&savesign=savesign&flush=flush&directflag=2">尾页</a>
					</span>
				</td>
			</tr>
       </table>
     <div style="height:20px;"></div> 
      </div>
        
    	<div class="pull-left news_right_ad">
			<%= AdM.getAdLinkHtml("list_252x108",ad_area_id,5,base_dir) %>
        </div>
        
    </div>
   
   <div class=" container ad_banner2">
   		<%= AdM.getAdLinkHtml("list_500x132",ad_area_id,2,base_dir) %>
   </div>
    <div style="height:30px; clear:both;"></div>
    
<jsp:include  page="../include/footer.jsp" flush="true"/>


<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

	</body>
</html>

