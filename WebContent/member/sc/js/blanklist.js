/* ====================================*/
// 函数作用：（加入\移出黑名单）
/*====================================*/
function blacklist(company_id,flag)
{
	if( flag == true ){
			var content=$("#dlg_check").html();
			msg_wait("加入黑名单",content,undefined,function(){
				sendData(company_id,flag);
			});
	}else{
		 msg_wait("提示信息","确定移出黑名单！",'question', function(r){
		  		sendData(company_id,flag);
		  });
		 
	}
 }
function sendData(company_id,flag)
{
	var mems="";
	var reason_type="";
	if(flag==true){
		mems =$("#mem").val();
		reason_type = $("input[name=reason_type]:checked").val();
		if( typeof(reason_type)!='undefined' ){
			mems = reason_type+"[BR]"+mems;
		}
		if(mems==""){
			msg_alert("提示信息","请选择或填写加入黑名单的原因！","warning");
			return;
		}
	}
    var ls_url = "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=jobfair_company_query&in_r=sc&in_action=black&in_job_fair_id="+job_fair_id+"&in_school_id="+school_id+"&in_company_id="+company_id+"&in_message="+mems+"&date="+new Date();
	$.ajax({
        url: ls_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            		msg_alert("提示信息",msg,'face-smile',function(){
            			window.location.reload();
            		});
            	}else{
            		msg_alert("提示信息","操作成功",'face-smile',function(){
            			window.location.reload();
            		});
            	}
            }else{
            	msg_alert("提示信息","未知错误",'error');
            }
        }
	});
}