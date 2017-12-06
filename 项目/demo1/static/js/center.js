$(function () {
	Resume.getOpen();
});
var Resume = {
	 refresh:function(){	
			var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=fresh&date=" + new Date();
			$.post(ls_url,{}
			).done(function(data){
				var data = $.parseJSON( decodeURIComponent(data) );
				/*
				{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
				*/
				if(data.returncode =='ok'){
					if(data.queryresult[0].ok=='ok'){
						window.location.reload();
					}else{
						$.messager.alert('提示信息','操作失败','error');
					}
				}else{
					$.messager.alert('提示信息',data.errordesc,'error');
					return;
				}
			}).fail(function(){
				$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
				return;
			});
	},
	getOpen : function(){
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=get_open&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			/*
			{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
			*/
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					if( data.queryresult[0].status ==1 ){
						$("#open_switch_btn").bind("click",function(){
							Resume.setOpen(0);
						}).text('[隐藏简历]').css({"color":"#e03919"}).before('<img src="/static/img/hide.png" style="width:20px;">');
					}else{
						$("#open_switch_btn").bind("click",function(){
							Resume.setOpen(1);
						}).text("[公开简历]").css({"color":"#00bb9c"}).before('<img src="/static/img/show.png" style="width:20px;">');
					}
				}else{
					$.messager.alert('提示信息','操作失败','error');
				}
			}else{
				$.messager.alert('提示信息',data.errordesc,'error');
				return;
			}
		}).fail(function(){
			$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
			return;
		});
	},
	setOpen : function( status ){
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=set_open&in_status="+status+"&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			/*
			{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
			*/
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					window.location.reload();
				}else{
					$.messager.alert('提示信息','操作失败','error');
				}
			}else{
				$.messager.alert('提示信息',data.errordesc,'error');
				return;
			}
		}).fail(function(){
			$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
			return;
		});
	}
};