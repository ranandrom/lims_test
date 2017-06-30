<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	//System.out.println("用户名或密码不能为空！");
	//System.out.println(basePath + "==" + path);
	//out.write("用户名或密码不能为空！");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>ANCHORDX LIMS Login</title>
		
		<!-- Import google fonts - Heading first/ text second -->
 
        <!--[if lt IE 9]>
		<link href="http://fonts.useso.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
		<link href="http://fonts.useso.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
		<![endif]-->

		<!-- Favicon and touch icons -->
		<!-- <link rel="shortcut icon" href="/static/assets/ico/favicon.ico" type="image/x-icon" /> -->

	    <!-- Css files -->
	    <link href="<%=basePath%>css/login/bootstrap.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/jquery.mmenu.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/font-awesome.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/jquery-ui-1.10.4.min.css" rel="stylesheet">
	    <link href="<%=basePath%>css/login/style.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/add-ons.min.css" rel="stylesheet">
		
	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body  style="background-image: url(<%=basePath%>images/login/background.jpg); background-repeat: no-repeat; background-size:100% 100%; background-attachment: fixed;">
		<div class="container-fluid content"> 
			<div class="row" >
				<div id="content" class="col-sm-12 full">
					<div class="row">
						<div class="login-box">
						
							<div class="header" style="background:#87CEEB;">用户登录</div>
							
							<div class="text-center" >
								<div class="t-center">
			                    	<span><img class="text-logo" src="<%=basePath%>images/login/logo.png"></span>
			                    </div>
							</div>				
						
							<div class="text-with-hr">
								<span>login</span>
							</div>
						
							<form method="post" action="login_action.jsp"  class="form-horizontal login">	                            
	
								<fieldset class="col-sm-12">
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="username" class="uname"> Your email or username </label>
											</p>
											<div class="input-group col-sm-12">
													
												<input type="text" class="form-control" id="username" name="username" placeholder="Username or E-mail" required/>
												<span class="input-group-addon"></span>
											</div>	
										</div>

									</div>
								
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" > Your password </label>
											</p>
											<div class="input-group col-sm-12">
												<input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
	
									<div class="confirm" align="right">									
										
										<!--<a href="<%=basePath%>jsp/register/register.jsp" class="red">Register</a>-->
										<a href="<%=basePath%>jsp/register/register.jsp">Register</a>
										<!--<input type="checkbox" name="remember_me" id="remember_me"/>-->											
									</div>
	
									<div class="row">								
										<button type="submit" class="btn btn-lg btn-primary col-xs-12">Login</button>																	
									</div>
									
								</fieldset>	
	
							</form>
								
							<div class="clearfix"></div>				
							
						</div>
					</div><!--/row-->
			
				</div>
		
			</div><!--/row-->
				
	</body>
</html>