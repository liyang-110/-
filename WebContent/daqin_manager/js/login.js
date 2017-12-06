var Login = function () {
    
    return {
        //main function to initiate the module
        init: function () {
        	
           $('.login-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the la st invalid input
	            rules: {
	                username: {
	                    required: true
	                },
	                password: {
	                    required: true
	                },
	                verfiy: {
	                    required: true
	                }
	            },

	            messages: {
	                username: {
	                    required: "请输入用户名！"
	                },
	                password: {
	                    required: "请输入密码！"
	                },
					verfiy: {
						required: "请输入验证码！"
					}
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
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
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                // window.location.href = "index.jsp";
	                 login('username', 'password', 'company');
	                 return false;
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    login('username', 'password', 'company');
	                }
	                return false;
	            }
	        });

        }

    };

}();
	
	function login(userNameId, passwordId, userType){
		
		var $userName = $("#"+ userNameId);
		var $password = $("#"+ passwordId);
		if(fieldCheck($userName) && fieldCheck($password)){
			var url= "login.do";
			$.post(url, {user_id: $userName.val(), user_pass: $password.val(), user_type: userType}, function(data){
				if(data=="1"){
					window.location.href = "index.jsp";
				}else{
					showErrDialog("登录失败");
				}
			});
		}
		return false;
	}
	
	function showErrDialog(str){
		art.dialog({
			title: '错误信息',
			content: str,
			icon: 'warning',
			lock:false,
			id:'login',
			time: 5
		});
	}
	
	function fieldCheck($field){
		if($field.val()==''){
			art.dialog({
				title: '错误信息',
				content: $field.attr("errorcontent"),
				icon: 'warning',
				lock:false,
				id:'login',
				time: 5,
				ok: function(){
					$field[0].focus();
				}
			});
			return false;	
		}
		return true;
	}