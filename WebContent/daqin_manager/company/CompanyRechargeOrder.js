/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	$('#searchAndreloadData').bind('click',function(){
		// searchAndreloadData();
		searchForm('#resultId',getUrl,getData);
	});
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '企业用户管理',
		toolbar:[{  
            text:'修改订单',  
            iconCls:'icon-view',  
            handler:function(){
            	orderStatus();
           	} 
        },{  
            text:'企业会员中心',  
            iconCls:'icon-copy',  
            handler:function(){
				memberCenter();
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
			field : 'trade_no',
			title : '单号',
			width : 150
		},{
			field : 'time_start',
			title : '订单时间',
			width : 150
		},{
			field : 'totalamount',
			title : '金额',
			width :  80,
			align : 'center'
		},{
			field : 'payamount',
			title : '应付',
			width :  80,
			align : 'center' 
		},{
			field : 'order_status',
			title : '订单状态',
			width :  70,
			align : 'center',
			formatter : function(value,row,index){
				if('SUCCESS'===value ){
					return '<span class="green">已完成</span>';
				}else if('EXPIRE'===row.is_expire){
					return '已关闭';
				}else if('OK'===value){
					return '待付款';
				}else{
					return value;
				}
			}
		},{
			field : 'pay_status',
			title : '支付状态',
			width :  70,
			align : 'center',
			formatter : function(value,row,index){
				switch( value ){
					case 'NOTPAY':
						return '未付款';
					case 'SUCCESS':
						return '<span class="green">已付款</span>';
					default:
						return value;
				}
			}
		},{
			field : 'company_name',
			title : '公司名称',
			formatter : function(value,row,index){
							var status="";
							if(row.company_status=='1'){
								status='<span class="green">[审]</span>';
							}else if(row.company_status=='2'){
								status='<span class="red">[退]</span>';
							}
							return status+'<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'
										+value+'</a>';
			},
			width : 260
		},{
			field : 'member_type_name',
			title : '会员类型',
			width : 100
		},{
			field : 'end_date',
			title : '截止时间',
			width : 150 
		},{
			field : 'company_site',
			title : '分站',
			width : 50
		},{
			field : 'admin_name',
			title : '招聘顾问',
			width : 60
		}
		]],

		type : 'POST',
		nowrap : true,
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
		nowrap : true,
		striped : true,
		fitColumns:true,
		border:false,
		rowStyler: function(index,row){
			var cssStr="";
			if (row.zk_id!=null && row.zk_id !=''){
					cssStr+='background-color:#E8EEE2;'; // return inline style
			}
			return cssStr;
		},
		onDblClickRow : function(index ,row ){
			$("#dlg_view").dialog({
			    title: '订单号：'+row.trade_no,   
			    width: 420,   
			    height: 320,   
			    closed: false,   
			    cache: false,   
			    modal: false,
			    fit:false,
			    content :''  
			});
		}
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_trade_order_query&in_r=ad&in_URLEncoding=UTF-8"+querystr;
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
		$('#resultId').datagrid( {
			pageNumber : 1,
			pageSize : 20
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
	}


/* =======================================================*/
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closepage(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
	ajaxData("#resultId", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
	/* =======================================================*/
// 函数作用：按条件搜索招聘会
// 输入参数及数据类型： 
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
// 返回参数及数据类型： 无
/* ===================================================== */
function searchAndreloadData(){	
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	searchForm('#resultId',getUrl,getData);
}
function orderStatus(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
        li_pagesize	  = lo_pg.pagination('options').pageSize;
        $("#orderStatusForm").form("load",{
        	in_trade_no : lo_selected[0].trade_no,
        	company_name : lo_selected[0].company_name,
        	in_order_status : lo_selected[0].order_status,
        	in_pay_status : lo_selected[0].pay_status,
        	in_pay_amount : lo_selected[0].payamount,
        });
        var ls_url = getUrl();
        $('#dlg_orderstatus').show().dialog({width:390,height:290,fit:false,buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
            	$("#orderStatusForm").form("submit",{
            	        url: ls_url,
            			type : "post",
            			dataType : "text",
            			onSubmit : function(){
            				if($(this).form('validate') ){
                				$.messager.progress({
                					text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
                				});
            					return true;
            				}
            				return false;
            			},
            			success : function(data) {
            				$.messager.progress("close");
            				data = decodeURIComponent( data );
            				out_return = eval("[" + data + "]");
            				if(out_return[0].returncode =='ok'){
            					var list = out_return[0].queryresult;
            					if( list[0].ok== 'ok' ){
            						$.messager.alert("提示信息","操作成功","info",function(){
            							 $("#dlg_orderstatus").dialog('close') ;
            							 searchForm('#resultId',getUrl,getData,li_pagenum,li_pagesize,li_currentnum );
            						});
            						return;
            					}else if( list[0].msg ){
            						$.messager.alert("提示信息",list[0].msg,"error");
            						return;
            					}
            				}
            				$.messager.alert("提示信息","操作失败","error");
            			}
            	});
            }
        },{
            text:'取消',
            handler:function(){
                $("#dlg_orderstatus").dialog('close') ;
            }
        }]}).dialog('open').dialog('setTitle','修改订单状态'); 
    }
}
function orderAmount(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $("#orderAmountForm").form("load",{
        	in_trade_no : lo_selected[0].trade_no,
        	company_name : lo_selected[0].company_name,
        	in_order_status : lo_selected[0].order_status,
        	in_pay_status : lo_selected[0].pay_status,
        	in_pay_amount : lo_selected[0].payamount,
        });
        
        $('#dlg_orderamount').show().dialog({width:390,height:280,fit:false,buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
            }
        },{
            text:'取消',
            handler:function(){
                $("#dlg_orderamount").dialog('close') ;
            }
        }]}).dialog('open').dialog('setTitle','修改订单金额'); 
    }
}
/* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendMessage(batsend){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";
	if(batsend !='bat'){
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择用户！','info');
	    	return false;
	    }else{
	    	for(var i=0;i< lo_selected.length;i++){
	    		if(ls_id.indexOf(lo_selected[i].id)==-1){
    				ls_id += "&in_receiver"+i+"="+ lo_selected[i].company_id;
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
 /* ====================================*/
// 函数作用：（批量审核通过）
/*====================================*/
function memberCenter(){
	var lo_selected;      //当前选中行
    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    ls_id     = lo_selected[0].user_code;
		window.open(cur_path+"/daqin_manager/memberLogin.do?user_type=company&user_code="+ls_id);
    }
}