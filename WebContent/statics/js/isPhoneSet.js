
 function mobile_device_detect(url){
  var thisOS=navigator.platform;
  var os=new Array("iPhone","iPod","iPad","android","Nokia","SymbianOS","Symbian","Windows Phone","Phone","Linux armv71","MAUI","UNTRUSTED/1.0","Windows CE","BlackBerry","IEMobile");
  for(var i=0;i<os.length;i++){
    if(thisOS.match(os[i])){ 
    	 document.body.innerHTML="正在加载中。。。";
         window.location=url;
         }
  }
  if(navigator.platform.indexOf('iPad') != -1){
	  document.body.innerHTML="正在加载中。。。";
      window.location=url;
  }
  var check = navigator.appVersion;
      if( check.match(/linux/i) ){
          if(check.match(/mobile/i) || check.match(/X11/i)) {
        	  document.body.innerHTML="正在加载中。。。";
         window.location=url;
        }  
      }
  Array.prototype.in_array = function(e){
    for(i=0;i<this.length;i++){
      if(this[i] == e)
      return true;
      }
      return false;
    }
  }
  /*
  * 璺宠浆绉诲姩html
  */
  //mobile_device_detect('http://h5.211zph.com');