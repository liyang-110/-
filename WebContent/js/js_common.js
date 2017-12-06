/////////////////////////////////////////////////////////////////////
//加载css和js文件
load_css(cur_path + "/js/jquery-easyui/themes/default/easyui.css");
load_css(cur_path + "/js/jquery-easyui/themes/icon.css");
load_css(cur_path + "/js/jquery-easyui/demo.css");
load_js("j001", cur_path + "/js/jquery-easyui/jquery-1.8.0.min.js");
load_js("j002", cur_path + "/js/jquery-easyui/jquery.easyui.min.js");
//load_js("j004", cur_path + "/flow_ui/js/jquery-easyui/jquery.cookie.js");
load_js("j005", cur_path + "/js/jquery-easyui/json2.js");
load_js("j003", cur_path + "/js/jquery-easyui/easyloader.js");
load_js("j006", cur_path + "/js/jquery-easyui/jquery.edatagrid.js");
load_js("j007", cur_path + "/js/jquery-easyui/locale/easyui-lang-zh_CN.js");
load_js("j008", cur_path + "/js/select_data_js_array.js");
easyloader.base = cur_path + "/js/jquery-easyui/";
easyloader.locale = "zh_CN";
///////////////////////////////////////////////
//定义全局变量
/* =======================================================*/
// 函数作用：与后台服务交换数据
// 输入参数及数据类型：
//                   ins_id          对象id
//                   inf_url         返回url的函数
//                   inf_deal        绘制显示内容的函数
//                   ini_page        页码
//                   ini_pagesize    当前行数
//                   ini_currentrow  当前行
// 返回参数及数据类型：无
/* ===================================================== */
function ajaxData(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
	var out_return;
	var ls_url = inf_url();
    if (ini_page && ini_page > 0)
		ls_url = ls_url + "&in_page=" + ini_page;
	if (ini_pagesize && ini_pagesize > 0)
		ls_url = ls_url + "&in_pagenum=" + ini_pagesize;
	$.ajax( {
		url : ls_url,
		type : "post",
		dataType : "text",
		beforeSend : function(){
			$.messager.progress({
				text :'\u6570\u636E\u52A0\u8F7D\u4E2D... ...'
			});
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
			   initPaperarea(ins_id,inf_url,inf_deal,ini_pagesize);
			    //选中当前行
			   if (ini_currentrow>=0)
				{
					$(ins_id).datagrid('selectRow', ini_currentrow);
				}
			} else if (out_return.length > 0 && out_return[0].returncode == 'fail') {
				showError(out_return[0].errordesc);
			}
		},
		complete : function(XMLHttpRequest, textStatus) {
			this;
		},
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
	});
}
/* =======================================================*/
// 函数作用：初始化分页事件
// 输入参数及数据类型：
//                   ins_id     对象id
//                   inf_url    返回url的函数
//                   inf_deal   绘制显示内容的函数
// 返回参数及数据类型：从后台服务返回的json对象
/* ===================================================== */
function initPaperarea(ins_id,inf_url,inf_deal,pageSize){
	 var pg = $(ins_id).datagrid("getPager");
if(pg)
{
   $(pg).pagination({
       pageSize: pageSize,
       onRefresh:function(pageNumber,pageSize){
	         // ajaxData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
        },
       onChangePageSize:function(pageSize){
        },
       onSelectPage:function(pageNumber,pageSize){
             ajaxData(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
        }
   });
}
 }
/////////////////////////////////////////////////////////////////////
//显示错误信息
/* =======================================================*/
// 函数作用：显示错误信息
// 输入参数及数据类型：
// 返回参数及数据类型：HttpRequest对象
/* ===================================================== */
function showError(in_errorinfor) {
	$.messager.alert("\u6807\u9898",in_errorinfor,'warning');//标题
}
/////////////////////////////////////////////////////////////////////
//加载css js文件使用
/* =======================================================*/
// 函数作用：获取GetHttpRequest对象
// 输入参数及数据类型：
// 返回参数及数据类型：HttpRequest对象
/* ===================================================== */
function GetHttpRequest()
{
  if (window.XMLHttpRequest) // Gecko
  return new XMLHttpRequest();
  else if (window.ActiveXObject) // IE
  return new ActiveXObject("MsXml2.XmlHttp");
}
/* =======================================================*/
// 函数作用：加载JS文件,供外部调用
// 输入参数及数据类型：
//                   sId      序号
//                   url      url串
// 返回参数及数据类型：无
/* ===================================================== */
function load_js(sId, url) {
  var oXmlHttp = GetHttpRequest();
  oXmlHttp.onreadystatechange = function() {
    if (oXmlHttp.readyState == 4)
    {
      IncludeJS(sId, url, oXmlHttp.responseText);
    }
  }
  oXmlHttp.open('GET', url, false);
  oXmlHttp.send(null);
}
/* =======================================================*/
// 函数作用：加载JS文件,需要HttpRequest参数
// 输入参数及数据类型：
//                   sId          序号
//                   fileUrl      url串
//                   source       HttpRequest 对象
// 返回参数及数据类型：无
/* ===================================================== */
function IncludeJS(sId, fileUrl, source)
{
  if ((source != null) && (!document.getElementById(sId))) {
    var oHead = document.getElementsByTagName('HEAD').item(0);
    var oScript = document.createElement("script");
    oScript.language = "javascript";
    oScript.type = "text/javascript";
    oScript.id = sId;
    oScript.defer = true;
    oScript.text = source;
    oHead.appendChild(oScript);
  }
}
/* =======================================================*/
// 函数作用：加载css文件
// 输入参数及数据类型：
//                   file         文件路径
// 返回参数及数据类型：无
/* ===================================================== */
function load_css(file) {
  var cssTag = document.getElementById('loadCss');
  var head = document.getElementsByTagName('head').item(0);
  css = document.createElement('link');
  css.href = file;
  css.rel  = 'stylesheet';
  css.type = 'text/css';
  css.id   = 'loadCss';
  head.appendChild(css);
}
/* =======================================================*/
// 函数作用：异步处理传给路径操作
// 输入参数及数据类型： ins_url  		文件处理路径
//				    ins_msg  		处理成功后提示信息
//					ins_sucfunction 处理成功后所走方法
// 返回参数及数据类型： true/false boolean值 表示处里成功或失败
/* ===================================================== */
function ajaxDealUrl(ins_url,ins_msg,ins_sucfunction) {
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
                         if(ins_sucfunction!='undifined'){
                            ins_sucfunction();
                         }
                    });
            	}else{
                    if(ins_sucfunction!='undifined'){
                            ins_sucfunction();
                    }
            	}
//                if(typeof(ins_sucfunction) !='undefined'){
//                	ins_sucfunction();
//                	//closePage();
//                }
            } else if (re.length > 0 && re[0].returncode == 'fail') {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
                return false;
            }
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
/* =======================================================*/
// 函数作用：保存数据并返回调用页面
// 输入参数及数据类型：  ins_url   数据保存跳转路径
//					 ins_upFun 数据保存成功后所走方法
//					 ins_msg   数据保存成功提示信息
// 返回参数及数据类型：无
/* ===================================================== */
function saveData(ins_url,ins_upFun,ins_msg) {
	$("#btn_save") && $("#btn_save").linkbutton('disable');
    $('#fm').form('submit', {
        url: ins_url,
        onSubmit: function() {
        	if( $(this).form('validate') ){
        		return true;
        	}else{
        		$("#btn_save") && $("#btn_save").linkbutton('enable');
        		return false;
        	}
        },
        success: function(data) {
        	$("#btn_save") && $("#btn_save").linkbutton('enable');
        	data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
            	var queryresult =re[0].queryresult;
            	if( queryresult[0].ok!='ok' && queryresult[0].msg ){
            	 	$.messager.alert('\u63d0\u793a\u4fe1\u606f',queryresult[0].msg,'error');
            	}else if(ins_msg!="" && ins_msg!=null){
	                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){//提示信息
	                 	if(typeof(ins_upFun) !='undefined'){
	                 		ins_upFun();
	                 	}
	            	});
            	}
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
}
/* =======================================================*/
// 函数作用：返回调用页面
// 输入参数及数据类型：无
// 返回参数及数据类型：无
/* ===================================================== */
function closePage(){
		 window.parent.closepage(gi_pagesize,gi_pagenum, gi_currentnum);
 }
 function saveForm(ins_url,ins_upFun,ins_msg, id ) {
    $('#'+id).form('submit', {
        url: ins_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
        data = decodeURIComponent(data);
            if (data=='success') {
                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){//提示信息
                 	if(typeof(ins_upFun) !='undefined'){
                 		ins_upFun();
                 	}
            	});
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
}
 function saveUpload(ins_url,ins_upFun,ins_msg,id) {
    $('#'+id).form('submit', {
        url: ins_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
            if (data!='fail'&&data!='') {
                 $.messager.alert('\u63d0\u793a\u4fe1\u606f',ins_msg,'info',function(){//提示信息
                 	if(typeof(ins_upFun) !='undefined'){
                 		ins_upFun(data);
                 	}
            	});
            } else {
                $.messager.alert('导入失败', data, 'alert');//错误信息
            }
        }
    });
}
 function savefo(ins_url,ins_upFun,id) {
    $('#'+id).form('submit', {
        url: ins_url,
        onSubmit: function() {
            return $(this).form('validate');
        },
        success: function(data) {
        data = decodeURIComponent(data);
            var re = eval("[" + data + "]");
            if (re.length > 0 && re[0].returncode == 'ok') {
                 	if(typeof(ins_upFun) !='undefined'){
                 		ins_upFun(re[0].sheetid);
                 	}
            } else {
                $.messager.alert('\u9519\u8bef\u4fe1\u606f', data, 'alert');//错误信息
            }
        }
    });
}
/* =======================================================*/
// 函数作用：下拉框联动
// 输入参数及数据类型：
//            ins_id             页面下拉框id
//            inb_checkone       是否默认选中第一行
//            ins_ld             联动的下拉框数据
//            ins_sqlid          tbl_base_selectdata表字段sqlid
//			  ins_checkvalue	 下拉框默认值
// 返回参数及数据类型：
/* ===================================================== */
function linkSelectCode(ins_sqlid,ins_id,inb_checkone,ins_ld,ins_checkvalue,ins_isbuxian, height ){
  try{
  	var js_array = eval( ins_sqlid+"_js_array");
  	if(js_array!=undefined){
               ls_return =js_array;
               if ( height && height>0 ){
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text',
	                    panelHeight: height
	                });
 				}else if( ins_id.indexOf("area_id")>0 || ins_id.indexOf("ad_type")>0){
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text',
	                    panelHeight: '200'
	                });
                }else{
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text',
	                    panelHeight: 'auto'
	                });
                }
                if (ins_isbuxian!='undifined' && ins_isbuxian==1){
                	ls_return.unshift({ "text": "\u4E0D\u9650", "id": "" }); //加不限
                }
                //默认选中第一行
                $("#"+ins_id).combobox('loadData', ls_return);
                lo_data = $('#'+ins_id).combobox('getData');
                if(typeof(inb_checkone) !='undefined'&&inb_checkone){
                	$("#"+ins_id).combobox('select', lo_data[0]['id']);
                }
               //alert(ins_checkvalue);
               if(typeof(ins_checkvalue) !="undefined"&&ins_checkvalue!=""){
               		// $("#"+ins_id).combobox('select', ins_checkvalue);
               		$("#"+ins_id).combobox('setValue', ins_checkvalue);
               		
               }
       return;
  	}
  }catch(e){
  }
  var ls_url = cur_path + "/esbServer.do?method=execClass&methodId=base_select_001&sqlId="+ins_sqlid+"&arguments="+ins_ld ;
  var ls_return;
  var lo_data;
    $.ajax({
        url: ls_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            data = decodeURIComponent(data);
            var ls_return = eval("[" + data + "]");
            if (ls_return.length > 0 && ls_return[0].returncode == 'ok') {
                ls_return = ls_return[0].queryresult;
                if( ins_id.indexOf("area_id")>0 || ins_id.indexOf("ad_type")>0){
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text',
	                    panelHeight: '200'
	                });
                }
                else{
	                $("#"+ins_id).combobox({
	                    valueField: 'id',
	                    textField: 'text',
	                    panelHeight: 'auto'
	                });
                }
                if (ins_isbuxian!='undifined' && ins_isbuxian==1){
                	ls_return.unshift({ "text": "\u4E0D\u9650", "id": "" }); //加不限
                }
                //默认选中第一行
                $("#"+ins_id).combobox('loadData', ls_return);
                lo_data = $('#'+ins_id).combobox('getData');
                if(typeof(inb_checkone) !='undefined'&&inb_checkone){
                	$("#"+ins_id).combobox('select', lo_data[0]['id']);
                }
               //alert(ins_checkvalue);
               if(typeof(ins_checkvalue) !="undefined"&&ins_checkvalue!=""){
               		$("#"+ins_id).combobox('select', ins_checkvalue);
               }
            }
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function alertMsg(title,msg,icon){
	$.messager.alert(title,msg,icon);
}
function rerutnTab(){
   parent.window.remove();
 }
function showData(jsonData){
	for(var key in jsonData){
		if(("#" + key).length > 0){
			$("#"+ key).html(jsonData[key]);
		}
	}
}
function linkSelectCodeS(ins_sqlid,ins_id,inb_checkone,ins_ld,ins_checkvalue,ins_chagfun){
  var ls_url = cur_path + "/esbServer.do?method=execClass&methodId=base_select_001&sqlId="+ins_sqlid+"&arguments="+ins_ld ;
  var ls_return;
  var lo_data;
    $.ajax({
        url: ls_url,
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            data = decodeURIComponent(data);
            var ls_return = eval("[" + data + "]");
            if (ls_return.length > 0 && ls_return[0].returncode == 'ok') {
                ls_return = ls_return[0].queryresult;
                $("#"+ins_id).combobox({
                    valueField: 'id',
                    textField: 'text',
                    onChange: function() {
                     	if(typeof(ins_chagfun) !='undefined'){
                     		ins_chagfun();
                     	}
                    }
                });
                //默认选中第一行
                $("#"+ins_id).combobox('loadData', ls_return);
                lo_data = $('#'+ins_id).combobox('getData');
                if(typeof(inb_checkone) !='undefined'&&inb_checkone){
                	$("#"+ins_id).combobox('select', lo_data[0]['id']);
                }
               //alert(ins_checkvalue);
               if(typeof(ins_checkvalue) !="undefined"&&ins_checkvalue!=""){
               		$("#"+ins_id).combobox('select', ins_checkvalue);
               }
            }
        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
}
function searchForm(ins_id,inf_url,inf_deal,ini_page, ini_pagesize,ini_currentrow,tip) {
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
			   $(ins_id).datagrid('loadData', out_return[0]);
			   initPaperareaForm(ins_id,inf_url,inf_deal,ini_pagesize);
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
function initPaperareaForm(ins_id,inf_url,inf_deal,pageSize){
	var pg = $(ins_id).datagrid("getPager");
	if(pg)
	{
	   $(pg).pagination({
	       pageSize: pageSize,
	       onRefresh:function(pageNumber,pageSize){
	    	   searchForm(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        },
	       onChangePageSize:function(pageSize){
	    	   searchForm(ins_id,inf_url,inf_deal,1,pageSize,undefined);
	        },
	       onSelectPage:function(pageNumber,pageSize){
	    	   searchForm(ins_id,inf_url,inf_deal,pageNumber,pageSize,undefined);
	        }
	   });
	}
}
function nowtimeToSting(){
	var date=new Date();
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
	var h = date.getHours();
  	var i = date.getMinutes();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+ (h<10?('0'+h):h)+':'+(i<10?('0'+i):i);
}
//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "h+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
}