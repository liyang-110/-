/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	linkSelectCode('member_type','in_member_type',false,'','');
	$('#searchAndreloadData').bind('click',function(){searchAndreloadData();})
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
            text:'审核',  
            iconCls:'icon-search',  
            handler:function(){
							batCheck();
           	 			} 
           	 			
        },{  
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
							del();
            			}  
        },"-",{  
            text:'充点',  
            iconCls:'icon-search',  
            handler:function(){
							points();
        				}  
        },/*{  
            text:'会员级别',  
            iconCls:'icon-search',  
            handler:function(){
							member();
        				}  
        },*/ {  
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
        }*/
        '-',{  
            text:'招客信息',  
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
			field : 'user_id',
			title : '用户账号',
			rowspan:2
		}/*,{
			field : 'user_name',
			title : '姓名'
		}*/,{
			field : 'member_type',
			title : '会员类型'
		},{
			field : 'points',
			title : '点数'
		},{
			field : 'begin_date',
			title : '开始时间'
		},{
			field : 'end_date',
			title : '截止时间'
		},{
			field : 'company_name',
			title : '公司名称',
			formatter : function(value,row,index){
							var pic=row.company_pic=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_pic+'" target="_blank"><span class="red">[代]</span></a>';
							var img=row.company_img=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_img+'" target="_blank"><span class="red">[执]</span></a>';
							var status="";
							if(row.status=='1'){
								status='<span class="green">[审]</span>';
							}else if(row.status=='2'){
								status='<span class="red">[退]</span>';
							}
							return pic+img+status+'<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'
										+value+'</a>';
			}
		},{
			field : 'area_id',
			title : '地区'
		},{
			field : 'contact_tel',
			title : '联系电话'
		},{
			field : 'user_email',
			title : '用户邮箱'
		},{
			field : 'add_time',
			title : '添加时间'
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_user_company_query&r=ad&in_URLEncoding=UTF-8"+querystr;
	return ls_url;	
	}
/* =======================================================*/
// 函数作用：打开新增页面
// 输入参数及数据类型：
//			  无
// 返回参数及数据类型：无
/* ===================================================== */
function add(){
	var li_currentnum = 0; //当前行
	var li_pagesize = 0; //每页行数
	var li_pagenum = 0; //页码
	var lo_selected;          //当前选中行
	var lo_pg;                //分页对象
	lo_selected = $("#resultId").datagrid("getSelected");                                               
	if (lo_selected) {
		li_currentnum = $("#resultId").datagrid("getRowIndex", lo_selected);
	}
	lo_pg = $("#resultId").datagrid("getPager");
	li_pagenum = lo_pg.pagination("options").pageNumber;
	li_pagesize = lo_pg.pagination("options").pageSize;
	$("#if_deal")[0].src = "./jCompanyAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	 $('#dlg_deal').dialog({width:260,height:220,fit:true});
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
}

/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的文件！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_02" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
		            
      		
        }
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
// 函数作用：修改
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function edit() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //编码

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jLoginEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		 $('#dlg_deal').dialog({width:260,height:220,fit:true});
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}


function view() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jLoginView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	     $('#dlg_deal').dialog({width:260,height:220,fit:true});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
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
		ajaxData('#resultId',getSearchUrl,getData,undefined,cur_page_size,undefined); 
	}
	function getSearchUrl()
	{
		var in_user_id= $('#in_user_id').val();
		var in_user_name=$('#in_user_name').val() ;
		var in_email=$('#in_email').val();
		var in_company_name=$('#in_company_name').val() ;
		var in_member_type=$('input[name=in_member_type]').val();
		
		var in_add_time_1=$('#in_add_time_1').datebox('getValue');
		var in_add_time_2=$('#in_add_time_2').datebox('getValue');
		
		var in_end_date_1=$('#in_end_date_1').datebox('getValue');
		var in_end_date_2=$('#in_end_date_2').datebox('getValue');
				
		var url = getUrl();
		return url+"&in_user_id="+in_user_id+
				        "&in_user_name="+in_user_name+
				        "&in_email="+in_email+
				        "&in_company_name="+in_company_name+
				        "&in_member_type="+in_member_type+
				        "&in_add_time_1="+in_add_time_1+
				        "&in_add_time_2="+in_add_time_2+
				        "&in_end_date_1="+in_end_date_1+
				        "&in_end_date_2="+in_end_date_2;
	}
function points() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //
	var ls_zk_id="";

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].user_code;
	    if ( lo_selected[0].zk_id!=null &&  lo_selected[0].zk_id !=''){
	    	ls_zk_id= lo_selected[0].zk_id;
	    }
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jPoints.jsp?zk_id='+ls_zk_id+'&id='+ls_id+'&user_type=company&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
         $('#dlg_deal').dialog({width:360,height:260,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','充点'); 
    }
}
function member(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jMember.jsp?id='+ls_id+'&user_type=company&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
         $('#dlg_deal').dialog({width:390,height:470,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','修改会员级别'); 
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
function batCheck(){
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要审核的信息！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要审核的信息！','info');
	    	return false;
	    }else{
	    	for(var i=0;i< lo_selected.length;i++){
    			ls_id += "&in_company_mgr"+i+"="+ lo_selected[i].company_id;
   			}
	    	$("#dlg_check").show().dialog({  title:"审核",
	    												   width: 350,
	    												   height: 220,
	    												   fit:false,
	    												   buttons: [{
												                    text:'通过',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendCheck('Y',ls_id);
												                    }
												                },{
												                    text:'不通过',
												                    handler:function(){
												                        sendCheck('N',ls_id);
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
 }
function sendCheck(deal_type,ls_id)
{
	var mem=$("#mem").val();
	if (deal_type=='N' && mem==""){
		$.messager.alert('提示信息','请输入批注意见','info');
		return;
	}
	var mems =   mem ;
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_audit&in_r=ad&in_buss_id=company" + ls_id+"&in_deal_type="+deal_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}

function showZhaoke() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  // zk_id
	var area_id="";
	var company_id="";

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
		if (lo_selected[0].zk_id==null || lo_selected[0].zk_id.zk_id ==''){
    		$.messager.alert('提示信息','该企业并非招客注册，请重新选择！','info');
			return false;
		}
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].zk_id;
	    area_id = lo_selected[0].area_id;
	    company_id  = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jZhaokeView.jsp?id='+ls_id+'&area_id='+area_id+'&company_id='+company_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();
	     $('#dlg_deal').dialog({width:390,height:210,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}
