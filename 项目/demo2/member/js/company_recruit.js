$(function(){
	/*
	var end_date_input = $("input[name='end_date']");
	end_date_input.bind("change",function(){
		calculateHurryPoints();
		alert("a");
	}).bind("propertychange", function(){
		calculateHurryPoints();
		alert("b");
	});
	*/
});
function errorMsgAlert( error_code )
{
	var msg="";
	switch( error_code ){
		case "arguement_error":msg="参数错误";break;
		case "noLogin": msg="请重新登录！";break;
		case "invalid_begin_or_end": msg="请输入开始截至日期！";break;
		case "begin_gt_end": msg="截止日期必须大于等于开始日期！";break;
		case "nomoney":msg="账户急聘日天数不足，请充值！";break;
		case "new_date": msg="开始日期已更新，请重新确认提交申请！";break;
		case "nomoney": msg="账户点数余额不足！";break;
		default : msg="未知错误！";
	}
	msg_alert( "错误信息",msg,"error" );
}
function calculateHurryPoints( form )
{
	try{
		var start_date = new Date( $("input[name='begin_date']",form ).val() );
		var end_date = new Date( $("input[name='end_date']",form).val() );
		var price = $("input[name='hurry_price']",form).val();
		var days = ( end_date.getTime()-start_date.getTime() )/86400000+1;
		if(days &&  days>0 ){
			$(".hurry_need_points",form).text( price * days );
			return true;
		}else{
			$(".hurry_need_points",form).text( 0 );
			errorMsgAlert("begin_gt_end");
			return false;
		}
	}catch(e ){
		errorMsgAlert("error" );
		return false;
	}
}
function submitHurryApply( form )
{
	form.form('submit', {   
	    url: cur_path+'/company/hurryRecruit.do',   
	    onSubmit: function(){   
	    	//return $(this).form("validate");
	    	return true;
	    },   
	    success:function(data){
	        if("succ"==data){
	        	msg_alert("提示信息","申请成功！","succeed",function(){
	        		window.location.reload();
	        	});
	        	return;
	        }else if( data && data.indexOf("invalid_begin_date")==0 ){
	        	// alert(data);
	        	var dataArr = data.split("@");
	        	if( dataArr[1] ){
	        		$(".hurry_begin_input",form).val( dataArr[1]  );
	        		$(".hurry_begin",form).val( dataArr[1] );
	        		calculateHurryPoints( form );
	        		errorMsgAlert( "new_date" );
	        	}
	        }else{
	        	errorMsgAlert( data );
	        }
	    }
	});  
}
function recruitHurry(job_id,job_name,is_hurry )
{
//		if( is_hurry ){
//			msg_alert("提示信息","紧急招聘尚未过期，不能重复申请！","error");
//			return;
//		}
		art.dialog({
			title:'申请紧急招聘' , // '提示信息',
			content: $("#recruitHurry").html(),
			fixed: true,
			lock:true,
			id:'apply-hurry-art-dialog',
			ok: function(){
				var form = $( this.content() ).find("form");
				submitHurryApply( form );
			},
			cancel:function(){
				this.hide();
			}
		}).hide();
		var content = art.dialog({id:'apply-hurry-art-dialog'}).content();
		var form = $(content).find("form");
		
		$(".job_id",form).val( job_id );
		$(".position",form).text( job_name );
		$(".is_hurry",form).val( is_hurry );
		
		$.ajax( {
			url : cur_path+'/company/hurryRecruit.do?buss=startDate&job_id='+job_id,
			type : "get",
			dataType : "text",
			beforeSend : function(){
//				$.messager.progress({
//					text :'稍等... ...'
//				});
			},
			success : function( res ) {
				
//				$.messager.progress("close");
				var data;
				try{
					data = $.parseJSON( res );
					if( data.ok != 'ok'){
						errorMsgAlert( data.ok );
						return ;
					}
				}catch(e ){
					msg_alert('提示信息','数据解析错误！','info');
					return ;
				}
				var start_date = data.start_date;
				var price = data.price;
				$(".hurry_begin_input",form).val( start_date );
				$(".hurry_price",form).val( price );

				$(".hurry_begin",form).val(start_date);
				
				//$("#hurry_end").bind("change",function(date){
				//		calculateHurryPoints();
				//});
				$('.hurry_end',form ).bind("click",function(e){
					WdatePicker({dateFmt:'yyyy-MM-dd',
								 minDate:start_date,
								 readonly:true,
								 onpicked:function(){
									 calculateHurryPoints()
								 }
					});
				});
				$(".hurry_end",form).val(start_date);
				if( calculateHurryPoints( form ) ){
					art.dialog({id:'apply-hurry-art-dialog'}).show();
				}
			}
		});
}
function setShow( job_id,status ){
	if( status=='show'){
		flag=0;
	}else{
		flag=1;
	}
	// flag=lo_selected[0].flag==1?0:1;
	ls_url = getUrl()+"&&in_action=setflag&in_r=co&in_flag="+flag+"&in_job_id="+job_id+"&date=" + new Date();
    updateRowStatus(ls_url,'操作成功' );
}
function setDel( job_id,status ){
	if( status=='show'){
		status=0;
	}else{
		status=1;
	}
	// flag=lo_selected[0].flag==1?0:1;
	ls_url = getUrl()+"&&in_action=setstatus&in_status="+status+"&in_job_id="+job_id+"&date=" + new Date();
    updateRowStatus(ls_url,'操作成功' );
}
function updateRowStatus(ins_url,ins_msg ) {
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
            	}else if(queryresult[0].ok=='unstatus'){
            		msg_alert('提示信息','企业资质未审核，请联系招聘顾问审核！','info',function(){
						window.location.reload();
                    });
            	}else if(queryresult[0].ok=='recharge'){
            		msg_alert('提示信息','发布职位数不足，请充值！','info',function(){
						window.location.reload();
                    });
            	}else if(queryresult[0].ok=='no_issue'){
            		msg_alert('提示信息','发布职位数不足，请充值！','info',function(){
						window.location.reload();
                    });
            	}else if(ins_msg!="" && ins_msg!=null){
                    msg_alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){
						window.location.reload();
                    });

            	}
            } else if (re.length > 0 && re[0].returncode == 'fail') {
                msg_alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
                return false;
            }
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function refreshJob( job_id,company_id ){	
	if( expire ){
		alert("您尚未开通会员或会员已过期,无法进行此操作!请联系您的客户经理，或拨打电话029-88662468与我们联系。");
		return;
	}
	var ls_url = getUrl()+"&in_action=refresh&in_job_id="+job_id+"&in_company_id="+company_id+"&date=" + new Date();
	$.post(ls_url,{}
	).done(function(data){
		var data = $.parseJSON( decodeURIComponent(data) );
		/*
		{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
		*/
		if(data.returncode =='ok'){
			if(data.queryresult[0].ok=='ok'){
				window.location.reload();
			}else if(data.queryresult[0].ok=='recharge'){
				msg_alert('提示信息','职位刷新数不足，请充值！','info');
			}else{
				msg_alert('提示信息','操作失败','error');
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
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_01&in_r=co&in_URLEncoding=UTF-8&in_company_id="+company_id;
	return ls_url;	
}
/* =======================================================*/
// 函数作用：打开新增页面
// 输入参数及数据类型：
//			  无
// 返回参数及数据类型：无
/* ===================================================== */
function add(){
	var li_currentnum = 0; //当前行
	var li_pagesize = 0; //每页行数
	var li_pagenum = 0; //页码
	var lo_selected;          //当前选中行
	var lo_pg;                //分页对象
	lo_selected = $("#resultId").datagrid("getSelected");                                               
	if (lo_selected) {
		li_currentnum = $("#resultId").datagrid("getRowIndex", lo_selected);
	}
	lo_pg = $("#resultId").datagrid("getPager");
	li_pagenum = lo_pg.pagination("options").pageNumber;
	li_pagesize = lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src = cur_path + "/company/jCompanyRecruitAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
}

/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	msg_alert('提示信息','请选择要删除的文件！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_company_recruit_mgr"+i+"="+ lo_selected[i].job_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_02" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
 }
   /* =======================================================*/
// 函数作用：得到当前被选中行的对象
// 输入参数及数据类型： ins_id   数据显示域id
//					ins_msg  无选中行时提示信息
// 返回参数及数据类型： lo_selected 选中行对象
/* ===================================================== */
	function getCheckObj(ins_id,ins_msg){
		//当前选中行
		if (!$("#"+ins_id).datagrid("getSelections") || $("#"+ins_id).datagrid("getSelections")==""){
			return false;
		}else{
			var lo_selected= $("#"+ins_id).datagrid("getSelections");
			return lo_selected;
		}
		
	}
	
/* =======================================================*/
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	msg_alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].job_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jCompanyRecruitEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}


function view() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	msg_alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].job_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jCompanyRecruitView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}

