<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="com.anchordx.receivefiles.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String)session.getAttribute("username");	
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}

	String tempFile = new String(request.getParameter("newcontext").getBytes("iso-8859-1"), "utf-8");
	//String tempFile = request.getParameter("newcontext");
	//Socket socket = null;
	try{
		/*socket = new Socket("192.168.10.5" , 30000);
		// 将Socket对应的输出流包装成PrintStream
		PrintStream pss = new PrintStream(socket.getOutputStream());
		// 进行普通IO操作()发送用户名
		pss.println(username);*/
		String filepath = application.getRealPath("."); //取得目录在服务器端的实际位置
		//String filepath = "D:\\myfile\\lims\\";
		//String filepath = basePath;
		File result = new File("config.txt");
		BufferedWriter bw = null;
		FileWriter fw = null;
		//String outputfile = "/WEB-INF/configtxt/"+username+"_config.html";
		//String outputfile = "/WEB-INF/configtxt/"+username+"_config.html";
		System.out.println("outputfile = " + filepath);
		//fw = new FileWriter(filepath+"/"+result);
		fw = new FileWriter(filepath+"/html/"+result);
		bw = new BufferedWriter(fw);
		//System.out.println("outputfile = " + outputfile);
		// 进行普通IO操作
		String tempFile_data[] = tempFile.split("\n");
		for (int i = 0 ; i < tempFile_data.length; i++ ){
			if (!tempFile_data[i].contains("\t") &&  tempFile_data[i] != "\n") {
				// 将Socket对应的输出流包装成PrintStream
				//PrintStream ps = new PrintStream(socket.getOutputStream());
				// 进行普通IO操作
				//ps.println(tempFile_data[i]);
				//bw.write(new String(tempFile_data[i].getBytes("utf-8"), "utf-8"));
				bw.write(tempFile_data[i]);
				bw.write("\r\n");
				//System.out.println("tempFile_data[i] = " + tempFile_data[i]);
			}
		}	
		/*// 将Socket对应的输入流包装成BufferedReader
		BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream(),"UTF-8"));
		// 进行普通IO操作
		String line = br.readLine();
		System.out.println("来自服务器的数据：" + line);
		// 关闭输入流、socket
		br.close();
		socket.close();*/
		
		bw.close();
		fw.close();
		
		//response.sendRedirect(basePath+"jsp/MethylationAnalysis/"+outputfile);
		
		//接收文件
		//ReceiveFiles rf = new ReceiveFiles();
		//String htmlpath = basePath+"html/";
		//String htmlpath = "D:\\Workspaces\\javaproject\\lims_test\\WebContent\\html\\";
		//String pngpath = basePath+"images/Tumor.risk.prediction.chart/";
		//String pngpath = "D:\\Workspaces\\javaproject\\lims_test\\WebContent\\images\\Tumor.risk.prediction.chart\\";
		//ReceiveFiles.fileStorage(htmlpath, pngpath);
		// TODO Auto-generated method stub
		/*try {
			ServerSocket server = new ServerSocket(8888);
			Socket ss = new Socket();
			while(true){
				ss = server.accept();
				InputStream is = ss.getInputStream();

				OutputStream os = ss.getOutputStream();
				byte[] b = new byte[1024];
				//1、得到文件名
				int a = is.read(b);
				String filename = new String(b, 0, a); 
				System.out.println("接受到的文件名为："+filename);
				String houzhui = filename.substring(filename.indexOf("."), filename.length());
				String filepath = null;
				if (houzhui.equals(".html")) {
					filepath = htmlpath;
				} else if(houzhui.equals(".png")){
					filepath = pngpath;
				}
				//String rand = String.valueOf((int) (Math.random() * 100000));
				//filename = rand+houzhui;
				System.out.println("新生成的文件名为:"+filename);
				FileOutputStream fos = new FileOutputStream(filepath+filename);
				int length = 0;
				while((length=is.read(b))!=-1){
					//2、把socket输入流写到文件输出流中去
					fos.write(b, 0, length);
				}
				//fos.flush();
				fos.close();
				os.flush();
				os.close();
				is.close();
				ss.close();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	} catch (Exception e) { 
		// TODO Auto-generated catch block 
		//e.printStackTrace();
		System.out.println("提交失败！");
		response.sendRedirect(basePath+"jsp/MethylationAnalysis/Submission_failure.jsp");
	} finally {
		//socket.close();
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
