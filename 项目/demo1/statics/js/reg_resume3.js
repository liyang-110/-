var options_stu={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	            	 r_hope_type: {
		                    required: true,
		            },
	            	 r_work_status: {
		                    required: true,
		            },
		              hope_areas: {
		                    required: true,
		            },
		              hope_positions: {
		                    required: true,
		            },
		             r_hope_salary: {
		                    required: true,
		            }
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	            	r_hope_type: {
	                    required:  "请输入工作性质！"
	                },
	                r_work_status: {
	                    required:  "请选择求职状态！",
	                },
	                hope_areas: {
	                    required:  "请选择期望地区！"
	                },
	                hope_positions: {
	                    required:  "请选择期望职位！",
	                },
	                r_hope_salary: {
	                    required: "请选择期望薪资！",
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
						url :  "/member/saveResume.do?flag=three",
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
							if (!data) return;
				            if(data =='66'){
				            	window.location.href="/member/completeResume.do?type=four";
				            }else{
				            	$("#register_btn").attr("disabled",false);
				            	$("#register_btn").attr("value","下一步");
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
				