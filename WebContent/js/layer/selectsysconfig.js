function changeProvince(str){
    if($("#"+str+"province").val()!=''){
        $("#"+str+"capital").empty();
        $("#"+str+"city").empty();
    	var selvalue=$("#"+str+"province").val();	  
    	var j,d,mm,f=0;
        selvalues='';
    	d=0;
		var newOption2=new Option('选择市','');
    	document.getElementById(str+'capital').options.add(newOption2);
		var newOption3=new Option('选择县','');
    	document.getElementById(str+'city').options.add(newOption3);		
    	for(j=0;j<provArray.length;j++) {
            if(provArray[j][2]==selvalue&&f==0){selvalues=provArray[j][2];f=1;}
    		if(provArray[j][1]==selvalues) {
    			if (d==0){
    			mm=provArray[j][2];
    			}
    			var newOption2=new Option(provArray[j][0],provArray[j][2]);
    			document.getElementById(str+'capital').options.add(newOption2);
    			d=d+1;	
    		}		
    		if(provArray[j][1]==mm) 
    		{		
    			var newOption3=new Option(provArray[j][0],provArray[j][2]);
    			document.getElementById(str+'city').options.add(newOption3);
    		}			
    	}
    }
}
function changeCity(str) {
    if($("#"+str+"capital").val()!=''){
        $("#"+str+"city").empty();
    	var selvalue=$("#"+str+"capital").val();
    	var j,d,f=0;
        selvalues='';
		var newOption3=new Option('选择县','');
    	document.getElementById(str+'city').options.add(newOption3);	
    	for(j=0;j<provArray.length;j++) 
    	{
            if(provArray[j][2]==selvalue&&f==0){selvalues=provArray[j][2];f=1;}
            if(provArray[j][1]==selvalues) 
    		{
    			var newOption4=new Option(provArray[j][0],provArray[j][2]);
    			document.getElementById(str+'city').options.add(newOption4);
    		}
    	}
    }
}
function selectprovince(str) { 
    var j;
	for(j=0;j<provArray.length;j++) {
		if(provArray[j][1]==0) {
			var newOption4=new Option(provArray[j][0],provArray[j][2]);
			document.getElementById(str+'province').options.add(newOption4);
		}
	}
    if($("#"+str+"province").val()!=''){
        var selvalue=$("#"+str+"province").val();	  
    	var t,d,mm,f=0;
        selvalues='';
    	d=0;
    	for(t=0;t<provArray.length;t++) {
            if(provArray[t][2]==selvalue&&f==0){selvalues=provArray[t][2];f=1;}
    		if(provArray[t][1]==selvalues) {
    			if (d==0){
    			mm=provArray[t][2];
    			}
    			var newOption2=new Option(provArray[t][0],provArray[t][2]);
    			document.getElementById(str+'capital').options.add(newOption2);
    			d=d+1;	
    		}		
    		if(provArray[t][1]==mm) 
    		{		
    			var newOption3=new Option(provArray[t][0],provArray[t][2]);
    			document.getElementById(str+'city').options.add(newOption3);
    		}			
    	}
    }
}
function changePosition(selvalue,obj,str){	
	var arrObj = document.getElementsByName(obj.name); 
	for(var i=0; i<arrObj.length; i++){ 
		if(obj == arrObj[i]) { 
		   index=i; 
		} 
	}
	document.getElementsByName(str).item(index).options.length=0; 
	var selvalue=selvalue;	  
	var j,f=0;
    selvalues='';
	for(j=0;j<posiArray.length;j++) {
        if(posiArray[j][0]==selvalue&&f==0){selvalues=posiArray[j][2];f=1;}
		if(posiArray[j][1]==selvalues) {
			var newOption2=new Option(posiArray[j][0],posiArray[j][0]);
			document.getElementsByName(str).item(index).options.add(newOption2);	
		}				
	}
}

function changeProfession(selvalue,obj,str){	
	var arrObj = document.getElementsByName(obj.name);
	for(var i=0; i<arrObj.length; i++){ 
		if(obj == arrObj[i]) { 
		   index=i; 
		}
	}
	document.getElementsByName(str).item(index).options.length=0; 
	var selvalue=selvalue;	  
	var j,f=0;
    selvalues='';
	for(j=0;j<profArray.length;j++) {
        if(profArray[j][0]==selvalue&&f==0){selvalues=profArray[j][2];f=1;}
		if(profArray[j][1]==selvalues) {
			var newOption2=new Option(profArray[j][0],profArray[j][0]);
			document.getElementsByName(str).item(index).options.add(newOption2);
		}				
	}	
}