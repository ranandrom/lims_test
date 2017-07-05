<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="com.anchordx.receivefiles.*" %>
<%@ page import="com.anchordx.image.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String)session.getAttribute("username");	
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}

	String tempFile = new String(request.getParameter("newcontext").getBytes("iso-8859-1"), "utf-8");

	try{
		String filepath = application.getRealPath("."); //取得目录在服务器端的实际位置
		File result = new File(username+"_config.txt");
		BufferedWriter bw = null;
		FileWriter fw = null;
		System.out.println("outputfile = " + filepath);
		//fw = new FileWriter(filepath+"/"+result);
		fw = new FileWriter(filepath+"/config/"+result);
		bw = new BufferedWriter(fw);
		// 进行普通IO操作
		String tempFile_data[] = tempFile.split("\n");
		for (int i = 0 ; i < tempFile_data.length; i++ ){
			if (!tempFile_data[i].contains("\t") &&  tempFile_data[i] != "\n") {
				bw.write(tempFile_data[i]);
				bw.write("\r\n");
			}
		}		
		bw.close();
		fw.close();
		
		//把文件放到数据里
		Image image = new Image();
		int i = image.InsertImage(filepath+"/config/"+result, "config", username);
		if (i!=0){
			System.out.println("提交失败！");
			response.sendRedirect(basePath+"jsp/MethylationAnalysis/Submission_failure.jsp");
		}

	} catch (Exception e) { 
		// TODO Auto-generated catch block 
		//e.printStackTrace();
		System.out.println("提交失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/Submission_failure.jsp");
	}
%>

<html> 
	<head> 
		<base href="<%=basePath%>"> 
	  
		<title>测序分析-基准医疗甲基化测序分析系统</title> 
		<link href="<%=basePath%>css/MethylationAnalysis/bootstrap.min.css" rel="stylesheet">
	  
		<meta http-equiv="pragma" content="no-cache"> 
		<meta http-equiv="cache-control" content="no-cache"> 
		<meta http-equiv="expires" content="0">  
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
		<meta http-equiv="description" content="This is test page">
		<meta http-equiv="refresh" content ="3;url=<%=basePath%>jsp/MethylationAnalysis/TaskSubmission.jsp"> 
		<!-- 
			<link rel="stylesheet" type="text/css" href="styles.css"> 
		--> 
	</head> 
 
	<body> 
		<div class="alert alert-info">
               <button type="button" class="close" data-dismiss="alert"></button>
               <h6 class="alert-heading">恭喜您，您的请求任务系统已正确为您提交到服务器运算，请耐心等待结果......</h6>
        </div>
	</body> 
</html>
