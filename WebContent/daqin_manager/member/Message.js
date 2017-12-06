/* =======================================================*/
// 功能：机构给企业发送的信息
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#notice').datagrid( {
		//title : '消息',
		toolbar:[
		{  
            text:'发送消息',  
            iconCls:'icon-copy',  
            handler:function(){
				sendMessage();
            }  
        },/*{  
            text:'群发消息',  
            iconCls:'icon-copy',  
            handler:function(){
				sendMessage('bat');
            }  
        },*/{  
            text:'删除消息',  
            iconCls:'icon-copy',  
            handler:function(){
				del();
            }  
        }
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		  {
			field : 'status',
			title : '消息状态',
			formatter:function(value,row,index){
				if (value=='未读'){
					return '<span style=color:red>'+value+'</span>';
				}else{
					return value;
				}	
			}
		},{
			field : 'message_content',
			title : '消息内容',
			width : '400'
		},{
			field : 'receiver',
			title : '接收',
			width : '225'
		},{
			field : 'add_time',
			title : '时间',
			width : '125'
		}
		] ],
		type : 'POST',
		nowrap : false,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 10,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : false,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		striped : true,
		checkbox:true,
		border:false
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#notice', getUrl, getData, undefined, 20, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_message_query&in_URLEncoding=UTF-8"+querystr;
	return ls_url;	
	}

   /* =======================================================*/
// 函数作用：得到当前被选中行的对象
// 输入参数及数据类型： ins_id   数据显示域id
//					ins_msg  无选中行时提示信息
// 返回参数及数据类型： lo_selected 选中行对象
/* ===================================================== */
	function getCheckObj(ins_id,ins_msg){
		//当前选中行
		if (!$("#"+ins_id).datagrid("getSelections") || $("#"+ins_id).datagrid("getSelections")==""){
			return false;
		}else{
			var lo_selected= $("#"+ins_id).datagrid("getSelections");
			return lo_selected;
		}
		
	}
	
	/* =======================================================*/
// 函数作用：加载或刷新数据
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
	function downOrreloadData(ini_pagesize,ini_pagenum,ini_currentnum){
		$('#notice').datagrid( {
			pageNumber : 1,
			pageSize : 20
		    });
		ajaxData('#notice',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
	}




/* =======================================================*/
// 函数作用：删除消息
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('notice','请选择要删除的消息！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除消息！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要删除所选消息?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_message_mgr"+i+"="+ lo_selected[i].message_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_message_del" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
 }
/* ====================================*/
// 函数作用：（批量审核通过）
/*====================================*/
function sendMessage(batsend){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";
	if(batsend !='bat'){
	    lo_selected   = getCheckObj('notice','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择用户！','info');
	    	return false;
	    }else{
	    	for(var i=0;i< lo_selected.length;i++){
	    		if(ls_id.indexOf(lo_selected[i].id)==-1){
    				ls_id += "&in_receiver"+i+"="+ lo_selected[i].id;
    			}
   			}
   			dlg_title="向所选用户发送消息";
			$("#in_send_type").val("user");
        }
     }else{
     		dlg_title="群发消息";
     		$("#in_send_type").val(user_type);
     }
     $("#dlg_check").show().dialog({  title:dlg_title,
	    												   width: 350,
	    												   height: 220,
	    												   fit:false,
	    												   buttons: [{
												                    text:'发送',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       submit(user_type,ls_id);
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_check").dialog('close') ;
												                    }
												                }]
	    												   });
	  $("#dlg_check").dialog("open");
 }
function submit(user_type,ls_id)
{
	var mem=$("#mem").val();
	var in_send_type=$("#in_send_type").val();
	var mems =   mem ;
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_message_send&in_user_type="+user_type+"&in_send_type="+in_send_type+"&in_message="+mems+ls_id+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}
 /* =======================================================*/
// 函数作用：编辑消息
/* ===================================================== */
   function edit() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    var mems="";
	    lo_selected   = getCheckObj('notice','请选择要编辑的消息！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要编辑的消息！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要修改所选消息?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_message_mgr"+i+"="+ lo_selected[i].message_id;
   					}
   					$("#dlg_check").show().dialog({  title: "编辑消息",
	    												   width: 350,
	    												   height: 220,
	    												   fit:false,
	    												   buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
					mems=$("#mem").val();					                    
   					ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_message_edit&in_message="+mems+ls_id+"&date="+new Date();
				    //console.info(ls_url);
				    ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
				    $("#dlg_check").dialog('close') ;
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_check").dialog('close') ;
												                    }
												                }]
	    												   });
	  				$("#dlg_check").dialog("open");
	    	 	}
	    	 });
		            
      		
        }
 }
