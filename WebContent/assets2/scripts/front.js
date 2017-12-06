function closeDialog()
{
	var list = art.dialog.list;
	for (var i in list) {
		list[i].close();
	};
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
			time: 5,
			ok: function(){
					if(typeof(in_func) !='undefined'){
						in_func();
	             	}
					this.close();
			}
		});
}
function msg_wait(title,msg,icon,in_func,top)
{
		art.dialog({
			title: title , // '提示信息',
			content: msg,
			top:top,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:true,
			id:'wait',
			ok: function(){
					if(typeof(in_func) !='undefined'){
						in_func();
	             	}
					this.close();
			}
		});
}
function open_layer( ls_url ){
			art.dialog.open(ls_url, 
						{title: '简历预览',
						 height:window.screen.availHeight-200,
						 width:785,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false); 
}