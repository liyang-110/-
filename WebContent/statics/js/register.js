function refreshCaptcha()
{
	var verify = $(".jcaptcha");
	verify.attr('src','jcaptcha.jpg?'+Math.random());
}
var Register = function () {
    
    return {
        init: function () {
        	$("#user_type_company").bind("click",function(){
        		$("#industry_select").show();
        	});
        	$("#user_type_school").bind("click",function(){
        		$("#industry_select").hide();
        	});
        	$("#organization").focus(function(){
        		var checked=false;
        		 $("input[name='user_type']").each(function(){
        		 	if( $(this).attr("checked") )checked=true;
        		 });
        		 if(!checked){
        		 	alert("请选择账户类型！");
        		 	$("#organization").blur();
        		 }
        	});
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
	                user_pass: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#register_password"
	                },
	                user_email: {
	                    required: true,
	                    email: true
	                },
	                organization: {
	                	required: true
	                },
	                contact_person: {
	                	required: true
	                },
	                contact_tel: {
	                	required : true,
	                	number:true
	                },
	                verfiy: {
	                    required: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	                user_id: {
	                    required: "请输入用户名！"
	                },
	                user_pass: {
	                    required: "请输入密码！"
	                },
	                rpassword: {
	                    equalTo: "两次输入的密码不相同！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！"
	                },
	                organization: {
	                	required: "请输入单位名称！"
	                },
	                contact_person: {
	                	required: "请输入联系人！"
	                },
	               contact_tel: {
	                	required: "请输入联系电话！",
	                	number: "请输入数字",  
	                },
					verfiy: {
						required: "必须同意本协议才能继续注册！"
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
						url : $(form).attr("action"),
						data : $(form).serialize(),
						type : "post",
						dataType : "json",
						success : function( data ) {
								    		if ( data=="66" || data=="88"){
								    			window.location="register_ok.jsp";
								    		}else if(data=="99"){	
								    			window.location="/member/home.do";
									    	}else{
									    		$("#register_btn").removeAttr("disabled");
									    		$("#register_btn").val("同意以上条款并注册");
									    		if (data=="4"){
									    			alert("此用户名已存在！");
									    		}else{
									    			alert("注册失败");
									    		}
								    		}	
										},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				});
		}
	}
}();
var options_stu={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                user_id: {
	                    required: true,
	                    isUserName: true,
	                    remote:{url: cur_path + "validateForm.do",
	                    	dateType:"json",
	                    	type:"post"
	                    }
	                },
	                user_pass: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#register_password"
	                },
	                user_name: {
	                    required: true,
	                },
	                qq: {
	                    required: true,
	                    digits:true
	                },
	                sex: {
	                    required: true,
	                },
	                birthday: {
	                    required: true,
	                },
	                hopeArea :{
	                	 required: true,
	                },
	                hopePosition :{
	                	 required: true,
	                }, 
	                hopeSalary :{
	                	 required: true,
	                	 digits:true
	                }, 
	                college : {
	                	required: true
	                },
	                education : {
	                	required: true
	                },	                
	                profession : {
	                	required: true
	                },
	                user_email: {
	                    required: true,
	                    email: true,
	                    remote:{url: cur_path + "validateForm.do",
	                    	dateType:"json",
	                    	type:"post"
	                    }
	                },
	                contact_tel: {
	                	required : true,
	                	digits:true,
	                	rangelength:[11,11],
	                	remote:{url: cur_path + "validateForm.do",
	                    	dateType:"json",
	                    	type:"post"
	                	}
	                },
	                verfiy: {
	                    required: true
	                }
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	                user_id: {
	                    required: "请输入用户名！",
	                    remote:"该用户名已被注册，请重新输入！"
	                },
	                user_pass: {
	                    required: "请输入密码！"
	                },
	                rpassword: {
	                    equalTo: "两次输入的密码不相同！"
	                },
	                user_name: {
	                    required:  "请输入姓名！"
	                },
	                qq: {
	                    required:  "请输入qq账号！",
	                    digits:"请输入数字"
	                },
	                sex: {
	                    required:  "请选择性别！",
	                },
	                birthday: {
	                    required:  "请点击输入框，选择出生日期！",
	                },
	                hopeArea :{
	                	 required: "请点击输入框，选择意向工作地区！",
	                },
	                hopePosition :{
	                	 required: "请点击输入框，选择意向岗位！",
	                }, 
	                hopeSalary :{
	                	 required: "请输入期望薪资！",
	                	 digits: "请输入数字！"
	                }, 
	                college : {
	                	required: "请输入毕业院校！"
	                },
	                education : {
	                	required: "请输入学历！"
	                },
	                profession : {
	                	required: "请输入所学专业！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！",
	                    remote:"该邮箱已被注册，请重新输入！"
	                },
	                organization: {
	                	required: "请输入单位名称！"
	                },
	                contact_person: {
	                	required: "请输入联系人！"
	                },
	               contact_tel: {
	                	required: "请输入11手机号码！",
	                	digits:"请输入数字",
	                	rangelength:"请输入11位手机号码!",
	                	remote:"该手机号已被注册，请重新输入！"
	                },
					verfiy: {
						required: "必须同意本协议才能继续注册！"
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
						url : $(form).attr("action"),
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
								    		if (data=="66" || data=="88"){
								    			window.location="register_ok.jsp";
								    		}else if(data=="99"){	
								    			//window.location="/member/home.do";
								    			window.location="/register_stu1.jsp";
									    	}else{
									    		$("#register_btn").removeAttr("disabled");
									    		$("#register_btn").val("同意以上条款并注册");
									    		if (data=="4"){
									    			alert("此用户名已存在！");
									    		}else if (data=="9"){
									    			alert("手机号或邮箱已注册211校招网帐号,请找回密码,申诉请拨打029-88662468！");
									    		}else if(data=="8"){
									    			refreshCaptcha();
									    			alert("验证码输入错误！");
									    		}else{
									    			alert("注册失败");
									    		}
								    		}	
										},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				};
var options_com={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                user_id: {
	                    required: true,
	                    isUserName: true,
	                    remote:{url: cur_path + "validateForm.do",
	                    	dateType:"json",
	                    	type:"post"
	                    }
	                },
	                user_pass: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#register_password"
	                },
	                user_email: {
	                    required: true,
	                    email: true
	                },
	                organization: {
	                	required: true,
	                	remote:{url: cur_path + "validateForm.do",
	                    	dateType:"json",
	                    	type:"post"
	                    }
	                },
	                contact_person: {
	                	required: true
	                },
	                contact_tel: {
	                	required : true,
	                	number:true
	                },
	                verfiy: {
	                    required: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	                user_id: {
	                    required: "请输入用户名！",
	                    remote:"该用户名已被注册，请重新输入！"
	                },
	                user_pass: {
	                    required: "请输入密码！"
	                },
	                rpassword: {
	                    equalTo: "两次输入的密码不相同！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！"
	                },
	                organization: {
	                	required: "请输入单位名称！",
	                	remote:"该单位名称已注册，请拨打电话 029-88662468 与我们联系 ！"
	                },
	                contact_person: {
	                	required: "请输入联系人！"
	                },
	               contact_tel: {
	                	required: "请输入联系电话！",
	                	number: "请输入数字",  
	                },
					verfiy: {
						required: "必须同意本协议才能继续注册！"
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
						url : $(form).attr("action"),
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
								    		if (data=="66" || data=="88"){
								    			window.location="register_ok.jsp";
								    		}else if(data=="99"){	
								    			window.location="/member/home.do";
									    	}else{
									    		$("#register_btn").removeAttr("disabled");
									    		$("#register_btn").val("同意以上条款并注册");
									    		if (data=="4"){
									    			alert("用户名已存在，请修改用户名！");
									    		}else if (data=="7"){
									    			alert("单位名称已注册，不能重复注册！");
									    		}else if (data=="8"){
									    			refreshCaptcha();
									    			alert("验证码输入错误！");
									    		}else{
									    			alert("注册失败");
									    		}
								    		}	
										},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				};
var options_sch={
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: true, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                user_id: {
	                    required: true,
	                    isUserName: true
	                },
	                user_pass: {
	                    required: true
	                },
	                rpassword: {
	                    equalTo: "#register_password"
	                },
	                user_email: {
	                    required: true,
	                    email: true
	                },
	                organization: {
	                	required: true
	                },
	                contact_person: {
	                	required: true
	                },
	                contact_tel: {
	                	required : true,
	                	number:true
	                },
	                verfiy: {
	                    required: true
	                }
	            },
	            messages: { // custom messages for radio buttons and checkboxes
	                user_id: {
	                    required: "请输入用户名！"
	                },
	                user_pass: {
	                    required: "请输入密码！"
	                },
	                rpassword: {
	                    equalTo: "两次输入的密码不相同！"
	                },
	                user_email: {
	                    required: "请输入邮箱！",
						email:"请输入正确的邮箱格式！"
	                },
	                organization: {
	                	required: "请输入单位名称！"
	                },
	                contact_person: {
	                	required: "请输入联系人！"
	                },
	               contact_tel: {
	                	required: "请输入联系电话！",
	                	number: "请输入数字",  
	                },
					verfiy: {
						required: "必须同意本协议才能继续注册！"
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
						url : $(form).attr("action"),
						data : $(form).serialize(),
						type : "post",
						dataType : "text",
						success : function(data) {
								    		if (data=="66" || data=="88"){
								    			window.location="register_ok.jsp";
								    		}else if(data=="99"){	
								    			window.location="/member/home.do";
									    	}else{
									    		$("#register_btn").removeAttr("disabled");
									    		$("#register_btn").val("同意以上条款并注册");
									    		if (data=="4"){
									    			alert("此用户名已存在！");
									    		}else{
									    			alert("注册失败");
									    		}
								    		}	
										},
						complete : function(XMLHttpRequest, textStatus) {
										},
						contentType:"application/x-www-form-urlencoded; charset=utf-8"
						});
					}
				};
				
				
	//弹出窗口
	function pop(){
		//将窗口居中
		makeCenter();
		//初始化省份列表
		initProvince();
		//默认情况下, 给第一个省份添加choosen样式
		$('[province-id="1"]').addClass('choosen');

		//初始化大学列表
		initSchool(2);
	}
	//隐藏窗口
	function hide()
	{
		$('#choose-box-wrapper').css("display","none");
	}

	function initProvince()
	{
		//原先的省份列表清空
		$('#choose-a-province').html('');
		for(i=0;i<schoolList.length;i++)
		{
			$('#choose-a-province').append('<a class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
		}
		//添加省份列表项的click事件
		$('.province-item').bind('click', function(){
				var item=$(this);
				var province = item.attr('province-id');
				var choosenItem = item.parent().find('.choosen');
				if(choosenItem)
					$(choosenItem).removeClass('choosen');
				item.addClass('choosen');
				//更新大学列表
				initSchool(province);
			}
		);
	}

	function initSchool(provinceID)
	{
		//原先的学校列表清空
		$('#choose-a-school').html('');
		var schools = schoolList[provinceID-2].school;
		for(i=0;i<schools.length;i++)
		{
			$('#choose-a-school').append('<a class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
		}
		//添加大学列表项的click事件
		$('.school-item').bind('click', function(){
				var item=$(this);
				var school = item.attr('school-id');
				//更新选择大学文本框中的值
				$('#school_id').val( school );
				$('#college').val(item.text());
				//关闭弹窗
				hide();
			}
		);
	}
	function makeCenter()
	{
		$('#choose-box-wrapper').css("display","block");
		$('#choose-box-wrapper').css("position","absolute");
		$('#choose-box-wrapper').css("top", Math.max(0, (($(window).height() - $('#choose-box-wrapper').outerHeight()) / 2) + $(window).scrollTop()) + "px");
		$('#choose-box-wrapper').css("left", Math.max(0, (($(window).width() - $('#choose-box-wrapper').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	
		$('.input-school-name-btn').show();
		$('.input-school-name').hide();
	}
	function inputSchoolName()
	{
		var school_name=$("input[name='new_school_name']").val();
		if(school_name==''){
			alert("请输入学校名称！");
		}else{
			$("input[name='college']").val( school_name );
			$('#school_id').val('');
			hide();
		}
	}