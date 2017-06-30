<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html> 
	<head> 
		<base href="<%=basePath%>"> 
	  
		<title>注册页面</title> 
	  
		<meta http-equiv="pragma" content="no-cache"> 
		<meta http-equiv="cache-control" content="no-cache"> 
		<meta http-equiv="expires" content="0">  
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
		<meta http-equiv="description" content="This is my page"> 
		
		<!-- Css files -->
	    <link href="<%=basePath%>css/MethylationAnalysis/bootstrap.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/jquery.mmenu.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/font-awesome.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/jquery-ui-1.10.4.min.css" rel="stylesheet">
	    <link href="<%=basePath%>css/login/style.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/login/add-ons.min.css" rel="stylesheet">
	</head> 
 
	<body> 
	
		<div class="controlss">
			<strong><input type="text" style="text-align:center" class="form-control" value="请填写以下用户信息，标记有*号的为必填项，无标记的为可选填项!" disabled></strong>
		</div>
		<div class="container-fluid content">                                           					                        
			<div class="row">
				<div id="content" class="col-sm-12 full">
					<div class="row">
						<div class="login-box">
						
							<div class="header">用户注册</div>
							
							<div class="text-center" >
								<div class="t-center">
			                    	<span><img class="text-logo" src="<%=basePath%>images/login/logo.png"></span>
			                    </div>
							</div>				
						
							<div class="text-with-hr">
								<span>User registration</span>
							</div>
						
							<form method="post" action="<%=basePath%>jsp/register/register_action.jsp"  class="form-horizontal login">	                            
	
								<fieldset class="col-sm-12">
								
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="username" class="uname">*用户名</label>
											</p>
											<div class="input-group col-sm-12">
													
												<input type="text" class="form-control" id="username" name="username" placeholder="username" required/>
												<span class="input-group-addon"></span>
											</div>	
										</div>

									</div>
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="username" class="uname">*登录密码</label>
											</p>
											<div class="input-group col-sm-12">
													
												<input type="password" class="form-control" id="password1" name="password1" placeholder="password" required/>
												<span class="input-group-addon"></span>
											</div>	
										</div>

									</div>
								
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" >*确认登录密码</label>
											</p>
											<div class="input-group col-sm-12">
												<input type="password" class="form-control" id="password2" name="password2" placeholder="password" required/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" >公司</label>
											</p>
											<div class="input-group col-sm-12">
												<input type="text" class="form-control" id="company" name="company" placeholder="company"/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" >地址</label>
											</p>
											<div class="input-group col-sm-12">
												<input type="text" class="form-control" id="address" name="address" placeholder="address"/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" >联系电话</label>
											</p>
											<div class="input-group col-sm-12">
												<input type="text" class="form-control" id="Telephone" name="Telephone" placeholder="Telephone"/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
									
									<div class="form-group">
										<div class="controls row">
											<p>
												<label for="password" class="youpasswd" >电子邮箱</label>
											</p>
											<div class="input-group col-sm-12">
												<input type="text" class="form-control" id="email" name="email" placeholder="email"/>
												<span class="input-group-addon"></span>
											</div>	
										</div>
									</div>
									
									<div class="row">								
										<button type="submit" class="btn btn-lg btn-primary col-xs-12">确认提交</button>																	
									</div>
									
								</fieldset>	
	
							</form>
							
							<form method="post" action=""  class="form-horizontal login">	                            	
								<fieldset class="col-sm-12">
									<div class="row">								
											<p></p>																	
									</div>
								</fieldset>		
							</form>
							
							<form method="post" action="<%=basePath%>jsp/login/login.jsp"  class="form-horizontal login">	                            	
								<fieldset class="col-sm-12">
									<div class="row" style="background:#000000;">							
											<button class="btn btn-lg btn-primary col-xs-12" >取消注册</button>																	
									</div>
								</fieldset>		
							</form>
							<div class="clearfix"></div>											
						</div>
					</div><!--/row-->
			
				</div>
		
			</div><!--/row-->
		</div>

		<!-- end: Main Menu -->
	 
	</body> 
</html>