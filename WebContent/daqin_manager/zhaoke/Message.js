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
            text:'标为已读',  
            iconCls:'icon-ok',  
            handler:function(){
				 readMessage();
            }
        },{  
            text:'回复消息',  
            iconCls:'icon-tip',  
            handler:function(){
				 sendMessage();
            }
        },{  
            text:'查看招客',  
            iconCls:'icon-copy',  
            handler:function(){
				showZhaoke();
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
			field : 'send_time',
			title : '时间',
			width : '150'
		},{
			field : 'sender',
			title : '发件人',
			width : '60'
		},{
			field : 'reciver',
			title : '收件人',
			width : '60'
		},{
			field : 'sms_content',
			title : '消息内容',
			width : '400'
		},{
			field : 'company_name',
			title : '企业名称',
			width : '150',
			formatter :function(value,row,index){
					return '<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>';
			}
		}
		] ],
		type : 'POST',
		nowrap : false,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		striped : true,
		checkbox:true,
		border:false,
		fitColumns:false,
		rowStyler: function(index,row){
			var cssStr="";
			if (row.read_flag=='0'){
					cssStr+='background-color:#D9FFAE;font-weight:bolder'; // return inline style
			}
			return cssStr;
		}
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_message_query&in_URLEncoding=UTF-8"+querystr;
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
function sendMessage(){
	var lo_selected;      //当前选中行
	var ls_read_person = "";        //用户id
	var ls_read_type="";
	var ls_area_id="";
	var ls_company_id="";
	var dlg_title="发送消息";
    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('notice','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    if(lo_selected[0].sender=='我'){
	    	$.messager.alert('提示信息','您不能给自己发送消息！','info');
	    	return false;
	    }
	    ls_read_person     = lo_selected[0].send_person;
	    ls_read_type = lo_selected[0].send_type;
	    ls_area_id = lo_selected[0].area_id;
	    ls_company_id =lo_selected[0].company_id;
   		dlg_title="回复消息";
		$("#in_send_type").val("ad");
		$("#mem").val("");
     }
     $("#dlg_check").show().dialog({  title:dlg_title,
	    												   width: 350,
	    												   height: 220,
	    												   fit:false,
	    												   buttons: [{
												                    text:'发送',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       submit(ls_read_person,ls_read_type,ls_area_id,ls_company_id);
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
function submit(read_person,read_type,area_id,company_id)
{
	var mems=$("#mem").val();
	var send_type=$("#in_send_type").val();
	var user_code=$("#in_user_code").val();
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=zk_message_query&in_r=ad&in_action=send&in_sms_type=zk_area&in_user_code="+user_code+"&in_memo1="+area_id+"&in_memo2="+company_id+"&in_read_person="+read_person+"&in_read_type="+read_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}

function showZhaoke() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('notice','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
		if (lo_selected[0].send_type=='zk'){
			 ls_id     = lo_selected[0].send_person;
		}else 	if (lo_selected[0].read_type=='zk'){
			 ls_id     = lo_selected[0].read_person;
		}else{
	    	$.messager.alert('提示信息','未知错误！','info');
	    	return false;
		}
	    li_currentnum = $("#notice").datagrid("getRowIndex",lo_selected[0]);
	   
        lo_pg         = $("#notice").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='jZhaokeView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	     $('#dlg_deal').dialog({width:390,height:180,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}
function readMessage(){
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('notice','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	return false;
	    }else{
	    	 for(var i=0;i< lo_selected.length;i++){
    			ls_id += "&in_sms_mgr"+i+"="+ lo_selected[i].sms_id;
   			}
   			ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=zk_message_query&in_r=ad&in_action=read"+ ls_id+"&date="+new Date();
			ajaxDealUrl(ls_url,'',downOrreloadData);
        }
}