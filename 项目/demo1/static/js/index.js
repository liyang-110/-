/**
 * 
 */
function index_jobfair_dlg(){
	if( $.cookie("todayNetcongress")==undefined ){
 			$(document).click(function(){
 				if(  $.cookie("todayNetcongress")==undefined ){
 					$.cookie("todayNetcongress",true );
 	 	 			window.open("https://www.211zph.com/netcongress/start.do?id=201704190012182");
 				}else{
 					
 				}
 			});
	}
}
/**
 * 
 */
function index_alert(action){
	if(action==false){
		var d = art.dialog({
		     id : "index-alert-dlg"});
		d.close();
		return;
	}else if( $.cookie ){
		if( $.cookie("index_alert") ){
			return;
		}else{
			$.cookie("index_alert",true);
			/*
			var expireDate = new Date();
			expireDate.setTime( expireDate.getTime()+ 1000*60*60 );
			$.cookie("index_alert", 'true', {
				  path : '/',//cookie的作用域
				  expires : expireDate
			});
			*/
		}
	}
	var d = art.dialog({
				     id : "index-alert-dlg", 
				     content : '<div style="width:612px;height:488px;position:relative;">'
								+'<div style="position:absolute;z-index:9999;right:0;">'
								+'<a onclick="index_alert(false);" href="javascript:;" style="margin-top:-10px;margin-right:-10px;display:block;width:20px;height:20px;line-height: 20px;float:right;font-size:30px;border:1px solid #333;background:#fff;color:#333;border-radius:15px;text-decoration: none;">&times;</a></div>'
								+'<a target="_blank" href="http://www.211zph.com/jobfair/detail.do?id=201611160010783"><img style="position:absolute;top:0;left:0;" width="612" height="488" src="/upload/ad/20161124.jpg"/></a></div>',
					 title:false,
					 height:488,
					 width:612,	
					 fixed:true,
					 lock:false,
					 cancel:false,
					 padding:'0px 0px',
					 background:'#000',
					 opacity:0.7,
					 resize: false,
					 drag :true,
					 init : function(){
						$( this.content() ).parents(".aui_inner").css({"background":"transparent"});
					 }
					 });
}
function leftbottom_dlg()
{
			art.dialog.open("/ad/popover-small.html", 
								{title:false,
								 height:'300px',
								 width:'300px',	
								 fixed:true,
								 zIndex:999999999,
								 lock:false,
								 cancel:false,
								 padding:0,
								 background:'#000',
								 opacity:0.3,
								 left: '0',
							     top: '100%',
								 },false);
 }
$(function(){
	// index_alert();
	// index_jobfair_dlg();
	// leftbottom_dlg();
});