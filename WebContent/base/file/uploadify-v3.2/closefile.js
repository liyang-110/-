


function fileClose(path){//alert(path);
	var req=null;
	var url=path+"?dd="+toDateString();
	if (window.XMLHttpRequest) { // Non-IE browsers
		req = new XMLHttpRequest();
		req.onreadystatechange = processStateChange;
		try {
			req.open("GET", url, true);
		}catch (e) {
			alert(e);
		}
		req.send(null);
	} else{
		if (window.ActiveXObject) { // IE
			req = new ActiveXObject("Microsoft.XMLHTTP");
			if (req) {
				req.onreadystatechange = processStateChange;
				req.open("post", url, true);
				req.send();
			}
		}
	}
	function processStateChange() {
		if (req.readyState == 4) { // Complete
			if (req.status == 200) { // OK response
				var valuevar=req.responseText;
				if(valuevar.indexOf('true')==-1){

				}
			} else {
				alert("Problem: " + req.statusText);
			}
		}
	}
} 

function toDateString(){
   var  d=new Date();
   var m;
   var c=":";
   m = d.getYear()+c;
   m += (d.getMonth() + 1) + c;
   m += d.getDate() + c;
   m += d.getHours() + c;
   m += d.getMinutes() + c;
   m += d.getSeconds() + c;
   m += d.getMilliseconds();
return m;
}