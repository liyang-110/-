var BindFrom = function () {
    
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
			            	$("[type='submit']").attr("disabled","disabled");
			            	$("[type='submit']").val("数据处理中，请稍候...");
			            	var url= cur_path +"/auth/bind.do?ajax=true";
							$.post(url, $(form).serialize(), function(data){
								if(data=="timeout"){
									showErrDialog("QQ登录超时");
								}else if(data=="fail"){
									showErrDialog("帐号或密码错误");
									form.user_pass.value='';
									$(form.user_pass).focus();
								}else if(data=="succ"){
									window.location.href=cur_path+"/auth/bind.do";
								}else{
									showErrDialog("登录失败");
								}
								$("[type='submit']").removeAttr("disabled");
				            	$("[type='submit']").val("绑    定");
							});
			            }
			     };
				$('#bind-form').validate( options );
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
			time: 5,
			ok : function(){
				this.close();
			}
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