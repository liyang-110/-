<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<!--滚动栏开始  -->
<div id="latest_log" class="news">
        <ul class="info">   
       	<%
        	List latest_log = Station.queryLatestLog();
            	for(Iterator it=latest_log.iterator();it.hasNext();){
                	HashMap row=(HashMap)it.next();
        %>
        	<li><%=row.get("cdate") %>前，&nbsp;&nbsp;<%=row.get("content") %></li>   
       	<%
            }     
        %>
        </ul>
       <div style="clear:both">
       </div>
        <script type="text/javascript"> 
                        var box2=document.getElementById("latest_log"),can=true; 
                        box2.innerHTML+=box2.innerHTML; 
                        box2.onmouseover=function(){can=false;}; 
                        box2.onmouseout=function(){can=true;}; 
                        $(function (){ 
                            var stop=box2.scrollTop%30==0&&!can; 
                            if(!stop)box2.scrollTop==parseInt(box2.scrollHeight/2)?box2.scrollTop=0:box2.scrollTop++; 
                            setTimeout(arguments.callee,box2.scrollTop%30?10:2000); 
                        }); 
                </script>
      </div>  
<!--滚动栏结束  -->    
 