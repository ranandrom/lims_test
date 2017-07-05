<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.anchordx.image.*" %>
<%@ page import="java.io.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String)session.getAttribute("username");
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}
	
	String filepath = application.getRealPath("."); //取得目录在服务器端的实际位置
	File result_forDoctor = new File(username+"_xxx_forDoctor.png");
	String forDoctor = username+"_xxx_forDoctor.png";	
	//加载最新图片
	Image image = new Image();
	//报告给医生的风险图
	/*int i = image.GetImage(filepath+"/images/Tumor.risk.prediction.chart/"+result_forDoctor, "image", username);
	//System.out.println("加载最新图片");
	if (i!=0){
		System.out.println("图片加载失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/Submission_failure.jsp");
	}*/
	try {
		image.GetImage(filepath+"/images/Tumor.risk.prediction.chart/"+result_forDoctor, "image", username);
	} catch (Exception e) {
		//e.printStackTrace();
		System.out.println(forDoctor+"图片加载失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/ImageGet_failure.jsp");
	}
	
	//报告给患者的风险图
	File result_forPatient = new File(username+"_xxx_forPatient.png");
	String forPatient = username+"_xxx_forPatient.png";	
	//加载最新图片
	/*int ii = image.GetImage(filepath+"/images/Tumor.risk.prediction.chart/"+result_forPatient, "html", username);
	System.out.println("加载最新图片");
	if (ii!=0){
		System.out.println("图片加载失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/Submission_failure.jsp");
	}*/
	try {
		 image.GetImage(filepath+"/images/Tumor.risk.prediction.chart/"+result_forPatient, "html", username);
	} catch (Exception e) {
		//e.printStackTrace();
		System.out.println(forPatient+"图片加载失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/ImageGet_failure.jsp");
	}
%>