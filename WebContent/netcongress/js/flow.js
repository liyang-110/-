var callback=undefined;
function submitCallback(){
	if(callback !== undefined ){
		callback();
	}
}
function msg_alert(title,msg,icon,in_func)
{
		art.dialog({
			title: title , // '提示信息',
			content: msg,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:false,
			id:'alert',
			// time: 5,
			ok: function(){
					if(typeof(in_func) !='undefined'){
						in_func();
	             	}
					this.close();
				}
		});
}
function openOrderJob(company_id,job_id ){
	art.dialog.open(cur_path +"/netcongress/frame/personOrder.jsp?job_fair_id=&school_id=&company_id="+company_id+"&job_id="+job_id, 
						{title: '投递简历',
						 height:290,
						 width:320,	
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false);
}
//设置弹出框位置
function openOrderJobSetTop(company_id,job_id,top){
	art.dialog.open(cur_path +"/netcongress/frame/personOrder.jsp?job_fair_id=&school_id=&company_id="+company_id+"&job_id="+job_id, 
						{title: '投递简历',
						 height:290,
						 width:320,	
						 top:top,	
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false);
}
function openOrder(job_fair_id,school_id,company_id,company_name){
	if(typeof(company_id)=='undefined'){
		company_id="";
	}
	if(typeof(company_name)=='undefined'){
		company_name="";
	}
	art.dialog.open(cur_path +"/netcongress/frame/personOrder.jsp?job_fair_id="+job_fair_id+"&school_id="+school_id+"&company_id="+company_id+"&company_name="+company_name, 
						{title: '投递简历-'+company_name ,
						 height:290,
						 width:320,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false);
}
function daojishi( end )
{
		var ts;
		var html='';
		try{
			ts = new Date(end )- ( new Date() );
		}catch(e){
			return '';
		}
		if(ts<=0 ){
			return '00时00分00秒';
		}
		var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数  
		var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
		var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
		var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
		if(dd>0){
			html+= dd + "天";
		}
		html +=checkTime(hh) + "时" + checkTime(mm) + "分" + checkTime(ss) + "秒";
		return html;
}
function checkTime(i)    
{    
   if (i < 10) {    
	   i = "0" + i;    
	}    
   return i;    
}
/*页面内搜索*/
var searchKey="";
var searchNext=0;
var searchNode=[];
var searchCount=0;
function ajaxFindInPage( str )
{
	console.info( str );
	if(str==''){
		//alert('请输入关键字');
		$("#job_fair_company_list_result").html("");
		$("#job_fair_company_list").show();
		return false;
	}else{
		$(".cont_pull").css({"background-color":"none"});
		try{
			$("#job_fair_company_list").textSearch( str ,{
				markClass:"lightNode",
				markColor:"red",
				callback:function(){
					// $(".cont_pull").css({"background-color":"none"});
					try{
						$("#job_fair_company_list").textSearch( str ,{
							markClass:"lightNode",
							markColor:"red",
							callback:function(){
								searchNode= $("span[rel='mark']");
								searchCount=searchNode.length;
								if( searchCount== 0 ){
									alert("没有");
									return;
								}else{
									$("#job_fair_company_list").hide();
								}
								$("#job_fair_company_list_result").html("");
								searchNode.each(function() {
									//$(this).closest( ".cont_pull" ).css({"background-color": "#00C88A"});
									var node = $(this).closest( ".cont_pull" ).clone();
									$("#job_fair_company_list_result").append(
											node
									);
								});	
							}
						});
					}catch(e){

					}
				}
			});
		}catch(e){
		}
		return false;
	}
}
function findInPage(str){
	if(str!="" && str == searchKey && searchNext<searchCount ){
		searchNext=searchNext+1;
		scrollNext();
		return false;
	}else{
		searchKey=str;
		searchNext=0;
		//$("#head_search_result").text("");
	}
	$(".cont_pull").css({"background-color":"none"});
	try{
		$("#job_fair_company_list").textSearch( str ,{
			markClass:"lightNode",
			markColor:"red",
			callback:function(){
				scrollNext();
			}
		});
	}catch(e){

	}
	return false;
}
function scrollNext()
{
	var result="";
	try{
		searchNode= $("span[rel='mark']");
		//console.info(marks);
		searchCount=searchNode.length;
		
		//console.info( marks[0] );
		if( searchNext>=searchCount ){
			searchNext =0;
			$("#head_search_result").text("("+(searchNext+1)+"/"+searchCount+")");
			scrollTo( searchNode[searchNext].closest( ".cont_pull" ),500,50 );
		}else{
			$("#head_search_result").text("("+(searchNext+1)+"/"+searchCount+")");
			scrollTo( searchNode[searchNext].closest( ".cont_pull" ),500,50 );
		}
		searchNode.each(function() {
			$(this).closest( ".cont_pull" ).css({"background-color": "#00C88A"});
		});	
	}catch(e){
	}
}
function scrollTo(scrolltodom,scrolltime,top )
{
	$(".currentNode").removeClass("currentNode");
	$(scrolltodom).addClass("currentNode");
	$('html,body').animate({
					scrollTop:$(scrolltodom).offset().top-top},scrolltime
	);
}
/*页面内搜索*/
/*页面加载更多*/
function ajaxMoreJson( in_url ,in_func )
{
	$.post(in_url,{}
	).done(function(data){
		if(data.returncode=='ok'){
			in_func( data.queryresult );
		}else if(data.returncode=='fail'){
			msg_alert('提示信息', data.errordesc ,'face-sad');
		}
	}).fail(function(){
		// msg_alert('提示信息','通讯错误，请刷新页面！','error');
	});
}
/*页面加载更多*/
function go_top(){
	$('html,body').animate({
						scrollTop:0},10
	);
}
function refresh(){
	location.reload();
}
function reload(){
	$('html,body').animate({
						scrollTop:0},10
	);
	location.reload();
}
function open_deal_resume( student_id, order_id ){
	
	var ls_url='/company/resumeDetail.do?netcongress=true&interview=true&id='+student_id+'&oid='+order_id;

	art.dialog.open(ls_url+'&callback=refresh', 
			{title: '查看简历',
			 height:window.screen.availHeight-200,
			 width:785,
			 fixed:true,
			 lock:true,
			 background:'#000',
			 opacity:0.3
			 },false); 
}
function view_resume(student_id){
	open_resume_layer("/company/resumeDetail.do?netcongress=true&id="+student_id );
}
function open_resume_layer(in_url)
{
	art.dialog.open(in_url+'&callback=refresh', 
			{title: '查看简历',
			 height:window.screen.availHeight-200,
			 width:785,
			 fixed:true,
			 lock:true,
			 background:'#000',
			 opacity:0.3
			 },false); 
}
function open_agree_layer( position, user_type )
{
	if( checkPlatform() ){
		return;
	}
	var ls_url="";
	var width;
	var height;
	var winWidth;
	var winHeight;
	if (window.innerWidth) 
		winWidth = window.innerWidth; 
	else if ((document.body) && (document.body.clientWidth)) 
		winWidth = document.body.clientWidth; 
	//获取窗口高度 
	if (window.innerHeight) 
		winHeight = window.innerHeight; 
	else if ((document.body) && (document.body.clientHeight)) 
		winHeight = document.body.clientHeight; 
		//通过深入Document内部对body进行检测，获取窗口大小 
	if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) 
	{ 
		winHeight = document.documentElement.clientHeight; 
		winWidth = document.documentElement.clientWidth; 
	} 
	
	if( position=='wellcome'){
		switch( user_type ){
			case 'company':
				height='100%';
				width='100%';
				ls_url='/netcongress/ext/wellcome-company.html';
				break;
			default:
				height=winHeight-52;
				width=800;
				ls_url='/netcongress/frame/index.html';
		}
		
	}else{
		height=winHeight-52;
		width=800;
		ls_url='/netcongress/frame/agree.jsp';
	}
	art.dialog.open(ls_url, 
			{title:false,
			 height:height,
			 width:width,
			 fixed:true,
			 padding:'0',
			 lock:true,
			 background:'#000',
			 opacity:0,
			 cancel: false
			 },true); 
}
function checkPlatform(){
	  if(/android/i.test(navigator.userAgent)){
		  return true;
		  //document.write("This is Android'browser.");//这是Android平台下浏览器
	  }
	  if(/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)){
		  return true;
		  //document.write("This is iOS'browser.");//这是iOS平台下浏览器
	  }
	  if(/Linux/i.test(navigator.userAgent)){
		  return true;
		  //document.write("This is Linux'browser.");//这是Linux平台下浏览器
	  }
	  if(/Linux/i.test(navigator.platform)){
		  return true;
		  //document.write("This is Linux operating system.");//这是Linux操作系统平台
	  }
	  if(/MicroMessenger/i.test(navigator.userAgent)){
	      return true;
		  //document.write("This is MicroMessenger'browser.");//这是微信平台下浏览器
	  }
	  return false;
}

function open_instruction_layer()
{
	var ls_url='/netcongress/frame/instruction.jsp';
	art.dialog.open(ls_url, 
			{title: '操作指南',
			 height:window.screen.availHeight-200,
			 width:785,
			 fixed:true,
			 lock:true,
			 background:'#000',
			 opacity:0
			 },true); 
}
$(function(){ 
	/*
	$(".interviewLi").live("mouseenter",function(){
		$(this).css({"background-color":"#00C88A"});
		
	});
	$(".interviewLi").live("mouseleave",function(){
		$(this).css({"background-color":"transparent"});
	}); 
	
	$(".nav_right").bind("click",function(e){
		e.preventDefault();
		art.dialog({
			title: false , // '提示信息',
			content: '<div style="margin-top:-2px;margin-bottom:2px;background:url(/netcongress/img/nav_right_pop_bg.jpg);height:260px;width:500px;" ><a onclick="closeDialog(this);" href="javascript:;"></a></div>',
			icon: false, // 'face-smile',
			fixed: true,
			lock:false,
			padding:'0',
			id:'nav_right'
		});
		
	});
	*/
});
function closeDialog( close ){
	art.dialog({id:'nav_right'}).close();
}
function open_login_layer(){
	art.dialog.open(cur_path +"/service/popoverLogin.jsp", 
						{
					     id : 'popoverLogin',
						 title:false,
						 height:410,
						 width:450,	
						 fixed:true,
						 lock:false,
						 cancel:false,
						 padding:0,
						 background:'#000',
						 opacity:0.3,
						 },false);
}