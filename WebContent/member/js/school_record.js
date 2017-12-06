function msg_alert(title,msg,icon,callback)
{
	var content='<div style="max-width:260px;">'+msg+'</div>';

		art.dialog({
			title: title , // '提示信息',
			content: content,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:true,
			id:'alert',
			ok: function(){
					this.close();
					if(callback !== undefined ){
						callback();
					}
				}
		});
}
function cancelSheet(processid){
	var ls_url= "/sheetAction.do?method=cancelSheet&ids=" + processid+"&flow_id=001&buss_id=apply";
	$.ajax({
        url: ls_url,
        type: "post",
        dataType: "text",
        success: function(data) {
        	if('succ' == data ){
        		msg_alert("提示信息","操作成功","succeed",function(){
        			window.location.reload();
        		});
        	}else{
        		msg_alert("提示信息","操作失败","error");
        	}
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}