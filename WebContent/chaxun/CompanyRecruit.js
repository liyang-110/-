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
		title :false,// '招聘职位管理',
		toolbar:[/* {  
            text:'添加',  
            iconCls:'icon-add',
            handler:function(){
					add();
//            		if(member_expire){
//						$.messager.alert('提示信息','会员到期，无法进行此操作！','error');
//						return;
//					}else{
//						add();
//					}
            }  
        },{  
            text:'修改',  
            iconCls:'icon-edit',  
            handler:function(){
					edit();
//            		if(member_expire){
//						$.messager.alert('提示信息','会员到期，无法进行此操作！','error');
//						return;
//					}else{
//						edit();
//					}
            }  
        },{  
            text:'删除',  
            iconCls:'icon-cancel1',  
            handler:function(){
					del();
//            		if(member_expire){
//						$.messager.alert('提示信息','会员到期，无法进行此操作！','error');
//						return;
//					}else{
//						del();
//					}
            } 
        },'-',{  
            text:'显示',  
            iconCls: 'icon-tip',
            handler:function(){
				setShow( 'show' );
         	}  
        },{
            text:'屏蔽',  
            iconCls: 'icon-remove',
            handler:function(){
				setShow( 'hide' );
         	}  
        }*//*,'-',{  
            text:'申请紧急招聘',  
            iconCls:'icon-8',  
            handler:function(){
					recruitHurry();
            }  
        }*/
        ],
        frozenColumns : [ [
			{
			field : 'ck',
			checkbox:true,
			width : 50
			
		}]],
		columns : [ [
		{
			field : 'job_type',
			title : '招聘类别',
			width: 130
		},{
			field : 'job_name',
			title : '职位名称',
			formatter: function(value,row,index)
			{
				var is_hurry="";
				if( row.is_hurry==1 ){
					is_hurry='<span style="color:red;">[急聘]</span>';
				}
				return is_hurry+'<a class="recruit" href="/company/jobDetail.do?id='+row.job_id+'" target="_blank">'+value+'</a>';
			},
			width: 350
		},{
			field :'areas',
			title :'工作地区',
			width: 150
		},{
			field :'positions',
			title :'岗位类别',
			width: 200
		},{
			field : 'education',
			title : '学历要求',
			width: 120
		},{
			field : 'money',
			title : '薪资待遇',
			width: 150,
			formatter: function(value,row,index){
				if( value=='' || value == null ){
					return '面议';
				}else{
					return value;
				}
			}
		},{
			field : 'add_time',
			title : '发布时间',
		   formatter :function(value,row,index){
				if(1==row.flag )
				{
					return value;
				}else{
			   		return value; // +'<a href="javascript:;" onclick="refreshJob(\''+row.job_id+'\','+index+');">[刷新]</a>';
				}
		   },
			width: 220
		},{
			field : 'flag',
			title : '状态',
			formatter :function(value,row,index){
				if(1==value)
				{
					return '屏蔽';
				}else{
					return '显示';
				}
			},
			width:40
		}
		] ],
		type : 'POST',
		nowrap : true,
		striped : false,
		fit : true,
		width : 500,
		height : 'auto',
		url : '',
		pageSize : 30,
		remoteSort : false,
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		collapsible : false,
		rownumbers : true,
		nowrap : true,
		striped : true,
		fitColumns :true,
		rowStyler: function(index,row){
			var cssStr="";
			if (row.flag==1){
					cssStr+='color:#777;';
			}
			return cssStr;
		}
	});
}
$(function(){
	var end_date_input = $("input[name='end_date']");
	end_date_input.bind("change",function(){
		calculateHurryPoints();
		//alert("a");
	}).bind("propertychange", function(){
		calculateHurryPoints();
		//alert("b");
	});
});
function errorMsgAlert( error_code )
{
	var msg="";
	switch( error_code ){
		case "noLogin": msg="请重新登录！";break;
		case "begin_gt_end": msg="截止日期必须大于等于开始日期！";break;
		case "new_date": msg="开始日期已更新，请重新确认提交申请！";break;
		case "nomoney": msg="账户点数余额不足！";break;
		default : msg="未知错误！";
	}
	$.messager.alert( "错误信息",msg,"error" );
}
function calculateHurryPoints()
{
	try{
		var start_date = new Date( $("input[name='begin_date']").val() );
		var end_date = new Date( $("input[name='end_date']").val() );
		var price = $("input[name='hurry_price']").val();
		var days = ( end_date.getTime()-start_date.getTime() )/86400000+1;
		if(days &&  days>0 ){
			$("#hurry_btnEp").linkbutton({"disabled":false});
			$("#hurry_need_points").text( price * days );
			return true;
		}else{
			$("#hurry_need_points").text( 0 );
			$("#hurry_btnEp").linkbutton({"disabled":true});
			errorMsgAlert("begin_gt_end");
			return false;
		}
	}catch(e ){
		errorMsgAlert("error" );
		return false;
	}
}
function closeHurryWindow( reload )
{
	if( reload ){
		var  lo_selected= getCheckObj('resultId','请选择一行信息！');
		if( lo_selected ){
		    var  li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
			var lo_pg = $("#resultId").datagrid("getPager");
			var li_pagenum = lo_pg.pagination("options").pageNumber;
			var li_pagesize = lo_pg.pagination("options").pageSize;
			closepage(li_pagesize,li_pagenum,li_currentnum);
		}
	}
	$("#recruitHurry").window("close");
}
function submitHurryApply()
{
	$("#apply_hurry_form").form('submit', {   
	    url: cur_path+'/company/hurryRecruit.do',   
	    onSubmit: function(){   
	    	$("#hurry_btnEp").linkbutton({"disabled":true});
	    	return true;
	    },   
	    success:function(data){
	        if("succ"==data){
	        	$.messager.alert("提示信息","申请成功！","info",function(){
	        		closeHurryWindow("reload");
	        	});
	        	return;
	        }else if( data && data.indexOf("invalid_begin_date")==0 ){
	        	// alert(data);
	        	var dataArr = data.split("@");
	        	if( dataArr[1] ){
	        		$("#hurry_begin_input").val( dataArr[1]  );
	        		$("#hurry_begin").datebox({disabled:false}).datebox("setValue",dataArr[1]).datebox({disabled:true});
	        		calculateHurryPoints();
	        		errorMsgAlert( "new_date" );
	        	}
	        }else{
	        	errorMsgAlert( data );
	        }
	        $("#hurry_btnEp").linkbutton({"disabled":false});
	    }   
	});  
}
function recruitHurry()
{
	var li_currentnum = 0; //当前行
	var li_pagesize = 0; //每页行数
	var li_pagenum = 0; //页码
	var lo_selected;          //当前选中行
	var lo_pg;                //分页对象
	var position;
	lo_selected   = getCheckObj('resultId','请选择一行信息！');
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行来查看！','info');
    	return false;
    }else{
		if( lo_selected[0].is_hurry ){
			$.messager.alert("提示信息","紧急招聘尚未过期，不能重复申请！","error");
			return;
		}
    	
	    li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
		lo_pg = $("#resultId").datagrid("getPager");
		li_pagenum = lo_pg.pagination("options").pageNumber;
		li_pagesize = lo_pg.pagination("options").pageSize;
		$("#recruitHurry .job_id").val( lo_selected[0].job_id );
		$("#recruitHurry .position").text( lo_selected[0].job_name );
		$("#recruitHurry .is_hurry").val( lo_selected[0].is_hurry );

		$.ajax( {
			url : cur_path+'/company/hurryRecruit.do?buss=startDate&job_id='+lo_selected[0].job_id,
			type : "get",
			dataType : "text",
			beforeSend : function(){
				$.messager.progress({
					text :'稍等... ...'
				});
			},
			success : function( res ) {
				$.messager.progress("close");
				var data;
				try{
					data = $.parseJSON( res );
					if( data.ok != 'ok'){
						errorMsgAlert( data.ok );
						return ;
					}
				}catch(e ){
					$.messager.alert('提示信息','数据解析错误！','info');
					return ;
				}
				var start_date = data.start_date;
				var price = data.price;
				$("#hurry_begin_input").val( start_date );
				$("#hurry_price").val( price );
				$("#hurry_begin").datebox("setValue",start_date).datebox({disabled:true});
				$("#hurry_end").datebox({
					onSelect: function(date){
						calculateHurryPoints();
					}
				});
				$("#hurry_end").datebox("setValue",start_date);
				if( calculateHurryPoints() ){
					$("#recruitHurry").window({
			            title: '申请紧急招聘',
			            width: 400,
			            modal: true,
			            shadow: true,
			            closed: false,
			            height: 170,
			            resizable:false
			        }).window('open');
				}
			}
		});
    }
}
function setShow( status ){
	var job_id=""; 
	var flag="";
	var lo_selected   = getCheckObj('resultId','请选择一行信息！'); 
	if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一场招聘会！','info');
    	return false;
    }else{
    	job_id =  lo_selected[0].job_id;
    	if( status=='show'){
    		if( lo_selected[0].flag==0 ){
    			$.messager.alert("提示信息","职位状态已经为显示状态！","info");
    			return;
    		}
    		flag=0;
    	}else{
    		if(lo_selected[0].flag==1){
    			$.messager.alert("提示信息","职位状态已经屏蔽状态！","info");
    			return;
    		}
    		flag=1;
    	}
    	// flag=lo_selected[0].flag==1?0:1;
    	ls_url = getUrl()+"&&in_action=setflag&in_flag="+flag+"&in_job_id="+job_id+"&date=" + new Date();
	    updateRowStatus(ls_url,'操作成功', lo_selected[0] );
    }
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
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	}else if(ins_msg!="" && ins_msg!=null){
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
function refreshJob( job_id ,index){
	var lo_pg = $("#resultId").datagrid("getPager");
	var li_pagenum = lo_pg.pagination("options").pageNumber;
	var li_pagesize = lo_pg.pagination("options").pageSize;
	
	var ls_url = getUrl()+"&in_action=refresh&in_job_id="+job_id+"&date=" + new Date();
	$.post(ls_url,{}
	).done(function(data){
		var data = $.parseJSON( decodeURIComponent(data) );
		/*
		{"returncode":"ok" , "errordesc":"" ,"queryresult":[{"'ok'":"ok"}]} 
		*/
		if(data.returncode =='ok'){
			if(data.queryresult[0].ok=='ok'){
				closepage(li_pagesize,li_pagenum,index);
			}else{
				$.messager.alert('提示信息','操作失败','error');
			}
		}else{
			$.messager.alert('提示信息',data.errordesc,'error');
			return;
		}
	}).fail(function(){
		$.messager.alert('提示信息','服务器错误，请稍后再试！','info');
		return;
	});
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	ajaxData('#resultId', getUrl, getData, undefined, 30, undefined);
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_01&in_URLEncoding=UTF-8&in_company_id="+company_id;
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
	$("#if_deal")[0].src ="jCompanyRecruitAdd.jsp?id="+company_id+"&pagesize=" + li_pagesize + "&pagenum=" + li_pagenum + "&currentnum=" + li_currentnum;
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
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
    					ls_id += "&in_company_recruit_mgr"+i+"="+ lo_selected[i].job_id;
   					}
   					ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_recruit_02" + ls_id+"&date="+new Date();
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
			pageSize : 30
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
	    ls_id     = lo_selected[0].job_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src='jCompanyRecruitEdit.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
        $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
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
	    ls_id     = lo_selected[0].job_id;
        lo_pg         = $("#resultId").datagrid("getPager");
        li_pagenum    = lo_pg.pagination('options').pageNumber;

        $('#if_deal')[0].src=cur_path+'/company/jCompanyRecruitView.jsp?id='+ls_id+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
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


 
 
