function contact(student_id)
{
	var ls_url="/company/unemployed.do?method=contact";
	$.ajax({
		url:ls_url, 
		data:{id:student_id},
		type:"post", 
		dataType:"json", 
		success:function (d) {
			if (!d) {
				return false;
			}
			if( 0 == d.code){
				var dialog = art.dialog({
					title: "电话面试" , // '提示信息',
					content: "正在加载",
					id:"contact_dialog",
					fixed: true,
					lock:true,
					width:390,
					height:175,
					opacity:'0.3',
					padding:"10px 5px 5px 5px",
					show:true,
					init:function(){
						var dlg = this;
						dlg.content( $("#contact_form").html() );
						var form=$(dlg.content()).find("form");
						$( form ).form("load", d.data );
					},
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
			}else{
				msg_alert("错误信息",d.message,"error");
			}
		},
		error:function(){
			msg_alert("错误信息","服务器连接失败","error");
		}
	});
}
function saveDataForm( form,in_func )
{
	var ls_url = "/company/unemployed.do?method=result&_t=" + new Date();
	$(form).form("submit",{
		url:ls_url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function( d ){
			d = decodeURIComponent(d);
			var re = eval("[" + d + "]");
			if(re[0].code === 0 ){
				msg_alert("提示信息","保存成功!","succeed",in_func);
			}else{
				msg_alert("提示信息",re[0].message,"error");
			}
			return;
		}
	});
}