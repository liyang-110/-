//企业每月评价
function openAppraise(){
	art.dialog.open("/member/appraise.jsp", 
			{title:false,
			 height:368,
			 width:350,	
			 fixed:true,
			 lock:true,
			 cancel:false,
			 padding:0,
			 background:'#000',
			 opacity:0.5,
			 },false);
}

function sendAppraise(){
	function msg_alert(title,msg,icon,in_func){
		artDialog({
				title: title , // '提示信息',
				content: msg,
				icon: icon, // 'face-smile',
				fixed: true,
				width:150,
				lock:true,
				id:'alert',
				//time: 10,
				ok: function(){
						if(typeof(in_func) !='undefined'){
							in_func();
		             	}
						window.location.reload();
						this.close();
						api.close();
						
				}
			});
	}
	
	var g1=$("#star_num_1").val();
	var g2=$("#star_num_2").val();
	var g3=$("#star_num_3").val();
	if(g1==0||g2==0||g3==0){
		msg_alert('提示信息','请填写评价！','error');
		return null;
	}
	var average=eval(g1+"+"+g2+"+"+g3)/3;
	average = parseFloat(average.toFixed(1));
	var introduce=$("#introduce").val();
	
	$.ajax({
        url: "/member/appraise.do",
        data:{g1:g1,g2:g2,g3:g3,average:average,introduce:introduce},
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            if( data =='error'){
            	msg_alert('提示信息','评价失败!','error');
            }else if(data=='yes'){
            	msg_alert('提示信息','本月已评价!','succeed');
            }else if(data=='ok'){
            	msg_alert('提示信息','评价成功!','succeed');
            }
            return;
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
//登录企业会员中心，提示今日简历，和待处理简历
$(function(){
	var content='<div>今日共收到简历：<span style="color:#e03919;font-size:16px;font-weight:bold;">'+allresume+'</span> 份，待处理简历：<span style="color:#e03919;font-size:16px;font-weight:bold;">'+untreated+'</span> 份。</div>';
	art.dialog({
		title: '提示信息' , // '提示信息',
		content: content,	
		fixed: true,
		lock:false,
		id:'alert',
		top:'100%',
		left:'100%',
		time: 5,
		background:'#000',
		opacity:0.1,
		ok: function(){
				this.close();
			}
	});
});