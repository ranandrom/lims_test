<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ page import="java.sql.*" %> 
<%@ page import="com.anchordx.businessbean.*" %>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String)session.getAttribute("username");	
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}
	//System.out.println(path + "====" + basePath);
	String OriginalPassword = request.getParameter("OriginalPassword");
	String NewPassword1 = request.getParameter("NewPassword1");
	String NewPassword2 = request.getParameter("NewPassword2");
	
	if (OriginalPassword==null||"".equals(OriginalPassword.trim())
			||NewPassword1==null||"".equals(NewPassword1.trim())
			||NewPassword2==null||"".equals(NewPassword2.trim())
			||username==null||"".equals(username.trim())) {  
		response.sendRedirect(basePath+"jsp/user/ModifyPassword.jsp"); 
		return;  
	}
	
	if (NewPassword1.equals(NewPassword2)) {
		
		//System.out.println("username:" + username);
		UserBean userBean = new UserBean(); 
		boolean isValid = userBean.valid(username,OriginalPassword);
		if (isValid) { 
			//System.out.println(username + "，登录成功！");
			//session.setAttribute("username", username); 
			//response.sendRedirect(basePath+"jsp/welcome/welcome.jsp");
			//response.sendRedirect(basePath+"jsp/MethylationAnalysis/MethylationAnalysis.jsp");
			//UpdateDB updatedb = new UpdateDB();
			boolean modifyPassword = userBean.ModifyPassword(username,NewPassword1);
			//updatedb.test(username,NewPassword1);
			if (modifyPassword) {
				System.out.println("恭喜您，修改登录密码成功！请重新登录");
				response.sendRedirect(basePath+"jsp/user/ModifyPassword_Success.jsp");
			} else {
				//System.out.println("用户名或密码错误，登录失败！");
				request.setAttribute("updatedataError", "数据库修改数据过程中出错，修改失败！请重新输入，或联系系统管理员..."); // 设置错误属性
				String errorupdatedata = (String)request.getAttribute("updatedataError"); // 获取错误属性
				if(errorupdatedata != null) {
%>
	<script type="text/javascript" language="javascript">
		alert("<%=errorupdatedata%>"); // 弹出错误信息
		window.location='<%=basePath%>jsp/user/ModifyPassword.jsp'; // 返回修改密码界面
	</script>

<%
				}
				return; 
			}
		} else { 
			//System.out.println("用户名或密码错误，登录失败！");
			request.setAttribute("loginError", "用户名或原密码输入错误，修改失败！请重新输入..."); // 设置错误属性
			String errorInfo = (String)request.getAttribute("loginError"); // 获取错误属性
			if(errorInfo != null) {
%>

	<script type="text/javascript" language="javascript">
		alert("<%=errorInfo%>"); // 弹出错误信息
		window.location='<%=basePath%>jsp/user/ModifyPassword.jsp'; // 返回修改密码界面
	</script>

<%
			}
			//response.sendRedirect(basePath+"jsp/login/login.jsp"); 
			return; 
		} 
	} else {
		//System.out.println("用户名或密码错误，登录失败！");
		request.setAttribute("loginErrorr", "两次输入的新密码不一致，修改失败！请重新输入..."); // 设置错误属性
		String errorInfoo = (String)request.getAttribute("loginErrorr"); // 获取错误属性
		System.out.println("两次输入的新密码不一致");
		if(errorInfoo != null) {
%>
		<script type="text/javascript" language="javascript">
			alert("<%=errorInfoo%>"); // 弹出错误信息
			window.location='<%=basePath%>jsp/user/ModifyPassword.jsp'; // 返回修改密码界面
		</script>
<%
		}
	}
%>