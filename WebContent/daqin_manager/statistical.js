function loadCompanyStat(){
  	$('#companyStat').load("./stat.do?method=companyStat",function(){
				  		var companyStat = $.parseJSON($('#companyStat').text());
					  	$('#companyStatTable').datagrid({
					  	 	// title:"全国企业会员统计",
					  		collapsible:false,
					  		fitColumns : true,
					  		fit : true ,
					  		striped : true,
					  		rownumbers : false,
					  		singleSelect : true,
					  		columns :companyStat.columns, //  [[{"title":"BASE_CODEx","field":"BASE_CODE"},{"title":"BASE_NAMEx","field":"BASE_NAME"}]],
					  		data : companyStat.data // [{"BASE_NAME":"综合招聘会","BASE_CODE":"multiple"},{"BASE_NAME":"专场招聘会","BASE_CODE":"organises"},{"BASE_NAME":"校企合作对接会","BASE_CODE":"cooperate"}]
						});
  	});
 }
 function loadcompanyStatMonth(){
  	$('#companyStatMonth').load("./stat.do?method=companyStat&month=month",function(){
				  		var companyStat = $.parseJSON($('#companyStatMonth').text());
					  	$('#companyStatMonthTable').datagrid({
					  		// title:"本月新增企业会员统计",
					  		collapsible:true,
					  		fitColumns : false,
					  		fit :true ,
					  		striped : true,
					  		rownumbers : false,
					  		singleSelect : true,
					  		columns :companyStat.columns, //  [[{"title":"BASE_CODEx","field":"BASE_CODE"},{"title":"BASE_NAMEx","field":"BASE_NAME"}]],
					  		data : companyStat.data // [{"BASE_NAME":"综合招聘会","BASE_CODE":"multiple"},{"BASE_NAME":"专场招聘会","BASE_CODE":"organises"},{"BASE_NAME":"校企合作对接会","BASE_CODE":"cooperate"}]
			});
  	});	
}
function loadJobFairStat(){
  	$('#jobfairStat').load("./stat.do?method=jobfairStat",function(){
				  		var jobfairStat = $.parseJSON($('#jobfairStat').text());
					  	$('#jobfairStatTable').datagrid({
					  	 	// title:"全国发布招聘会统计",
					  		collapsible:true,
					  		fitColumns : false,
					  		fit : true ,
					  		striped : true,
					  		rownumbers : false,
					  		singleSelect : true,
					  		columns :jobfairStat.columns, //  [[{"title":"BASE_CODEx","field":"BASE_CODE"},{"title":"BASE_NAMEx","field":"BASE_NAME"}]],
					  		data : jobfairStat.data // [{"BASE_NAME":"综合招聘会","BASE_CODE":"multiple"},{"BASE_NAME":"专场招聘会","BASE_CODE":"organises"},{"BASE_NAME":"校企合作对接会","BASE_CODE":"cooperate"}]
			});
  	});
 }
 function loadJobFairStatMonth(){
  	$('#jobfairStatMonth').load("./stat.do?method=jobfairStat&month=month",function(){
				  		var jobfairStat = $.parseJSON($('#jobfairStatMonth').text());
					  	$('#jobfairStatMonthTable').datagrid({
					  		// title:"本月新增招聘会统计",
					  		collapsible:true,
					  		fitColumns : false,
					  		fit :true ,
					  		striped : true,
					  		rownumbers : false,
					  		singleSelect : true,
					  		columns :jobfairStat.columns, //  [[{"title":"BASE_CODEx","field":"BASE_CODE"},{"title":"BASE_NAMEx","field":"BASE_NAME"}]],
					  		data : jobfairStat.data // [{"BASE_NAME":"综合招聘会","BASE_CODE":"multiple"},{"BASE_NAME":"专场招聘会","BASE_CODE":"organises"},{"BASE_NAME":"校企合作对接会","BASE_CODE":"cooperate"}]
			});
  	});	
}
 function loadCompositeStat(){
  	$('#compositeStat').load("./stat.do?method=compositeStat",function(){
				  		var compositeStat = $.parseJSON($('#compositeStat').text());
					  	$('#compositeStatTable').datagrid({
					  		// title:"综合统计",
					  		collapsible: false ,
					  		fitColumns : true,
					  		fit : false ,
					  		striped : true,
					  		rownumbers : false,
					  		singleSelect : true,
					  		nowrap : false,
					  		columns :compositeStat.columns, //  [[{"title":"BASE_CODEx","field":"BASE_CODE"},{"title":"BASE_NAMEx","field":"BASE_NAME"}]],
					  		data : compositeStat.data // [{"BASE_NAME":"综合招聘会","BASE_CODE":"multiple"},{"BASE_NAME":"专场招聘会","BASE_CODE":"organises"},{"BASE_NAME":"校企合作对接会","BASE_CODE":"cooperate"}]
			});
  	});	
}