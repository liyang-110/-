function editItem()
{
	var id = checkValue();
	if( id != undefined ){
		var dialog = artDialog({
			title: "修改" , // '提示信息',
			content: "正在加载...",
			fixed: true,
			lock:true,
			id:'profession-edit',
			width:350,
			height:165,
			opacity:'0.3',
			padding:"10px 5px 5px 5px",
			ok: function(){
				var form = $(this.content()).find("form");
				var $this=this;
				if( form ){
					editDataForm( form,function(){
						$this.close();
						window.location.reload();
					});					
				}else{
					msg_alert("提示信息","操作失败","error");
				}
				return false;
			},
			cancel : function(){
				this.close();
			}
		});
		var ls_url = "/esbServer.do?method=execProc&methodId=school_grad_04&in_r=sc&in_id=" + id + "&date=" + new Date();
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
				initdata= re[0].queryresult;
				console.info( initdata[0] );
				dialog.content( $("#professionForm").html() );
				var form=$(dialog.content()).find("form");
				$( form ).form("load", initdata[0]);
			}
		}});
		//
	}
}
function addItem()
{
	artDialog({
		title: "添加院系专业" , // '提示信息',
		content: $("#professionForm").html(),
		fixed: true,
		lock:true,
		width:350,
		height:165,
		opacity:'0.3',
		padding:"10px 5px 5px 5px",
		id:'profession-add',
		ok: function(){
			var form = $(this.content()).find("form");
			var $this=this;
			saveDataForm( form ,function(){
				$this.close();
				window.location.reload();
			});
			return false;
		},
		cancel : function(){
			this.close();
			return true;
		}
	});
}
function deleteItem()
{
	var id = checkValue();
	if( id != undefined ){
	   	 msg_wait('提示信息', '您确定要进行删除操作吗?',"question", function(){
	   		/*
 	 		for(var i=0;i< lo_selected.length;i++){
				ls_id += "&in_school_grad_mgr"+i+"="+ lo_selected[i].id;
			}
			*/
	   		var ls_id = "&in_school_grad_mgr0="+ id;
			var	ls_url = "/esbServer.do?method=execProc&methodId=school_grad_02" + ls_id+"&date="+new Date();

			ajaxDealUrl(ls_url,'删除成功',function(){
				window.location.reload();
			});
	 	 });
	}
}
function checkValue( )
{
	var checkboxs = $(".item_check:checked");
	if(checkboxs.length==0 ){
		msg_alert("提示信息","请选择一行专业信息","error");
		return undefined;
	}else if(checkboxs.length>1){
		msg_alert("提示信息","只能选择一行信息","error");
		return undefined;
	}else{
		return checkboxs.val();
	}
}
function editDataForm(form , in_func )
{
	var ls_url = "/esbServer.do?method=execProc&methodId=school_grad_05&date=" + new Date();
	$(form).form("submit",{
		url:ls_url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function( data ){
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			if (re.length > 0 && re[0].returncode == "ok") {
				queryresult = re[0].queryresult;
				if( queryresult[0].ok == 'ok' ){
					msg_alert("提示信息","保存成功!","succeed",function(){
						if( typeof ( in_func )=='function' ){
							in_func();
						}
					});
				}else if( queryresult[0].msg ){
					msg_alert("错误信息",queryresult[0].msg ,"error");
				}
			}else{
				msg_alert("错误信息","保存失败,请稍后再试.","error");
			}
		}
	});
}
function saveDataForm( form,in_func )
{
	var ls_url = "/esbServer.do?method=execProc&methodId=school_grad_03&date=" + new Date();
	$(form).form("submit",{
		url:ls_url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function( data ){
			data = decodeURIComponent(data);
			var re = eval("[" + data + "]");
			if (re.length > 0 && re[0].returncode == "ok") {
				queryresult = re[0].queryresult;
				if( queryresult[0].ok == 'ok' ){
					msg_alert("提示信息","保存成功!","succeed",function(){
						if( typeof ( in_func )=='function' ){
							in_func();
						}
					});
				}else if( queryresult[0].msg ){
					msg_alert("错误信息",queryresult[0].msg ,"error");
				}
			}else{
				msg_alert("错误信息","保存失败,请稍后再试.","error");
			}
		}
	});
	
}