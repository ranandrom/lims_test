<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	String username = (String)session.getAttribute("username");
	
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}
%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
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
		<meta http-equiv="refresh" content ="5;url=<%=basePath%>jsp/welcome/homepage.jsp"> 
		<!-- 
			<link rel="stylesheet" type="text/css" href="styles.css"> 
		--> 
	</head> 
 
	<body> 
		<div class="alert alert-warning">
               <button type="button" class="close" data-dismiss="alert"></button>
               <h6 class="alert-heading">很抱歉，您提交的请求任务系统目前还没分析完成，请耐心等待，若有其他问题，请联系系统管理员！！！</h6>
        </div>
	</body> 
</html>