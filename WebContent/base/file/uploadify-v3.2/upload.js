

 /**
 	contextpath �ļ���·��
   	pathSign �������� 0��ʾ�ϴ��ļ����뱾�� 1��ʾ�ϴ��ļ����빤���� Ĭ��Ϊ0
   */
function upload(contextpath,text_new_name,text_old_name,directory,userid,fileid,uploadmethod,pathsign,upnum){
var num=10;
 var fileId = '';
  var fileNameTemp = '';
  if(upnum!=null||upnum!=''){
  	num=upnum;
  }
            $(document).ready(function() {     
            $("#file_upload").uploadify({         
            //弄1�7启调评1�7         
            'debug' : false,         
            //是否自动上传        
             'auto':false,         
             //超时时间         
             'successTimeout':99999,               
             //flash         
             'swf': contextpath+'/base/file/uploadify-v3.2/uploadify.swf',         
             //不执行默认的onSelect事件         
             'overrideEvents' : ['onDialogClose'],         
             //文件选择后的容器ID         
             'queueID':'fileQueue',         
             //服务器端脚本使用的文件对象的名称 $_FILES个['upload']         
             'fileObjName':'upload',         
             //上传处理程序         
             'uploader': contextpath+'/uploadifyupLoad.do?pathSign='+pathsign+'&directory='+directory+'&userid='+userid,         
             //浏览按钮的背景图片路径1�7 
             'buttonImage':'base/file/images/uploading-button1.jpg',  
             'wmode': 'transparent' ,        
             'width': 88,
             'height':40,     
             //expressInstall.swf文件的路径�1�7�1�7         
             'expressInstall':'uploadify.swf',         
             //在浏览窗口底部的文件类型下拉菜单中显示的文本         
             'fileTypeDesc':'支持的格式：',         
             //允许上传的文件后缄1�7         
             'fileTypeExts':'*.*',         
             //上传文件的大小限刄1�7         
             'fileSizeLimit':'10MB',         
             //上传数量         
             'queueSizeLimit' : num,         
             //每次更新上载的文件的进展         
             'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {              
             //有时候上传进度什么想自己个�1�7�化控制，可以利用这个方泄1�7             
              //使用方法见官方说昄1�7         
              },         
             //返回丄1�7个错误，选择文件的时候触叄1�7        
             'onSelectError':function(file, errorCode, errorMsg){             switch(errorCode) {                 case -100:                     alert("\u4E0A\u4F20\u7684\u6587\u4EF6\u6570\u91CF\u5DF2\u7ECF\u8D85\u51FA\u7CFB\u7EDF\u9650\u5236\u7684"+$('#file_upload').uploadify('settings','queueSizeLimit')+"\u4E2A\u6587\u4EF6\uFF01");                     break;                 case -110:                     alert("\u6587\u4EF6 ["+file.name+"] \u5927\u5C0F\u8D85\u51FA\u7CFB\u7EDF\u9650\u5236\u768417"+$('#file_upload').uploadify('settings','fileSizeLimit')+"\u5927\u5C0F\uFF0417");                     break;                 case -120:                     alert("\u6587\u4EF6 ["+file.name+"] \u5927\u5C0F\u5F02\u5E38\uFF0417");                     break;                 case -130:                     alert("\u6587\u4EF6 ["+file.name+"] \u7C7B\u578B\u4E0D\u6B63\u786E!");                     break;             }         },         
              //棄1�7测FLASH失败调用        
             'onFallback':function(){             alert("\u60A8\u672A\u5B89\u88C5FLASH\u63A7\u4EF6\uFF0C\u65E0\u6CD5\u4E0A\u4F20\u6587\u4EF6\uFF01\u8BF7\u5B89\u88C5FLASH\u63A7\u4EF6\u540E\u518D\u8BD51717");         },
              //上传到服务器，服务器返回相应信息到data釄1�7         
              'onUploadSuccess':function(file, data, response){
					var temp = data.split("|");
					if(fileId!=''&&fileid!=''){
					var i=fileId.substring(fileId.length-1,fileId.length).indexOf(',');
					if(i>=0){
						fileId=fileId.substring(0,fileId.length-1);
						fileNameTemp=fileNameTemp.substring(0,fileNameTemp.length-1);
					}
						fileId+=","+temp[0];
                   		fileNameTemp+=","+temp[1];
					}else{
						fileId+=temp[0]+",";
                   		fileNameTemp+=temp[1]+",";
					}
                   	
              },
              'onQueueComplete':function (){
              		if(opener){
					if(fileId != '' && fileNameTemp != ''){
						var i=fileId.substring(fileId.length-1,fileId.length).indexOf(',');
					if(i<0){
						fileId =fileId+',';
						fileNameTemp =fileNameTemp+',';
					}
						fileId = fileId.substring(0,fileId.length-1);
						fileNameTemp = fileNameTemp.substring(0,fileNameTemp.length-1);
					}
					if(opener.document.getElementById(text_new_name).value!=""&&opener.document.getElementById(text_new_name).value!=null){
						
						opener.document.getElementById(text_new_name).value+=','+fileId;
  						opener.document.getElementById(text_old_name).value+=','+fileNameTemp;
					}else{
						opener.document.getElementById(text_new_name).value=fileId;
  						opener.document.getElementById(text_old_name).value=fileNameTemp;
					}
					
  						//setTimeout(function(){close();},1000);
  						if(fileid!=''&&fileid!=null){
  						fileid+=','+fileId;
  						}else{
  						fileid=fileId;
  						}
  						//opener.document.getElementById('uploadfileid').value=fileid;
  						var path=contextpath+'/fileup.do?fileid='+fileid;
  						fileId='';
  						fileNameTemp='';
  						document.file.location.replace(path);	
  					if(uploadmethod=='true'){
  						opener.uploadAfterDo();
  					}				
  					}
              }
              }); 
            }); 
            
}
