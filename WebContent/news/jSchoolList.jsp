<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
<%@ page import="com.zhaopin.vo.PageResVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>


<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/styles/global.css">

<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/news/css/slide.css"/>
<link href="<%=request.getContextPath()%>/news/css/list.css" rel="stylesheet" type="text/css" />


</head>
	<body>
<jsp:include  page="../include/topnav.jsp" flush="true"/>
<jsp:include  page="../include/header1.jsp" flush="true"/>

    <div class="container">
        <ul class="breadcrumb">
          <li>
            <a href="./">首页</a> <span class="divider">&gt;</span>
          </li>
          <li class="active">高校/人才市场搜索结果</li>
        </ul>
    </div>

	<div class="container">
    
   <div class="pull-left news_list">
      
   <div class="container f_panel_title">
			高校/人才市场搜索结果
   </div>
   <div class="f_news_list">
   
   		<table class="table table-condensed">
            <colgroup>
            	<col width="20" />
                <col width="300" />
                <col width="86" />
                <col width="100" />
            </colgroup>
        	<tbody>
       <%
    	PageResVO pageVO=(PageResVO)session.getAttribute("schoolSearch");
	  	if(pageVO!=null){
	          	List list=pageVO.getResList();
	          	if(list!=null&&list.size()>0){
	          	    int i=0;
	            	for(Iterator iter=list.iterator();iter.hasNext();){
	            		List temp=(List)iter.next();
	            		i++;
	            		out.print("<tr><td><div class='rightdirection'></div></td>"+
	            		"<td><a href='"+request.getContextPath()+"/substation.do?method=schoolindex&school_id="+temp.get(0)+"'>"+temp.get(1)+"</a></td></tr>");
	             	}
	             }else{
	             	out.print("对不起，没有查询到结果！");
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
					    <a href="<%=request.getContextPath()%>/multiQueryAction.do?method=schoolSearch&queryType=schoolSearch&savesign=savesign&flush=flush&directflag=-2">首页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=schoolSearch&queryType=schoolSearch&savesign=savesign&flush=flush&directflag=-1">上一页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=schoolSearch&queryType=schoolSearch&savesign=savesign&flush=flush&directflag=1">下一页</a>
						<a href="<%=request.getContextPath()%>/multiQueryAction.do?method=schoolSearch&queryType=schoolSearch&savesign=savesign&flush=flush&directflag=2">尾页</a>
					</span>
				</td>
			</tr>
       </table>
      
      </div>
        
    	<div class="pull-left news_right_ad">
        	<a href="#">
            	<img src="<%=request.getContextPath()%>/news/tmp/ad1.png" />
                </a>
        	<a href="#">
            	<img src="<%=request.getContextPath()%>/news/tmp/ad2.png" />
                </a>
        	<a href="#">
            	<img src="<%=request.getContextPath()%>/news/tmp/ad3.png" />
                </a>
        	<a href="#">
            	<img src="<%=request.getContextPath()%>/news/tmp/ad4.png" />
                </a>
        	<a href="#">
            	<img src="<%=request.getContextPath()%>/news/tmp/ad5.png" />
                </a>

        </div>
        
    </div>
   
   <div class=" container ad_banner2">
   		<img src="<%=request.getContextPath()%>/news/tmp/banner_ad1.png" />
   </div>
    <div style="height:30px; clear:both;"></div>
    
<jsp:include  page="../include/footer.jsp" flush="true"/>


<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

	</body>
</html>

