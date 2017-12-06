$(function(){
	$(".form_submit").bind("click",function(e){
		e.preventDefault();
		var form = $(this).parents("form");
		form.form("submit",{
			onSubmit:function(){
				return $(this).form('validate');
			},
			success:function( data ){
				data = decodeURIComponent(data);
				var re = $.parseJSON( data );
				//console.info( re );
				if( re.returncode=='ok' && re.querycount==1 ){
					//console.info( re.queryresult[0] );
					$("#stu_info_card").form("load",re.queryresult[0] );
					edit_stu_info(false);
					alert("保存成功");
				}else{
					alert( re.errordesc );
				}
			}
		});
	});
});
$(function () {
	WdatePicker();
	setTimeout("Work.setData()", 300);
	setTimeout("Education.setData()", 300);
	setTimeout("Resume.getOpen()", 500);
});

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
			$('#in_school_id').val( school );
			$('#in_school_name').val(item.text());
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
		$("input[name='in_school_name']").val( school_name );
		hide();
	}
}
function edit_stu_info( action )
{
	if( action==true ){
		$("#stu_info_card").hide();
		$("#stu_info_form_btn").hide();
		$("#stu_info_form").show();
		$("#stu_info_card_btn").show();
	}else{
		$("#stu_info_card").show();
		$("#stu_info_card_btn").hide();
		$("#stu_info_form").hide();
		$("#stu_info_form_btn").show();
	}

}
var Resume = {
	 refresh:function(){	
			var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=fresh&date=" + new Date();
			$.post(ls_url,{}
			).done(function(data){
				var data = $.parseJSON( decodeURIComponent(data) );
				/*
				{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
				*/
				if(data.returncode =='ok'){
					if(data.queryresult[0].ok=='ok'){
						window.location.reload();
					}else{
						$.messager.alert('提示信息','操作失败','error');
					}
				}else{
					$.messager.alert('提示信息',data.errordesc,'error');
					return;
				}
			}).fail(function(){
				$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
				return;
			});
	},
	getOpen : function(){
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=get_open&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			/*
			{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
			*/
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					if( data.queryresult[0].status ==1 ){
						$("#open_switch_btn").bind("click",function(){
							Resume.setOpen(0);
						}).text("[隐藏简历]").css({"color":"red"}).attr("title","点击隐藏简历, 企业将无法搜索到您的简历");
					}else{
						$("#open_switch_btn").bind("click",function(){
							Resume.setOpen(1);
						}).text("[公开简历]").css({"color":"green"}).attr("title","点击公开简历,等待HR来找你");
					}
				}else{
					$.messager.alert('提示信息','操作失败','error');
				}
			}else{
				$.messager.alert('提示信息',data.errordesc,'error');
				return;
			}
		}).fail(function(){
			$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
			return;
		});
	},
	setOpen : function( status ){
		var ls_url = cur_path + "/esbServer.do?in_r=su&method=execProc&methodId=student_resume_query&in_r=su&in_URLEncoding=UTF-8&in_action=set_open&in_status="+status+"&date=" + new Date();
		$.post(ls_url,{}
		).done(function(data){
			var data = $.parseJSON( decodeURIComponent(data) );
			/*
			{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
			*/
			if(data.returncode =='ok'){
				if(data.queryresult[0].ok=='ok'){
					window.location.reload();
				}else{
					$.messager.alert('提示信息','操作失败','error');
				}
			}else{
				$.messager.alert('提示信息',data.errordesc,'error');
				return;
			}
		}).fail(function(){
			$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
			return;
		});
	}
};
var Work = {
		setData : function () {	
			var ls_url = cur_path + "/esbServer.do?method=execProc&in_r=su&methodId=student_work&in_student_id="+student_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				$("#work_list").html("");
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok" 
						&& re[0].querycount>0 ) {
					init= re[0].queryresult;
					//$("#addform").form("load", initdata[0]);
					var tpl=$("#work_tpl").html();
					for(var i=0;i<init.length;i++){
						Work.append_tpl_replace(tpl,init[i] );
					}
				}else if(re[0].querycount==-1){
					initdata= re[0].queryresult
					alert( initdata[0].msg );
				}
			}});
		},
		append_tpl_replace : function (tpl,obj)
		{
			var work=tpl.replace('{$company_name}',obj.company_name)
						.replace('{$begin_date}',obj.begin_date)
						.replace('{$end_date}',obj.end_date)
						.replace('{$position}',obj.position)
						.replace('{$work_type}',obj.work_type)
						.replace('{$salary}',obj.salary)
						.replace('{$introduce}',obj.introduce)
						.replace('{$work_id}',obj.work_id)
						.replace('{$work_id_2}',obj.work_id);
			$('#work_list').append( work );
		},
		close: function ()
		{
			$('.stu_work_form').hide();
			$('.stu_work_form').form("clear");
			$("#stu_work_form_add_btn").show();
			$("#stu_work_form_close_btn").hide();
		},
		add : function ()
		{
			$(".stu_work_form input[name='in_action']").val("add");
			// $(".stu_work_form input[name='in_student_id']").val( student_id );
			$("#stu_work_form_add_btn").hide();
			$("#stu_work_form_close_btn").show();
			$('.stu_work_form').show();
		},
		del :function ( edu_id )
		{
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_work&in_r=su&in_action=del&in_work_id="+edu_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
					Work.setData();
				}
			}});
		},
		edit :function ( edu_id )
		{
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_work&in_r=su&in_action=view&in_work_id="+edu_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				$('.stu_work_form').show();
				$("#stu_work_form_add_btn").hide();
				$("#stu_work_form_close_btn").show();
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
					initdata= re[0].queryresult;
					$(".stu_work_form").form("load", initdata[0]);
				}
				$(".stu_work_form input[name='in_action']").val("edit");
			}});
		},
		save : function(){
			$(".stu_work_form").form("submit",{
				success:function( data ){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					if( re.returncode=='ok' && re.querycount==1 ){
						Work.close();
						Work.setData();
						alert("保存成功");
					}else{
						alert( re.errordesc );
					}
				}
			});
		}
}
var Position = {
		edit:function( action ){
			if( action==true ){
				$("#stu_hope_position_card").hide();
				$("#stu_hope_position_form_btn").hide();
				$("#stu_hope_position_form").show();
				$("#stu_hope_position_card_btn").show();
				
			}else{
				$("#stu_hope_position_card").show();
				$("#stu_hope_position_card_btn").hide();
				$("#stu_hope_position_form").hide();
				$("#stu_hope_position_form_btn").show();
			}
			$(".auto-height").trigger("change");
		},
		save: function(){
			$('#stu_hope_position_form').form("submit",{
				success: function(data){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					//console.info( re );
					if( re.returncode=='ok' ){
						if( re.querycount==1 ){
							//console.info( re.queryresult[0] );
							$("#stu_hope_position_card").form("load",re.queryresult[0] );
							Position.edit(false);
							alert("保存成功");
						}else{
							alert( re.queryresult[0].msg );
						}
					}else{
						alert( re.errordesc );
					}
				}
			});
		},
		cancel : function(){
			Position.edit(false);
		}
}
var Contact = {
		edit:function( action ){
			if( action==true ){
				$("#stu_contact_card").hide();
				$("#stu_contact_form_btn").hide();
				$("#stu_contact_form").show();
				$("#stu_contact_card_btn").show();
			}else{
				$("#stu_contact_card").show();
				$("#stu_contact_card_btn").hide();
				$("#stu_contact_form").hide();
				$("#stu_contact_form_btn").show();
			}
		},
		save: function(){
			$('#stu_contact_form').form("submit",{
				onSubmit:function(){
					return $(this).form('validate');
				},
				success: function(data){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					// console.info( re );
					if( re.returncode=='ok' && re.querycount==1 ){
						// console.info( re.queryresult[0] );
						$("#stu_contact_card").form("load",re.queryresult[0] );
						Contact.edit(false);
						alert("保存成功");
					}else if( re.returncode=='ok' && re.querycount==0 ){
						//alert( re.errordesc );
						alert( re.queryresult[0].msg );
					}
				}
			});
		},
		cancel : function(){
			Contact.edit(false);
		}
}
var Education = {
		setData : function () {	
			var ls_url = cur_path + "/esbServer.do?method=execProc&in_r=su&methodId=student_edu&in_student_id="+student_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				$('#school_list').html("");
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok"
						 && re[0].querycount>0  ) {
					initdata= re[0].queryresult;
					//$("#addform").form("load", initdata[0]);
					var tr="";
					for(var i=0;i<initdata.length;i++){
						tr='<tr><td>'+initdata[i].begin_date+'至'+initdata[i].end_date+'</td>'+
								'<td>'+initdata[i].school_name+'</td>'+
								'<td>'+initdata[i].education+'</td>'+
								'<td>'+initdata[i].profession+'</td>'+
								'<td><a href="javascript:;" onclick="Education.edit(\''+initdata[i].edu_id+'\');">编辑</a>&nbsp;&nbsp;&nbsp;<a href="javascript:;" onclick="Education.del(\''+initdata[i].edu_id+'\');">删除</a></td></tr>';
						$('#school_list').append(tr);
					}
				}
			}});
		},
		close : function close()
		{
			$("#stu_edu_form_add_btn").show();
			$("#stu_edu_form_close_btn").hide();
			$('.stu_edu_form').hide();
		},
		add : function add()
		{
			$("#stu_edu_form_add_btn").hide();
			$("#stu_edu_form_close_btn").show();
			$(".stu_edu_form input[name='in_action']").val("add");
			$('.stu_edu_form').show();
		},
		del : function( edu_id )
		{
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_edu&in_r=su&in_action=del&in_edu_id="+edu_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
					Education.setData();
				}
			}});
		},
		edit : function ( edu_id )
		{
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_edu&in_r=su&in_action=view&in_edu_id="+edu_id+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				$("#stu_edu_form_add_btn").hide();
				$("#stu_edu_form_close_btn").show();
				$(".stu_edu_form input[name='in_action']").val("edit");
				$('.stu_edu_form').show();
				
				data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
					initdata= re[0].queryresult;
					$(".stu_edu_form").form("load", initdata[0]);
				}
			}});
		},
		save : function(){
			$('.stu_edu_form').form("submit",{
				onSubmit:function(){
					return $(this).form('validate');
				},
				success: function(data){
					data = decodeURIComponent(data);
					var re = $.parseJSON( data );
					console.info( re );
					if( re.returncode=='ok' && re.querycount==1 ){
						console.info( re.queryresult[0] );
						alert("保存成功");
						$('.stu_edu_form').form("clear");
						Education.setData();
						Education.close();
					}else if( re.returncode=='ok' && re.querycount==0 ){
						//alert( re.errordesc );
						alert( re.queryresult[0].msg );
					}
				}
			});
		}
};
//多行文本输入框剩余字数计算  
function checkMaxInput(obj, maxLen) {  
    if (obj == null || obj == undefined || obj == "") {  
        return;  
    }  
    if (maxLen == null || maxLen == undefined || maxLen == "") {  
        maxLen = 100;  
    }  

    var strResult;  
    var $obj = $(obj);  
    var newid = $obj.attr("id") + 'msg';  

    if (obj.value.length > maxLen) { //如果输入的字数超过了限制  
        obj.value = obj.value.substring(0, maxLen); //就去掉多余的字  
        strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
    }  
    else {  
        strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
    }  

    var $msg = $("#" + newid);  
    if ($msg.length == 0) {  
        $obj.after(strResult);  
    }  
    else {  
        $msg.html(strResult);  
    }  
}  

//清空剩除字数提醒信息  
function resetMaxmsg() {  
    $("span.Max_msg").remove();  
}  
