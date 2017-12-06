$(document).ready(function(){
	var className="";
 $("input[tab='tab']").bind("mouseover", function(){
	 className= $(this).attr("className");
  $(this).attr("className",$(this).attr("overclass"));
}); 
 $("input[tab='tab']").bind("mouseout", function(){
  $(this).attr("className",className);
}); 
}); 

