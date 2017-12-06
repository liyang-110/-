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
<%@ page import="jxl.format.VerticalAlignment"%>
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
<%
		Map res = (Map)request.getAttribute("resMap");
		/*
		System.out.println(new StringBuilder(String.valueOf(request
								.getContextPath())).append("/")
								.append("../school/exportExcel.jsp").toString() );
		*/						
		//int counts=Integer.parseInt( (String)res.get("querycount") );		
		String job_fair_name =(String)res.get("querycount");
		List list = (List)res.get("queryresult");
		String[] title = { "序号", "客户经理","地区","会员类型", "单位名称","备注1",
						   "备注2","签到",
						   "招聘职位", "就业岗位", "需求专业", "联系人", "电话", "邮箱","申请时间","审核时间","企业类型"};
		String filePath ="/upload/attendCompany/"+
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
			WritableCellFormat wc = new WritableCellFormat();
			wc.setAlignment(Alignment.CENTRE);
			wc.setVerticalAlignment( VerticalAlignment.CENTRE );
			sheet.mergeCells(0, 0,7, 0);
			label = new Label(0, 0, job_fair_name,wc);
			sheet.addCell(label);
			
			wc = new WritableCellFormat();
			// 设置居中
			wc.setAlignment(Alignment.CENTRE);
			// 设置边框线
			wc.setBorder(Border.ALL, BorderLineStyle.THIN);
			// 设置单元格的背景颜色
			wc.setBackground(jxl.format.Colour.LIGHT_GREEN );
			wc.setVerticalAlignment( VerticalAlignment.CENTRE );

			for (int i = 0; i < title.length; i++) {
				// Label(x,y,z) 代表单元格的第x+1列，第y+1行, 内容z
				// 在Label对象的子对象中指明单元格的位置和内容
				label = new Label(i, 1, title[i],wc);
				// 将定义好的单元格添加到工作表中
				sheet.addCell(label);
			}
			sheet.setRowView(0,30, false);
			sheet.setRowView(1,30, false);
			wc = new WritableCellFormat();
			// 设置居中
			wc.setAlignment(Alignment.CENTRE);
			// 设置边框线
			wc.setBorder(Border.ALL, BorderLineStyle.THIN);
			// 设置单元格的背景颜色
			wc.setBackground(jxl.format.Colour.WHITE  );
			wc.setVerticalAlignment( VerticalAlignment.CENTRE );
			wc.setWrap(true);
			if(list!=null && list.size()>0 )
			{
				for(int i=0; i<list.size(); i++ )
				{
					sheet.setColumnView(i, 20);
					List row = (List)list.get(i);
					if(row!=null & row.size()>0)
					{
						for(int j=0;j<row.size(); j++)
						{
							String value="";
							try{
								value=(String)row.get(j);
							}catch(Exception e){
							}
							label = new Label(j,i+2, value,wc);
							sheet.addCell(label);
							sheet.setRowView(i+2,50, false);
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
