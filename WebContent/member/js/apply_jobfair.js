function applyJobfair(company_status,member_expire,ids) {
		if( ids =='' || ids == undefined ){
			msg_alert('提示信息',"请选择要申请的招聘会",'error');
			return;
		}
   		var alert_msg="";
   		if(company_status!=1 ){
   			alert_msg='<div style="line-height:2em;width:300px;">您的账号未审核，请上传有效营业执照和代码证电子版，联系211校招网及时审核。<br/>电话：029-88662468.';
			msg_alert('提示信息',alert_msg,'error');
			return;
        }else if(member_expire){
			msg_alert('提示信息','会员到期，无法进行此操作！','error');
			return;
		}
   		var url= "/sheetAction.do?method=sendSheet&ids=" +ids+"&flow_id=001&buss_id=apply";
 		$.post(url, {}, function(data){
          if(data=="succ"){
        	msg_alert('提示信息', '申请成功，请等待学校审核!','face-smile',function (){
        		window.location.reload();
        	});
          }else{
          	show_result( data );
             // $.messager.alert('提示信息','操作失败，您可能已申请过该招聘会，或者学校已向您发了邀请！','info');
          }
        });
}
function show_result( data ){
		if(data=="attended"){
			msg_alert("提示信息","您已预定招聘会，请不要重复申请！","warning");
		}else if(data=="applied"){
			msg_alert("提示信息","您已申请该招聘会，请等待学校审核！","warning");
		}else if(data=="invited"){
			msg_alert("提示信息","学校已向你发出邀请，请及时审核！","warning");
		}else if(data=="done"){
			msg_alert("提示信息","您已申请该招聘会，请不要重复申请预定！","warning");
		}else if(data=="nologin"){
			msg_alert("提示信息","请用企业账号登陆后预约！","error");
		}else if(data=="noaudit"){
			msg_alert("提示信息","您的账号未通过审核，不能申请招聘会！","error");
		}else if(data=="nomoney"){
			msg_alert("提示信息","账号点数不足，无法申请招聘会！","error");
		}else if(data=="over"){
			msg_alert("提示信息","该招聘会展位已满，请选择其他招聘会！","error");
		}else if(data=="end"){
			msg_alert("提示信息","预定已经结束，请选择其他招聘会！","error");
		}else if(data=="black"){
			msg_alert("提示信息","您的账户已被举办学校列人黑名单，无法预定该招聘会！<br/>如有异议，请联系211校招网！","error");
		}else if( data=="usedout"){
			msg_alert('提示信息', '会员套餐招聘会数量已用完，申请失败!','error');
		}else if(data =="outdate" ){
			msg_alert('提示信息', '招聘会举办时间不在会员有效期内，申请失败!','error');
		}else{
			msg_alert("提示信息","预订失败！","error");
		}
}