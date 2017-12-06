function msg_wait(title,msg,icon,in_func,top)
{
	return artDialog({
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
function buy_resume( student_id )
{
	var cur_points=0;
	var set_points=0;
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_points_confirm&in_r=co&in_role=company&in_compare=points9&date=" + new Date();
	$.post(ls_url,{}
	).done(function(data){
		var data = $.parseJSON( decodeURIComponent(data) );
		/*
		{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
		*/
		if(data.returncode =='ok'){
			cur_points=data.queryresult[0].points;
			set_points=data.queryresult[0].compare;
			if(set_points>cur_points){
				msg_alert('提示信息','本操作需要点数'+set_points+'，您当前点数'+cur_points+',点数不足！','error');
			}else{
				buy_confirm(cur_points,set_points,student_id);
			}			
		}else{
			msg_alert('提示信息',data.errordesc,'error');
			return;
		}
	}).fail(function(){
		msg_alert('提示信息','服务器错误，请稍后再试！','info');
		return;
	});
}
function buy_confirm(points,compare,student_id) {
		art.dialog.confirm('当前点数' + points + '<br/>本次将扣除点数' + compare, function(topWin) {
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_down&in_r=co&in_order_id=" + order_id + "&date=" + new Date();
			if ("" == order_id) {
				ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_down&in_r=co&in_student_id=" + student_id + "&date=" + new Date();
			}

			$.post(ls_url, {}
			).done(function(data) {
				var data = $.parseJSON(decodeURIComponent(data));
				/*
				{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
				*/
				if (data.returncode == 'ok') {
					if (data.queryresult[0].ok == 'ok') {
						//deal_resume(2);
						window.location.reload();
					} else if (data.queryresult[0].msg) {
						art.dialog.alert(data.queryresult[0].msg);
					} else {
						art.dialog.alert('提示信息', '操作失败');
					}
				} else {
					art.dialog.alert(data.errordesc);
				}
			}).fail(function() {
				art.dialog.alert('服务器错误，请稍后再试！');
			});
		}, function() {
			// alert('你取消了操作');
		});
		}
function download_resume() {
	var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_down&in_r=co&in_order_id=" + order_id + "&date=" + new Date();
	if ("" == order_id) {
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=person_order_down&in_r=co&in_student_id=" + student_id + "&date=" + new Date();
	}
	$.post(ls_url, {}
	).done(function(data) {
		var data = $.parseJSON(decodeURIComponent(data));
		/*
		{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
		*/
		// console.info( data );
		if (data.returncode == 'ok') {
			if (data.queryresult[0].ok == 'ok') {
				window.location.reload();
			} else if (data.queryresult[0].msg) {
				msg_alert('提示信息', data.queryresult[0].msg, 'error');
			} else {
				msg_alert('提示信息', '操作失败', 'error');
			}
		} else {
			msg_alert('提示信息', data.errordesc, 'error');
		}
	}).fail(function() {
		msg_alert('提示信息', '服务器错误，请稍后再试！', 'info');
	});
}

function close_layer() {
	try {
		var parent = art.dialog.parent; // 父页面window对象
		var api = art.dialog.open.api;
		api.close();
	} catch (e) {
		var dialog = art.dialog({
			id : 'dialog'
		});
		dialog.close();
		window.location.reload();
	}
	if (callback != undefined && callback != null && callback != '') {
		eval('parent.' + callback + '()');
	//parent.location.reload();
	}
}
function cancel_layer() {
	if (window == top) {
		window.close();
	} else {
		var parent = art.dialog.parent; // 父页面window对象
		var api = art.dialog.open.api;
		api.close();
	}

}
function deal_resume( action )
{
	var title='';
	var id='';
	switch( action ){
		case 1:
			title='简历未通过';
			id='#dlg_failure1';
			break;
		case 2:
			title='通知面试';
			id='#dlg_interview';
			break;
		case 3:
			title='面试未通过';
			id='#dlg_failure2';
			break;
		case 4:
			title='面试通过';
			id='#dlg_reinterview';
			break;
		case 5:
			title='通知录用';
			id='#dlg_offer';
			break;
		default:
			alert('参数错误！');
			return ;
	}
	var art = artDialog({
			top: 50,
			title: title , // '提示信息',
			content:$(id).html(),
			icon: false, // 'face-smile',
			fixed: true,
			lock:true,
			id:'dialog',
			ok: function(){
				
					submit_form(  $(this.content()).find("form")  ,function(){
						window.location.reload();
					} );
					return false;
			},
			cancel:function(){
					this.close();
			}
	});
	if( action== 1 || action== 3 ){
		var content = art.content();
		$(content).find("input").bind("change",function(e){
				var contentInput = $(this).parents(".reason-options").next().find("input[name=content]");
				var optionsCheckbox = $(this).parents(".reason-options").find( "input[type=checkbox]:checked" );
				var otherReason =  $(this).parents(".reason-options").find( "input[type=text]" );
				if( otherReason.val() !='' ){
					optionsCheckbox.push( otherReason );
				}
				resetContent( optionsCheckbox , contentInput );
		});
	}
}
function submit_form(  form , succ , fail )
{
	// alert(  form.serialize() );
	var status = form.find("[name=status]").val();
	var content = form.find("[name=content]").val();
	if( content==undefined || content=='' ){
		if( status == 1 || status==3 ){
			alert("请选择未通过的原因！");
		}else{
			alert("内容不能为空！");
			form.find("[name=content]").focus();
		}
		return;
	}
	var url='/netcongress/dealResume.do';
	$.post(url, form.serialize(), function(data){
		try{
			if( data.ok == 'ok'){
				msg_wait('提示信息',data.msg,"succeed",succ,50);
			}else if( data.ok == 'fail' ){
				msg_wait('提示信息',data.msg,"face-sad",fail,50 );
			}else{
				msg_wait('提示信息','未知错误！',"face-sad",fail,50 );
			}
		}catch(e){
			msg_wait('提示信息','通讯错误！',"face-sad",fail,50 );
		}
		return;
	});
}
function resetContent( optionsCheckbox , contentInput )
{
	var reasons="";
	optionsCheckbox.each(function(){
		reasons += $(this).val()+',';
	});
	contentInput.val( reasons );
}
//查看简历，一键面试
function interview(hx_user,headpic,name){
	var parent = art.dialog.parent;				// 父页面window对象
	var api = art.dialog.open.api;				//本窗口对象					
	parent.IM_interview(api, hx_user,headpic,name );
	
}