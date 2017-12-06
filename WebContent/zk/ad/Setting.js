$(document).ready(function(){
/* 定义所有class为copy标签，点击后可复制被点击对象的文本 */
    $(".copy").zclip({
		path: "ZeroClipboard.swf",
		copy: function(){
		return $(this).text();
		},
		beforeCopy:function(){/* 按住鼠标时的操作 */
			$(this).css("color","orange");
		},
		afterCopy:function(){/* 复制成功后的操作 */
			var $copysuc = $("<div class='copy-tips'><div class='copy-tips-wrap'>☺ 复制成功</div></div>");
			$("body").find(".copy-tips").remove().end().append($copysuc);
			$(".copy-tips").fadeOut(3000);
        }
	});
/* 定义所有class为copy-input标签，点击后可复制class为input的文本 */
	$(".copy-input").zclip({
		path: "ZeroClipboard.swf",
		copy: function(){
		return $(this).parent().find(".input").val();
		},
		afterCopy:function(){/* 复制成功后的操作 */
			var $copysuc = $("<div class='copy-tips'><div class='copy-tips-wrap'>☺ 复制成功</div></div>");
			$("body").find(".copy-tips").remove().end().append($copysuc);
			$(".copy-tips").fadeOut(3000);
        }
	});
});