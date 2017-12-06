var CreateTask = function () {
    
    return {
        init: function () {
        		var options ={
			            submitHandler: function(form) {
			            	if( $("input[name='pageUrl']:checked").val()==undefined ){
			            		alert("请选择要采集的文章！");
			            		return;
			            	}else if( $('#subType').val()==''){
			            		alert("请选择采集分类！");
			            		return;
			            	}
			            	var url= $(form).attr("action");
							$.post(url, $(form).serialize(), function(data){
								if(data>0){
									alert("操作成功 !");
								}else{
									alert("操作失败 !");
								}
							});
			            }
			     };
				$('#createTask').validate( options );

			}
		};
}();