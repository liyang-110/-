<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>主办方进入会场</title>
<link type="text/css" rel="stylesheet" href="style/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="style/core.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/carousel.js"></script>
<script type="text/javascript" src="js/jquery.downCount.js"></script>

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script src="<%=request.getContextPath()%>/assets2/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets2/scripts/front.js" charset="utf-8"></script>

<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.textSearch-1.0.js" charset="utf-8"></script>

<script type="text/javascript" src="js/flow.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$(".nav-pills>li:eq(0)").addClass("activ_one");
	});
</script>
</head>

<body>
<jsp:include page="include/header_sch.jsp"></jsp:include>
<!--banner完成-->
<div class="job">
    <h1>招聘大厅</h1>
    <form class="form-inline" role="form">
       <div class="form-group">
          <input type="text" class="form-control control" id="name" placeholder="请输入企业名称或应聘职位">
       </div>
       <button type="submit" class="btn btn-default">搜索</button>
    </form>
</div>
<!--job完成-->
<div class="container">
    <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">125</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
     <div class="pull-left cont_pull">
        <ul class="list-inline">
          <li><img src="img/ren_b.png"/></li>
          <li class="bg">1</li>
          <li><img src="img/ren_c.png" /></li>
        </ul>
        <div class="clear"></div>
        <div class="text_a"><a href="#" title="骏辉建材有限公司网络">骏辉建材有限公司网络</a></div>
        <div class="text_b">
            <p><a href="#">推广运营经理</a><span>（简历20份）</span>
                <br /><a href="#">前台文员</a><span>（简历8份）</span><br />
            </p>
        </div>
        <form class="form-inline" role="form">
           <button type="submit" class="btn btn-default toudi">投递简历</button>
        </form>
    </div>
</div>
<div class="footer">
    <div class="foot">
    	<p>本站信息版权归西安大秦人力资源有限公司所有，不得采集，违者必究</p>
        <p>地址：西安高新区科技二路65号清华科技园清扬国际大厦A座410 客服:千先生 电话:029-88662468 87240519 传真:029-88662468 </p>
        <p> 
            <a title="站长统计" target="_blank" href="http://www.cnzz.com/stat/website.php?web_id=1253006258">
             <img vspace="0" hspace="0" border="0" src="http://icon.cnzz.com/img/pic.gif">
            </a>
        </p>
    </div>
</div>
</body>
</html>
