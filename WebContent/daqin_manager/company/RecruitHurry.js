/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() { 
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '搜索招聘会',
		toolbar : '#toolbar',
        frozenColumns : [ [
		{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		{
			field : 'company_name',
			title : '单位名称',
			formatter : function(value,row,index){
				return '<a href="/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>';
			},
			width:300
		},{
			field : 'job_name',
			title : '职位名称',
			formatter : function(value,row,index){
				return '<a href="/company/jobDetail.do?id='+row.job_id+'" target="_blank">'+value+'</a>';
			},
			width:300
		},{
			field : 'job_person_num',
			title : '招聘人数',
			width:50
		},{
			field :'begin_date',
			title :'开始日期',
			width:150
		},{
			field :'end_date',
			title :'结束日期',
			width:150
		},{
			field : 'add_time',
			title : '发布时间',
			width:150
		}
		] ],
		type : 'GET',
		nowrap : true,
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_hurry&in_r=ad&in_URLEncoding=UTF-8"+querystr;
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
			pageSize : ini_pagesize
		    });
		ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
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
	    ls_id     = lo_selected[0].job_fair_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jJobFairView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
		var job_fair_name=   $('#in_job_fair_name').val() ;
		var job_fair_time_1=$('#in_job_fair_time_1').datebox('getValue');
		var job_fair_time_2=$('#in_job_fair_time_2').datebox('getValue');
		var job_fair_type=$('input[name=in_job_fair_type]').val();
		var job_fair_level=$('input[name=in_job_fair_level]').val();
		var job_fair_feature=$('input[name=in_job_fair_feature]').val();
		var preview=$('input[name=in_preview]:checked').val();
		var flag=$('input[name=in_flag]:checked').val();
		var url = getUrl();
		return url+"&in_job_fair_name="+job_fair_name+
				        "&in_job_fair_time_1="+job_fair_time_1+
				        "&in_job_fair_time_2="+job_fair_time_2+
				        "&in_job_fair_type="+job_fair_type+
				        "&in_job_fair_level="+job_fair_level+
				        "&in_job_fair_feature="+job_fair_feature+
				        "&in_preview="+preview+
				        "&in_flag="+flag;
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
	$("#if_deal")[0].src = "./jJobFairAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$("#dlg_deal").dialog("open").dialog("setTitle", "新增");
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
    	var preview = lo_selected[0].preview;
    	if(preview == 1){
	    	$.messager.alert('提示信息','不能修改学校待审核招聘会！','info');
	    	return false;
    	}
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].job_fair_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jJobFairEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function deleteStudent() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的记录！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的记录！','info');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_student_mgr"+i+"="+ lo_selected[i].user_code;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=student_query&in_r=ad&in_action=del" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除成功',downOrreloadData);
	    	 	}
	    	 });
     }
 }
 function searchStudent(){
    var li_pagesize  = $("#resultId").datagrid('options').pageSize;
	$('#resultId').datagrid( {
		pageNumber : 1,
		pageSize : li_pagesize
	});
	ajaxData("#resultId", searchUrl, getData, undefined, li_pagesize, undefined);
}
function searchUrl(){
	var add_time_1=$('#in_end_date_1').datebox('getValue');
	var add_time_2=$('#in_end_date_2').datebox('getValue');
	var company=$("#in_company_name").val();
	var position=$("#in_position").val();
	return  getUrl()+"&in_company_name="+company+"&in_position="+position+"&in_end_date_1="+add_time_1+"&in_end_date_2="+add_time_2+"&date="+new Date();
}