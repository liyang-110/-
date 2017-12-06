function closeDialog()
{
	var list = art.dialog.list;
	for (var i in list) {
		list[i].close();
	};
}
function msg_alert(title,msg,icon,in_func)
{
	artDialog({
			title: title , // '提示信息',
			content: msg,
			icon: icon, // 'face-smile',
			fixed: true,
			//width:350,
			lock:true,
			id:'alert',
			//time: 10,
			ok: function(){
					if(typeof(in_func) !='undefined'){
						in_func();
	             	}
					this.close();
			}
		});
}
function msg_wait(title,msg,icon,in_func,top)
{
		art.dialog({
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
			},
			cancel:function(){
				this.close();
			}
		});
}
function open_layer( ls_url ){
			art.dialog.open(ls_url, 
						{title: '简历预览',
						 height:window.screen.availHeight-200,
						 width:785,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false); 
}
function open_resume( ls_url ){
	art.dialog.open(ls_url, 
				{title: '简历预览',
				 height:window.screen.availHeight-200,
				 width:785,
				 fixed:true,
				 lock:true,
				 background:'#000',
				 opacity:0.3
				 },false); 
}
function initdatetime(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
	var h = date.getHours();
  	var i = date.getMinutes();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+ (h<10?('0'+h):h)+':'+(i<10?('0'+i):i);
}
function initdate(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
   var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
/* =======================================================*/
//函数作用：下拉框联动
//返回参数及数据类型：
/* ===================================================== */
function linkSelectCode(ins_sqlid,ins_id,empty,unshiftObj,in_value,in_func ){
try{
	var js_array = eval( ins_sqlid+"_js_array");
	if(js_array!=undefined){
            ls_return =js_array;
            /*
             if (ins_isbuxian!='undifined' && ins_isbuxian==1){
             	ls_return.unshift({ "text": "\u4E0D\u9650", "id": "" }); //加不限
             }
             */
            if( unshiftObj!= undefined && unshiftObj ){
            	ls_return.unshift( unshiftObj );
            }
             var selectObj = $("#"+ins_id);
             if( empty ){
            	 selectObj.empty();
             }
             for(var i=0;i<ls_return.length;i++){
            	 selectObj.append('<option value="'+ls_return[i].id+'">'+ls_return[i].text+'</option>');
             }
             if(in_value){
            	 selectObj.find("option[value='"+in_value+"']").attr("selected",true);
             }
	}
	if( typeof(in_func )!=undefined ){
		in_func( selectObj.val() );
	}
}catch(e){
}

}
function sign()
{
	$.ajax({
        url: "/sign.do",
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            if( data =='error'){
            	msg_alert('提示信息','签到失败','error');
            	return;
            }
            data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            var signCount = re[0].signCount;
            if( re[0].remark ){
            	msg_alert('提示信息',re[0].remark,'succeed');
            }else{
            	msg_alert('提示信息','今天已签到!','error');
            }
            $(".qiandao_btn").text("签到"+signCount+"天");
            $(".qiandao_btn").attr("disabled",true);
            return;
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function ajaxDealUrl(ins_url,ins_msg,ins_sucfunction) {
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
                         if(ins_sucfunction!='undifined'){
                            ins_sucfunction();
                         }
                    });
            	}else{
                    if(ins_sucfunction!='undifined'){
                            ins_sucfunction();
                    }
            	}
            } else if (re.length > 0 && re[0].returncode == 'fail') {
            	msg_alert('\u9519\u8bef\u4fe1\u606f', data, 'error');//错误信息
                return false;
            }
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
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