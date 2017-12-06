var callback=undefined;
function submitCallback(){
	if(callback !== undefined ){
		callback();
	}
}
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
				}
		});
}
function cmpanyApplyJobfair(job_fair_id, in_func ){
			if( in_func !== undefined ){
				callback=in_func;
			}
			art.dialog.open("/service/select_fuwu.jsp?job_fair_id="+job_fair_id, 
						{title: '请选择招聘会服务',
						 height:308,
						 width:705,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false); 
}
function checkApplyJobfairPoints( job_fair_id,school_id)
{
	var cur_points=0;
	var set_points=0;
	var ls_url =  "/esbServer.do?method=execProc&methodId=login_points_confirm&in_r=co&in_job_fair_id="+job_fair_id+"&in_compare=points1&date=" + new Date();
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
				art.dialog({
					title: "申请招聘会" , // '提示信息',
					content: '本操作需要点数'+set_points+'，您当前点数'+cur_points,
					icon:'face-smile',
					fixed: true,
					lock:true,
					id:'confirm',
					ok: function(){
						/* 发送招聘会申请 */
						var url= "/sheetAction.do?method=sendSheet&ids=" + job_fair_id+"&flow_id=001&buss_id=apply&APPLY_INVITED="+school_id;
						$.post(url, function(re){
							if(re=="succ"){
								msg_alert("提示信息","申请提交成功，请等待审核","succeed");
							}else{
								msg_alert("提示信息","申请失败","face-sad");
							}
						}); 
						/* 发送招聘会申请 */
					},
					cancel : function(){
							this.close();
					}
				});
			}			
		}else{
			msg_alert('提示信息',data.errordesc,'error');
		}
	}).fail(function(){
		msg_alert('提示信息','通讯错误，请联系管理员！','info');
	});
}
function ComApplyConfirm(title,msg,job_fair_id ,school_id){
	var content='<div style="max-width:260px;line-height:1.5em;">'+msg+'</div>';
	art.dialog({
		title: "申请招聘会" , // '提示信息',
		content: content ,
		icon:'question',
		fixed: true,
		lock:true,
		id:'confirm',
		okVal : '确定',
		cancelVal :'取消',
		ok: function(){
			/* 发送招聘会申请 */
			var url= "/sheetAction.do?method=sendSheet&ids=" + job_fair_id+"&flow_id=001&buss_id=apply&APPLY_INVITED="+school_id;
			$.post(url, function(re){
				if(re=="succ"){
					msg_alert("提示信息","申请提交成功，请等待审核","succeed");
				}else{
					// msg_alert("提示信息","申请失败","face-sad");
					alertMessage( re );
				}
			}); 
			/* 发送招聘会申请 */
		},
		cancel : function(){
				this.close();
		}
	});
}
function ComApply(job_fair_id,school_id){
	var url= "/sheetAction.do?method=checkSheet&job_fair_id=" + job_fair_id;
	$.post(url, function(data){
		if( data.type=='text'){
			if(data.data =="nologin"){
				// msg_alert("提示信息","请用企业账号登陆后预订！","error");
				quick_apply_form( job_fair_id );
			}else{
				alertMessage( data.data );
			}
		}else if( data.type=='json') {
			var info = data.data;
			var msg;
			if( info.period !='period'){
				msg_alert("提示信息","您的账号已过期，不能申请招聘会！","face-sad");
			}else if( info.chargetype==1 ){
				if( 'multiple'==info.job_fair_type && info.member_type=='member_type_06' ){
					msg= '您是至尊会员，会员有效期'+info.end_date+'，您可以免费申请这场招聘会！' +
							'凡是报名了招聘会，又不去参加的，账号将被屏蔽。是否确认参会？' ;
					ComApplyConfirm('申请招聘会',msg,job_fair_id,school_id);
				}else if( info.points<info.points1 ) {
					msg=' 本操作需要点数'+info.points1+'，您当前点数'+info.points+',点数不足。 '+
							'如需帮助请联系211校招网。电话：029-88662468';
					msg_alert("提示信息",msg,"face-sad");
				}else {
					msg='您当前点数'+info.points+'，本操作将扣除点数'+info.points1+
							'。凡是报名了招聘会，又不去参加的，账号将被屏蔽。是否确认参会？' ;
					ComApplyConfirm('申请招聘会',msg,job_fair_id,school_id);
				}
			}else if( info.chargetype==3 ){
				if( 'multiple'==info.job_fair_type && info.member_type=='member_type_06' ){
					msg= '您是至尊会员，会员有效期'+info.end_date+'，您可以免费申请这场招聘会！' +
					'凡是报名了招聘会，又不去参加的，账号将被屏蔽。是否确认参会？' ;
					ComApplyConfirm('申请招聘会',msg,job_fair_id,school_id);
				}else if( 'multiple'==info.job_fair_type && info.multiple>0){
						msg= '您的校园招聘会场次还有'+info.multiple+'次，场次有效期截止'+info.end_date+'日，'+
						'本次将扣除1次。凡是报名了招聘会，又不去参加的，账号将被屏蔽。是否确认参会？';
					ComApplyConfirm('申请招聘会',msg,job_fair_id,school_id);
				}else if( 'netcongress'==info.job_fair_type && info.netcongress>0 ){
						msg= '您的网络招聘会场次还有'+info.netcongress+'次，场次有效期截止'+info.end_date+'日，'+
						'本次将扣除1次。凡是报名了招聘会，又不去参加的，账号将被屏蔽。是否确认参会？';
					ComApplyConfirm('申请招聘会',msg,job_fair_id,school_id);
				}else{
					msg_alert("提示信息", '您的'+(('multiple'==info.job_fair_type)?'校园':'网络')+'招聘会场次数已用完，如需帮助请联系211校招网。电话：029-88662468',"face-sad");
				}
			}else{
				alert("未知错误");
			}
		}
		return;
		if(data=="continue"){
			/* 发送招聘会申请 */
			var url= "/sheetAction.do?method=sendSheet&ids=" + job_fair_id+"&flow_id=001&buss_id=apply&APPLY_INVITED="+school_id;
			$.post(url, function(re){
				//console.info( re );
				if(re=="succ"){
					msg_alert("提示信息","申请提交成功，请等待审核","succeed");
				}else if(re =="usedout"){
			        msg_alert('提示信息', '会员套餐招聘会数量已用完，申请失败!','face-sad');
			    }else{
			    	alertMessage( re );
				}
			}); 
			/* 发送招聘会申请 */
		}else if(data=="succ"){
		 	/*	
			art.dialog.open("/service/select_fuwu.jsp?job_fair_id="+job_fair_id, 
						{title: '请选择招聘会服务',
						 height:308,
						 width:705,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false); 
			*/
			checkApplyJobfairPoints( job_fair_id,school_id);
		}else{
			alertMessage( data );
		}
	});
}
function alertMessage( data ){
	if(data=="attended"){
			msg_alert("提示信息","您已预订招聘会，请不要重复申请！","warning");
	}else if(data=="applied"){
			msg_alert("提示信息","您已申请该招聘会，请等待学校审核！","warning");
	}else if(data=="invited"){
			msg_alert("提示信息","学校已向你发出邀请，请及时审核！","warning");
	}else if(data=="done"){
			msg_alert("提示信息","您已申请该招聘会，请不要重复申请预订！","warning");
	}else if(data=="nologin"){
			msg_alert("提示信息","请用企业账号登陆后预订！","error");
	}else if(data=="noaudit"){
			msg_alert("提示信息","您的账号未通过审核，不能申请招聘会！","face-sad");
	}else if(data=="nomoney"){
			msg_alert("提示信息","账号点数不足，无法申请招聘会！","face-sad");
	}else if(data=="over"){
			msg_alert("提示信息","该招聘会展位已满，请选择其他招聘会！","face-sad");
	}else if(data=="end"){
			msg_alert("提示信息","预订已经结束，请选择其他招聘会！","face-sad");
	}else if(data=="black"){
			msg_alert("提示信息","您的账户已被举办学校列人黑名单，无法预订该招聘会！如有异议，请联系211校招网！","face-sad");
	}else if(data =="usedout"){
        msg_alert('提示信息', '会员套餐招聘会数量已用完，申请失败!','face-sad');
	}else if(data =="outdate" ){
		msg_alert("提示信息","招聘会举办时间不在会员有效期内，申请失败！","face-sad");
	}else{
		msg_alert("提示信息","申请失败！","face-sad");
	}
}
function openOrderJob(company_id,job_id ){
	art.dialog.open("/service/personOrder.jsp?job_fair_id=&school_id=&company_id="+company_id+"&job_id="+job_id, 
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
	art.dialog.open("/service/personOrder.jsp?job_fair_id=&school_id=&company_id="+company_id+"&job_id="+job_id, 
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
//报名
function signUp(){
	art.dialog.open("/service/signUp.jsp", 
						{title: '我要报名',
						 height:290,
						 width:320,	
						 top:0,	
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false);
}
function openOrder(job_fair_id,school_id,company_id){
	if(typeof(company_id)=='undefined'){
		company_id="";
	}
	art.dialog.open("/service/personOrder.jsp?job_fair_id="+job_fair_id+"&school_id="+school_id+"&company_id="+company_id, 
						{title: '投递简历',
						 height:290,
						 width:320,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false);
}
function open_login_layer(){
	art.dialog.open("/service/popoverLogin.jsp", 
						{title:false,
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
function quick_apply_form( job_fair_id ){
	art.dialog.open("/service/quickApplyForm.jsp?id="+job_fair_id, 
						{title:false,
						 height:410,
						 width:620,	
						 fixed:true,
						 lock:true,
						 cancel:false,
						 padding:0,
						 background:'#000',
						 opacity:0.3,
						 },false);
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