$(function(){
	linkSelectCode("area_id","in_area_id",false,{id:"",text:"---不限---"},area_id );
	linkSelectCode("company_nature","in_company_nature",false,{id:"",text:"---不限---"},company_nature );
	linkSelectCode("company_person_num","in_company_person_num",false,{id:"",text:"---不限---"},company_person_num );
	linkSelectCode("company_registered_capital","in_company_registered_capital",false,{id:"",text:"---不限---"},company_registered_capital );
	linkSelectCode("job_fair_level","in_job_fair_level",false,{id:"",text:"---不限---"},job_fair_level );
	linkSelectCode("money","in_money",false,{id:"",text:"---不限---"},money );
	linkSelectCode("industry","in_industry",false,{id:"",text:"---不限---"},industry );
});
function invite( name )
{
	  var ids="";
	  var checkboxs = $("input[name="+name+"]:checked");
	  console.info( checkboxs );
	  if(checkboxs.length>0){
		  checkboxs.each(function(){
			  ids+=$(this).val()+",";
		  });
		  inviteCompany( job_fair_id, ids );
	  }else{
		  msg_alert("提示信息","请选择要邀请的企业","warning");
		  return;
	  }
}
function inviteCompany(job_fair_id,ids) {
	var url="/sheetAction.do?method=sendSheet&ids=" + ids+"&flow_id=001&buss_id=sch_apply&job_fair_id="+job_fair_id;
	$.post(url, {}, function(data){
	  if(data=="succ"){
        msg_alert('提示信息', '邀请成功!','succeed',function (){
        	window.location.reload();
        });
      }else{
        msg_alert('提示信息','邀请失败','error');
      }
    });  // $.post 
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