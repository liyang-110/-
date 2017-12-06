function closeDialog()
{
	var list = art.dialog.list;
	for (var i in list) {
		list[i].close();
	};
}
function msg_alert_lock(title,msg,icon,in_func )
{
		art.dialog({
			title: title , // '提示信息',
			content: msg,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:true,
			id:'alert',
			ok: function(){
					if( in_func ){
						in_func();
					}
					this.close();
				}
		});
}
function msg_alert(title,msg,icon,in_func )
{
		art.dialog({
			title: title , // '提示信息',
			content: msg,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:false,
			id:'alert',
			//  time: 5,
			ok: function(){
					if( in_func ){
						in_func();
					}
					this.close();
				}
		});
}
function open_layer( ls_url ){
			art.dialog.open(ls_url, 
						{title: '简历',
						 
						 width:755,
						 fixed:true,
						 lock:true,
						 background:'#000',
						 opacity:0.3
						 },false); 
}
/* =======================================================*/
//函数作用：下拉框联动
//返回参数及数据类型：
/* ===================================================== */
function linkSelectCode(ins_sqlid,ins_id,empty,unshiftObj,in_value,in_func ){
try{
	var js_array = eval( ins_sqlid+"_js_array");
	if(js_array!=undefined){
          ls_return =js_array;
          /*
           if (ins_isbuxian!='undifined' && ins_isbuxian==1){
           	ls_return.unshift({ "text": "\u4E0D\u9650", "id": "" }); //加不限
           }
           */
          if( unshiftObj!= undefined && unshiftObj ){
          	ls_return.unshift( unshiftObj );
          }
           var selectObj = $("#"+ins_id);
           if( empty ){
          	 selectObj.empty();
           }
           for(var i=0;i<ls_return.length;i++){
          	 selectObj.append('<option value="'+ls_return[i].id+'">'+ls_return[i].text+'</option>');
           }
           if(in_value){
          	 selectObj.find("option[value='"+in_value+"']").attr("selected",true);
           }
	}
	if( typeof(in_func )!=undefined ){
		in_func( selectObj.val() );
	}
}catch(e){
}

}