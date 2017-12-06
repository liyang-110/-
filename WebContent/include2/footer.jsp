<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.AdvertisementModel" %>
   
   	<%
	   	String base_dir =request.getContextPath()+"/";
	   	AdvertisementModel	AdM = new AdvertisementModel();
	   	String area_id="-1";
	   	List friendlink = AdM.getAdList("friendlink", area_id,30 );
	   	
	   	if( friendlink!=null && friendlink.size()>0 ){
   	%>
   	<div class="container">
    	<div class="section_title">
        	友情链接
        </div>
    </div>
    
    <div class="container">
    	<div id="ad_link_logo" style="padding:0 10px;">
	    	<% for(Iterator it=friendlink.iterator();it.hasNext();){ 
	    		List row = (List)it.next(); %>
				<a target="_blank" href="<%=row.get(0) %>">
					<%=row.get(3) %></a>
	    	<% } %>
        </div>
    </div>
    	<% } %>
    <div id="bottom_contact">
    	<div class="container">
        	<div class="pull-left" style="margin-top:25px;">
            <img src="<%=base_dir %>assets2/images/tel_400.png" />
            </div>
            <div class="pull-left" style="margin-top:25px; width:550px; text-align:center;">
            <img src="<%=base_dir %>assets2/images/110.gif"  width="355" height="65"/>
            </div>
            <div class="pull-right" style="margin-top:15px;">
            <img src="<%=base_dir %>assets2/images/weixin.jpg"/>
        	</div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div id="bottom_declare">
    	<div class="container">
        		<div class="navbar">
                    <ul class="nav">
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000321">关于我们</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000326">广告投放</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000328">法律声明</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000329">人才招聘</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="<%=request.getContextPath() %>/page.do?id=201407210000327">联系方式</a></li>
                  </ul>
                  </div>
        </div>
        <div class="container">
        	<%=com.zhaopin.Config.getSiteBottomHtml() %>
        </div>
        <div style="margin:auto;text-align:center;">
			<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</div>
    </div>
