            <div class="row f_sec_3  pull-left">
            <form action=""  id="J_TSearchForm">
            <!--
            	<select name="ktype">
                	<option value="1">高校/人才市场</option>
                    <option value="2">招聘会</option>
                </select>
                -->
                <div class="search-triggers">
                    <ul class="ks-switchable-nav">
                            <li class="J_SearchTab selected" data-searchtype="school" style="display: list-item;">
                            <a href="javascript:;">高校/人才市场<i  class="icon-chevron-dow"></i></a></li>
                            <li class="J_SearchTab" data-searchtype="jobfair" style="display: none;">
                            <a href="javascript:;">招聘会<i  class="icon-chevron-dow"></i></a></li>
                            <li class="J_SearchTab" data-searchtype="company" style="display: none;">
                            <a href="javascript:;">企业<i  class="icon-chevron-dow"></i></a></li>
                    </ul>
                    
                    <div style="clear:both;"></div>
                </div>
                <div style=" display:inline-block; position:absolute; top:0; left:100px; width:427px;">
                <input type="hidden" name="search_type" id="search_type" value="school"/>
                <input type="text" name="key" id="search_key"/>
                <input class=" btn-success" type="button" value="search" onClick="query();"/>
                </div>
             </form>
<script>
$("document").ready(function(){
	$(".J_SearchTab").bind('click',J_SearchTab_Click);
	$(".search-triggers").bind('mouseenter',J_SearchTab_MouseEnter);
	$(".search-triggers").bind('mouseleave',J_SearchTab_MouseLeave);
});
J_SearchTab_Click =function(){
		$(".J_SearchTab").each(function(){
				$(this).removeClass("selected");
		})
		$(this).addClass("selected");
		$(this).remove().insertBefore($(".J_SearchTab:first"));
		$(this).bind('mouseenter',J_SearchTab_Mouse);
		$(this).bind('click',J_SearchTab_Click);
		$(".search-triggers").trigger("mouseleave");
		$("#J_TSearchForm input[name=search_type]").val( $(this).attr("data-searchType") );
	}
J_SearchTab_Mouse = function() {
		$('.search-triggers li').each(function(){
			$(this).show();
		})
		$(".search-triggers").mouseleave(function(){ 
					$('.search-triggers li').each(function(){$(this).hide();});
					$('.search-triggers li.selected').show();
		});
	}
J_SearchTab_MouseEnter = function() {
		$('.search-triggers li').each(function(){
			$(this).show();
		})
}
J_SearchTab_MouseLeave = function() {
		$('.search-triggers li').each(function(){$(this).hide();});
		$('.search-triggers li.selected').show();
}
</script>

             <div style="clear:both;"></div>
            </div>