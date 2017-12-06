var notice_scripts = document.getElementsByTagName("script");
var notice_script = notice_scripts[notice_scripts.length - 1];
var in_r=notice_script.src.split('r=')[1];
artDialog.notice = function (options) {
    var opt = options || {},
        api, aConfig, hide, wrap, top,
        duration = 800;
        
    var config = {
        //id: 'Notice',
        left: '100%',
        top: '100%',
        fixed: true,
        drag: true,
        resize: false,
        follow: null,
        lock: false,
        init: function(here){
            api = this;
            aConfig = api.config;
            wrap = api.DOM.wrap;
            top = parseInt(wrap[0].style.top);
            hide = top + wrap[0].offsetHeight;
            
            wrap.css('top', hide + 'px')
                .animate({top: top + 'px'}, duration, function () {
                    opt.init && opt.init.call(api, here);
                });
        },
        close: function(here){
            wrap.animate({top: hide + 'px'}, duration, function () {
                opt.close && opt.close.call(this, here);
                aConfig.close = $.noop;
                api.close();
            });
            
            return false;
        }
    };	
    
    for (var i in opt) {
        if (config[i] === undefined) config[i] = opt[i];
    };
    return artDialog(config);
};
$(function(){
	setTimeout(function(){
		ajaxMoreNotice();
	},30000);
	//showNotice("通知","尊敬的顾客朋友，您IQ卡余额不足10元，请及时充值");
});
function showNotice(title,content,url,target )
{
	if( content==undefined || content=='' ){
    //	setTimeout(function(){
    //		ajaxMoreNotice();
    //	},20000);
    	return;
	}
	content='<div style="color:#666;min-height:130px;width:280px;">'+content+'</div>';
	if( url && target ){
		content+='<div><a style="float:right;" href="'+url+'" target="'+target+'">查看</a></div>'
	}
	art.dialog.notice({
	    title: title,
	    width: 330,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
	    content: content,
	    icon: false,
	    time: 180,
	    padding:'10px 10px',
	    close: function(){
	    //	setTimeout(function(){
	    //		ajaxMoreNotice();
	    //	},20000);
	    }
	});
//	var list = art.dialog.list;
//	console.info( list );
//	for (var i in list) {
//		//list[i].close();
//		console.info(i);
//	};
	/*
	art.dialog({
	    title: title,
	    width: 360,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
	    content: content,
	    icon: icon,
	    time: 60,
	    fixed:true,
	    padding:'10px 10px',
	    okVal : '关闭',
	    ok :function(){
	    	this.close();
	    },
	    close: function(){
	    	setTimeout(function(){
	    		ajaxMoreNotice();
	    	},20000);
	    }
	});	
	*/
}
function ajaxMoreNotice()
{
	var time=$.cookie("notice-time-flag");
	var ls_url='/netcongress/ajaxNotice.do?in_r='+in_r+'&time='+time;
	$.post(ls_url,{}
	).done(function(data){
		//console.info( data );
		//$.cookie("notice-time-flag", new Date().getTime()  );
		if(data.returncode=='ok'){
			if( data.time ){
				$.cookie("notice-time-flag",data.time );
			}
			if( data.queryresult  ){
				queryresult = data.queryresult;
				for(var i=0;i< queryresult.length ; i++ ){
					//console.info( queryresult[i] );
					ajaxNoticeShow( queryresult[i] );
				}
			}
			//showNotice("通知", ajaxNoticeHtml( data.queryresult ) );
		}else if(data.returncode=='fail'){
			showNotice('提示信息', data.errordesc ,'face-sad');
		}
		setTimeout(function(){
    		ajaxMoreNotice();
    	},20000);
	}).fail(function(){
		showNotice('提示信息','通讯错误，请刷新页面！','error');
	});
}
function ajaxNoticeShow( obj )
{
	var title = obj.title;
	var content = obj.content;
	var url = obj.url;
	var target="_blank";
	var args = getUrlArgObject();
	var job_fair_id=args.id;
	if( obj.type == 0 ){
		switch( obj.status ){
			case '0':;
			case '1'://return '<span style="color:red">简历未通过</span>';
				url='?m=interview&id='+job_fair_id;
				break;
			case '4'://return '<span style="color:green">通知复试</span>';
			case '2'://return '<span style="color:green">通知面试</span>';
				url='?m=interview&id='+job_fair_id;;
				break;
			case '3'://return '<span style="color:red">面试未通过</span>';
			case '5'://return '<span style="color:green">通知录用</span>';
				url='?m=result&id='+job_fair_id;;
				break;
		}
	}
	showNotice(title,content,url,target);
}
function ajaxNoticeHtml( interviewList )
{	
	var html="";
	if( interviewList.length >0 ){
		for( var i=0;i<interviewList.length;i++ ){
			//console.info( interviewList[i] );
			var row= interviewList[i];
			html+=row.time+'&nbsp;'+interviewStatus( row.status )+'&nbsp;'+row.company_name+'<br/>';
		}
	}
	return html;
}
function interviewStatus( status )
{
	switch( status ){
		case '0':return "";
		case '1':return '<span style="color:red">简历未通过</span>';
		case '2':return '<span style="color:green">通知面试</span>';
		case '3':return '<span style="color:red">面试未通过</span>';
		case '4':return '<span style="color:green">通知复试</span>';
		case '5':return '<span style="color:green">通知录用</span>';
	}
	return '';
}
//返回的是字符串形式的参数，例如：class_id=3&id=2& 
function getUrlArgStr(){ 
    var q=location.search.substr(1); 
    var qs=q.split('&'); 
    var argStr=''; 
    if(qs){ 
        for(var i=0;i<qs.length;i++){ 
            argStr+=qs[i].substring(0,qs[i].indexOf('='))+'='+qs[i].substring(qs[i].indexOf('=')+1)+'&'; 
        } 
    } 
    return argStr; 
} 
//返回的是对象形式的参数 
function getUrlArgObject(){ 
    var args=new Object(); 
    var query=location.search.substring(1);//获取查询串 
    var pairs=query.split(",");//在逗号处断开 
    for(var i=0;i<pairs.length;i++){ 
        var pos=pairs[i].indexOf('=');//查找name=value 
        if(pos==-1){//如果没有找到就跳过 
            continue; 
        } 
        var argname=pairs[i].substring(0,pos);//提取name 
        var value=pairs[i].substring(pos+1);//提取value 
        args[argname]=unescape(value);//存为属性 
    } 
    return args;//返回对象 
} 
// 另外列出一些 javascript 获取url中各个部分的功能方法：
// window.location.host; //返回url 的主机部分，例如：www.xxx.com 
// window.location.hostname; //返回www.xxx.com 
// window.location.href; //返回整个url字符串(在浏览器中就是完整的地址栏)，例如：www.xxx.com/index.php?class_id=3&id=2 
// window.location.pathname; //返回/a/index.php或者/index.php 
// window.location.protocol; //返回url 的协议部分，例如： http:，ftp:，maito:等等。 
// window.location.port //url 的端口部分，如果采用默认的80端口，那么返回值并不是默认的80而是空字符 