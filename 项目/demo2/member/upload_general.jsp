<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>上传简历</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
</head>

<body>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
 		<jsp:include page="inc/menu.jsp" flush="true" />
        <!--left完成-->
        <div class="right">
        	<div class="right_top">
            	<h1 class="upload">上传简历</h1>
                <div class="xian"></div>
                <div class="table">
                	<table width="560" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="r_align">简历名称:</td>
                        <td class="l_align"><input type="text" value="" class="text"></td>
                      </tr>
                      <tr>
                        <td class="r_align">文件:</td>
                        <td class="l_align"><a href="#" class="file">选择文件</a></td>
                      </tr>
                      <tr>
                        <td class="r_align">&nbsp;</td>
                        <td class="l_align" style="color:#0c74f6; font-weight:bold;">只能上传* .doc,*.docx文件，大小不能超过2M。</td>
                      </tr>
                      <tr>
                        <td class="r_align">&nbsp;</td>
                        <td class="l_align"><a href="#" class="upload">上传</a></td>
                      </tr>
                    </table>
                </div> 
                <div class="form">
                	<table width="750" border="0" cellpadding="5" cellspacing="0">
					  <tr>
						<td>序号</td>                 	              	                             
						<td>应聘职位</td>
						<td>上传时间</td>
                        <td>公开状态</td>
                        <td>预览</td>
					  </tr>
					  <tr class="xian">
						<td></td>
						<td></td>
						<td></td>
                        <td></td>
						<td></td>            	                     
					  </tr>
					  <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
                     <tr>
						<td>01</td>
						<td>应聘市场部主管</td>
                        <td> 2015年9月15日</td>
						<td>
                        	<input type="radio" value=""><span>公开</span>
                            <input type="radio" value=""><span>秘密</span>
                        </td>
						<td class="bag"><a href="#">查看</a></td>
					 </tr>
					</table>
					<div class="pagelist">
                        <ul class="pages1">
                            <li><a href="#" class="disabled" style="color:#999;">上一页</a></li>
                            <li><a href="#" class="current" style="color:#999;">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">下一页</a></li>
                        </ul>
                    </div>
                </div>   
            </div>
            <!--right_top完成-->  
        </div>
        <!--right完成-->
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
<!--footer开始-->
<div class="fenlan"></div>
<div class="foot">
    <div class="footer">
        <p class="text"><a href="http://www.211zph.com/page.do?id=201407210000321">关于我们</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000326">广告投放</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000328">法律声明</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000329">人才招聘</a><span>/</span>
        <a href="http://www.211zph.com/page.do?id=201407210000327">联系方式</a></p>
        <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A410  电话：029-88662468 / 87240519</p>
        <p>工信部备案号：陕ICP备13006138号-3  西安市人力资源服务许可证编号：610100120105 </p>
        <p>西安大秦人力资源有限公司 版权所有</p>
        <p><a href="#"><img src="img/foot_a.png" /></a>
        <a href="#"><img src="img/foot_b.png" /></a>
        <a href="#"><img src="img/foot_c.png" /></a>
        <a href="#"><img src="img/foot_d.png" /></a></p>
        <p>
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253006258'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1253006258%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
        </p>
    </div> 
</div>
<!--footer完成-->
</body>
</html>
