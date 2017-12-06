/* =======================================================*/
// 功能：待审核文件
/* ===================================================== */
$(function() {
		getData();
		ajaxdata1();
		$('#searchAndreloadData').bind("click",function(){
			searchData("#notice", getUrl, getData);
		});

	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#notice').datagrid( {
		toolbar :"#toolbar",
		columns : [ [
		  {
			field : 'g_year',
			title : '毕业时间',
			width: 110
		},{
			field : 'g_total',
			title : '毕业生人数',
			width: 100
		},{
			field : 'school_name',
			title : '毕业学校',
			width: 200
		},{
			field : 'g_title',
			title : '标题',
			width: 250,
			formatter : function(value,row,index){
				return '<a href="'+cur_path+'jedit_uploading.jsp?id='+row.g_id+'" title="'+row.g_title+'" target="_blank">'+row.g_title+'</a>';
			}
		},{
			field : 'edit_time',
			title : '修改时间',
			width: 130
		}
		] ],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : "auto",
		height : 'auto',
		url : '',
		pageSize : 20,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : false,
		rownumbers : true,
		nowrap : true,
		striped : true,
		checkbox:true,
		border:false,
		onLoadSuccess : function(){
			/* var ifram = parent.document.getElementById("rightFrm");
			var panel = $(this).datagrid("getPanel");
			setTimeout(function() {
		          var contentHeight =  $(panel).height();
				  $(ifram).attr("height",contentHeight+32 ); 
		    }, 500);
			*/
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
		ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=school_graduation_query";
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
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closepage(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
	$('#w').dialog('close') ;
	ajaxData("#notice", getUrl, getData, ini_pagenum, ini_pagesize, ini_currentnum);
}
function audit(processid,buss_id,index,lastNum,permit){
	$.messager.alert("提示信息","此功能暂时无法使用！","info");
	return false;
}
function xxx(){
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
    lo_selected   = getCheckObj('notice','请选择一行信息！');   
   	lo_pg         = $("#notice").datagrid("getPager");
   	li_pagenum    = lo_pg.pagination('options').pageNumber;
	li_pagesize = $('#notice').datagrid('options').pageSize;
   	li_currentnum = index; //$("#notice").datagrid("getRowIndex",lo_selected[0]);
	if( lastNum==0 || permit ==0 ){
		var title="";
		var msg="";
		if(lastNum==0){
			title='展位已满';
		}else{
			title='预定已经截止';
		}
		if(buss_id=='apply'){
			msg="，申请已取消！";
		}else{
			msg="，邀请已取消！";		
		}
		$.messager.alert('提示信息',title+msg,'info',function(){
				sendData("N",processid,buss_id,li_pagenum,li_pagesize,li_currentnum);
		});

	}else{
		$("#if_deal")[0].src = "jDeal.jsp?processid=" + processid+ "&buss_id=" + buss_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();;
		$("#dlg_deal").dialog("open").dialog("setTitle", "审核");
	}
}	
function sendData(deal_type,processid,buss_id,pagenum,pagesize,currentnum)
{
			var mem='展位已满！';
			var url= cur_path +"/sheetAction.do?method=dealSheet";
			$.post(url, {processid: processid, buss_id: buss_id, deal_type: deal_type,mem:mem}, function(data){
				if(data=="succ"){
					ajaxData("#notice", getUrl, getData, pagenum, pagesize, currentnum);

				}else{
					$.messager.alert('提示信息','服务器连接错误','info');
				}
			});
}
function searchData(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
	var ins_url = inf_url();
    if (ini_page && ini_page > 0)
		 ins_url = ins_url + "&in_page=" + ini_page;
	if (ini_pagesize && ini_pagesize > 0)
		 ins_url = ins_url + "&in_pagenum=" + ini_pagesize;
    $('#fm').form('submit', {
        url: ins_url,
        onSubmit: function() {
        	if($(this).form('validate')){
				$.messager.progress({
					text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
				});
				return true;
        	}else{
            	return false;
            }
        },
		success : function(data) {
        	$.messager.progress("close");
			if (!data)
				return;
			data = decodeURIComponent(data);
			 out_return = eval("[" + data + "]");
			if (out_return.length > 0 && out_return[0].returncode == 'ok') {
				rowcount = out_return[0].querycount;
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
                }else{
					$(ins_id).datagrid( {
						pageNumber : 1,
						pageSize : 20
					});
                }
//				else{
//					inf_deal();
//					}
			  //加载数据
			   $(ins_id).datagrid('loadData', out_return[0]);
			   initPaperareafm(ins_id,inf_url,inf_deal,ini_pagesize);
			   //initPaperarea(ins_id,inf_url,inf_deal,ini_pagesize);
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
	        },
	       onSelectPage:function(pageNumber,pageSize){
	             searchData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        }
	   });
	}
 }