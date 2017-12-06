/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	linkSelectCode('area_id','in_area_id',false,'','');
	linkSelectCode('member_type','in_member_type',false,'','');
	$('#searchAndreloadData').bind('click',function(){
		searchCompany();
		//searchAndreloadData();
	});
	$("input[name='in_audit']").bind("change",function(){
		searchCompany();
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
            text:'审核',  
            iconCls:'icon-search',  
            handler:function(){
							batCheck();
           	 			} 
        },"-",{  
            text:'会员套餐',  
            iconCls:'icon-search',  
            handler:function(){
				points();
        	}  
        },'-',{  
            text:'消息',  
            iconCls:'icon-copy',  
            handler:function(){
				sendMessage();
            }  
        },{  
            text:'短信',  
            iconCls:'icon-copy',  
            handler:function(){
				sendShotMessage();
            }  
        },/*{  
            text:'群发消息',  
            iconCls:'icon-copy',  
            handler:function(){
				sendMessage('bat');
            }  
        },*/ '-',{  
            text:'会员中心',  
            iconCls:'icon-copy',  
            handler:function(){
				schoolCenter();
            }  
        },{  
            text:'资源分配',  
            iconCls:'icon-copy',  
            handler:function(){
				//setAdvertisement();
				assignAdmin();
            }  
        },/*{  
            text:'名企推荐',  
            iconCls:'icon-copy',  
            handler:function(){
				setAdvertisement('company_ad_1');
            }  
        },{  
            text:'培训机构',  
            iconCls:'icon-copy',  
            handler:function(){
            	setAdvertisement('training_com');
            }  
        },*/'-',{  
            text:'联系指导师',  
            iconCls:'icon-copy',  
            handler:function(){
				showZhaoke();
            }  
        }],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50,
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			}
		}]],
		columns : [ [
		{
			field : 'user_id',
			title : '用户账号',
			width : 100
		},{
			field : 'member_type',
			title : '会员类型',
			width : 60
		},{
			field : 'points',
			title : '点数',
			width : 40,
			align : 'center',
			formatter : function(value,row,index){
				return '<a onclick="viewPointsLog('+row.company_id+',\''+row.company_name+'\')" href="javascript:;">'+value+'</a>';
			}
		},{
			field : 'sms_last',
			title : '短信',
			width : 50,
			align : 'center',
			formatter : function(value,row,index){
				return '<a title="累计发送短信/短信帐户余额">'+row.sms_used+' / '+row.sms_last+'</a>';
			}
		},{
			field : 'multiple',
			title : '场次',
			width : 50,
			align : 'center',
			formatter : function(value,row,index){
				return '<a onclick="viewJobfairLog('+row.user_code+',\''+row.company_name+'\')" href="javascript:;">'+
							row.multiple+' / '+row.netcongress+'</a>';
			}
		},{
			field : 'begin_date',
			title : '开始时间',
			width : 55
		},{
			field : 'end_date',
			title : '截止时间',
			width : 55
		},{
			field : 'company_name',
			title : '公司名称',
			formatter : function(value,row,index){
							var pic=row.company_pic=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_pic+'" target="_blank"><span class="red">[代]</span></a>';
							var img=row.company_img=='no'?'':'<a href="../jImage.jsp?file_id='+row.company_img+'" target="_blank"><span class="red">[执]</span></a>';
							var status="";
							var doc="";
							var email = "";
							if( row.email_verify =='success'){
								email ='<a class="green" title="'+row.user_email+'">[邮]</a>';
							}
							if(row.status=='1'){
								status='<span class="green">[审]</span>';
							}else if(row.status=='2'){
								status='<span class="red">[退]</span>';
							}else if(row.status=='3'){
								status='<span style="color:#c90;">[逾]</span>';
							}
							if( row.doc && row.doc!=""){
								doc= '<a href="'+cur_path+'/upload/download.jsp?path='+row.doc+'&name='+row.company_name+'" target="_blank" style="color:#669900;">[简]</a>';
							}
							return email+doc+pic+img+status+'<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'
										+value+'</a>';
			},
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			},
			width : 250
		},{
			field : 'area_name',
			title : '地区',
			width : 30
		},{
			field : 'add_time',
			title : '注册时间',
			width : 100
		},{
			field : 'login_date',
			title : '最后登录',
			width : 100
		},{
		    field : 'resumes',
		    title :'简历/待处理',
		    formatter : function(value,row,index){
		   		return row.resumes+'&nbsp;/&nbsp;<span style="color:red;">'+row.last_resumes+'</span>';
		    },
			width : 70,
			align : 'center'
		},{
			field : 'admin_name',
			title : '管理员',
			width : 35
		},{
			   field : 'zk_name',
			   title :'指导师',
			   formatter : function(value,row,index){
			   		if(value!='' && value!=null){
			   			return '<a href="javascript:;" onclick="showZhaoke('+index+')">'+value+'</a>';
			   		}else{
			   			return '';
			   		}
			   },
				width : 35
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
		/*
			var cssStr="";
			if (row.zk_id!=null && row.zk_id !=''){
					cssStr+='background-color:#67FFAE;'; // return inline style
			}
			return cssStr;
		*/
		}
	});
}
function viewJobfairLog( user_code ,company_name )
{
    $('#if_deal')[0].src='./jJobfairSetLog.jsp?id=' + user_code+"&date="+new Date();
    $('#dlg_deal').dialog({width:600,height:360,fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle',company_name+'-招聘会套餐使用记录'); 
}
function viewPointsLog( company_id ,company_name )
{
    $('#if_deal')[0].src='./jPointsSearch.jsp?id=' + company_id+"&date="+new Date();
    $('#dlg_deal').dialog({width:600,height:360,fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle',company_name+'-点数消费记录'); 
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
}
function assignAdmin()
{
		var li_currentnum =0; //当前行
		var li_pagesize   =0; //每页行数
		var li_pagenum    =0; //页码

		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择用户！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择企业！','info');
	    	return false;
	    }else{
		    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	        lo_pg         = $("#resultId").datagrid("getPager");
	        li_pagenum    = lo_pg.pagination('options').pageNumber;
   	 		li_pagesize = lo_pg.pagination("options").pageSize;
   	 		
   	 		var input="";
   	 		$("#company_list").html("");
   	 		for(var i=0;i< lo_selected.length;i++){
  					ls_id += "&in_login_mgr"+i+"="+ lo_selected[i].user_code;
 						input='<li><input type="hidden" name="in_company_'+lo_selected[i].company_id+'" value="'+lo_selected[i].company_id+'"/>'+lo_selected[i].company_name+'</li>';
 						$("#company_list").append( input );
 			}
   	 	}

     $("#dlg_change_admin").show().dialog({  title:'资源分配',
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
   var 	ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_user_company_query&r=ad&in_action=chown&in_URLEncoding=UTF-8&date="+new Date();
	
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
	$("#if_deal")[0].src = "../company/jCompanyAdd.jsp?pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
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
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=login_02&in_r=ad" + ls_id+"&date="+new Date();
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
	//var cur_page_size = $('#resultId').datagrid('options').pageSize;
	
    var lo_pg         = $("#resultId").datagrid("getPager");
    var li_pagenum = lo_pg.pagination('options').pageNumber;
    var li_pagesize  = lo_pg.pagination('options').pageSize;
	searchData("#resultId", getUrl, getData, li_pagenum, li_pagesize, ini_currentnum );
	/*
	$('#resultId').datagrid( {
		pageNumber : 1,
		pageSize : ini_pagesize
	    });
	ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum);
	*/ 
}
function setAdvertisement( ad_type ){
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
	    ls_id     = lo_selected[0].company_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;
        
        company_name = lo_selected[0].company_name;

    	var strTitle="";
    	if("company_ad_1"==ad_type ){
    		strTitle='名企推广-'+company_name;
    	}else if("training_com"==ad_type){
    		strTitle='培训机构-'+company_name;
    	}else{
    		alert("参数错误");
    	}
        $('#if_deal')[0].src='./jCompanyAdvertisement.jsp?id='+ls_id+'&ad_type='+ad_type+'&title='+company_name+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		 $('#dlg_deal').dialog({width:500,height:282,fit:false});
		$('#dlg_deal').dialog('open').dialog('setTitle',strTitle ); 
    }
	
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
		$('#dlg_deal').dialog({width:400,height:272,fit:false});
		$('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}


function showZhaoke( index ) {
	if( index != undefined ){
		$("#resultId").datagrid("selectRow",index);
	}
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
		if (lo_selected[0].zk_id==null || lo_selected[0].zk_id ==''){
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

/* =======================================================*/
// 函数作用：关闭弹出窗口
// 输入参数及数据类型：
//            ini_pagesize            当前每页行数
//            ini_pagenum             当前页码
//            ini_currentnum          当前行
/* ===================================================== */
function closepage(ini_pagesize,ini_pagenum,ini_currentnum) { 
	$('#dlg_deal').dialog('close') ;
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	// ajaxData("#resultId", getSearchUrl, getData, ini_pagenum, cur_page_size, ini_currentnum);
	searchData("#resultId", getUrl, getData, ini_pagenum, cur_page_size, ini_currentnum );
}
function closePageCancel()
{
	$('#dlg_deal').dialog('close') ;
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
		var in_email=$('#in_email').val();
		var in_company_name=$('#in_company_name').val() ;
		var in_member_type=$('input[name=in_member_type]').val();
		var in_area_id=$('input[name=in_area_id]').val();
		
		var in_add_time_1=$('#in_add_time_1').datebox('getValue');
		var in_add_time_2=$('#in_add_time_2').datebox('getValue');
		
		var in_end_date_1=$('#in_end_date_1').datebox('getValue');
		var in_end_date_2=$('#in_end_date_2').datebox('getValue');
		
		var in_order='';// = $("#in_order").combobox("getValue");

		var in_audit=$('input[name=in_audit]:checked').val();
			 if(in_audit==undefined)in_audit="";
		var url = getUrl();
		return url+"&in_user_id="+in_user_id+
						"&in_area_id="+in_area_id+
				        "&in_email="+in_email+
				        "&in_company_name="+in_company_name+
				        "&in_member_type="+in_member_type+
				        "&in_add_time_1="+in_add_time_1+
				        "&in_add_time_2="+in_add_time_2+
				        "&in_end_date_1="+in_end_date_1+
				        "&in_end_date_2="+in_end_date_2+
				        "&in_order="+in_order+
				        "&in_audit="+in_audit;
	}
function points() {
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
	
	var lo_selected;      //当前选中行
    var lo_pg;            //分页对象
	var ls_id="";	  //
	var ls_zk_id="";
	
	var company_name="";

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
        company_name = lo_selected[0].company_name;
        $('#if_deal')[0].src='./jPoints.jsp?zk_id='+ls_zk_id+'&id='+ls_id+'&user_type=company&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
         $('#dlg_deal').dialog({width:500,height:400,fit:false});
	    $('#dlg_deal').dialog('open').dialog('setTitle','套餐充值-'+company_name ); 
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
	    lo_selected   = getCheckObj('resultId','请选择用户！'); 
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
	ajaxDealUrl(ls_url,'操作成功',function(){} );
	$("#dlg_check").dialog('close') ;
}
/* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendShotMessage(){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";

	lo_selected   = getCheckObj('resultId','请选择用户！'); 
	if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择用户！','info');
	    	return false;
	}else{
			sendShotMessageTo( lo_selected[0].contact_tel )
     }
 }
 /* ====================================*/
// 函数作用：（批量发送消息）
/*====================================*/
function sendShotMessageTo( contact_tel ){
   			var dlg_title="发送短信";
   	if(contact_tel != undefined ){
			$("#in_sms_to").val( contact_tel );
			$("input[name='in_sms_to']").val( contact_tel );
			$("#in_sms_to").validatebox("validate");
	}
     $("#dlg_check2").show().dialog({  title:dlg_title,
	    												   width: 300,
	    												   height: 200,
	    												   fit:false,
	    												   modal:true,
	    												   buttons: [{
												                    text:'发送',
												                    iconCls:'icon-ok',
												                    handler:function(){
	var ls_url = cur_path + "/esbServer.do?in_r=ad&method=execProc&methodId=short_message&in_action=add&date=" + new Date();
	// saveData(ls_url, function(){$("#dlg_check2").dialog('close') ;}, "\u6570\u636e\u6dfb\u52a0\u6210\u529f\uff01");
	$('#fm_msg').form('submit', {
        url: ls_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	 var res = re[0].queryresult;
            	 if( res[0].ok=='ok'){
	                 $.messager.alert('提示信息','短信已发送！','info',function(){//提示信息
	                 	$("#dlg_check2").dialog('close') ;
	            	});
	            }else if( res[0].msg ){
	                 $.messager.alert('提示信息', res[0].msg ,'error');
	            }else {
	                 $.messager.alert('提示信息','未知错误！','error');

	            }
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });                    
												                    
												                    }
												                },{
												                    text:'取消',
												                    handler:function(){
												                        $("#dlg_check2").dialog('close') ;
												                    }
												                }]
	    												   });
	  $("#dlg_check2").dialog("open");
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
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData );
	$("#dlg_check").dialog('close') ;
}
function schoolCenter(){
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
		window.open(cur_path+"/daqin_manager/memberLogin.do?user_type=company&user_code="+ls_id);
    }
}
function searchCompany(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;

	searchData("#resultId", getUrl, getData,1,cur_page_size);
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