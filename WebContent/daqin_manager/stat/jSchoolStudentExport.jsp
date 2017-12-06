<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="jxl.*"%>
<%@ page import="jxl.format.Alignment"%>
<%@ page import="jxl.format.Border"%>
<%@ page import="jxl.format.BorderLineStyle"%>
<%@ page import="jxl.format.CellFormat"%>
<%@ page import="jxl.write.Boolean"%>
<%@ page import="jxl.write.Label"%>
<%@ page import="jxl.write.Number"%>
<%@ page import="jxl.write.WritableCellFormat"%>
<%@ page import="jxl.write.WritableFont"%>
<%@ page import="jxl.write.WritableSheet"%>
<%@ page import="jxl.write.WritableWorkbook"%>
<%@ page import="cn.com.zhaopin.base.pub.CreateID" %>
<%@ page import="com.zhaopin.dao.CacheModel" %>
<%
String where="";
String area_id = request.getParameter("area_id");
if( area_id !=null ){
	where =" and b.area_id='"+area_id+"'";
}
String sql=" select t1.school_name,t1.counts,t2.counts orders,t3.counts downs,t4.counts views from ( "+
		" select a.school_name,count(*) counts from tbl_student a "+
		" left join tbl_school b on a.school_name = b.school_name "+
		" where 1=1 "+where+" group by a.school_name ) t1 "+ 
		" left join ( "+
		" select a.school_name,count(*) counts from tbl_person_order c "+
		" left join tbl_student a on c.student_id=a.student_id "+
		" left join tbl_school b on a.school_name = b.school_name "+
		" where 1=1 "+where+" group by a.school_name ) t2 on t1.school_name=t2.school_name "+
		" left join ( "+
		" select a.school_name,count(*) counts from tbl_person_order_down c "+
		" left join tbl_student a on c.student_id=a.student_id "+
		" left join tbl_school b on a.school_name = b.school_name "+
		" where 1=1 "+where+" group by a.school_name ) t3 on t1.school_name=t3.school_name "+
		" left join ( "+
		" select a.school_name,count(*) counts from tbl_person_interview c "+
		" left join tbl_student a on c.student_id=a.student_id "+
		" left join tbl_school b on a.school_name = b.school_name "+
		" where 1=1 "+where+" group by a.school_name ) t4 on t1.school_name=t4.school_name "+
		" order by t1.counts desc ";

String job_fair_name =com.zhaopin.Station.getStationName(area_id)+"学校注册学生及就业意向统计";
List list = new CacheModel().queryList( sql );
String[] title = { "学校","注册学生(人)", "投递简历(次)", "下载简历(次)", "就业意向(次)"};
String filePath ="/upload/schoolStudent/"+
					CreateID.returnID("fun_down_xls_id")+".xls";
// 输出的excel的路径
String realPath = this.getServletContext().getRealPath( filePath );
// request.getRealPath(filePath);
try {
	// 获得开始时间
	long start = System.currentTimeMillis();
	// 创建Excel工作薄
	WritableWorkbook wwb;
	// 新建立一个jxl文件,即在e盘下生成testJXL.xls
	OutputStream os = new FileOutputStream(realPath);
	wwb = Workbook.createWorkbook(os);
	// 添加第一个工作表并设置第一个Sheet的名字
	WritableSheet sheet = wwb.createSheet("参会企业列表", 0);
	Label label;
	
	sheet.mergeCells(0, 0, 4, 0);
	label = new Label(0, 0, job_fair_name);
	sheet.addCell(label);
	
	WritableCellFormat wc = new WritableCellFormat();
	// 设置居中
	wc.setAlignment(Alignment.CENTRE);
	// 设置边框线
	wc.setBorder(Border.ALL, BorderLineStyle.THIN);
	// 设置单元格的背景颜色
	wc.setBackground(jxl.format.Colour.LIGHT_GREEN );

	for (int i = 0; i < title.length; i++) {
		// Label(x,y,z) 代表单元格的第x+1列，第y+1行, 内容z
		// 在Label对象的子对象中指明单元格的位置和内容
		label = new Label(i, 1, title[i],wc);
		// 将定义好的单元格添加到工作表中
		sheet.addCell(label);
	}
	if(list!=null && list.size()>0 )
	{
		for(int i=0; i<list.size(); i++ )
		{
			List row = (List)list.get(i);
			if(row!=null & row.size()>0)
			{
				for(int j=0;j<row.size(); j++)
				{
					label = new Label(j,i+2,(String)row.get(j) );
					sheet.addCell(label);
				}
			}
		}
	}

	// 写入数据
	wwb.write();
	// 关闭文件
	wwb.close();
	long end = System.currentTimeMillis();
	// System.out.println("----完成该操作共用的时间是:" + (end - start) / 1000);
	// response.sendRedirect(request.getContextPath()+filePath);
} catch (Exception e) {
	System.out.println("---出现异常---");
	e.printStackTrace();
}

//下载文件
response.setContentType("text/html; charset=UTF-8");
	//得到下载文件的名字
//String filename=request.getParameter("filename");
//解决中文乱码问题
//String filename=new String(request.getParameter("filename").getBytes("iso-8859-1"),"gbk");
// File file=new File("F://book//WebRoot//"+filename);
String filename=job_fair_name+".xls";
File file=new File(realPath);
if( !file.isDirectory() && file.exists() )
{
    //设置response的编码方式
    response.setContentType("application/x-msdownload");
    //写明要下载的文件的大小
    response.setContentLength((int)file.length());
    //设置附加文件名
    // response.setHeader("Content-Disposition","attachment;filename="+filename);
    response.setHeader("Content-Disposition","attachment;filename="+
    new String( filename.getBytes("gbk"),"iso-8859-1"));  
    
	//读出文件到i/o流
    FileInputStream fis=new FileInputStream(file);
    BufferedInputStream buff=new BufferedInputStream(fis);
     byte [] b=new byte[1024];//相当于我们的缓存
	long k=0;//该值用于计算当前实际下载了多少字节
	
    //从response对象中得到输出流,准备下载

    OutputStream myout=response.getOutputStream();
    //开始循环下载
    while(k<file.length()){
        int j=buff.read(b,0,1024);
        k+=j;
        //将b中的数据写到客户端的内存
        myout.write(b,0,j);
    }
    //将写入到客户端的内存的数据,刷新到磁盘
    myout.flush();
    out.clear(); 
	out = pageContext.pushBody();
}else{
	response.sendRedirect( request.getContextPath() );
}
%>