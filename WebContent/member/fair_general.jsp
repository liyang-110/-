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
<title>订阅招聘会</title>
<link type="text/css" rel="stylesheet" href="style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<link type="text/css" rel="stylesheet" href="style/post_general.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<script src="/statics/artDialog/artDialog.js?skin=green"></script>
<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>

</head>

<body>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
    
		<jsp:include page="inc/menu.jsp" flush="true" />
        <!--left完成-->
        <div class="right">
        	<div class="right_top">
            	<h1 class="job">招聘会订阅</h1> 
            </div>
            <!--right_top完成-->
            <div class="cont_top">
        	<h1>高级搜索 <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Advanced Search</span></h1>
            <div class="sousuo">
                <table class="tbl">	
                    <tr>
                        <td>地区：</td>
                        <td>
                        	<select>
                                <option value="9">--请选择--</option>
                                <option value="01">北京</option>
                                <option value="02">天津</option>
                                <option value="03">河北</option>
                                <option value="01">山西</option>
                                <option value="02">内蒙古</option>
                                <option value="03">辽宁</option>
                                <option value="01">吉林</option>
                                <option value="02">黑龙江</option>
                                <option value="03">江苏</option>
                                <option value="01">浙江</option>
                                <option value="02">上海</option>
                                <option value="03">安徽</option>
                                <option value="01">福建</option>
                                <option value="02">江西</option>
                                <option value="03">山东</option>
                                <option value="01">河南</option>
                                <option value="02">湖北</option>
                                <option value="03">广东</option>

                            </select>
                        </td>
                         <td>类型:</td>
                        <td>
                        	<select>
                        		<option value="9">--请选择--</option>
                                <option value="1">网络招聘会</option>
                                <option value="2">校园招聘会</option>
                                <option value="1">校园宣讲会</option>
                                <option value="2">专场会</option>
                            </select>
                        </td>
                        <td colspan="4">
                            <input class="zi" type="text" name="in_job_name" value="" placeholder="请输入关键字">
                            <input class="suo" type="button" onclick="javascript:searchForm();" value="搜索">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="post_table" style="margin-top:10px;">
            	<table width="710" border="0" cellpadding="0" cellspacing="0">
                  <tr style="font-size:16px;">
                  	<td width="26"><input type="checkbox" value=""></td>
                    <td width="41">序号</td>
                    <td width="132">招聘会时间</td>
                    <td width="317">招聘会名称</td>
                    <td width="112">地点</td>
                    <td width="82">进入</td>
                  </tr>
                  <tr class="xian">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td>01</td>
                    <td>2015.10.22  9:00</td>
                    <td><a href="#">西京学院2016届毕业生综合类校园招聘会</a></td>
                    <td>西京学院操场</td>
                    <td class="bag"><a href="#">进入</a></td>
                  </tr>
                  <tr>
                  	<td><input type="checkbox" value=""></td>
                    <td colspan="6" style="text-align:left; padding-left:20px;"><a href="#" class="batch">批量订阅选中招聘会</a></td>
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
            <!--post_table完成-->
        </div>
        <!--sousuo完成-->  
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
