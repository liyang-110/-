//职位收藏  id=job_id  status 1：收藏 ，0：取消收藏
$(function () {
	Favorite.getOpen();
});
function msg_alert(title,msg,icon)
{
	var content='<div style="max-width:260px;">'+msg+'</div>';

		art.dialog({
			title: title , // '提示信息',
			content: content,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:false,
			id:'alert',
			time: 10,
			ok: function(){
					this.close();
					window.location.reload();
				}
		});
}
var Favorite = {
	getOpen : function(){
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_favorite_query&in_URLEncoding=UTF-8&in_action=get_open_zw&in_id="+job_id+"&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					if( data.queryresult[0].count ==1 ){
						$("#open_favorite_btn").bind("click",function(){
							Favorite.setOpen(0);
						}).text('已收藏').prepend("<i class='fa fa-star sc' aria-hidden='true'> </i>").css({"color":"#999","background":"#fff"});
					}else if(data.queryresult[0].count ==0){
						$("#open_favorite_btn").bind("click",function(){
							Favorite.setOpen(1);
						}).text("收藏").prepend("<i class='fa fa-star-o sc' aria-hidden='true'> </i>").css({"color":"#f2994b"});
					}else{
						msg_alert("提示信息","收藏职位异常，请联系网站客服！","face-sad");
						return;
					}
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
	},
	setOpen : function( status ){
		if(user_type == null||user_type == ""){
			msg_alert("提示信息","学生会员才能收藏哦！","face-sad");
			return;
		}
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_favorite_query&in_URLEncoding=UTF-8&in_action=set_open_zw&in_id="+job_id+"&in_status="+status+"&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					if(status==0){
						msg_alert("提示信息","取消成功！","succeed");
					}else if(status==1){
						msg_alert("提示信息","收藏成功！","succeed");
					}
				}else{
					msg_alert("提示信息","操作失败,请稍后再试！","face-sad");
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
};

