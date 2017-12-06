<%@ page language="java" pageEncoding="UTF-8"%>

    <div style="height:1px; background:#D3CECA;"></div>
    
    <div class="f_foot_menu">
        <div class=" container">
            <div class="pull-left contact">
                <img src="<%=request.getContextPath()%>/assets/images/contact1.png"/>
            </div>
            <%@page import="com.zhaopin.dao.factory.BottomContentModel" %>
            <%
            BottomContentModel bcM=new BottomContentModel();
             %>
             <%= bcM.bottomContent(request.getContextPath(),"_blank") %>
            
            <div class="pull-left">
            	<img src="<%=request.getContextPath()%>/assets/images/weixin.jpg" style="margin-top:15px;"/>
                <div style=" text-align:center;font-size:12px;">211校招网</div>
            </div>
        
        </div>
    </div>
    
    <div class="f_foot_info">
    	<div class="container">
        	<div class="pull-left" style="width:720px;">
<%=com.zhaopin.Config.getSiteBottomHtml() %>
            </div>
            <div class="pull-right">
                   	<%@page import="com.zhaopin.dao.factory.PicModel" %>
        	<% PicModel picM=new PicModel(); %>            
            	<img src="<%=request.getContextPath()%>/<%=picM.getLogo() %>" style="margin-top:-10px;" />
            </div>
        </div>
</div>
<div  class="f_foot_info">
            <div style="clear:both;"><!-- <%=System.currentTimeMillis() %>--></div>
            <div style="text-align:center;">
                    <img src="<%=request.getContextPath() %>/assets/images/110.gif" />
            </div>
            <div style="width:469px;margin:-20px auto 0 auto;text-align:right;">
			<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
			</div>
</div>
