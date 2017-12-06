<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="cn.com.zhaopin.base.pub.cCharControl" %>
<%
		// /file/download.jsp?filename=211校招网用户协议.docx
		
		HashMap<String,String> map = new HashMap<String,String>(){
			{
				put("register.docx","211校招网用户协议.docx");
				put("apply.docx","高校开通使用申请表.docx");
				put("schoolgrad.xls","毕业生信息导入模板.xls");
				put("readme_sch.pptx","高校会员使用说明.pptx");
				put("readme-com.pptx","企业会员使用说明.pptx");
				
				put("zhonghangfeiji.doc","中航飞机股份有限公司西安飞机分公司应聘人员基本信息表.doc");
			}
		};
		String dir="";
		String filename="";
		//得到下载文件的名字
        if(request.getParameter("filename")!=null )
        {
        	 //解决中文乱码问题
        	//filename=new String(request.getParameter("filename").getBytes("iso-8859-1"),"GBK");
        	filename=cCharControl.ISOtoUTF8( request.getParameter("filename") );
			dir ="/file/doc";
			//String realPath = request.getRealPath(dir);
			String realPath = request.getSession().getServletContext().getRealPath(dir);
	        // File file=new File("F://book//WebRoot//"+filename);
			File file=new File(realPath+"/"+filename);
			//System.out.println( file.getCanonicalPath() );
			//System.out.println( new File(realPath).getCanonicalPath() );
			if( !file.getCanonicalPath().startsWith( new File(realPath).getCanonicalPath() ) ){
				out.println("参数错误");
				return;
			}
			if( !file.isDirectory() && file.exists() )
			{
				response.setContentType("text/html; charset=UTF-8");
		        //设置response的编码方式
		        response.setContentType("application/x-msdownload");
		        //写明要下载的文件的大小
		        response.setContentLength((int)file.length());
		        //设置附加文件名
		        // response.setHeader("Content-Disposition","attachment;filename="+filename);
		        filename=map.get(filename)!=null?(String)map.get(filename):filename;
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
		        try{
		        	myout.flush();
		        }catch(IOException e){
		        	
		        }
		        out.clear(); 
				out = pageContext.pushBody();
			}else{
				out.println(filename+"不存在，或已经删除");
				return;
			}
        }else{
        	response.sendRedirect( request.getContextPath() );
        }
 %>