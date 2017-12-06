var Login = function () {
    
    return {
        init: function ( callback ) {
        		var options ={
				       errorElement: 'label', //default input error message container
				       errorClass: 'help-inline', // default input error message class
				       focusInvalid: true, // do not focus the last invalid input
				       ignore: "",
				       rules :{
				    	    in_company_name: {
			                    required: true
			                },
			                in_company_nature: {
			                    required: true
			                },
			                in_big: {
			                    required: true
			                },
			                in_small: {
			                	required: true
			                },
			                in_area_id: {
			                	required: true
			                },
			                in_email: {
			                    required: true,
			                    email: true
			                },
			                in_contact_person: {
			                	required: true
			                },
			                in_contact_tel: {
			                	required: true
			                },
			                in_introduce: {
			                	required: true
			                },
			                in_recruit: {
			                	required: true
			                },
				       },
			            messages: { // custom messages for radio buttons and checkboxes
			            	in_company_name: {
			                    required: "请输入企业名称！"
			                },
			                in_company_nature: {
			                    required: "请选择公司性质！"
			                },
			                in_big: {
			                    required: "请选择所属行业"
			                },
			                in_small: {
			                    required: "请选择所属行业"
			                },
			                in_area_id: {
			                    required: "请选择所在地区"
			                },
			                in_email: {
			                    required: "请输入联系邮箱地址",
			                    email: "不是有效的邮箱地址",
			                },
			                in_contact_person: {
			                	required: "请输入联系人"
			                },
			                in_contact_tel: {
			                	required: "请输入联系手机"
			                },
			                in_introduce: {
			                	required: "请输入公司简介"
			                },
			                in_recruit: {
			                	required: "请输入招聘计划"
			                },
			             },
				        invalidHandler: function (event, validator) { //display error alert on form submit   
								showErrDialog(validator.errorList[0].message);
				        },
			            highlight: function (element) { // hightlight error inputs
			                $(element)
			                    .closest('.control-group').addClass('error'); // set error class to the control group
			                 
			            },
			            success: function (label,element) {
			            	$(element).closest('.control-group').removeClass('error');
			                //label.remove();
			            },
			            errorPlacement: function (error, element) {
			                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
			                   // error.addClass('help-small no-left-padding').insertAfter($('#register_tnc_error'));
			                } else {
			                    //error.addClass('hidden').insertAfter(element.closest('.controls'));
			                }
			            },
			            focusCleanup: true,
			            submitHandler: function(form) {
			            	var url= cur_path +"/esbServer.do?method=execProc&methodId=job_fair_apply&in_URLEncoding=utf-8";
							$.ajax({
								url:url, 
								data:$(form).serialize(),
								dataType :'text',
								success: function(data){
									data = decodeURIComponent(data);
									out_return = eval("[" + data + "]");
									if (out_return.length > 0 && out_return[0].returncode == 'ok') {
										var rowcount = out_return[0].querycount;
										var queryresult = out_return[0].queryresult;
										msg_alert_lock("提示信息","您申请参加的招聘会已经提交，稍后我们将与您联系，<br/>欢迎致电029-88662468咨询。","succeed",function(){
											if( typeof(callback)=='function' ){
												callback();
											}
										});
										
									}else if (out_return.length > 0 && out_return[0].returncode == 'fail') {
										msg_alert("提示信息",out_return[0].errordesc,"error");
									}
								},
								contentType:"application/x-www-form-urlencoded; charset=utf-8"

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
				$('#quickApplyForm').validate( options );
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