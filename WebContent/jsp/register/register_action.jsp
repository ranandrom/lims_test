<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %> 
<%@ page import="com.anchordx.businessbean.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
 
 
<% 
	String username = request.getParameter("username"); 
	String password1 = request.getParameter("password1"); 
	String password2 = request.getParameter("password2");
	String company = request.getParameter("company"); 
	String address = request.getParameter("address"); 
	String Telephone = request.getParameter("Telephone"); 
	String email = request.getParameter("email");
	if (username==null||"".equals(username.trim())||password1==null||"".equals(password1.trim())||password2==null||"".equals(password2.trim())||!password1.equals(password2)) { 
		//out.write("用户名或密码不能为空！"); 
		//System.out.println("用户名或密码不能为空！"); 
		request.setAttribute("Err", "用户名为空或两次密码输入不一致，请重新输入"); // 设置错误属性
		String Err = (String)request.getAttribute("Err"); // 获取错误属性
		if(Err != null) {
%>

<script type="text/javascript" language="javascript">
	alert("<%=Err%>");  // 弹出错误信息
	window.location='register.jsp'; // 跳转到注册界面
</script>

<%
		}
		//response.sendRedirect("register.jsp"); 
		return; 
		//request.getRequestDispatcher("login.jsp").forward(request, response); 
	} 
	UserBean userBean = new UserBean(); 
	boolean isExit = userBean.isExist(username); 
	if (!isExit) { 
		userBean.add(username, password1, email, company, Telephone, address); 
		//System.out.println("注册成功，请登录！");
		request.setAttribute("success", "恭喜您，注册成功，请登录！"); // 设置成功属性
		String success = (String)request.getAttribute("success"); // 获取成功属性
		if(success != null) {
%>

<script type="text/javascript" language="javascript">
	alert("<%=success%>");  // 弹出成功信息
	window.location='<%=basePath%>jsp/login/login.jsp'; // 跳转到登录界面
</script>

<% 
		}
		//response.sendRedirect(basePath+"jsp/login/login.jsp"); 
		return; 
	} else {
		request.setAttribute("fail", "该用户名已存在！"); // 设置失败属性
		String fail = (String)request.getAttribute("fail"); // 获取失败属性
		if(fail != null) {
%>

<script type="text/javascript" language="javascript">
	alert("<%=fail%>");  // 弹出失败信息
	window.location='register.jsp'; // 跳转到注册界面
</script>

<%
		}
		//System.out.println("用户名已存在！"); 
		//response.sendRedirect("register.jsp"); 
		return; 
	} 
%>