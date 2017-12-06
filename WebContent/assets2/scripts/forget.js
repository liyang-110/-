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
	                user_id: {
	                    required: true,
	                    isUserName: true
	                },
	                user_email: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	                user_id: {
	                    required: "请输入用户名！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！"
	                }
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