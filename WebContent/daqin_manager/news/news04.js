/* =======================================================*/
// 功能：新闻管理
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
		$('#searchAndreloadData').bind('click',function(){
			searchData("#resultId", getUrl, getData);
		});
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		toolbar:[{  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
							add();
            		}  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
							edit();
            		}  
        },{  
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
							del();
            		}  
        },{  
            text:'批量审核',  
            iconCls:'icon-copy',  
            handler:function(){
			 				batCheck()
            		}  
        },'-',{  
            text:'置顶显示',  
            iconCls:'icon-copy',  
            handler:function(){
			 				frontShow(true);
            		}  
        },{  
            text:'取消置顶',  
            iconCls:'icon-copy',  
            handler:function(){
			 				frontShow(false);
            		}  
        }
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]], 
		columns : [ [ {
			field : 'author',
			title : '发布',
			width:80,
			formatter :function(value ,row ,index){
				if(row.school_id !=null && row.school_id !=''){
					return '<a href="'+cur_path+'/school/info.do?id='+row.school_id+'" target="_blank">'+value+'</a>';
				}else{
					return value;
				}
			}
		},{
			field : 'sub_type',
			title : '类型',
			width:60
		},{
			field : 'news_title',
			title : '标题',
			formatter: function(value,row,index){
				var is_pic="",front_sign="";
				if( row.is_pic == 1 ){
					is_pic='<span style="color:blue;">[图]</span>';
				}
				if(row.front_sign>0){
					front_sign='<span style="color:red;">[置顶]</span>';
				}
				return is_pic+front_sign+'<a href="'+cur_path+'/newsDetail.do?id='+row.news_id+'&_t='+new Date+'" target="_blank">'+row.news_title+'</a>';
			} ,
			width:240
		},{
			field : 'news_display',
			title : '显示位置',
			width:110
		},{
			field : 'news_author',
			title : '作者',
			width:120
		},{
			field : 'news_source',
			title : '来源',
			width:100
		},{
			field : 'add_time',
			title : '发布时间',
			width:120
		},{
			field : 'click_stat',
			title : '点击',
			width:50,
			align:'center'
		}
		] ],

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
		singleSelect : false,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		fitColumns:true
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_news_query&in_news_type=news_type04&in_role_id="+role_id+"&in_URLEncoding=UTF-8";
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
	$("#if_deal")[0].src = "jNewsAdd04.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "添加");
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
	    	 			if(lo_selected[i].status ==0){
							$.messager.alert('提示信息','待审核的新闻不能删除！','info');
							return false;
						}
    					ls_id += "&in_news_mgr"+i+"="+ lo_selected[i].news_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_news_del&in_role_id="+role_id+ ls_id+"&date="+new Date();
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
			pageSize : ini_pagesize
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
	var ls_status=-1; //新闻状态

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    if(lo_selected[0].status ==0){
	    	$.messager.alert('提示信息','待审核的新闻不能修改！','info');
	    	return false;
	    }
	    ls_id     = lo_selected[0].news_id;
	    ls_status=lo_selected[0].status;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='jNewsEdit04.jsp?id='+ls_id+'&status='+ls_status+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
	    ls_id     = lo_selected[0].news_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/school/jNewsView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
// 函数作用：提交至下一环节审核
/* ===================================================== */
   function sendData() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要提交审核的新闻！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要提交审核的新闻！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要提交审核该新闻吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += ","+ lo_selected[i].news_id;
   					}
   					ls_id=ls_id.substring(1,ls_id.length);
   					
   					var url= cur_path +"/sheetAction.do?method=sendSheet&ids=" + ls_id+"&flow_id=002&buss_id=news";
		   		  $.post(url, {}, function(data){
		            if(data=="succ"){
		              $.messager.alert('提示信息', '提交成功!','info',function (){downOrreloadData('','','');});
		              
		            }else{
		              $.messager.alert('提示信息','提交失败','info');
		            }
		          });

	    	 	}
	    	 });
		            
      		
        }
 }
/* ====================================*/
// 函数作用：（批量审核通过）
/*====================================*/
function batCheck(){
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的用户选项！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择待审核的新闻！','info');
	    	return false;
	    }else{
	    	for(var i=0;i< lo_selected.length;i++){
	    		if(lo_selected[i].status ==1){
					$.messager.alert('提示信息','请不要选择已审核的新闻！','info');
					return false;
				}
    			ls_id += "&in_news_mgr"+i+"="+ lo_selected[i].news_id;
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
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_news_audit&in_deal_type="+deal_type+"&in_role_id="+role_id+ ls_id+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}
function frontShow( flag ) {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要置顶的记录！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要置顶的记录！','info');
	    	return false;
	    }else{

	    	 for(var i=0;i< lo_selected.length;i++){
	    	 			if(lo_selected[i].status ==0){
							$.messager.alert('提示信息','待审核的新闻不能置顶操作！','info');
							return false;
						}
    					ls_id += "&in_news_mgr"+i+"="+ lo_selected[i].news_id;
   			 } // for
   			ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_news_update&r=ad&in_action=front&in_flag="+flag+"&in_role_id="+role_id+ ls_id+"&date="+new Date();
			ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	    } 
 }
 
 
function searchData(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
	var ls_url = inf_url();
	
    if (ini_page && ini_page > 0)
		ls_url = ls_url + "&in_page=" + ini_page;
	if (ini_pagesize && ini_pagesize > 0)
		ls_url = ls_url + "&in_pagenum=" + ini_pagesize;

    $('#fm').form('submit', {
        url: ls_url,
		type : "post",
		dataType : "text",
		onSubmit : function(){
			$.messager.progress({
				text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
			});
			return true;
		},
		success : function(data) {
			$.messager.progress("close");
			if (!data)
				return;
			data = decodeURIComponent(data);
			 out_return = eval("[" + data + "]");
			if (out_return.length > 0 && out_return[0].returncode == 'ok') {
				var rowcount = out_return[0].querycount;
				var queryresult = out_return[0].queryresult;
				if( rowcount == -1 && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	 	return;
            	}
				if(rowcount<1&&!tip){
					 //$.messager.alert('提示信息','无查询结果');   
					 
				}
				out_return = "{\"total\":" + rowcount + ",\"rows\":"+ JSON.stringify(out_return[0].queryresult) + "}";
				out_return = eval("[" + out_return + "]");
				//处理页面一致
				if (ini_page && ini_page > 0){
					$(ins_id).datagrid( {
						pageNumber : ini_page,
						pageSize   : ini_pagesize
				    });
                }
//				else{
//					inf_deal();
//					}
			  //加载数据
			   $(ins_id).datagrid('loadData', out_return[0]);
		
			   initPaperareafm(ins_id,inf_url,inf_deal,ini_pagesize);
			    //选中当前行
			   if (ini_currentrow>=0)
				{
					$(ins_id).datagrid('selectRow', ini_currentrow);
				}
			} else if (out_return.length > 0 && out_return[0].returncode == 'fail') {
				showError(out_return[0].errordesc);
				
			}
		}
    });
}
function initPaperareafm(ins_id,inf_url,inf_deal,pageSize){
	 var pg = $(ins_id).datagrid("getPager");
	if(pg)
	{
	   $(pg).pagination({
	       pageSize: pageSize,
	       onRefresh:function(pageNumber,pageSize){
		        searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        },
	       onChangePageSize:function(pageSize){
		        searchData(ins_id,inf_url,inf_deal,1,pageSize,undefined);
	        },
	       onSelectPage:function(pageNumber,pageSize){
	             searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        }
	   });
	}
 }