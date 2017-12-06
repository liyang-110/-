//star
var x = 0;
$(document).ready(function(){
    var stepW = 24;
    
    //服务态度
    var description1 = new Array("很不满意!","不满意!","一般!","满意!","非常满意!");
    var descriptionTemp1;   
   
    $("#showb1").css("width",0);
    var stars1 = $("#star1 > li");
    stars1.each(function(i){
    	
        $(stars1[i]).click(function(e){
            var n1 = i+1;
            $("#showb1").css({"width":stepW*n1});
            descriptionTemp1 = n1+"分";
            $(this).find('a').blur();
            $("#star_num_1").val(n1);
            return stopDefault(e);
            return descriptionTemp1;
        });
    });
    stars1.each(function(i){
        $(stars1[i]).hover(
            function(){
                $(".dc1").text(description1[i]);
            },
            function(){
                if(descriptionTemp1 != null)
                	 $(".dc1").text(descriptionTemp1);
                else 
                    $(".dc1").text(" ");
            }
        );
    });
    //专业能力
    var description2 = new Array("很不满意!","不满意!","一般!","满意!","非常满意!");
    var descriptionTemp2;
    $("#showb2").css("width",0);
    var stars2 = $("#star2 > li");
    stars2.each(function(i){
        $(stars2[i]).click(function(e){
            var n2 = i+1;
            $("#showb2").css({"width":stepW*n2});
            descriptionTemp2 = n2+"分";
            $(this).find('a').blur();
            $("#star_num_2").val(n2);
            return stopDefault(e);
            return descriptionTemp2;
        });
    });
    stars2.each(function(i){
        $(stars2[i]).hover(
            function(){
                $(".dc2").text(description2[i]);
            },
            function(){
                if(descriptionTemp2 != null)
                	 $(".dc2").text(descriptionTemp2);
                else 
                    $(".dc2").text(" ");
            }
        );
    });
    //综合素质评价
    var description3 = new Array("很不满意!","不满意!","一般!","满意!","非常满意!");
    var descriptionTemp3;
    $("#showb3").css("width",0);
    var stars3 = $("#star3 > li");
    stars3.each(function(i){
        $(stars3[i]).click(function(e){
            var n3 = i+1;
            $("#showb3").css({"width":stepW*n3});
            descriptionTemp3 = n3+"分";
            $(this).find('a').blur();
            $("#star_num_3").val(n3);
            return stopDefault(e);
            return descriptionTemp3;
        });
    });
    stars3.each(function(i){
        $(stars3[i]).hover(
            function(){
                $(".dc3").text(description3[i]);
            },
            function(){
                if(descriptionTemp3 != null)
                	 $(".dc3").text(descriptionTemp3);
                else 
                    $(".dc3").text(" ");
            }
        );
    });
});
function stopDefault(e){
    if(e && e.preventDefault)
           e.preventDefault();
    else
           window.event.returnValue = false;
    return false;
};