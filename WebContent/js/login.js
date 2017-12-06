$(function(){
		$("#btnSchLogin").bind("click",function(){
			login("sch_userName", "sch_password", "school");
		});
		$("#btnComLogin").bind("click",function(){
			login("com_userName", "com_password", "company");
		});
		
		$("#com_userName").keyup(function(event){
		  if(event.keyCode ==13){
		    $("#com_password").focus();
		  }
		});
		$("#com_password").keyup(function(event){
		  if(event.keyCode ==13){
		    $("#btnComLogin").trigger("click");
		  }
		});
		
		$("#sch_userName").keyup(function(event){
		  if(event.keyCode ==13){
		    $("#sch_password").focus();
		  }
		});
		$("#sch_password").keyup(function(event){
		  if(event.keyCode ==13){
		    $("#btnSchLogin").trigger("click");
		  }
		});
		
	});
	
	function login(userNameId, passwordId, userType){
		var $userName = $("#"+ userNameId);
		var $password = $("#"+ passwordId);
		if(fieldCheck($userName) && fieldCheck($password)){
			var url= cur_path +"/login.do";
			$.post(url, {user_id: $userName.val(), user_pass: $password.val(), user_type: userType}, function(data){
				if(data=="1"){
					showErrDialog("账号不存在");
				}else if(data=="2"){
					showErrDialog("密码错误");
				}else if(data=="66"){
					window.location.href=cur_path+"/company/main.jsp";
				}else if(data=="88"){
					window.location.href=cur_path+"/school/main.jsp";
				}else{
					showErrDialog("登录失败");
				}
			});
		}
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