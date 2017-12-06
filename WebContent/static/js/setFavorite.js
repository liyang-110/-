
//收藏职位（status 0:取消收藏/1:收藏）
function setFavorite( id,status ){
	var ls_url ="/esbServer.do?in_r=su&method=execProc&methodId=student_favorite_query&in_URLEncoding=UTF-8&in_action=set_open_zw&in_id="+id+"&in_status="+status+"&date=" + new Date();
	$.post(ls_url,{}
	).done(function(data){
		var data = $.parseJSON( decodeURIComponent(data) );
		if(data.returncode =='ok'){
			if(data.queryresult[0].ok=='ok'){
				window.location.reload();
			}else{
				msg_alert("提示信息","操作失败！","face-sad");
				return;
			}
		}else{
			msg_alert("提示信息",data.errordesc,"face-sad");
			return;
		}
	}).fail(function(){
		msg_alert("提示信息","服务器错误，请稍后再试！","face-sad");
		return;
	});
}
