<%@page import="com.zhaopin.dao.factory.HashMapFactory"%>
<%@page import="com.zhaopin.dao.Model"%>
<%@page import="jxl.format.VerticalAlignment"%>
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
<%@ page import="com.zhaopin.bean.*" %>
<%
	UserInterface user = User.currentUser(session);
	if(!( user instanceof AdUserBean )){
		response.sendRedirect("/");
	}
%>
<%
		Model model = new Model();
		List list;
		String job_fair_id = request.getParameter("id");
		if( job_fair_id == null ){
			response.sendError(404);
		}
		String[] params=new String[1];
		params[0]=job_fair_id;
		list = model.queryProcMap("pro_netcongress_report",params );
		
		HashMap m = new HashMap();
		if( list != null && list.size()>0 ){
			for(Iterator it=list.iterator();it.hasNext();){
				HashMap row = (HashMap)it.next();
				m.put( row.get("key"), row.get("value") );
			}
		}
		HashMapFactory map = new HashMapFactory( m,"0");
		//System.out.println( list.toString() );
		//int counts=Integer.parseInt( (String)res.get("querycount") );		
		String job_fair_name ="name";
		
		String filePath ="/upload/attendCompany/"+
							CreateID.returnID("fun_down_xls_id")+".xls";
		// 输出的excel的路径
		String realPath = this.getServletContext().getRealPath( filePath );
		// request.getRealPath(filePath);
		try {
			OutputStream os = new FileOutputStream(realPath);
			
			String template = this.getServletContext().getRealPath("/upfiles/netcongress-report.xlt");
			Workbook wb = Workbook.getWorkbook(new File( template ));
			WritableWorkbook wwb = Workbook.createWorkbook(os, wb);
			
			// 创建Excel工作薄
			//WritableWorkbook wwb;			
			//wwb = Workbook.createWorkbook(os);
			
			// 添加第一个工作表并设置第一个Sheet的名字
			//WritableSheet sheet = wwb.createSheet("参会企业列表", 0);
			WritableSheet sheet = wwb.getSheet("sheet1");
			Label label;
			// 设置单元格的背景颜色
			//wc.setBackground(jxl.format.Colour.LIGHT_GREEN );
			/*标题*/
			//sheet.mergeCells(0, 0, 3, 0);
			//label = new Label(0, 0, "2016年3月22日");
			//sheet.addCell(label);
			
			label = (Label)sheet.getWritableCell(0,0);
			label.setString("这里是招聘会名称");
			
			//sheet.mergeCells(0, 1, 0, 5 );
			//label = new Label(0, 1, "参会企业");
			//sheet.addCell(label);
			
			//sheet.mergeCells(1, 1, 1, 5 );
			label = new Label(1, 1,map.get("company_num").toString());
			sheet.addCell(label);
			/*
			label = new Label(2, 1, "国企");
			sheet.addCell(label);
			label = new Label(2, 2, "事业单位");
			sheet.addCell(label);
			label = new Label(2, 3, "私企");
			sheet.addCell(label);
			label = new Label(2, 4, "外企");
			sheet.addCell(label);
			label = new Label(2, 5, "其他");
			sheet.addCell(label);
			*/
			label = new Label(3, 1, map.get("nature_01").toString());
			sheet.addCell(label);
			label = new Label(3, 2, map.get("nature_05").toString());
			sheet.addCell(label);
			label = new Label(3, 3, map.get("nature_02").toString());
			sheet.addCell(label);
			label = new Label(3, 4, map.get("nature_03").toString());
			sheet.addCell(label);
			label = new Label(3, 5, map.get("nature_07").toString());
			sheet.addCell(label);
			
			//label = new Label(0, 6, "招聘职位");
			//sheet.addCell(label);
			//label = new Label(0, 7, "就业岗位");
			//sheet.addCell(label);
			
			label = new Label(1, 6, map.get("recruit_count").toString());
			sheet.addCell(label);
			label = new Label(1, 7, map.get("person_num").toString());
			sheet.addCell(label);
			/*
			label = new Label(2, 6, "");
			sheet.addCell(label);
			label = new Label(2, 7, "");
			sheet.addCell(label);
			label = new Label(3, 6, "");
			sheet.addCell(label);
			label = new Label(3, 7, "");
			sheet.addCell(label);
			*/
			//sheet.mergeCells(0, 8, 0, 12 );
			//label = new Label(0, 8, "入场求职");
			//sheet.addCell(label);
			
			//sheet.mergeCells(1, 8, 1, 12 );
			label = new Label(1, 8,map.get("resume_size").toString());
			sheet.addCell(label);
			/*
			label = new Label(2, 8, "男");
			sheet.addCell(label);
			label = new Label(2, 9, "女");
			sheet.addCell(label);
			label = new Label(2, 10, "研究生");
			sheet.addCell(label);
			label = new Label(2, 11, "本科");
			sheet.addCell(label);
			label = new Label(2, 12, "高职");
			sheet.addCell(label);
			*/
			label = new Label(3, 8, "1");
			sheet.addCell(label);
			label = new Label(3, 9, "2");
			sheet.addCell(label);
			label = new Label(3, 10, "3");
			sheet.addCell(label);
			label = new Label(3, 11, "4");
			sheet.addCell(label);
			label = new Label(3, 12, "5");
			sheet.addCell(label);
			//累计投递简历
			//sheet.mergeCells(0, 13, 0, 15 );
			//label = new Label(0, 13, "累计投递简历");
			//sheet.addCell(label);
			
			//sheet.mergeCells(1, 13, 1, 15 );
			label = new Label(1, 13,map.get("status_6").toString());
			sheet.addCell(label);
			
			label = new Label(2, 13, "简历未通过");
			sheet.addCell(label);
			label = new Label(2, 14, "简历通过审核");
			sheet.addCell(label);
			label = new Label(2, 15, "简历待处理");
			sheet.addCell(label);
			
			label = new Label(3, 13,map.get("status_1").toString());
			sheet.addCell(label);
			//label = new Label(3, 14, "x");
			//sheet.addCell(label);
			label = new Label(3, 15,map.get("status_0").toString());
			sheet.addCell(label);
			/*
			sheet.mergeCells(0, 16, 0, 18 );
			label = new Label(0, 16, "达成就业意向");
			sheet.addCell(label);
			*/
			//sheet.mergeCells(1, 16, 1, 18 );
			label = new Label(1, 16, "0");
			sheet.addCell(label);
			/*
			label = new Label(2, 16, "进入初试");
			sheet.addCell(label);
			label = new Label(2, 17, "加入复试");
			sheet.addCell(label);
			label = new Label(2, 18, "当场录用");
			sheet.addCell(label);
			*/
			label = new Label(3, 16, "1");
			sheet.addCell(label);
			label = new Label(3, 17, "2");
			sheet.addCell(label);
			label = new Label(3, 18, "3");
			sheet.addCell(label);
			/*
			sheet.setRowView(0,30, false );
			sheet.setColumnView(0, 20);
			sheet.setColumnView(1, 20);
			sheet.setColumnView(2, 20);
			sheet.setColumnView(3, 20);
			*/
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
