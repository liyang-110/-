/* =======================================================*/
// 功能：企业管理
/* ===================================================== */
var area_id="";
var company_name ="";
var status ="";
var add_time_1="";
var add_time_2="";
var member_type="";

$(function() {
	linkSelectCode('area_id','in_area_id',false,'','');
	linkSelectCode('member_type','in_member_type',false,'','');

	$('#searchAndreloadData').bind('click',function(){
		var cur_page_size = $('#resultId').datagrid('options').pageSize;

		searchForm("#resultId", getUrl, getData,1,cur_page_size);
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
        }/*,{  
            text:'删除',  
            iconCls:'icon-bullet-cross',  
            handler:function(){
							del();
            			}  
        },{  
            text:'重置密码',  
            iconCls:'icon-search',  
            handler:function(){
							setLogin();
           	 		}  	
        },{  
            text:'促单',  
            iconCls:'icon-search',  
            handler:function(){
					sendMessage();
           }  
           	 			
        } */ ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		{
			field : 'add_time',
			title : '注册日期',
			width : 50
		},{
			field : 'audit_time',
			title : '审核日期',
			width : 50
		},{
			field : 'audit_remark',
			title : '状态',
			width : 50,
			formatter : function(value,row,index){
				if( row.audit_time ){
					return '<span style="color:green;">[已审核]</span>';
				}else if( value ){
					return '<span style="color:red;">'+value+'</span>';
				}else{
					return '待审核';
				}
			}
		},{
			field : 'area_name',
			title : '地区',
			width : 20
		},{
			field : 'user_id',
			title : '帐号',
			width : 50
		}/*,{
			field : 'points',
			title : '点数'
		},{
			field : 'member_type',
			title : '会员类型'
		},{
			field : 'end_date',
			title : '有效期'
		}*/,{
			field : 'company_name',
			title : '企业名称',
/*			formatter : function(value,row,index){
					return '<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>';
			} */
			formatter : function(value,row,index){
				var pic=row.company_pic=='no'?'':'<span class="red">[代]</span>';
				var img=row.company_img=='no'?'':'<span class="red">[执]</span>';
				var status="";
				var doc="";
				var email = "";
				if( row.email_verify =='success'){
					email ='<a class="green" title="'+row.user_email+'">[邮]</a>';
				}
				/*
				if(row.status=='1' || row.status=='3'){
					status='<span class="green">[审]</span>';
				}else if(row.status=='2'){
					status='<span class="red">[退]</span>';
				}
				if( row.doc && row.doc!=""){
					doc= '<a href="'+cur_path+'/upload/download.jsp?path='+row.doc+'&name='+row.company_name+'" target="_blank" style="color:#669900;">[简]</a>';
				}*/
				return email+doc+pic+img+status+'<a href="/company/info.do?id='+row.company_id+'" target="_blank">'
							+value+'</a>';
			},
			width : 150
		},{
			field : 'recruit_count',
			title : '发布职位',
			align : 'center',
			width : 50
		},{
			field : 'contact_person',
			title : '联系人',
			width : 50
		},{
			field : 'contact_tel',
			title : '手机',
			width : 50
		}/*,{
			field : 'company_tel',
			title : '固定电话'
		},{
			field : 'email',
			title : '电子邮件'
		},{
			field : 'company_addr',
			title : '公司地址'
		} */
		] ],

		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url :false,
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
		fitColumns:true,
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_company_query&in_URLEncoding=UTF-8"+querystr;
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
	$("#if_deal")[0].src =  "./jCompanyAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
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
	    }else if( lo_selected.length>1 ){
	    	$.messager.alert("提示信息",'请选择一行','warning');
	    	return false;
	    }else{
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_company_mgr"+i+"="+ lo_selected[i].company_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_02" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除成功',downOrreloadData);
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

    //得到选中行对象 code:请选择一行用户信息！
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来进行修改！','info');
    	return false;
    }else{
    	var audit_time=lo_selected[0].audit_time;
    	if( audit_time ){
    		$.messager.alert("提示信息","企业信息已通过验证,不允许修改","warning");
    		return;
    	}
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jCompanyEdit.jsp?id='+ls_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();
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
	    ls_id     = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jCompanyView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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
   var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_audit&in_buss_id=company" + ls_id+"&in_deal_type="+deal_type+"&in_message="+mems+"&date="+new Date();
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
	    ls_id     = lo_selected[0].company_id;
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
		var url = getUrl();
		return url+"&in_job_fair_name="+job_fair_name+
				        "&in_job_fair_time_1="+job_fair_time_1+
				        "&in_job_fair_time_2="+job_fair_time_2+
				        "&in_job_fair_type="+job_fair_type+
				        "&in_job_fair_level="+job_fair_level+
				        "&in_job_fair_feature="+job_fair_feature;
	}
/* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
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
    lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }else{
	    ls_read_person="";
	    ls_read_type = "ad";
	    ls_area_id = lo_selected[0].area_id;
	    ls_company_id =lo_selected[0].company_id;
   		dlg_title="发消息给分站";
		$("#in_send_type").val("zk");
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
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=zk_message_query&in_r=zk&in_action=send&in_sms_type=zk_area&in_user_code="+user_code+"&in_memo1="+area_id+"&in_memo2="+company_id+"&in_read_person="+read_person+"&in_read_type="+read_type+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	$("#dlg_check").dialog('close') ;
}
