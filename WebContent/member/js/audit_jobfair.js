function audit(processid,buss_id,job_fair_name,lastNum,permit){
//  if(member_expire){
//		msg_alert('提示信息','会员到期，无法进行此操作！','error');
//		return;
//	}
	var mem="";
	var msg="";
	var textarea;
	if( lastNum==0 || permit ==0 ){
		if(lastNum<=0){
			mem='展位已满';
		}else{
			mem='预定已经截止';
		}
		if(buss_id=='apply'){
			msg="，申请已取消！";
		}else{ // 'sch_apply'
			msg="，邀请已取消！";		
		}
		msg_alert('提示信息',mem+msg,'info',function(){
				sendData("N",processid,buss_id,mem );
		});
	}else{
		art.dialog({
			title: job_fair_name , // '提示信息',
			opacity: 0.5,
			content:$("#dlg_audit").html(),
			icon: false, // 'face-smile',
			fixed: true,
			lock:true,
			padding:'0 15px',
			id:'dlg_audit',
//			okVal:'同意',
//			cancelVal:'不同意',
//			ok: function(){
//					submit_form(  $(this.content()).find("form")  ,close_layer );
//					return false;
//			},
//			cancel:function(){
//					this.close();
//			},
//			cancel:true,
			button:[{name: '同意', focus: true, callback: function () {
						sendData("Y",processid,buss_id,'');
					}},{name: '不同意',callback: function () {
						textarea= $(this.content()).find('textarea');
						mem =textarea.val();
						if(mem==''){
							msg_alert("提示信息","请填写不同意的原因","error",function(){
								textarea.focus();
							});
							return false;
						}else{
							sendData("N",processid,buss_id,mem);
						}
					}}, {name: '取消'}] 
		});
	}
}
function sendData(deal_type,processid,buss_id,mem,in_func )
{
	var data={processid: processid, buss_id: buss_id, deal_type: deal_type,mem:mem};
	var url= "/sheetAction.do?method=dealSheet";
	$.post(url,data,function(data){
		if(data=="succ"){
			window.location.reload();
			
		}else{
			//msg_alert('提示信息','服务器连接错误','info');
			alertMessage( data );
		}
	});
}
function alertMessage( data ){
	if( data == 'expire'){
			msg_alert("提示信息","会员帐号已到期","warning");
	}else if(data=="attended"){
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
		msg_alert("提示信息","预订失败！","face-sad");
	}
}