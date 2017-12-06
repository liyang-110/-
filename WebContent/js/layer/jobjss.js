//页面初始化
var SearchDivcode='<form name="form_job" id="form_job">'
+'		<div style="width:100%;">'
+'			<div id="changbox" style="float:left; margin-left:10px; margin-right:6px; margin-top:10px;"></div>'
+'            <div id="changboxs" style="float:left; margin-left:10px;margin-top:10px; display:none;"></div>'
+'		</div>'
+'            <div id="bigclass" style="clear:both;margin-left:10px;width:528px;margin-top:4px;"></div>'
+'            <div id="smallclass" style="margin-left:10px;width:528px;margin-top:4px; line-height:150%; height:150px; line-height:150%; overflow:auto"></div>'
+'            <div id="checktitle" style="margin-left:10px; width:528px; margin-top:8px; font-size:13px; font-weight:bold;">您已经选择的是：<span style="cursor:pointer;font-size:12px; font-weight:bold; color:#FF6600" onClick="DelAllItem();">清空所有选项</span></div>'
+'            <div id="selectitem" style="margin-left:10px; width:508px; height:40px;margin-top:10px; border-top:1px solid #eee;background-color:#f8f8f8;padding:10px;"></div>'
+'            <div id="selectok" style="margin-left:10px; margin-top:4px; text-align:right; padding-right:40px;"></div>'
+'        </form>';
//参数：arrayid:调用的为哪个数组，fname：表单名称，vname：传回页面的存贮id的控件名称，tname，传回页面的存贮文本的控件名称

var maxSelectNumber =1;
window.artDialog = $.dialog = $.artDialog = artDialog;
function JumpSearchLayer(arrayid,fname,vname,tname,_maxSelectNumber){   
    if(_maxSelectNumber != undefined) maxSelectNumber = _maxSelectNumber;
    var objllist=document.getElementsByTagName('select');
	for(var i=0;i<objllist.length;i++)
	{
		objllist[i].style.visibility="hidden";
	} 
	var dialog = artDialog({
        id: 'SearchDivhire',
        lock: true,
        fixed: true,
        background: '#000', // 背景色
        opacity: 0.6,	// 透明度
        title: '提示信息',
        width:560,
        content: SearchDivcode,
        close:function(){
            var objllist=document.getElementsByTagName('select');
        	for(var i=0;i<objllist.length;i++){
        		objllist[i].style.visibility="";
        	}
        }
    });
	var onecount;
	if (arrayid==1){
		onecount=posiArray.length;
		arraynames=posiArray;
	    dialog.title('请选择职位');
	}else if (arrayid==2)
	{
		onecount=provArray.length;
		arraynames=provArray;
	    dialog.title('请选择希望工作地区（最多可选择3个）');
	}else if (arrayid==5)
	{
		onecount=provArray.length;
		arraynames=provArray;
	    dialog.title('请选择希望工作地区（最多可选择1个）');
	}else if (arrayid==3)
	{
		onecount=profArray.length;
		arraynames=profArray;
	    dialog.title('请选择专业要求（最多可选择3个）');
	}else if (arrayid==4)
	{
		onecount=tradeArray.length;
		arraynames=tradeArray;
        dialog.title('请选择行业领域（最多可选择1个）');
	}else if (arrayid==6)
	{
		onecount=provArray.length;
		arraynames=provArray;
	    dialog.title('请选择户籍所在地:');
	}
	var k;
	var j=0;
	document.getElementById("changboxs").style.display = "block";
	if (arrayid==5||arrayid==1)
	{
		//写二级城市下拉列表框		
		var changstr='<select name="bigselect" onchange=SecondToSelect(this.options[this.selectedIndex].value,arraynames,'+arrayid+'); id="bigselect"></select>';
		document.getElementById("changbox").innerHTML=changstr;
		var changstrs='<select name="smallselect" onchange=BigChangeToSmall(this.options[this.selectedIndex].text,this.options[this.selectedIndex].value,'+arrayid+'); id="smallselect"></select>';
		document.getElementById("changboxs").innerHTML=changstrs;
	}
	else{
		var changstr='<select name="bigselect" onchange=BigChangeToSmall(this.options[this.selectedIndex].text,this.options[this.selectedIndex].value,'+arrayid+'); id="bigselect"></select>';
		document.getElementById("changbox").innerHTML=changstr;	
	}
	var bigclassstr='';
	var strok='';
	document.form_job.bigselect.length = 0;
	if (arrayid==5||arrayid==1)
	{document.form_job.smallselect.length = 0;}
	for (k=0;k<onecount;k++)
	{
		if (arraynames[k][1] == 0)
		{
			j=j+1;
			document.form_job.bigselect.options[document.form_job.bigselect.options.length] = new Option(arraynames[k][0],arraynames[k][2]);
			if (j==1)
			{
				if (arrayid==5||arrayid==1)
				{
					SecondToSelect(arraynames[k][2],arraynames,arrayid);
				}
				else
				{
					if (arraynames[k][1]==0)
					{
						bigclassstr='<input name="bigclasscheck" id="bigclass'+arraynames[k][2]+'" type="checkbox" class="checkbox" value='+arraynames[k][2]+' onclick="BigClassToSelect(\''+arraynames[k][2]+'\');" /> <label name="bigclasslb" id="bigclasslb'+arraynames[k][2]+'" for="bigclass'+arraynames[k][2]+'" style="font-weight:bold; font-size:13px;">'+arraynames[k][0]+'</label>（选择此大类，将包括以下所有小类）';
					}
					else
					{
						bigclassstr='<input name="bigclasscheck" id="bigclass'+arraynames[k][2]+'" type="checkbox" class="checkbox" value='+arraynames[k][1]+'*'+arraynames[k][2]+' onclick="BigClassToSelect(\''+arraynames[k][2]+'\');" /> <label name="bigclasslb" id="bigclasslb'+arraynames[k][2]+'" for="bigclass'+arraynames[k][2]+'" style="font-weight:bold; font-size:13px;">'+arraynames[k][0]+'</label>（选择此大类，将包括以下所有小类）';
					}
					document.getElementById("bigclass").innerHTML=bigclassstr;
					JumpSearchLayers(arraynames[k][2],arrayid);
				}
				strok='<input type="button" name="Submit" value="确定" onclick="CloseAndInsertHtml(\''+fname+'\',\''+vname+'\',\''+tname+'\');" />&nbsp;&nbsp;<input type="button" name="Submit" value="取消" onclick="unSearchLayers();" />'
				document.getElementById("selectok").innerHTML=strok;
			}
		}		
	} 
	var l;
	var selectitemstr=''; 
	ts=document.getElementById(vname).value;
	var itemvarray=ts.split(",");
	ts=document.getElementById(tname).value;
	var itemtarray=ts.split(",");	
	itemnum=itemvarray.length;
	if (itemvarray[0]&&itemvarray[0]!='null')
	{
		for (l=0;l<itemnum;l++)
		{
			selectitemstr=selectitemstr+'<input name="selectokcheck" id="selectok'+itemvarray[l].slice(-4)+'" type="checkbox" class="checkbox" value='+itemvarray[l]+' checked="checked" onclick="CancelCheck(\''+itemvarray[l].slice(-4)+'\');" /><label name="selectoklb" id="selectoklb'+itemvarray[l].slice(-4)+'" for="selectok'+itemvarray[l].slice(-4)+'">'+itemtarray[l]+' </label>';
		}
		document.getElementById("selectitem").innerHTML=selectitemstr
		ClassIsCheck();
	}
	if(arrayid==2 ){
		$("#bigselect").find("option[value='0028']").attr("selected",true);
		BigChangeToSmall('陕西','0028',2);
		// setTimeout(BigChangeToSmall('陕西','28',2),500);

	}else if(arrayid==6 ){
		$("#bigselect").find("option[value='0028']").attr("selected",true);
		BigChangeToSmall('陕西','0028',6);
		// setTimeout(BigChangeToSmall('陕西','28',2),500);

	}
}
//功能:把第一个一级城市的所有二级城市写到第二个下拉列表框
function SecondToSelect(cityid,arraynames,arrayid)
{
	document.form_job.smallselect.length=0; 
	var selvalue=cityid;	  
	var j,h,mm;
	var arrayid;
	var mmt,mms;
	h=0;
	j=0;
	for(j=0;j<arraynames.length;j++) 
	{
		//二级城市的第一个城市触发事件
		if(arraynames[j][1]==selvalue) 
		{
			var newOption2=new Option(arraynames[j][0],arraynames[j][1]+'*'+arraynames[j][2]);
			document.getElementById('smallselect').options.add(newOption2);	
			if(h==0)
			{
				mms=arraynames[j][1]+'*'+arraynames[j][2];
				mmt=arraynames[j][0];
			}
			h=h+1;
		}
	}
	BigChangeToSmall(mmt,mms,arrayid);	
}
//功能：调用大类关联的小类
function JumpSearchLayers(positionids,arrayid)
{
	var onecounts;
	if (arrayid==1)
	{
	onecounts=posiArray.length;
	arraynames=posiArray;
	}else if (arrayid==2)
	{
	onecounts=provArray.length;
	arraynames=provArray;
	}else if (arrayid==3)
	{
	onecounts=profArray.length;
	arraynames=profArray;
	}else if (arrayid==4)
	{
	onecounts=tradeArray.length;
	arraynames=tradeArray;
	}else if (arrayid==5)
	{
	onecounts=provArray.length;
	arraynames=provArray;
	}else if (arrayid==6)
	{
	onecounts=provArray.length;
	arraynames=provArray;
	}
	var positionid=positionids.slice(-4);
	var i;
	var smallclassstr='';
	for (i=0;i<onecounts;i++)
	{
		if (arraynames[i][1] == positionid)
		{
			if (arraynames[i][1]==0)
			{
				smallclassstr+='<li style="float:left;width:170px;cursor:pointer;overflow:hidden;"> <input name="smallclasscheck" type="checkbox" onclick="SmallClassToSelect(\''+arraynames[i][2]+'\');" value="'+arraynames[i][2]+'" id="smallclass'+arraynames[i][2]+'" /><label name="smallclasslb" id="smallclasslb'+arraynames[i][2]+'" for="smallclass'+arraynames[i][2]+'">'+arraynames[i][0]+'</label></li>'
			}
			else
			{
				smallclassstr+='<li style="float:left;width:170px;cursor:pointer;overflow:hidden;"> <input name="smallclasscheck" type="checkbox" onclick="SmallClassToSelect(\''+arraynames[i][2]+'\');" value="'+positionids+'*'+arraynames[i][2]+'" id="smallclass'+arraynames[i][2]+'" /><label name="smallclasslb" id="smallclasslb'+arraynames[i][2]+'" for="smallclass'+arraynames[i][2]+'">'+arraynames[i][0]+'</label></li>'
			}
		}
	}
	document.getElementById("smallclass").innerHTML=smallclassstr;
	ClassIsCheck();	
}
//下拉列表的onchang事件调用相关的选项的子项
function BigChangeToSmall(text,value,arrayids)
{
	var Subvalue=value.slice(-4);
bigclassstr='<input name="bigclasscheck" id="bigclass'+Subvalue+'" type="checkbox" class="checkbox" value='+value+' onclick="BigClassToSelect(\''+Subvalue+'\');" /> <label name="bigclasslb" id="bigclasslb'+Subvalue+'" for="bigclass'+Subvalue+'" style="font-weight:bold; font-size:13px;">'+text+'</label>（选择此大类，将包括以下所有小类）'
document.getElementById("bigclass").innerHTML=bigclassstr;
JumpSearchLayers(value,arrayids);	
}
//将大类的值和id写到选中的区域
function BigClassToSelect(bigclasscheckid)
{
//先清除结果中存在该大类的小类；
DelThisSmallClass();
//判断一共选中了几项，若超过三项则提示不能再选
var bigclassobj=document.getElementById("bigclass"+bigclasscheckid);
var selectokstr='';
var t;
if (bigclassobj.checked==true)
{	
		//var selectokobj=form3.elements("selectokcheck");
		var selectokobj=document.getElementsByName('selectokcheck');
		if (selectokobj != null)
		{
			var selectoknum = selectokobj.length;
			if (selectoknum == undefined)
			{
				selectoknum=1;				
			}
			if (selectoknum>2)
			{
				bigclassobj.checked=false;
				alert("对不起，您选中的选项已经超过三项了，请先减少已选项再选择！");		
				return false;
			}			
		}
  	selectokstr='<input name="selectokcheck" id="selectok'+bigclassobj.value.slice(-4)+'" type="checkbox" class="checkbox" value='+bigclassobj.value+' checked="checked" onclick="CancelCheck('+bigclassobj.value+');" /><label name="selectoklb" id="selectoklb'+bigclassobj.value.slice(-4)+'" for="selectok'+bigclassobj.value.slice(-4)+'">'+document.getElementById("bigclasslb"+bigclassobj.value.slice(-4)).innerHTML+' </label>';
	if (document.getElementById("selectitem").innerHTML.indexOf("selectok"+bigclassobj.value.slice(-4))==-1)
	{	
		document.getElementById("selectitem").innerHTML=document.getElementById("selectitem").innerHTML+selectokstr;
	}
	else
	{
		document.getElementById("selectok"+lastTocken(bigclassobj.value) ).checked = true;

		//document.getElementById("selectok"+bigclassobj.value.slice(-4)).checked = true;
	}
}
else
{
	//if (document.getElementById("selectitem").innerHTML.indexOf("selectok"+bigclassobj.value.slice(-4))!=-1)
	if (document.getElementById("selectitem").innerHTML.indexOf("selectok"+lastTocken(bigclassobj.value))!=-1)
	
	{
		// document.getElementById("selectok"+bigclassobj.value.slice(-4)).checked = false;
			document.getElementById("selectok"+lastTocken(bigclassobj.value) ).checked = false;
	}
}
SmallClassIsDisable(bigclasscheckid);
DelIsNotCheck();
}
//将小类的值和id写到选中的区域
function SmallClassToSelect(smallclasscheckid)
{
var smallclassobj=document.getElementById("smallclass"+smallclasscheckid);
var selectokstr='';
var t;
var Subsmallclass=smallclassobj.value;
var subclassids = Subsmallclass.split("*");
var Subsmallclassid=subclassids[ subclassids.length-1 ];
// var Subsmallclassid=Subsmallclass.slice(-4);


if (smallclassobj.checked==true)
{	
	//var selectokobj=form3.elements("selectokcheck");
	var selectokobj=document.getElementsByName('selectokcheck');
	if (selectokobj != null)
	{
		var selectoknum = selectokobj.length;
		if (selectoknum == undefined)
		{
			selectoknum=1;				
		}
        
        if (selectoknum >= maxSelectNumber)
		{
			smallclassobj.checked=false;
			alert("对不起，最多允许选择"+maxSelectNumber+"项！");		
			return false;
		}
/**        maxSelectNumber		 */		
	}
  	selectokstr='<input name="selectokcheck" id="selectok'+Subsmallclassid+'" type="checkbox" class="checkbox" value='+smallclassobj.value+' checked="checked" onclick="CancelCheck('+Subsmallclassid+');" /><label name="selectoklb" id="selectoklb'+Subsmallclassid+'" for="selectok'+Subsmallclassid+'">'+document.getElementById("smallclasslb"+Subsmallclassid).innerHTML+' </label>';
	if (document.getElementById("selectitem").innerHTML.indexOf("selectok"+Subsmallclassid)==-1)
	{	
		document.getElementById("selectitem").innerHTML=document.getElementById("selectitem").innerHTML+selectokstr;
	}
	else
	{
		document.getElementById("selectok"+Subsmallclassid).checked = true;
	}
}
else
{
	if (document.getElementById("selectitem").innerHTML.indexOf("selectok"+Subsmallclassid)!=-1)
	{
		document.getElementById("selectok"+Subsmallclassid).checked = false;
	}
}
DelIsNotCheck();
}
//功能：若大类或小类在选中区域选中，则其也为选中状态
function ClassIsCheck()
{
//var selectokobj=document.form3.elements("selectokcheck");
var selectokobj=document.getElementsByName('selectokcheck');
var selectokstr='';
var t;
if (selectokobj != null)
{
	var selectoknum = selectokobj.length;
	//如果选中的只有一项时
	if (selectoknum == undefined)
	{
		//选中结果的id
		var selectokobjchecks;
		selectokobjchecks=document.getElementsByName("selectokcheck").item(0).value;
		var selectokobjchecksid=lastTocken(selectokobjchecks); // selectokobjchecks.slice(-4);
		if (document.getElementById("bigclass").innerHTML.indexOf("bigclass"+selectokobjchecksid)!=-1)
		{	
			document.getElementById("bigclass"+selectokobjchecksid).checked = true;
		}
		if (document.getElementById("smallclass").innerHTML.indexOf("smallclass"+selectokobjchecksid)!=-1)
		{	
			document.getElementById("smallclass"+selectokobjchecksid).checked = true;
		}
	}
	else
	{
		for (t=0;t<selectoknum;t++)
		{
			var selectokobjcheck=selectokobj[t];
			var selectokobjcheckv=selectokobjcheck.value;
			var selectokobjcheckvid=lastTocken( selectokobjcheckv );// selectokobjcheckv.slice(-4);
			if (document.getElementById("bigclass").innerHTML.indexOf("bigclass"+selectokobjcheckvid)!=-1)
			{	
				document.getElementById("bigclass"+selectokobjcheckvid).checked = true;
				SmallClassIsDisable(selectokobjcheckvid);
			}
			if (document.getElementById("smallclass").innerHTML.indexOf("smallclass"+selectokobjcheckvid)!=-1)
			{	
				document.getElementById("smallclass"+selectokobjcheckvid).checked = true;
			}
		}
	}
}
}
//功能，若大类的复选框为选中，则对应的小类复选框为不可选
function SmallClassIsDisable(bigclasscheckid)
{
var smallclassobj = document.getElementsByName("smallclasscheck");
var bigclassobj=document.getElementById("bigclass"+bigclasscheckid);
if (smallclassobj != null)
{
	var smallclassnum = smallclassobj.length;
	if (smallclassnum == undefined)
	{
		//选中结果只有一项,获取该项的id
		var selectokobjchecks;
		selectokobjchecks=document.getElementsByName("smallclasscheck").item(0).value;
		var selectokobjchecksid=lastTocken( selectokobjchecks ); // selectokobjchecks.slice(-4);
		if (bigclassobj!=null)
		{
			if (bigclassobj.checked)
			{
				document.getElementById("smallclass"+selectokobjchecksid).checked = false;
				document.getElementById("smallclass"+selectokobjchecksid).disabled = true;
			}
			else
			{
				document.getElementById("smallclass"+selectokobjchecksid).disabled = false;
			}
		}
	}
	else
	{	
	//alert(bigclassobj);
		if (bigclassobj!=null)
		{
			if (bigclassobj.checked)
			{
				for(var i=0;i<smallclassnum;i++)
				{
				smallclassobj[i].checked = false;	
				smallclassobj[i].disabled = true;
				}
			}
			else
			{
				for(var i=0;i<smallclassnum;i++)
				{smallclassobj[i].disabled = false;}
			}
		}
	}
}
}
//删除该大类的小类在结果中,把选中的结果是该小类的选中变为不选中
function DelThisSmallClass()
{
//var selectokobj=form3.elements("selectokcheck");
var selectokobj=document.getElementsByName("selectokcheck");
var selectokstr='';
var t;
if (selectokobj != null)
{
	var selectoknum = selectokobj.length;
	//如果结果中只有一个选中的
	if (selectoknum == undefined)
	{
		//选中结果的id
		var selectokobjchecks;
		selectokobjchecks=document.getElementsByName("selectokcheck").item(0).value.split("*");
		bb=selectokobjchecks[1]
		if (document.getElementById("smallclass").innerHTML.indexOf("smallclass"+bb)!=-1)
		{	
			document.getElementById("selectok"+bb).checked = false;
		}		
	}
	else
	{	
		for (t=0;t<selectoknum;t++)
		{
			var selectokobjcheck=selectokobj[t];
			//alert(selectokobjcheck);	
			selectokobjchecks=selectokobjcheck.value.split("*");
			bbn=selectokobjchecks.length-1;
			bb=selectokobjchecks[bbn];
			if (document.getElementById("smallclass").innerHTML.indexOf("smallclass"+bb)!=-1)
			{	
				document.getElementById("selectok"+bb).checked = false;
			}
		}
	}
}
//执行清除结果中没有选中的项
DelIsNotCheck();
}
//下面不选时上面的同时不选，且清除没有选中的
function CancelCheck(selectid)
{
if (document.getElementById("bigclass").innerHTML.indexOf("bigclass"+selectid)!=-1)
{		
	document.getElementById("bigclass"+selectid).checked = false;			
}
if (document.getElementById("smallclass").innerHTML.indexOf("smallclass"+selectid)!=-1)
{		
	document.getElementById("smallclass"+selectid).checked = false;			
}
DelIsNotCheck();
SmallClassIsDisable();
}
//清除结果中没有选中的选项
function DelIsNotCheck()
{
var selectokobj=document.getElementsByName("selectokcheck");
var selectokstr='';
var t;
if (selectokobj != null)
{
	var selectoknum = selectokobj.length;
	if (selectoknum == undefined)
	{
		//选中结果的id
		var selectokobjchecks;
		selectokobjchecks=document.getElementsByName("selectokcheck").item(0).value;	
		var selectokobjchecksid=lastTocken(selectokobjchecks);//selectokobjchecks.slice(-4);
		if (document.getElementById("selectok"+selectokobjchecksid).checked==true)
			{
				selectokstr='<input name="selectokcheck" id="selectok'+selectokobjchecksid+'" type="checkbox" value='+selectokobjchecks+' onclick="CancelCheck('+selectokobjchecksid+');" class="checkbox" checked="checked" /><label name="selectoklb" id="selectoklb'+selectokobjchecksid+'" for="selectok'+selectokobjchecksid+'">'+document.getElementById("selectoklb"+selectokobjchecksid).innerHTML+' </label>';			
			}
	}
	else
	{
		for (t=0;t<selectoknum;t++)
		{
			var selectokobjcheck=selectokobj[t];
			var selectokobjcheckv=selectokobjcheck.value
			var selectokobjcheckvid=lastTocken(selectokobjcheckv);// selectokobjcheckv.slice(-4);
			if (selectokobjcheck.checked==true)
			{
				selectokstr=selectokstr+'<input name="selectokcheck" id="selectok'+selectokobjcheckvid+'" type="checkbox" value='+selectokobjcheck.value+' onclick="CancelCheck('+selectokobjcheckvid+');" class="checkbox" checked="checked" /><label name="selectoklb" id="selectoklb'+selectokobjcheckvid+'" for="selectok'+selectokobjcheckvid+'">'+document.getElementById("selectoklb"+selectokobjcheckvid).innerHTML+' </label>';			
			}
		}
	}
	document.getElementById("selectitem").innerHTML=selectokstr;
}
}
//清空所有选中的选项
function DelAllItem()
{
//var bigclassobj=document.getElementById("bigclasscheck");
var bigclassobj=document.getElementsByName("bigclasscheck");
if (bigclassobj != null)
{
//	for (bo in bigclassobj){
//		
//		//alert(bo)
//		bigclassobj[bo].checked = false;
//		}
		for (t=0;t<bigclassobj.length;t++)
		{
			bigclassobj[t].checked = false;
		}		
	sbo=document.getElementsByName("smallclasscheck")
			for (t=0;t<sbo.length;t++)
		{
			sbo[t].disabled = false;
		}	
}
//var smallclassobj=form3.elements("smallclasscheck");
var smallclassobj=document.getElementsByName("smallclasscheck");
var t;
if (smallclassobj != null)
{
	var smallclassnum = smallclassobj.length;
	//如果结果中只有一个选中的
	if (smallclassnum == undefined)
	{
		//选中结果的id
		var smallclasschecks;
		smallclasschecks=document.getElementsByName("smallclasscheck").item(0).value;
		var smallclasschecksid=lastTocken(smallclasschecks );// smallclasschecks.slice(-4);
		document.getElementById("smallclass"+smallclasschecksid).checked = false;
	}
	else
	{	
		for (t=0;t<smallclassnum;t++)
		{
			var smallclassobjs=smallclassobj[t];
			smallclassobjs.checked = false;
		}
	}
}
document.getElementById("selectitem").innerHTML='';
}
//关闭后把内容写回页面
function CloseAndInsertHtml(fname,vname,tname){
var selectokobj=document.getElementsByName("selectokcheck");
var selectokstr='';
var closestr='';
var closestrs='';
var t;
if (selectokobj != null){
	var selectoknum = selectokobj.length;
	var selectoknums = selectokobj.length;
	if (selectoknum == undefined){
		closestr=document.getElementsByName("selectokcheck").item(0).value;
		var closestrid=lastTocken( closestr ); // closestr.slice(-4);
		closestrs=document.getElementById("selectoklb"+closestrid).innerHTML;		
	}else{
		for (t=0;t<selectoknum;t++)
		{
			var selectokobjcheck=selectokobj[t];
			var selectokobjchecks=selectokobjcheck.value;
			var selectokobjchecksid=lastTocken( selectokobjchecks ); //selectokobjchecks.slice(-4);
			if (t==selectoknums-1)
			{
				closestrs=closestrs+fnRemoveBrank(document.getElementById("selectoklb"+selectokobjchecksid).innerHTML);
				closestr=closestr+selectokobjcheck.value;
			}
			else
			{
				closestrs=closestrs+fnRemoveBrank(document.getElementById("selectoklb"+selectokobjchecksid).innerHTML)+',';
				closestr=closestr+selectokobjcheck.value+',';
			}
		}
	}

	eval("document."+fname+"."+vname+".value='"+closestr+"'");
	eval("document."+fname+"."+tname+".value='"+closestrs+"'");
	$('#'+tname).css('background-position','0 -31px'); 
	
}
else
{
//	alert('请至少选择一项');
//	return false;
	eval("document."+fname+"."+vname+".value=''");
	eval("document."+fname+"."+tname+".value=''"); 
}
unSearchLayers();
}
//关闭弹出层
function unSearchLayers(){
    var objllist=document.getElementsByTagName('select');
	for(var i=0;i<objllist.length;i++)
	{
		objllist[i].style.visibility="";
	}
    $.dialog({id: 'SearchDivhire'}).close();
}
function JumpSearchDate(fname,vname,tname){
    var objllist=document.getElementsByTagName('select');
	for(var i=0;i<objllist.length;i++)
	{
		objllist[i].style.visibility="hidden";
	} 
var dialog = $.dialog({
    id: 'SearchDivhire',
    lock: true,
    fixed: true,
    background: '#000', // 背景色
    opacity: 0.6,	// 透明度
    title: '请选择查询日期',
    width:560,
    content: SearchDivcode
});
document.getElementById("bigclass").style.display = "none";
document.getElementById("smallclass").style.display = "none";
document.getElementById("checktitle").style.display = "none";
document.getElementById("selectitem").style.display = "none";
document.getElementById("selectok").style.display = "none";
str='';
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="1";document.'+fname+'.'+vname+'.value="近一天";unSearchLayers();>·近一天</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="2";document.'+fname+'.'+vname+'.value="近两天";unSearchLayers();>·近两天</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="3";document.'+fname+'.'+vname+'.value="近三天";unSearchLayers();>·近三天</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="7";document.'+fname+'.'+vname+'.value="近一周";unSearchLayers();>·近一周</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="14";document.'+fname+'.'+vname+'.value="近两周";unSearchLayers();>·近两周</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="30";document.'+fname+'.'+vname+'.value="近一月";unSearchLayers();>·近一月</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="42";document.'+fname+'.'+vname+'.value="近六周";unSearchLayers();>·近六周</li>'
str+='<li style="float:left;width:170px;height:20px;cursor:pointer;" onmouseover=this.style.background="#F1F8FC" onmouseout=this.style.background="" onclick=document.'+fname+'.'+tname+'.value="60";document.'+fname+'.'+vname+'.value="近两月";unSearchLayers();>·近两月</li>'
document.getElementById("changbox").innerHTML=str;
}
function fnRemoveBrank(strSource)
{
return strSource.replace(/^\s*/,'').replace(/\s*$/,'');
}
function lastTocken( str )
{ 
	var strArray = str.split("*");
	 if(strArray.length>0){
	 	return strArray[ strArray.length-1 ];
	 }else{
	 	return '';
	 }
}