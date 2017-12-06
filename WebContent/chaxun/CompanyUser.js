/* =======================================================*/
// 功能：招聘会管理
/* ===================================================== */
$(function() {
	linkSelectCode('area_id','in_area_id',false,'','');
	linkSelectCode('member_type','in_member_type',false,'','');

	getData();
	ajaxdata1();
	$("#btnEp").bind("click",function(){ serverLogin() });
});
        //设置登录窗口
        function openPwd() {
        	$('#editpassw').window("open");
        }
        //关闭登录窗口
        function closePwd() {
            $('#editpassw').window('close');
        }
        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入用户名！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
			var ls_url = "/daqin_manager/login.do";
            $.post(ls_url, {user_id:$newpass.val(),user_pass:$rePass.val() }, function(data, textStatus){
            	if ( data.indexOf("uiwu")>0 ){
            		window.location.href="jJobFairSearchAD.jsp";
				}else if (data == 1 || data.indexOf('ccess')>0) {
	                msgShow('系统提示', '登录成功！' , 'info');
	                $newpass.val('');
	                $rePass.val('');
	                //closePwd();
	                window.location.reload();
				}else{
	                msgShow('系统提示', '登录失败！' , 'error');
				}
            });
            
        }
        function msgShow(title,msg,icom)
        {
        	$.messager.alert(title,msg,icom);
        }
        //修改密码
        function changePwd() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
			var ls_url = cur_path + "/esbServer.do?method=execProc&methodId=admin_login_edit&r=ad&in_id=" + id+"&date=" + new Date();
            $.post(ls_url, {in_passwd:$newpass.val() }, function(data, textStatus){
            	data = decodeURIComponent(data);
				var re = eval("[" + data + "]");
				if (re.length > 0 && re[0].returncode == "ok") {
	                msgShow('系统提示', '恭喜，密码修改成功！' , 'info');
	                $newpass.val('');
	                $rePass.val('');
	                closePwd();
				}else{
	                msgShow('系统提示', '未知错误！' , 'error');
				}
            });
            
        }
/* =======================================================*/
// 函数作用：绘制页面
/* ===================================================== */
function getData() {
	$('#resultId').datagrid( {
		// title : '企业用户管理',
		toolbar:'#datagrid-menu',
		/*
		toolbar:[{  
            text:'企业信息',  
            iconCls:'icon-view',
            handler:function(){
            	companyInfomation();
            }  
        },{  
            text:'发送短信',
            iconCls:'icon-view',
            handler:function(){
            	sendShotMessage();
            }  
        },{  
            text:'海报备注',  
            iconCls:'icon-add',
            handler:function(){
					 remark();
            }  
        },{  
            text:'职位管理',  
            iconCls:'icon-view',
            handler:function(){
            	viewCompanyRecruit();
            }  
        },{  
            text:'待处理简历',  
            iconCls:'icon-view',
            handler:function(){
					 listLastResumes();
            }  
        },{  
            text:'证照管理',  
            iconCls:'icon-view',
            handler:function(){
            	companyLicense();
            }  
        },{  
            text:'招聘简章',  
            iconCls:'icon-view',
            handler:function(){
            	uploadRecruitDoc();
            }  
        },{  
            text:'注册查询',  
            iconCls:'icon-view',
            handler:function(){
            	companyStatus();
            }  
        },{  
            text:'申请招聘会',  
            iconCls:'icon-view',
            handler:function(){
            	applyJobfair();
            }
        },{  
            text:'游客申请招聘会',  
            iconCls:'icon-view',
            handler:function(){
            	window.open("jobfair/jJobFairApply.jsp");
            }
        },{  
            text:'回访记录',  
            iconCls:'icon-view',
            handler:function(){
            	companyVisitRecord();
            }
        }],
        */
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
			field : 'area_name',
			title : '地区',
			width : 20
		},{
			field : 'user_id',
			title : '用户账号',
			width : 50
		}/*,{
			field : 'zk_name',
			title : '指导师',
			width : 40
		}*/,{
			field : 'member_type',
			title : '会员类型',
			width : 40
		},{
			field : 'points',
			title : '点数',
			align : 'center',
			formatter : function(value,row,index){
				return '<a onclick="viewPointsLog('+row.company_id+',\''+row.company_name+'\')" href="javascript:;">'+value+'</a>';
			},
			width : 40
		},{
			field : 'multiple',
			title : '校场/网场',
			align : 'center',
			formatter : function(value,row,index){
				return '<a onclick="viewJobfairLog('+row.user_code+',\''+row.company_name+'\')" href="javascript:;">'
						+row.multiple+' / '+row.netcongress+'</a>';
			},
			width : 50
		},{
			field : 'begin_date',
			title : '开始时间',
			width : 50
		},{
			field : 'end_date',
			title : '截止时间',
			width : 50
		},{
		    field : 'resumes',
		    title :'简历/未看',
		    formatter : function(value,row,index){
		   		return row.resumes+'&nbsp;/&nbsp;<span style="color:red;">'+row.last_resumes+'</span>';
		    },
			width : 50,
			align : 'center'
		},{
			field : 'company_name',
			title : '公司名称',
			formatter : function(value,row,index){
							var pic,img;
							if(row.company_pic=='no'){
								pic='';
							}else if(row.company_pic!='-'){
								pic='<a href="company/jImage.jsp?file_id='+row.company_pic+'" target="_blank"><span class="red">&lt;代&gt;</span></a>';
							}else{
								pic='<span class="red">[代]</span></a>';
							}
							if(row.company_img=='no'){
								img='';
							}else if(row.company_img!='-'){
								img='<a href="company/jImage.jsp?file_id='+row.company_img+'" target="_blank"><span class="red">&lt;执&gt;</span></a>';
							}else{
								img='<span class="red">[执]</span></a>';
							}
							var status="";
							if(row.status=='1'){
								status='<span class="green">[审]</span>';
							}else if(row.status=='2'){
								status='<span class="red">[退]</span>';
							}else if(row.status=='3'){
								status='<span class="fc0">[逾]</span>';
							}
							var remark='';
							if(row.remark ){
								remark='<a onclick="remark('+index+');" style="color:red;padding-left:15px;" href="javascript:;" title="'+row.remark+'\n'+row.operdate+'">[ '+row.remark+' / '+row.operdate+']</a>';
							}

							return pic+img+status+'<a href="'+cur_path+'/company/info.do?id='+row.company_id+'" target="_blank">'+value+'</a>'+remark;
			},
			styler: function(index,row){
				var cssStr="";
				if (row.zk_id!=null && row.zk_id !=''){
						cssStr+='background-color:#67FFAE;'; // return inline style
				}
				return cssStr;
			},
			width : 200
		},{
			field : 'next_visit',
			title : '计划回访',
			width : 50,
			formatter : function(value,row,index){
				if(!value){
					value='点击回访';
				}
				return '<a href="javascript:void(0)" onclick="companyVisitRecord('+index+');">'+value+'</a>';
			},
			align: 'center'
		},{
			field : 'doc',
			title : '简章',
			width:20,
			formatter: function(value,row,index){
				if(value===null || value=="" || value ==undefined ){
					 return '无';
				}else{
					return '<a href="'+cur_path+'/upload/download.jsp?path='+value+'&name='+row.company_name+'" target="_blank">下载</a>';
				}
			},
			align:'center'
		},{
			field : 'add_time',
			title : '注册时间',
			width : 60
		},{
			field : 'login_date',
			title : '最后登录',
			width : 60
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
		fitColumns :true,
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
	$('#dlg_deal').dialog('open').dialog('setTitle','招聘会套餐使用记录-'+company_name); 
}
function viewPointsLog( company_id ,company_name )
{
    $('#if_deal')[0].src='./jPointsSearch.jsp?id=' + company_id+"&date="+new Date();
	$('#dlg_deal').dialog('open').dialog('setTitle','点数消费记录-'+company_name); 
}
function companyStatus()
{
	var company_id ,company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length>=1 ){
    	company_id = lo_selected[0].company_id;
        company_name = lo_selected[0].company_name;
    }else{
    	company_name='';
    }
    $('#if_deal')[0].src='company/jCompanySearch.jsp?in_company_name='+company_name+'&date='+new Date();
	$('#dlg_deal').dialog('open').dialog('setTitle','企业会员注册查询'); 
}
function companyLicense()
{
	var company_id ,company_name, status ;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    status = lo_selected[0].status;
    if( status == 1){
    	$.messager.alert("提示信息","企业已审核,不能修改证照信息!","warning");
    	return;
    }
    $('#if_deal')[0].src='company/jCompanyLicense.jsp?id=' +company_id+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','职位管理-'+company_name); 
}
function uploadRecruitDoc()
{
	var company_id ,company_name, status,user_code;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    status = lo_selected[0].status;
    user_code = lo_selected[0].user_code;
    $('#if_deal')[0].src='company/jUploadDoc.jsp?uid=' +user_code+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','职位管理-'+company_name); 
}
function companyInfomation()
{
	var company_id ,company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    $('#if_deal')[0].src='company/jCompanyEdit.jsp?id=' +company_id+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','职位管理-'+company_name); 
}
function viewCompanyRecruit()
{
	var company_id ,company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    $('#if_deal')[0].src='jCompanyRecruitSearch.jsp?id=' +company_id+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','职位管理-'+company_name); 
}
function applyJobfair()
{
	var company_id ,company_name , user_code ;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    user_code = lo_selected[0].user_code;
    $('#if_deal')[0].src='company/jApplyJobfair.jsp?id=' +company_id+'&uid='+user_code+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','申请招聘会-'+company_name); 
}
/*
* 函数作用：异步加载
*/
function ajaxdata1(){
	if( typeof(login) != 'undefined' ){
		var cur_page_size = $('#resultId').datagrid('options').pageSize;
		ajaxData('#resultId', getUrl, getData, undefined, cur_page_size, undefined);
	}
}
/* =======================================================*/
// 函数作用：得到查询路径
/* ===================================================== */
function getUrl() {
	var ls_url ="";
		ls_url = cur_path + "/esbServer.do?method=execProc&methodId=company_find&in_r=ad&URLEncoding=GBK";
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
		pageSize : ini_pagesize
	    });
	ajaxData('#resultId',getUrl,getData,ini_pagenum,ini_pagesize,ini_currentnum); 
}
function closeDialog(){
	$('#dlg_deal').dialog('close');
}
function setAdvertisement(){
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

        $('#if_deal')[0].src='./jCompanyAdvertisement.jsp?id='+ls_id+'&title='+company_name+'&in_pagesize=' + li_pagesize+'&in_pagenum=' + li_pagenum+'&in_currentnum=' +li_currentnum +"&date="+new Date();
		 $('#dlg_deal').dialog({width:500,height:282,fit:false});
		$('#dlg_deal').dialog('open').dialog('setTitle','名企推广-'+company_name); 
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
	//var cur_page_size = $('#resultId').datagrid('options').pageSize;
	//ajaxData("#resultId", getSearchUrl, getData, ini_pagenum, cur_page_size, ini_currentnum);
	searchCompany();
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
function searchCompany(){
	searchForm("#resultId", getUrl, getData);
}
function editLogin()
{
   $('#if_deal')[0].src='jLoginEdit2.jsp?id='+id+"&date="+new Date();
   $('#dlg_deal').dialog({width:650,height:320,fit:false});
   $('#dlg_deal').dialog('open').dialog('setTitle','完善资料'); 
}
function remark( index )
{
	if( index != undefined && index>=0){
		$("#resultId").datagrid("checkRow", index );
	}
	var li_currentnum =0; //当前行
	var li_pagesize   =0; //每页行数
	var li_pagenum    =0; //页码
    var lo_pg;            //分页对象
    
	var lo_selected = getCheckObj("resultId","请选择一行记录");
	if( !lo_selected ){
		return;
	}
	lo_pg         = $("#resultId").datagrid("getPager");
	li_currentnum = $("#resultId").datagrid("getRowIndex",lo_selected[0]);
	li_pagenum    = lo_pg.pagination('options').pageNumber;
	li_pagesize   = lo_pg.pagination("options").pageSize;
	
	console.info( lo_selected[0] );
	var company_name = lo_selected[0].company_name;
	var company_id = lo_selected[0].company_id;
	var remark = lo_selected[0].remark;
	$("#mem").val(remark);
	var dlg_title=company_name;
	$("#dlg_check").show().dialog({  title:dlg_title,
	    											width: 350,
	    											height: 220,
	    											fit:false,
	    											buttons: [{
												                    text:'确定',
												                    iconCls:'icon-ok',
												                    handler:function(){
												                       sendData(company_id, remark,li_pagenum,li_pagesize,li_currentnum);
												                  
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
function sendData( company_id , remark,li_pagenum,li_pagesize,li_currentnum )
{
	var mems=$("#mem").val();
	if(!mems ){
		$.messager.alert("提示信息","请填写内容！","info");
		return;
	}
    var ls_url = cur_path + "/esbServer.do?in_URLEncoding=UTF-8&method=execProc&methodId=company_find&in_action=remark&in_r=ad&in_company_id="+company_id+"&in_message="+mems+"&date="+new Date();
	ajaxDealUrl(ls_url,'操作成功',function(){
		$("#dlg_check").dialog('close');
		searchData("#resultId",getUrl,getData,li_pagenum,li_pagesize,li_currentnum,'');
	});
}
/* ====================================*/
//函数作用：（批量发送消息）
/*====================================*/
function sendShotMessage(){
	var lo_selected;      //当前选中行
	var ls_id = "";        //用户id
	var ls_url;           //url
	var ls_sign="";
	var dlg_title="发送消息";

	lo_selected   = getCheckObj('resultId','请选择用户！'); 
 if(lo_selected.length!=1){
 	$.messager.alert('提示信息','请选择一行来查看！','info');
 	return false;
 }else{
			sendShotMessageTo( lo_selected[0].contact_tel )
  }
  
}
/* ====================================*/
//函数作用：（批量发送消息）
/*====================================*/
function sendShotMessageTo( contact_tel ){
	var dlg_title="发送短信";
	if(contact_tel != undefined ){
			$("#in_sms_to").val( contact_tel );
			$("input[name='in_sms_to']").val( contact_tel );
			$("#in_sms_to").validatebox("validate");
	}else if(contact_tel != '' || contact_tel==null ){
		$("#in_sms_to").val( contact_tel );
		$("input[name='in_sms_to']").val( contact_tel );
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
	$('#fm2').form('submit', {
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
function companyVisitRecord( index )
{
	if( index!=undefined && index >=0 ){
		var r = $("#resultId").datagrid("selectRow",index );
	}
	var company_id ,company_name,user_id,zk_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;  
    user_id = lo_selected[0].user_id;
    zk_name = lo_selected[0].zk_name;
    
    $('#if_deal')[0].src='company/jVisitRecord.jsp?company_id='+company_id+"&user_id="+user_id;
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:true});
	$('#dlg_deal').dialog('open').dialog('setTitle','回访记录 - '+ company_name ); 
}
function listLastResumes()
{
	var company_id ,company_name;
	var lo_selected   = getCheckObj('resultId','请选择一行信息！');   
    if(lo_selected.length!=1){
    	$.messager.alert('提示信息','请选择一行信息！','info');
    	return false;
    }
    company_id = lo_selected[0].company_id;
    company_name = lo_selected[0].company_name;
    $('#if_deal')[0].src='company/jLastResumes.jsp?id=' +company_id+"&date="+new Date();
    $('#dlg_deal').dialog({resizable:true,minimizable:false,maximizable:true,width:800,height:'100%',fit:false});
	$('#dlg_deal').dialog('open').dialog('setTitle','待处理简历-'+company_name+'<span style="color:red;">(仅显示最近一月未处理简历)</span>'); 
}
function showNeedTodayVisit(){
	$('#in_visit_time_1').datebox('setValue', new Date().Format("yyyy-MM-dd") );
	$('#in_visit_time_2').datebox('setValue', new Date().Format("yyyy-MM-dd") );
	searchCompany();
}
function clearFormAndReload(){
	$("#fm").form("clear");
	searchCompany();
}