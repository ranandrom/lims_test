<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ page import="java.sql.*" %> 
<%@ page import="com.anchordx.businessbean.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//System.out.println(path + "====" + basePath);

	String username = request.getParameter("username"); 
	String password = request.getParameter("password"); 
	if (username==null||"".equals(username.trim())||password==null||"".equals(password.trim())) { 
		//out.write("用户名或密码不能为空！"); 
		//System.out.println("用户名或密码不能为空！"); 
		response.sendRedirect(basePath+"jsp/login/login.jsp"); 
		return; 
		//request.getRequestDispatcher("login.jsp").forward(request, response); 
	}
	
	UserBean userBean = new UserBean(); 
	boolean isValid = userBean.valid(username,password); 
	if (isValid) { 
		System.out.println(username + "，登录成功！"); 
		//session.setAttribute("username", username);
		//response.sendRedirect(basePath+"jsp/welcome/welcome.jsp");
		//response.sendRedirect(basePath+"jsp/MethylationAnalysis/MethylationAnalysis.jsp");
		//response.sendRedirect(basePath+"jsp/welcome/homepage.jsp");
%>
		<form method="post" action="<%=basePath%>jsp/welcome/homepage.jsp"> 
			<%
				//首页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/MethylationAnalysis/TaskSubmission.jsp"> 
			<%
				//任务提交页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/MethylationAnalysis/Tumor.risk.prediction.jsp"> 
			<%
				//肿瘤风险预测页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/user/Personal_Information.jsp"> 
			<%
				//用户信息页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/user/ModifyPassword.jsp"> 
			<%
				//密码修改页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/loginout/loginout.jsp"> 
			<%
				//退出页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/MethylationAnalysis/MethylationAnalysis_action.jsp"> 
			<%
				//退出页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/MethylationAnalysis/Submission_failure.jsp"> 
			<%
				//退出页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/user/ModifyPassword_action.jsp"> 
			<%
				//退出页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
		
		<form method="post" action="<%=basePath%>jsp/user/ModifyPassword_Success.jsp"> 
			<%
				//退出页
				//System.out.println(username + "，登录成功！"); 
				session.setAttribute("username", username);
			%>
		</form>
<%
		response.sendRedirect(basePath+"jsp/welcome/homepage.jsp");
		return; 
	} else { 
		//System.out.println("用户名或密码错误，登录失败！");
		request.setAttribute("loginError", "用户名或密码错误，登录失败！请重新输入..."); // 设置错误属性
		String errorInfo = (String)request.getAttribute("loginError"); // 获取错误属性
		if(errorInfo != null) {
%>

<script type="text/javascript" language="javascript">
	alert("<%=errorInfo%>"); // 弹出错误信息
	window.location='login.jsp'; // 跳转到登录界面
</script>

<%
		}
		//response.sendRedirect(basePath+"jsp/login/login.jsp"); 
		return; 
	} 
%>