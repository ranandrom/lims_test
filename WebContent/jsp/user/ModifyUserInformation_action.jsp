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
	
	//String email = request.getParameter("email");
	//String Telephone = request.getParameter("Telephone");
	//String address = request.getParameter("address");
	//String company = request.getParameter("company");
	
	String email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
	String Telephone = new String(request.getParameter("Telephone").getBytes("ISO-8859-1"), "UTF-8");
	String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
	String company = new String(request.getParameter("company").getBytes("ISO-8859-1"), "UTF-8");
	
	//System.out.println("address: "+address);
	
	UserBean userBean = new UserBean();	
	boolean modifyPassword = userBean.ModifyUserInformation(username, email, company, Telephone, address);
	if (modifyPassword) {
		System.out.println("恭喜您，修改用户信息成功！");
		response.sendRedirect(basePath+"jsp/user/Personal_Information.jsp");
	} else {
		request.setAttribute("updatedataError", "数据库修改数据过程中出错，修改失败！请重新输入，或联系系统管理员..."); // 设置错误属性
		String errorupdatedata = (String)request.getAttribute("updatedataError"); // 获取错误属性
		if(errorupdatedata != null) {
%>
	<script type="text/javascript" language="javascript">
		alert("<%=errorupdatedata%>"); // 弹出错误信息
		window.location='<%=basePath%>jsp/user/ModifyUserInformation.jsp'; // 返回修改密码界面
	</script>

<%
		}
		return; 
	}

%>