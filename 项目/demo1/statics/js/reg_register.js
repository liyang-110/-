$(document).ready(function(){
		$('.register-form').validate(options_stu);
});

var options_stu={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	            	user_contact: {
	                    required: true,
	                    remote:{url:"/validateForm.do",
	                    	dateType:"json",
	                    	type:"post",
	                    	dataFilter:function(data,type){//typeof data string
	                    	if(data == "true"){
	                    		$("#show").attr("onclick","sendVerifyCode();");
	                    		$("#show").css("background","#02c084");
	                    		return true;
	                    	}else if(data == "false"){
	                    		$("#show").removeAttr("onclick");
	                    		$("#show").css("background","#efefef");
	                    		return false;
	                    	}
	                    	}
	                    }
	            },
	            verify_code: {
	                    required: true,
	                    minlength:4,
	                    maxlength:4,
	                    number:true
	            },
	            user_pass: {
	                    required: true,
	                    minlength:6
	            },
	            ruser_pass: {
	            	equalTo:"#user_pass"
	            },
	            flag: {
	                required: true
	            }
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	            	user_contact: {
	                    required:  "  请输入手机号！",
	                    remote:"  该用户名已被注册，请重新输入！"
	                },
	                verify_code: {
	                    required:  "  请输入验证码！",
	                    minlength: "  验证码为四位数字",
	                    maxlength: "  验证码为四位数字",
	                    number:    "  必须输入合法的数字"
	                },
	                user_pass: {
	                    required:  "  请输入密码！",
	                    minlength: "  密码不能小于六个字符"
	                },
	                ruser_pass: {
	                	equalTo: "  二次密码不一致!"
	                },
	                flag: {
	                    required: "  必须同意本协议才能继续注册！"
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	            },
	            highlight: function (element) { // hightlight error inputs
	                //$(element).closest('.control-group').addClass('error'); // set error class to the control group
	            },
	            success: function (label) {
	                //label.closest('.control-group').removeClass('error');
	                //label.remove();
	            },
	            errorPlacement: function (error, element) {
	            	if (element.attr("name") == "flag") { // insert checkbox errors after the container                  
	                    error.addClass('help-small no-left-padding lableCss flag').insertAfter(element.closest('.control-group'));
	                }else {
	                    error.addClass('help-small no-left-padding lableCss').insertAfter(element.closest('.control-group'));
	                } 
	                },
	            submitHandler: function(form) {
	            	$("#register_btn").attr("disabled",true);
	            	$("#register_btn").attr("value","已经提交，请稍后…");
	            	$.ajax({
						url :  "/member/accountRegister.do",
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
							if (!data) return;
				            
				           if(data =='11'){
				            	window.location.href="/member/completeResume.do?type=one";
				            }else if(data =='22'){
				            	window.location.href="/member/completeResume.do?type=five";
				            }else if(data =='33'){
				            	window.location.href="/member/home.do";
				            }else{
				            	$("#register_btn").removeAttr("disabled");
					    		$("#register_btn").val("同意以上条款并注册");
					    		
				            	if(data =='-0'){
				            		msg_alert('提示信息','系统错误!','error');
				            	}else  if( data =='-1'){
					            	msg_alert('提示信息','手机号格式错误!','error');
					            }else if(data =='-2'){
					            	msg_alert('提示信息','用户存在!','error');
					            }else if(data =='-3'){
					            	msg_alert('提示信息','验证码错误!','error');
					            }else if(data =='-4'){
					            	msg_alert('提示信息','注册失败!','error');
					            }
				            	
				            }
				            return;
										},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				};			
function msg_alert(title,msg,icon){
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
//获取验证码
var clock = '';
var nums = 60;

function doLoop(){
	nums--;
	if(nums > 0){
		document.getElementById('show').innerHTML=nums+'秒后可重新获取';
	}else{
			clearInterval(clock); //清除js定时器
			$("#show").attr("disabled",false);
			$("#show").attr("onclick","sendVerifyCode()");
			document.getElementById('show').innerHTML="点击发送验证码";
			nums = 60; //重置时间
	}
}

function sendVerifyCode(){	
	var mobile=$("#user_contact").val();

	if(mobile==''){
		msg_alert('提示信息','请输入手机号！','warning');
		return null;
	}else{
		if(!(/^1[0-9]{10}$/.test(mobile))){ 
			msg_alert('提示信息','请输入正确的手机号！','warning');
	    	return null; 
		} 
	}

	$.ajax({
        url: "/member/verifyByMobile.do",
        data:{mobile:mobile},
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            if(data=='no'){
            	msg_alert('提示信息','请输入正确的手机号！','warning');
            	return null;
            }else if(data=='miss'){
            	msg_alert('提示信息','手机号为空！','warning');
            	return null;
            }else if(data=='more'){
            	msg_alert('提示信息','操作过于频繁，请稍后再试！','warning');
            	return null;
            }
            return;
        },
        error:function(){
        	window.location.reload();
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
	//倒计时60秒
	
	$("#show").attr("disabled",true);
	$("#show").removeAttr('onclick');
	document.getElementById('show').innerHTML=nums+'秒后可重新获取';
	clock = setInterval(doLoop, 1000); //一秒执行一次
}				