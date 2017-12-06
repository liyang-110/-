/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function(){
	linkSelectCode('area_id','in_area_id',false,'','');
	linkSelectCode('jobfair_type','in_job_fair_type',false,'','');
	linkSelectCode('job_fair_level','in_job_fair_level',false,'','');
	linkSelectCode('job_fair_feature','in_job_fair_feature',false,'','');
	$('#searchAndreloadData').bind('click',function(){
		searchJobfair();
		//searchAndreloadData();
	});
	$("input[name='in_audited']").bind("change",function(){
		searchJobfair();
	});
	$('#exportSearchData').bind('click',function(){
		exportSearchData();
	});
	getData();
	ajaxdata1();
});
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '搜索招聘会',
		toolbar:[{  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
						$.messager.alert("提示信息","请进入学校或企业会员中心发布招聘会！谢谢！","info");
						//	add();
						
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
            iconCls: 'icon-view',
            handler:function(){
				setShow( 'audit' );
         	}  
        },{  
            text:'取消屏蔽',  
            iconCls: 'icon-add',
            handler:function(){
				setShow( 'show' );
         	}  
        },{  
            text:'屏蔽',  
            iconCls: 'icon-remove',
            handler:function(){
				setShow( 'hide' );
         	}  
        },{
        	text:'参会企业列表',
        	iconCls :'icon-save',
        	handler:function(){
        		listCom();
        	}
        },{  
            text:'添加备注',  
            iconCls:'icon-add',
            handler:function(){
					 remark();
            }  
        },{  
            text:'前台显示',  
            iconCls:'icon-copy',  
            handler:function(){
			 				frontShow(true);
            		}  
        },{  
            text:'前台隐藏',  
            iconCls:'icon-copy',  
            handler:function(){
			 				frontShow(false);
            		}  
        },{  
            text:'会员中心',  
            iconCls:'icon-copy',  
            handler:function(){
				schoolCenter();
            }  
        },{  
            text:'短信通知',  
            iconCls:'icon-copy',  
            handler:function(){
				smsNotice();
            }
        }/*,{
        	text:'推荐招聘会',
        	iconCls :'icon-save',
        	handler:function(){
        		recommendJobfair();
        	}
        }*/
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		
		columns : [ [ {
			field : 'job_fair_time',
			title : '招聘会时间',
			width:80
		},{
			field : 'job_fair_endtime',
			title : '预定截止时间',
			width:80
		},{
			field : 'area_name',
			title : '地区',
			width:30
		}, {
			field : 'job_fair_name',
			title : '招聘会名称',
			formatter : function(value,row,index){
				var job_fair='';
				var front_sign="";
				var audit='';
				var remark='';
				if(row.preview==1){
					job_fair= '<a title="'+value+'" href="'+cur_path+'/jobfairInfo.do?preview=true&id='+row.job_fair_id+'" target="_blank">'+value+'</a>';
				}else{
					if(row.front_sign>0){
						front_sign='<span style="color:red;">[藏]</span>';
					}
					job_fair= '<a title="'+value+'" href="'+cur_path+'/jobfairInfo.do?id='+row.job_fair_id+'" target="_blank">'+value+'</a>';
				}
				if( row.remark ){
					remark='<a onclick="remark('+index+');" style="color:red;padding-left:15px;" href="javascript:;" title="'+row.remark+'\n'+row.operadmin+'">[ '+row.remark+' / '+row.operadmin+']</a>';
				}
				if( row.audit_date == undefined ){
					audit='<span style="color:red;">[待审核]<span>';
				}
				return audit+front_sign+job_fair+remark;
			},
			width:320,
			styler : function(value,row,index){
				if( row.com_apply && row.com_apply=='1'){
					return "background:#7DD6FB;";
				}
			}
		},{
			field : 'job_fair_type',
			title : '招聘会类型',
			width:60
		},{
			field : 'job_fair_sponsor',
			title : '招聘会主办方',
			width:100
		},/*{
			field : 'job_fair_level',
			title : '学历',
			width:100
		},{
			field : 'job_fair_feature',
			title : '特色',
			width:50
		},*/{
			field : 'job_fair_company_num',
			title : '展位（预订）',
			formatter : function(value,row,index){
				return value+'<span>（'+row.company_num+'）</span>';
			},
			align:"center",
			width:60
		},/*{
			field : 'click_stat',
			title : '点击',
			width:50,
			align:'center'
		},*/{
			field :'add_time',
			title :'发布日期'
		}
		] ], 

		type : 'GET',
		nowrap : true,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 50,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : true,
		iconCls : 'icon-ok',
		rownumbers : true,
		nowrap : true,
		striped : true,
		border : false,
		fitColumns:true,
		rowStyler: function(index,row){
			var cssStr="";
			if (row.flag==1){
					cssStr+='color:#FFAA25;';
			}
			if (row.company_num>=row.job_fair_company_num ){
				cssStr+='background-color:#ECEFF5;'; // return inline style
				// the function can return predefined css class and inline style
				// return {class:'r1', style:{'color:#fff'}};	
			}else if(row.is_end=='true'){
				cssStr+='background-color:#FBFAD4;'; // return inline style
			}
			return cssStr;
		},
		onDblClickRow : function(index ,row ){
			var school_id = row.school_id;
			var school_name = row.school_name;
			var content ='';
			if( school_id && school_name ){
				content = '<p>举办高校:</p><p><a href="/school/info.do?id='+school_id+'" target="_blank">'+school_name+'</a></p>';
			}
			content = '<div style="height:280px;width:405px;overflow:scroll;">'+content+'</div>';
			// $.messager.alert(row.company_name,content );
			$("#dd").dialog({
			    title:row.job_fair_name,   
			    width: 420,   
			    height: 320,   
			    closed: false,   
			    cache: false,   
			    modal: false,
			    content :content 
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
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_job_fair_query&in_URLEncoding=UTF-8&in_r=ad";
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
		/*
		$('#resultId').datagrid( {
			pageNumber : 1,
			pageSize : ini_pagesize
		});
		*/
	    var lo_pg         = $("#resultId").datagrid("getPager");
	    var li_pagenum = lo_pg.pagination('options').pageNumber;
	    var li_pagesize  = lo_pg.pagination('options').pageSize;

		ajaxData('#resultId',getSearchUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
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
function closeDialog(){
	$('#dlg_deal').dialog('close');
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
		ajaxData('#resultId',getSearchUrl,getData,1,cur_page_size,undefined); 
	}
	function getSearchUrl()
	{
		return getUrl()+getSearchString();
	}
	function getSearchString()
	{
		var job_fair_name= $('#in_job_fair_name').val() ;
		var job_fair_sponsor =  $('#in_job_fair_sponsor').val() ;
		var school_name =  $('#in_school_name').val() ;
		var job_fair_time_1=$('#in_job_fair_time_1').datebox('getValue');
		var job_fair_time_2=$('#in_job_fair_time_2').datebox('getValue');
		var job_fair_type=$('input[name=in_job_fair_type]').val();
		var job_fair_level=$('input[name=in_job_fair_level]').val();
		var job_fair_feature=$('input[name=in_job_fair_feature]').val();
		var preview=$('input[name=in_preview]:checked').val();
			 if(preview==undefined)preview="";
		var flag=$('input[name=in_flag]:checked').val();
			if(flag==undefined)flag="";
		var area_id=$('input[name=in_area_id]').val();
		return 		"&in_job_fair_name="+job_fair_name+
					"&in_job_fair_sponsor="+job_fair_sponsor+
					"&in_school_name="+school_name+
				    "&in_job_fair_time_1="+job_fair_time_1+
				    "&in_job_fair_time_2="+job_fair_time_2+
				    "&in_job_fair_type="+job_fair_type+
				    "&in_job_fair_level="+job_fair_level+
				    "&in_job_fair_feature="+job_fair_feature+
				    "&in_preview="+preview+
				    "&in_flag="+flag+
				    "&in_area_id="+area_id;
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
      
        var school_id = lo_selected[0].school_id;

        if('网络招聘会'== lo_selected[0].job_fair_type){
            $('#if_deal')[0].src='./jJobFairUpdate.jsp?id='+ls_id+'&school_id='+school_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
        }else{
            $('#if_deal')[0].src='./jJobFairEdit.jsp?id='+ls_id+'&school_id='+school_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
        }
        $('#dlg_deal').dialog('open').dialog('setTitle','编辑'); 
    }
}
/* =======================================================*/
// 函数作用：删除（批量删除）
/* ===================================================== */
   function del() {
		var lo_selected;      //当前选中行
	    var ls_id = "";        //用户id
	    var ls_url;           //url
	    var ls_sign="";
	    lo_selected   = getCheckObj('resultId','请选择要删除的招聘会！'); 
	    if(!lo_selected[0]){
	    	$.messager.alert('提示信息','请选择要删除的招聘会！','info');
	    	return false;
	    }else{
	    	var preview = lo_selected[0].preview;
	    	if(preview == 1){
		    	$.messager.alert('提示信息','不能删除学校待审核招聘会！','info');
		    	return false;
	    	}
	    	 $.messager.confirm('提示信息', '您确定要进行删除操作吗?', function(r){
	    	 	if (r){
	    	 		for(var i=0;i< lo_selected.length;i++){
    					ls_id += "&in_job_fair_mgr"+i+"="+ lo_selected[i].job_fair_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_job_fair_del&in_r=ad" + ls_id+"&date="+new Date();
				    ajaxDealUrl(ls_url,'删除文件成功',downOrreloadData);
	    	 	}
	    	 });
     }
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
	    	 			if(lo_selected[i].flag ==1 || lo_selected[i].preview==1 ){
							$.messager.alert('提示信息','操作失败！','info');
							return false;
						}
   					ls_id += "&in_job_fair_mgr"+i+"="+ lo_selected[i].job_fair_id;
  			 } // for
  			ls_url = cur_path + "/esbServer.do?method=execProc&methodId=ad_job_fair_query&r=ad&in_action=front&in_flag="+flag+ls_id+"&date="+new Date();
			ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
	    } 
}
 function recommendJobfair()
 {
		var job_fair_id=""; 
		var flag="";
		var lo_selected   = getCheckObj('resultId','请选择一行信息！'); 
		if(lo_selected.length!=1){
	    	$.messager.alert('提示信息','请选择一场招聘会！','info');
	    	return;
	    }else{
	    	$.messager.alert('提示信息','正在开发...！','info');
	    }
 }
 function setShow( status ){
	var school_id="";
	var job_fair_id=""; 
	var flag="";
	var ls_url='';
	
	var lo_selected   = getCheckObj('resultId','请选择一行信息！'); 
	if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一场招聘会！','info');
    	return false;
    }
    	school_id =  lo_selected[0].school_id;
    	job_fair_id =  lo_selected[0].job_fair_id;
    	if( status=='show'){
    		if( lo_selected[0].flag!=1 ){
    			$.messager.alert("提示信息","招聘会状态已经为显示状态！","info");
    			return;
    		}
    		flag=0;
    	}else if( status=='hide'){
    		if(lo_selected[0].flag==1){
    			$.messager.alert("提示信息","招聘会状态已经屏蔽！","info");
    			return;
    		}
    		flag=1;
    	}else if( status =='audit' ){
    		if(lo_selected[0].audit_date ){
    			$.messager.alert("提示信息","招聘会已审核","info");
    			return;
    		}
    		flag=3;
    	}else{
    		$.messager.alert("提示信息","参数错误!","info");
    		return;
    	}
    	if( flag == 3 ){
    			$.messager.confirm("招聘会审核","确定通过审核本招聘会吗?",function(r){
    				if( r ){
    	  				ls_url = "/esbServer.do?method=execProc&methodId=ad_job_fair_edit&in_r=ad&in_action=setflag&in_flag="+flag+"&in_id=" + job_fair_id+"&date="+new Date();
    	  				updateRowStatus(ls_url,'操作成功', lo_selected[0] );
    				}
    			});
    			return;
    	}
    	//flag=lo_selected[0].flag==1?0:1;
    	 //$.messager.confirm('提示信息', '您确定修改所选招聘会状态?', function(r){
    	 //	if (r){
  				ls_url = "/esbServer.do?method=execProc&methodId=ad_job_fair_edit&in_r=ad&in_action=setflag&in_flag="+flag+"&in_id=" + job_fair_id+"&date="+new Date();
			    updateRowStatus(ls_url,'操作成功', lo_selected[0] );
    	// 	}
    	 //});
}
function updateRowStatus(ins_url,ins_msg,row ) {
	var lo_pg 		= $("#resultId").datagrid("getPager");
	var li_pagenum= lo_pg.pagination("options").pageNumber;
	var li_pagesize = lo_pg.pagination("options").pageSize;
	var li_currentnum = $("#resultId").datagrid("getRowIndex", row );
	$.ajax({
        url: ins_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	if(ins_msg!="" && ins_msg!=null){
//            		$.messager.show({
//	                    title:'\u63d0\u793a\u4fe1\u606f',//提示信息
//	                    msg: ins_msg,
//	                    timeout:5000,
//	                    height:150
//                	});
                    $.messager.alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){
						ajaxData("#resultId", getUrl, getData, li_pagenum, li_pagesize, li_currentnum);
                    });

            	}
            } else if (re.length > 0 && re[0].returncode == 'fail') {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
                return false;
            }
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function exportSearchData(){
	var url=cur_path + '/esbServer.do?method=execProc&methodId=ad_job_fair_xls&in_r=ad'+getSearchString();
	window.open( url );
}
function listCom(){
	var school_id="";
	var job_fair_id="";
	var job_fair_name="";
	var lo_selected   = getCheckObj('resultId','请选择一行信息！'); 
	if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一场招聘会！','info');
    	return false;
    }else{
    	if(lo_selected[0].company_num && lo_selected[0].company_num>0 ){
	    	school_id =  lo_selected[0].school_id;
	    	job_fair_id =  lo_selected[0].job_fair_id;
	    	job_fair_name = lo_selected[0].job_fair_name ;
	    	$("#if_deal")[0].src = "jCompanySearch.jsp?school_id="+school_id+"&id=" + job_fair_id;
			$("#dlg_deal").dialog("open").dialog("setTitle", job_fair_name+" - 参会企业列表");
		}else{
			$.messager.alert('提示信息','该招聘会没有参会企业，请选择其他招聘会！','info');
		}
    }
}
function remark( index )
{
	if( index != undefined && index>=0){
		$("#resultId").datagrid("checkRow", index );
	}
	var lo_selected = getCheckObj("resultId","请选择一行记录");
	if( !lo_selected ){
		return;
	}
	var job_fair_id=lo_selected[0].job_fair_id;
	var job_fair_name=lo_selected[0].job_fair_name;
	var remark = lo_selected[0].remark;
	$("#mem").val(remark);
	var dlg_title=job_fair_name;
	$("#dlg_check").show().dialog({  title:dlg_title,
	    											width: 350,
	    											height: 180,
	    											fit:false,
	    											buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendData(job_fair_id, remark);
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
function sendData(job_fair_id,remark)
{
	var mems=$("#mem").val();
	if(!mems ){
		$.messager.alert("提示信息","请填写内容！","info");
		return;
	}
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=ad_job_fair_query&in_action=remark&in_r=ad&in_job_fair_id="+job_fair_id+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',downOrreloadData);
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
		window.open(cur_path+"/daqin_manager/memberLogin.do?user_type=school&user_code="+ls_id);
    }
}
function smsNotice()
{
    var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行！','info');
    	return false;
    }
    var job_fair_id = lo_selected[0].job_fair_id;
	$("#sms_deal")[0].src="jSmsNotice.jsp?id="+job_fair_id;
	$("#ddSmsNotice").dialog({
		title : "短信通知",
		width : 360,
		height: 260,
	});
}
function closeSmsNotice()
{
	$("#ddSmsNotice").dialog("close");
}
function searchJobfair(){
	var cur_page_size = $('#resultId').datagrid('options').pageSize;
	searchForm("#resultId", getUrl, getData,1,cur_page_size);
}