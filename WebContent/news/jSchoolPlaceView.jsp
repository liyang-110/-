<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.database.cDataControlA"%>
<%
request.setCharacterEncoding("GBK");
cDataControlA cdata = new cDataControlA();

String place_id=request.getParameter("id"); 
%>
<%@page import="org.apache.commons.beanutils.DynaBean" %>
<%@page import="com.zhaopin.dao.factory.PlaceModel"%>
<%@page import="com.zhaopin.dao.factory.PlacePicModel"%>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/slide/g.base.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/news/css/slide.css"/>
<link href="<%=request.getContextPath()%>/news/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/news/css/picplay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/jquery/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets2/scripts/front.js"></script>

</head>
	<body>

	<div class="container">
   	  <div class="pull-left news_content">

            <div class="content">
            
            	<%
            	 PlacePicModel picM = new PlacePicModel();
            	 List picList = picM.getPlacePicList( place_id );
            	 if(picList != null && picList.size()>0 ){
            	 %>
            	 
<div id="play">
  <ul class="img_ul">
  <%
  	int first_tag=1;
 	for(Iterator it = picList.iterator(); it.hasNext(); )
 	{ 
 		List row = (List)it.next();
 		if(first_tag==1)
 		{	%>
 			<li style=\"display:block;\">
 			<%
 		}else{
 			first_tag=0;
 			%>
 			<li>
 			<%
 		}
   %>
    <a class="img_a">
    <img src="<%=request.getContextPath()%>/<%=row.get(0) %>" /></a>
    </li>
 <%
    }
  %>
  </ul>  
  <a href="javascript:void(0)" class="prev_a change_a" title="上一张"> <span></span></a>
  <a href="javascript:void(0)" class="next_a change_a" title="下一张"> <span style="display: inline; "></span> </a>
  </div>
  
<div class="img_hd">
  <ul class=" clearfix">
  <%
 	for(Iterator it = picList.iterator(); it.hasNext(); )
 	{ 
 		List row = (List)it.next();
 		%>
	   <li><a class="img_a"><img src="<%=request.getContextPath()%>/<%=row.get(0) %>" onload="imgs_load(this)"></a></li>
 <%
    }
    				
  %>
  

  </ul>
  <a class="bottom_a prev_a" style="opacity: 0.7; "></a> <a class="bottom_a next_a" style="opacity: 0.7; "></a> </div>
<script>
	var i=0; //图片标识
var img_num=$(".img_ul").children("li").length; //图片个数
$(".img_ul li").hide(); //初始化图片	
play();
$(function(){
	 $(".img_hd ul").css("width",($(".img_hd ul li").outerWidth(true))*img_num); //设置ul的长度
	 
	 $(".bottom_a").css("opacity",0.7);	//初始化底部a透明度
	 //$("#play").css("height",$("#play .img_ul").height());
	 if (!window.XMLHttpRequest) {//对ie6设置a的位置
	 $(".change_a").css("height",$(".change_a").parent().height());}
	 $(".change_a").focus( function() { this.blur(); } );
	 $(".bottom_a").hover(function(){//底部a经过事件
		 $(this).css("opacity",1);	
		 },function(){
		$(this).css("opacity",0.7);	 
			 });
	 $(".change_a").hover(function(){//箭头显示事件
		 $(this).children("span").show();
		 },function(){
		 $(this).children("span").hide();
			 });
	 $(".img_hd ul li").click(function(){
		 i=$(this).index();
		 play();
		 });
	 $(".prev_a").click(function(){
		 //i+=img_num;
		 i--;
		 //i=i%img_num;
		 i=(i<0?0:i);
		 play();
		 }); 
	 $(".next_a").click(function(){
		 i++;
		 //i=i%img_num;
		 i=(i>(img_num-1)?(img_num-1):i);
		 play();
		 }); 
	 }); 
function play(){//动画移动	
	var img=new Image(); //图片预加载
	img.onload=function(){img_load(img,$(".img_ul").children("li").eq(i).find("img"))};
	img.src=$(".img_ul").children("li").eq(i).find("img").attr("src");
	//$(".img_ul").children("li").eq(i).find("img").(img_load($(".img_ul").children("li").eq(i).find("img")));
	
	$(".img_hd ul").children("li").eq(i).addClass("on").siblings().removeClass("on");
	if(img_num>7){//大于7个的时候进行移动
		if(i<img_num-3){ //前3个
		$(".img_hd ul").animate({"marginLeft":(-($(".img_hd ul li").outerWidth()+4)*(i-3<0?0:(i-3)))});
		}
		else if(i>=img_num-3){//后3个
			$(".img_hd ul").animate({"marginLeft":(-($(".img_hd ul li").outerWidth()+4)*(img_num-7))});
			}
	}
	if (!window.XMLHttpRequest) {//对ie6设置a的位置
	$(".change_a").css("height",$(".change_a").parent().height());}
	}
function img_load(img_id,now_imgid){//大图片加载设置 （img_id 新建的img,now_imgid当前图片）
    
    if(img_id.width/img_id.height>1)
	{
		if(img_id.width >=$("#play").width()) $(now_imgid).width($("#play").width());
		}
	else {
		if(img_id.height>=500) $(now_imgid).height(500);
		}
		$(".img_ul").children("li").eq(i).show().siblings("li").hide(); //大小确定后进行显示
	}
function imgs_load(img_id){//小图片加载设置
	if(img_id.width >=$(".img_hd ul li").width()){img_id.width = 80};
	//if(img_id.height>=$(".img_hd ul li").height()) {img_id.height=$(".img_hd ul li").height();}
	}
	</script>	 
            	 <%
            	 		} // end if picList.size>0
            	  %>
            </div>
            <div class="content">
            	<%
            	com.zhaopin.dao.factory.PlaceModel newsModel= new com.zhaopin.dao.factory.PlaceModel();
            	out.println( newsModel.getContent( 
            						place_id 
            						) ); //bean.get("news_content") %>
			
          </div><!-- /content -->
          
          

            
        </div>
        

        
    </div>
   

    <div style="height:30px; clear:both;"></div>
    


<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

	</body>
</html>

