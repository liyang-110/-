var Forget = function () {
    
    return {
        //main function to initiate the module
        init: function () {
	        $('.register-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                contact_tel: {
	                    required: true,
	                    digits:true,
	                    rangelength:[11,11]
	                },
	                user_tel: {
	                    required: true,
	                    digits:true,
	                    rangelength:[11,11]
	                },
	                user_id: {
	                    required: true,
	                    isUserName: true
	                },
	                user_email: {
	                    required: true,
	                    email: true
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
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	                contact_tel: {
	                    required: "请输入手机号码",
	                    digits:"请输入正确的手机号码",
	                    rangelength:"请输入正确的手机号码"
	                },
	                user_tel: {
	                    required: "请输入手机号码",
	                    digits:"请输入正确的手机号码",
	                    rangelength:"请输入正确的手机号码"
	                },
	                user_id: {
	                    required: "请输入用户名！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！"
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
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
	                    error.addClass('help-small no-left-padding').insertAfter($('#register_tnc_error'));
	                } else {
	                    error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	                }
	            },

	            submitHandler: function(form) {
	            	$("[type='submit']").attr("disabled","disabled");
	            	$("[type='submit']").val("数据处理中，请稍候...");
	            	form.submit();
				    return true;    
				 } 
	        });

        }

    };

}();
function sendVerifyCode(){
	var mobile=$("#user_tel").val();

	if(mobile==''){
		msg_alert('提示信息','请输入手机号！','warning');
		return;
	}else{
		if(!(/^1[0-9]{10}$/.test(mobile))){ 
			msg_alert('提示信息','请输入正确的手机号！','warning');
	    	return; 
		} 
	}
	$("#verify_btn").attr("disabled","disabled");
	$.ajax({
        url: "/forget.do?action=verify_code",
        data:{mobile:mobile},
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            if(data=='ok'){
    			var daojishiSpan = $('#verify_btn').find("span");
    			function daojishiDialog( m ){
    				if(m==0){
    					daojishiSpan.text( '' );
    					$("#verify_btn").removeAttr("disabled");
    				}else{
    					daojishiSpan.text( '('+m+'秒)' );
    					setTimeout(function(){
    						daojishiDialog( m-1 );
    					},1000);
    				}
    			}
    			daojishiDialog( 60 );
    			return;
            }else if(data=='no'){
            	msg_alert('提示信息','请输入正确的手机号！','warning');
            }else if(data=='miss'){
            	msg_alert('提示信息','手机号为空！','warning');
            }else if(data=='more'){
            	msg_alert('提示信息','操作过于频繁，请稍后再试！','warning');
            }else {
            	msg_alert('提示信息',data,'warning');
            }
            $("#verify_btn").removeAttr("disabled");
            return;
        },
        error:function(){
        	$("#verify_btn").removeAttr("disabled");
        },
        contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
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