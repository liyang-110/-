var Login = function () {
    
    return {
        init: function () {
        		var options ={
				       errorElement: 'label', //default input error message container
				       errorClass: 'help-inline', // default input error message class
				       focusInvalid: true, // do not focus the last invalid input
				       ignore: "",
				       rules :{
			                user_id: {
			                    required: true
			                },
			                user_pass: {
			                    required: true
			                }
				       },
			            messages: { // custom messages for radio buttons and checkboxes
			                user_id: {
			                    required: "请输入用户名！"
			                },
			                user_pass: {
			                    required: "请输入密码！"
			                }
			             },
				        invalidHandler: function (event, validator) { //display error alert on form submit   
								showErrDialog(validator.errorList[0].message);
				        },
			            highlight: function (element) { // hightlight error inputs
			                /*
			                $(element)
			                    .closest('.control-group').addClass('error'); // set error class to the control group
			                 */
			            },
			            success: function (label) {
			                label.closest('.control-group').removeClass('error');
			            },
			            errorPlacement: function (error, element) {
			                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
			                   // error.addClass('help-small no-left-padding').insertAfter($('#register_tnc_error'));
			                } else {
			                    //error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
			                }
			            },
			            submitHandler: function(form) {
			            	var url= cur_path +"/login.do";
							$.post(url, $(form).serialize(), function(data){
								switch(data){
									case '1':
										showErrDialog("账号不存在");
										form.user_pass.value='';
										$(form.user_id).focus();
										break;
									case '2':
										showErrDialog("密码错误");
										form.user_pass.value='';
										$(form.user_pass).focus();
										break;
									case '66':
									case '88':
									case '99':
										location.reload();
										break;
									default :
										showErrDialog("登录失败");
								}
							});
			            }
			     };
			     /*
			    $('.company_login input').keypress(function (e) {
			            if (e.which == 13) {
			                  $('.company_login').validate();
			            }
			    });
			    */
				$('.company_login').validate( options );
				//$('.school_login').validate(options);
			}
		};
}();
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