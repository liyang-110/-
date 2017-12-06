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
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="it.sauronsoftware.base64.Base64" %>

<%
		request.setCharacterEncoding("UTF-8");
		String path=request.getParameter("path");
		String dir=URLDecoder.decode(path,"UTF-8");
		String extName = dir.lastIndexOf(".")>0?dir.substring(dir.lastIndexOf(".")+1):"";

		String name=request.getParameter("name");

		String filename= new String( name.getBytes("ISO-8859-1"),"UTF-8")+"."+extName;
				 // URLDecoder.decode(name,"UTF-8");
				 // filename = Base64.decode(name,"UTF-8")+"."+extName;

		//String realPath = request.getSession().getServletContext().getRealPath(dir);
		String realPath = com.zhaopin.Settings.SAVE_FILE_PATH + "../"+dir;
		File file=new File(realPath);
		// System.out.println( file.getCanonicalPath() );
		if( !com.zhaopin.Settings.checkUploadPermition(file) ){
			out.println("文件格式错误");
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
	        //filename=map.get(filename)!=null?(String)map.get(filename):filename;
	        response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(filename,"UTF-8"));
	        // new String( filename.getBytes("gb2312"),"ISO-8859-1") );  
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
			
		}
 %>