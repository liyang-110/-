<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     <%
 Map res = (Map)request.getAttribute("resMap");
 List list = (List)res.get("queryresult");
  StringBuffer x=new StringBuffer();
 StringBuffer y1=new StringBuffer();
 StringBuffer y2=new StringBuffer();
 StringBuffer y3=new StringBuffer();
 StringBuffer y4=new StringBuffer();
for( Object row : list ){
	List r =(List)row;
	x.append("'").append( r.get(0) ).append("',");
	y1.append( r.get(1) ).append(",");
	y2.append( r.get(2) ).append(",");
	y3.append( r.get(3) ).append(",");
	y4.append( r.get(4) ).append(",");
}
/*
out.println(x+"<br/>");
out.println(y1+"<br/>");
out.println(y2+"<br/>");
*/
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jStatistics.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="daqin_manager/stat/chart/raphael-min.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="daqin_manager/stat/chart/raphael.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/g.raphael.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/g.bar.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/g.line.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/g.pie.js"></script>
<script type="text/javascript" src="daqin_manager/stat/chart/g.dot.js"></script>

<script type="text/javascript">
var options = {
	axis: "0 0 1 1", // Where to put the labels (trbl)
	axisxstep: 14, // How many x interval labels to render (axisystep does the same for the y axis)
	axisxlables: [<%=x%>],
	shade:false, // true, false
	smooth:false, //曲线
	symbol:"circle"
};

$(function () {
	var r = Raphael("chartHolder"); 
	var lines = r.linechart(
		20, // X start in pixels
		20, // Y start in pixels
		900, // Width of chart in pixels
		250, // Height of chart in pixels
		[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
		 [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
		 [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
		 [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
		], // Array of x coordinates equal in length to ycoords
		[[<%=y1%>],
		 [<%=y2%>],
		 [<%=y3%>],
		 [<%=y4%>]
		], // Array of y coordinates equal in length to xcoords
		options // opts object
	).hoverColumn(function () {
		/*
        this.tags = r.set();
        for (var i = 0, ii = this.y.length; i < ii; i++) {
            this.tags.push(r.tag(this.x, this.y[i], this.values[i], 160, 10).insertBefore(this).attr([{ fill: "#fff" }, { fill: this.symbols[i].attr("fill") }]));
        }
        */
        this.tags = r.set();

		var box_x = this.x, box_y = 30,
			box_w = 100, box_h = 70;
		if (box_x + box_w > r.width) box_x -= box_w;
		var box = r.rect(box_x,box_y,box_w,box_h).attr({stroke: "#f00", "stroke-width": 1, r:5});
		this.tags.push(box);
		var label =['注册学生','投递简历','处理简历','下载简历']
        for (var i = 0; i < this.y.length; i++) {
			//this.tags.push(r.blob(this.x, this.y[i], "$"+this.values[i]).insertBefore(this).attr([{ fill: "#ffa500", stroke: "#000"}, { fill: this.symbols[i].attr("fill") }]));
        	var t = r.text(box_x+50, box_y+10 + i*16,label[i]+" : "+this.values[i]).attr({fill: this.symbols[i].attr("fill")})
        	this.tags.push(t);
        }
    }, function () {
        this.tags && this.tags.remove();
    });
    lines.symbols.attr({ r: 6 });//曲线上的点半径大小
});
</script>

  </head>
  
  <body>

    <br>
      <div id="chartHolder" style="width:950px;height:280px;overflow:hidden;z-index:1;"></div>

<h2 style="font-size:14px;line-height:20px;">
	<span>统计表说明:</span>
	<span style="color:#2F69BF;">学生注册人数，</span>
	
	<span style="color:#A6C23B;">简历投递量，</span>
	<span style="color:#BF5A2F;">简历处理量，</span>
	<span style="color:#BFA22F;">简历下载量.</span>
	</h2>

  </body>
</html>
