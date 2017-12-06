<%@page import="com.zhaopin.dao.factory.PersonInterviewModel"%>
<%@page import="com.zhaopin.dao.factory.JobFairModel"%>
<%@page import="java.text.DecimalFormat"%>
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
		HashMap jobfair=   new JobFairModel().getJobFairInfo(job_fair_id, false );
		if( jobfair == null ){
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
		
		List result = new PersonInterviewModel().interviewResultOfSucceed(job_fair_id);
		String[] thead=
			{
				"面试状态",
				"姓名",
				"性别",
				"学校",
				"专业",
				"招聘单位"
			};
		
		String job_fair_name =jobfair.get("job_fair_date").toString()
					+jobfair.get("job_fair_name").toString();
		
		String filePath ="/upload/attendCompany/"+
							CreateID.returnID("fun_down_xls_id")+".xls";
		String realPath = this.getServletContext().getRealPath( filePath );
		try {
			OutputStream os = new FileOutputStream(realPath);
			
			String template = this.getServletContext().getRealPath("/upfiles/netcongress-report.xlt");
			Workbook wb = Workbook.getWorkbook(new File( template ));
			WritableWorkbook wwb = Workbook.createWorkbook(os, wb);

			WritableSheet sheet = wwb.getSheet("汇总报表");
			Label label;
			//招聘会名称
			label = (Label)sheet.getWritableCell(0,0);
			label.setString( job_fair_name );
			//参会企业
			label = (Label)sheet.getWritableCell(1,1);
			label.setString( map.get("company_num").toString() );
			//国企
			label = (Label)sheet.getWritableCell(3,1);
			label.setString( map.get("nature_01").toString() );
			//事业单位
			label = (Label)sheet.getWritableCell(3,2);
			label.setString( map.get("nature_05").toString() );
			//私企
			label = (Label)sheet.getWritableCell(3,3);
			label.setString( map.get("nature_02").toString() );
			//外企
			label = (Label)sheet.getWritableCell(3,4);
			label.setString( map.get("nature_03").toString() );
			//其他
			//label = (Label)sheet.getWritableCell(3,5);
			//label.setString( map.get("nature_07").toString() );
			//招聘职位
			//label = (Label)sheet.getWritableCell(1,6);
			//label.setString( map.get("recruit_count").toString() );
			//就业岗位
			label = (Label)sheet.getWritableCell(1,6);
			label.setString( map.get("person_num").toString() );
			//入场求职
			label = (Label)sheet.getWritableCell(1,7);
			label.setString( map.get("resume_size").toString() );
			try{
				String student = map.get("student").toString();
				String boy = map.get("男").toString();
				String girl = map.get("女").toString();
				double boyPercent = Double.parseDouble( boy ) / Double.parseDouble( student );
				double girlPercent = Double.parseDouble( girl ) / Double.parseDouble( student );
				DecimalFormat df = new DecimalFormat();
				df.applyPattern("##.##%"); 
				//男
				label = (Label)sheet.getWritableCell(3,7);
				label.setString( df.format( boyPercent ) );
				//女
				label = (Label)sheet.getWritableCell(3,8);
				label.setString( df.format( girlPercent ) );
			}catch(Exception e){
				
			}
			try{
				String level = map.get("level").toString();
				String level_01= map.get("level_01").toString();
				String level_02=map.get("level_02").toString();
				double level01Percent = Double.parseDouble(level_01)/Double.parseDouble(level);
				double level02Percent =	Double.parseDouble(level_02)/Double.parseDouble(level);
				double level03Percent =	1-level01Percent-level02Percent;
				DecimalFormat df = new DecimalFormat();
				df.applyPattern("##.##%"); 
				
				//研究生
				label = (Label)sheet.getWritableCell(3,9);
				label.setString( df.format( level01Percent ) );
				//本科
				label = (Label)sheet.getWritableCell(3,10);
				label.setString( df.format( level02Percent ) );
				//高职
				label = (Label)sheet.getWritableCell(3,11);
				label.setString( df.format( level03Percent ) );
				
			}catch(Exception e){
				
			}

			
			//累计投递简历
			label = (Label)sheet.getWritableCell(1,12);
			label.setString( map.get("status_6").toString() );
			
			//简历未通过
			//label = (Label)sheet.getWritableCell(3,13);
			//label.setString( map.get("status_1").toString() );
			//简历待处理
			//label = (Label)sheet.getWritableCell(3,15);
			//label.setString( map.get("status_0").toString() );
			
			//达成就业意向
			label = (Label)sheet.getWritableCell(1,13);
			label.setString( map.get("view_6").toString() );
			//通过初试
			//label = (Label)sheet.getWritableCell(3,13);
			//label.setString( map.get("view_2").toString() );
			//label = (Label)sheet.getWritableCell(3,14);
			//label.setString( map.get("view_4").toString() );
			//label = (Label)sheet.getWritableCell(3,15);
			//label.setString( map.get("view_5").toString() );
			//本校/非本校
			label = (Label)sheet.getWritableCell(3,13);
			label.setString( map.get("school_1").toString() );
			label = (Label)sheet.getWritableCell(3,14);
			label.setString( map.get("school_0").toString() );
			/***********************************/
			sheet = wwb.getSheet("就业意向明细");
			WritableCellFormat wc = new WritableCellFormat();
			// 设置居中
			wc.setAlignment(Alignment.CENTRE);
			// 设置边框线
			wc.setBorder(Border.ALL, BorderLineStyle.THIN);
			// 设置单元格的背景颜色
			wc.setBackground(jxl.format.Colour.LIGHT_GREEN );
			wc.setVerticalAlignment( VerticalAlignment.CENTRE );
			
			for(int i=0;i<thead.length;i++ ){
				sheet.setColumnView(i, 25 );
				label = new Label(i, 0,thead[i] ,wc );
				sheet.addCell(label);
			}
			for(int j=0;j<result.size();j++ ){
				List row = (List)result.get(j);
				for(int i=0;i<row.size();i++){
					label = new Label(i,j+1, row.get(i)==null?"":row.get(i).toString() );
					sheet.addCell(label);
				}
			}
			/***********************************/
			// 写入数据
			wwb.write();
			// 关闭文件
			wwb.close();
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
