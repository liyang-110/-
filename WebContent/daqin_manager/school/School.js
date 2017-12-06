/* =======================================================*/
// 功能：企业管理
/* ===================================================== */
var area_id="";
var status="";
var school_name="";
var add_time_1="";
var add_time_2="";
$(function() {
		linkSelectCode('area_id','in_area_id',false,'','');
		
	$('#searchAndreloadData').bind('click',function(){
			area_id=$("#in_area_id").combobox("getValue");
			school_name =   $('#in_school_name').val() ;
			status=$("#in_status").combobox("getValue");
			add_time_1=$("#in_add_time_1").datebox('getValue');
			add_time_2=$("#in_add_time_2").datebox('getValue');
			downOrreloadData();
												});
		
		getData();
		ajaxdata1();
	});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		//title : '招聘会管理',
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
            text:'批量删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
							del();
            			}  
        },{  
            text:'批量审核',  
            iconCls:'icon-search',  
            handler:function(){
							batCheck();
           	 			}  
           	 			
        },{  
            text:'设置登陆账号',  
            iconCls:'icon-search',  
            handler:function(){
							setLogin();
           	 			}  
           	 			
        },{  
            text:'导出毕业生信息',  
            iconCls:'icon-search',  
            handler:function(){
							exportGrad();
           	 	}  	
        }],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		  {
			field : 'area_id',
			title : '地区'
		},{
			field : 'school_name_status',
			title : '学校名称',
			formatter: function(value,row,index){
					return '<a href="'+cur_path+'/school/info.do?id='+row.school_id+'" target="_blank">'+value+'</a>';
			}
		},{
			field : 'contact_person',
			title : '联系人'
		},{
			field : 'contact_tel',
			title : '联系电话'
		},{
			field : 'email',
			title : '邮箱'
		},{
			field : 'school_addr',
			title : '地址'
		},{
			field : 'school_website',
			title : '网站'
		},{
			field : 'school_year',
			title : '毕业年份'
		},{
			field : 'school_studentnum',
			title : '毕业生总数'
		},{
			field : 'add_time',
			title : '添加时间'
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
		border : false
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_school_query&in_URLEncoding=UTF-8"
		+"&in_school_name="+school_name+"&in_area_id="+area_id
		+"&in_status="+status
		+"&in_add_time_1="+add_time_1
		+"&in_add_time_2="+add_time_2
		+querystr;
		return ls_url;
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
	$("#if_deal")[0].src = "./jSchoolAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
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
	    	$.messager.alert('提示信息','请选择要删除的记录！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_school_mgr"+i+"="+ lo_selected[i].school_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=school_02" + ls_id+"&date="+new Date();
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
		ajaxData('#resultId',getUrl,getData,ini_pagesize,ini_pagenum,ini_currentnum); 
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
	    ls_id     = lo_selected[0].school_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jSchoolEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
	    ls_id     = lo_selected[0].school_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jSchoolView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
function closePageCancel(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
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
    			ls_id += "&in_school_mgr"+i+"="+ lo_selected[i].school_id;
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
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_audit&in_r=ad&in_buss_id=school" + ls_id+"&in_deal_type="+deal_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}
/*
设置登陆账户
*/
function setLogin() {
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
	    ls_id     = lo_selected[0].school_id;
	    ls_user_code = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
		if(ls_user_code == null){
        	$('#if_deal')[0].src='./jLoginAdd.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	   	 	$('#dlg_deal').dialog('open').dialog('setTitle','开通用户'); 
		}else {
        	$('#if_deal')[0].src='./jLoginEdit.jsp?id='+ls_user_code+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	   		$('#dlg_deal').dialog('open').dialog('setTitle','修改用户'); 
		}
    }
}
function exportGrad(){
    var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    var ls_id     = lo_selected[0].school_id;
		var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=school_grad_xls&in_URLEncoding=UTF-8&in_school_id="+ls_id;
	    window.open(ls_url);
	}
}
 
 

 
 
