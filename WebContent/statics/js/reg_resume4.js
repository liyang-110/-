var options_stu={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	            	 r_company_name: {
		                    required: true,
		            },
		              r_jobname: {
		                    required: true,
		            },
		              r_begin_date: {
		                    required: true,
		            },
		             r_end_date: {
		                    required: true,
		            },
		            r_introduce: {
		                    required: true,
		            }
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	            	r_company_name: {
	                    required:  "请输入企业名称！"
	                },
	                r_jobname: {
	                    required:  "请输入职位名称！",
	                },
	                r_begin_date: {
	                    required:  "请选择开始时间！",
	                },
	                r_end_date: {
	                    required: "请选择结束时间！",
	                },
	                r_introduce: {
	                    required: "请输入工作内容！",
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
	            	$("#register_btn").attr("disabled",true);
	            	$("#register_btn").attr("value","已经提交，请稍后…");
					$.ajax({
						url :  "/member/saveResume.do?flag=four",
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
							if (!data) return;
				            if(data =='77'){
				            	window.location.href="/student/sCenter.do";
				            }else{
				            	$("#register_btn").attr("disabled",false);
				            	$("#register_btn").attr("value","完成");
				            	if(data =='-2'){
					            	alert("保存失败！");
					            }else{
					            	alert("系统更新中，请稍后再试！");
					            }
					            return;
				            } 
						},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				};			
				