function editItem()
{
	var obj = checkObject();
	if( obj && obj.type && 'netcongress'==obj.type ){
		window.location.href="update_network.jsp?action=update&id="+obj.id;
	}else if( obj && obj.type && 'multiple'==obj.type ){
		window.location.href="update_school.jsp?action=update&id="+obj.id;
	}else{
		msg_alert("提示信息","参数错误","error")
	}
}
function checkObject( )
{
	var checkboxs = $(".item_check:checked");
	if(checkboxs.length==0 ){
		msg_alert("提示信息","请选择招聘会","error");
		return undefined;
	}else if(checkboxs.length>1){
		msg_alert("提示信息","只能选择一行信息","error");
		return undefined;
	}else{
		return {
			id : checkboxs.val(),
			type : checkboxs.attr("data-type"),
			flag : checkboxs.attr("data-flag"),
			company_num : checkboxs.attr("data-company_num"),
			job_fair_company_num : checkboxs.attr("data-job_fair_company_num"),
			is_end :checkboxs.attr("data-is_end") 
		};
	}
}
function setShow( status ){
	var job_fair_id=""; 
	var flag="";
	var lo_selected   = checkObject();
	if( lo_selected ){
    	job_fair_id =  lo_selected.id;
    	if( status=='show'){
    		if( lo_selected.flag==0 ){
    			msg_alert("提示信息","招聘会状态已经为显示状态！","warning");
    			return;
    		}
    		flag=0;
    	}else{
    		if(lo_selected.flag==1){
    			msg_alert("提示信息","招聘会状态已经屏蔽状态！","warning");
    			return;
    		}
    		flag=1;
    	}
		ls_url ="/esbServer.do?method=execProc&methodId=ad_job_fair_edit&in_r=sc&in_action=setflag&in_flag="+flag+"&in_id=" + job_fair_id+"&date="+new Date();
	    updateRowStatus(ls_url,'操作成功', lo_selected );
    }
}
function updateRowStatus(ins_url,ins_msg,row ) {
	$.ajax({
        url: ins_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            	 	msg_alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	}else if(ins_msg!="" && ins_msg!=null){
                    msg_alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'succeed',function(){
                    	window.location.reload();
                    });
            	}
            } else if (re.length > 0 && re[0].returncode == 'fail') {
                msg_alert('\u9519\u8bef\u4fe1\u606f', data, 'error');//错误信息
                return false;
            }
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function inviteCompany()
{
	var obj = checkObject();
	if( obj && obj.id ){ 
		var company_num = parseInt( obj.company_num );
		var job_fair_company_num = parseInt( obj.job_fair_company_num );
		if ( company_num>=job_fair_company_num ){
			msg_alert("提示信息","该招聘会预定已满，请选择其他招聘会！","error");
			return;
		}else if( obj.is_end=='true'){
			msg_alert("提示信息","该招聘会预定已截止，请选择其他招聘会！","error");
			return;
		}
		window.location.href="invitation.jsp?id="+obj.id;
	}
}
function auditCompany(){
	var obj = checkObject();
	if( obj && obj.id ){
		window.location.href="audit.jsp?id="+obj.id;
	}
}
function companyList()
{
	var obj = checkObject();
	if( obj && obj.id ){
		window.location.href="participants.jsp?id="+obj.id;
	}
}