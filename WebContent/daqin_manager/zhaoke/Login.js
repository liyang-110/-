/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	    linkSelectCode('area_station','in_area_id',false,'','',1);
		getData();
		ajaxdata1();
		
		$("#searchAndreloadData").click(function(){
			search();
		});
});
function search()
{
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	searchForm("#resultId", getUrl, getData,1,cur_page_size);
}
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
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
            	//$.messager.alert("提示信息","暂时不允许删除招客用户！","info");
				del();
            }  
        }/*,{  
            text:'提现',  
            iconCls:'icon-search',  
            handler:function(){
			zhaokePay();
            } 
        }*/,{  
            text:'指导师用户中心',  
            iconCls:'icon-search',  
            handler:function(){
			zhaokeCenter();
             
            }  
        },{  
            text:'分配招聘顾问',  
            iconCls:'icon-copy',  
            handler:function(){
            	assignAdviser();
             
            }  
        }],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]], 
		columns : [ [/*{
			field : 'zk_type',
			title : '招客类型'
		},*/{
			field : 'user_id',
			title : '用户账号',
			width : 50
		},{
			field : 'user_name',
			title : '姓名',
			width : 50
		},{
			field : 'admin_name',
			title : '招聘顾问',
			width : 50
		},{
			field : 'company_num',
			title : '企业数',
			align:'right',
			width : 30,
			align:'center',
			sortable : true 
		},{
			field : 'student_num',
			title : '学生数',
			align:'right',
			width : 30,
			align:'center',
			sortable : true 
		}/*,{
			field : 'bill_amount',
			title : '成交笔数',
			align:'right'
		},{
			field : 'total_points',
			title : '成交量',
			align:'right'
		},{
			field : 'accept_points',
			title : '返点合计',
			align:'right'
		},{
			field : 'paid_amount',
			title : '实付金额',
			align:'center'
		},{
			field : 'shift_points',
			title : '账户点数',
			align:'right',
			align:'center',
			styler : function(value,row,index){
					if(value>0 && value<1000 ){
						return 'background-color:#EAFDBE;';
					}else if(value>=1000){
						return 'background-color:#67FFAE;';
					}
			}
		}*/,{
			field : 'user_tel',
			title : '联系电话',
			align:'center',
			width : 80
		},{
			field : 'login_time',
			title : '最近登录' ,
			align:'center',
			width : 100,
			
		},{
			field : 'login_count',
			title : '登录次数' ,
			align:'center',
			width : 60,
			
		},{
			field : 'add_person_name',
			title : '创建人',
			width : 50
		},{
			field : 'add_time',
			title : '创建日期' ,
			width : 50
		},{
			field : 'area_name',
			title : '分站',
			width : 50
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
		border:false,
		fitColumns:true,
		remoteSort: true 
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
		ls_url = cur_path + "/esbServer.do?method=execProc&r=ad&methodId=zk_user_query&in_URLEncoding=UTF-8";
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
	$("#if_deal")[0].src = "./jLoginAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
	$('#dlg_deal').dialog({width:390,height:180,fit:true});
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
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_user_query&in_action=del_zk&in_r=ad" + ls_id+"&date="+new Date();
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
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	    ls_id     = lo_selected[0].user_code;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='./jLoginEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
	    $('#dlg_deal').dialog({width:390,height:180,fit:true});
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

function zhaokeCenter(){
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
	    ls_id     = lo_selected[0].user_code;
		window.open(cur_path+"/daqin_manager/memberLogin.do?user_type=zhaoke&user_code="+ls_id);
    }
}
function zhaokePay() {
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

        $('#if_deal')[0].src='./jZhaokePay.jsp?id='+ls_id+'&pagesize=' + li_pagesize+'&pagenum=' + li_pagenum+'&currentnum=' +li_currentnum +"&date="+new Date();
	     $('#dlg_deal').dialog({width:360,height:280,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','查看'); 
    }
}
//**************分配招聘顾问

function assignAdviser()
{
		var li_currentnum =0; //当前行
		var li_pagesize   =0; //每页行数
		var li_pagenum    =0; //页码
		var lo_pg;

		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要分配的指导师！'); 
	    
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择指导师！','info');
	    	return false;
	    }else{
		    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	        lo_pg         = $("#resultId").datagrid("getPager");
	        li_pagenum    = lo_pg.pagination('options').pageNumber;
   	 		li_pagesize = lo_pg.pagination("options").pageSize;
   	 		//所选指导师列表
   	 		var input="";
   	 		$("#zk_list").html("");
   	 		for(var i=0;i< lo_selected.length;i++){
  					ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
 						input='<li><input type="hidden" name="in_zk_'+lo_selected[i].user_code+'" value="'+lo_selected[i].user_code+'"/>'+lo_selected[i].user_name+'</li>';
 						$("#zk_list").append( input );
 			}
   	 	}
	    
  //分配招聘顾问窗口
     $("#dlg_change_admin").show().dialog({  title:'分配招聘顾问',
	    												   width: 390,
	    												   height: 260,
	    												   fit:false,
	    												   buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       submit_admin_change(function(){
												                        $("#dlg_change_admin").dialog('close');
												                        closepage(li_pagesize,li_pagenum,li_currentnum);
												                    });
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_change_admin").dialog('close') ;
												                    }
												                }]
	    												   });
}
function submit_admin_change(ins_upFun)
{
   var 	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=zk_user_query&r=ad&in_action=chown&in_URLEncoding=UTF-8&date="+new Date();
	
   $('#fm2').form('submit', {
        url: ls_url,
        onSubmit: function() {
            return true;
        },
        success: function(data) {
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	}else if(queryresult[0].ok=='ok' && queryresult[0].msg){
	                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'info',function(){//提示信息
	                 	if(typeof(ins_upFun) !='undefined'){
	                 		ins_upFun();
	                 	}
	            	});
            	}else{
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f','未知错误！','error');

            	}
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
}