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

<html lang="en">
<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>测序分析-基准医疗甲基化测序分析系统</title>

		<!-- Fav and touch icons

	    <!-- Css files -->
	   <link href="<%=basePath%>css/MethylationAnalysis/bootstrap.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/MethylationAnalysis/jquery.mmenu.css" rel="stylesheet">
		<link href="<%=basePath%>css/MethylationAnalysis/font-awesome.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/MethylationAnalysis/climacons-font.css" rel="stylesheet">

		<link href="<%=basePath%>css/MethylationAnalysis/morris.css" rel="stylesheet">
		<link href="<%=basePath%>css/MethylationAnalysis/jquery-ui-1.10.4.min.css" rel="stylesheet">

	    <link href="<%=basePath%>css/MethylationAnalysis/style.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/MethylationAnalysis/add-ons.min.css" rel="stylesheet">

    <!-- 引入必须的css和js文件 -->

<!-- start: JavaScript-->
	<!--[if !IE]>-->

	<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>

	<script src="<%=basePath%>js/jquery.js"></script>

	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>

		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='<%=basePath%>js/jquery.js'>"+"<"+"/script>");
		</script>

	<![endif]-->

    <!--引入wangEditor.css-->
    <script src="<%=basePath%>js/chosen/chosen.jquery.min.js"></script>
    <link href="<%=basePath%>js/chosen/chosen.css" rel="stylesheet" />

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>

<body>
	<!-- start: Header -->
	<div class="navbar" role="navigation">

		<div class="container-fluid">

			<!-- <ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg"><a href="#" id="main-menu-toggle"><img src="<%=basePath%>images/login/list.png"><i class="fa fa-th-large"></i></a></li>
				<li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i class="fa fa-navicon"></i></a></li>
			</ul> -->

	        <ul class="nav navbar-nav navbar-right">

                <li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"></a>
	      		</li>


				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome, <%=username%></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Account</strong>
						</li>
						<li><a href="<%=basePath%>jsp/user/Personal_Information.jsp"><img src="<%=basePath%>images/login/PersonalInformation.jpg">个人信息</a></li>
						<li class="divider"></li>
                        <li><a href="<%=basePath%>jsp/user/ModifyPassword.jsp"><img src="<%=basePath%>images/login/password.jpg">修改密码</a></li>
						<li class="divider"></li>
						<li><a href="<%=basePath%>jsp/login/login.jsp"><img src="<%=basePath%>images/login/logout.png">Logout</a></li>
	        		</ul>
	      		</li>
				<li><a href="<%=basePath%>jsp/login/login.jsp"><img src="<%=basePath%>images/login/logout.png">Logout</a></li>
			</ul>

		</div>

	</div>
	<!-- end: Header -->

	<div class="container-fluid content">

		<div class="row">

			<!-- start: Main Menu -->
			<div class="sidebar ">

				<div class="sidebar-collapse">
					<div class="t-center">
                     <span><img class="text-logo" src="<%=basePath%>images/login/logo.png"></span>
                    </div>
					<div class="sidebar-menu">
						<ul class="nav nav-sidebar">
							<li><a href="<%=basePath%>jsp/welcome/homepage.jsp"><i class="fa fa-laptop"></i><span class="text"> 首页</span></a></li>
							<li><a href="<%=basePath%>jsp/MethylationAnalysis/TaskSubmission.jsp"><i class="fa fa-laptop"></i><span class="text">开始分析</span></a></li>
							<li><a href="<%=basePath%>html/01.fastqc.html"><i class="fa fa-laptop"></i><span class="text">查看 01.fastqc</span></a></li>
							<li><a href="<%=basePath%>html/03.clean_fastqc.html"><i class="fa fa-credit-card"></i><span class="text">查看 03.clean_fastqc</span></a></li>
							<li><a href="<%=basePath%>html/04.clean_alignment.html"><i class="fa fa-credit-card"></i><span class="text">查看 04.clean_alignment</span></a></li>
							<li><a href="<%=basePath%>html/05.clean_methylation.html"><i class="fa fa-credit-card"></i><span class="text">查看 05.clean_methylation</span></a></li>
							<li><a href="<%=basePath%>html/06.clean_summary.html"><i class="fa fa-credit-card"></i><span class="text">查看 06.clean_summary</span></a></li>
							<li><a href="<%=basePath%>jsp/MethylationAnalysis/Tumor.risk.prediction.jsp"><i class="fa fa-credit-card"></i><span class="text">肿瘤风险预测</span></a></li>
						</ul>
					</div>
				</div>
				<div class="sidebar-footer">

					<div class="sidebar-brand">
						Anchordx
					</div>

					<ul class="sidebar-terms">
						<li><a href="#">Teams</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">About</a></li>
					</ul>


				</div>

			</div>
			<!-- end: Main Menu -->
			
			<div class="main ">

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="controls">
                          <strong><input type="text" class="form-control" value="肿瘤风险预测结果" disabled></strong>
                    </div>
                    
                    <div class="panel-body">
                           <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="报告给医生的风险图" disabled>
                               	</div>
                           </div>
							<div class="form-group">
								该图展示的是该样本的DNA甲基化状态，经过生物信息分析得出的风险预测值。
								<p></p>
								<p style="text-align:center">
									<img src="<%=basePath%>images/Tumor.risk.prediction.chart/xxx_forDoctor.png">
								</p>						
							</div>
                           
                    </div>
                    
                    <div class="panel-body">
                           <div class="form-group">
                           		<div class="controls" >
                                	<input type="text" class="form-control" value="报告给患者的风险图" disabled>
                               	</div>
                           </div>
							<div class="form-group">
								该图展示的是该样本的DNA甲基化状态，经过生物信息分析得出的风险预测值。
								<p></p>
								<p style="text-align:center">
									<img src="<%=basePath%>images/Tumor.risk.prediction.chart/xxx_forPatient.png">
								</p>
							</div>
                    </div>
                    
                    <div class="panel-body">
                           <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="结果解释" disabled>
                               	</div>
                           </div>
								<p>1.在肺部结节患者外周血样本中的灵敏度和特异性分别为82.5%和83.3%，在此灵敏度和特异性的基础上通过生物信息学计算得出受检者生物信息学评分，该评分越高，受检者肺部结节为恶性的可能性越大。</p>
								<p>2.对肺部结节恶性风险的定性检测，根据生物信息学评分将肺部结节恶性风险划分为低风险、中风险、高风险三个等级，标准如下：</p>
								<table border="1" align="center">
								<tr>
								<th style="text-align:center; width:240px; height: 21px;" valign="middle">生物信息学评分（0-100分）</th>
								<th style="text-align:center; width:120px; height: 21px;" valign="middle">判断结果</th>
								<th style="text-align:center; width:120px; height: 21px;" valign="middle">恶性概率</th>
								</tr>
								<tr>
								<td align="center"><50</td>
								<td align="center">低风险</td>
								<td align="center"><50%</td>
								</tr>
								<tr>
								<td align="center">50-64.5</td>
								<td align="center">中风险</td>
								<td align="center">50%-73%</td>
								</tr>
								<tr>
								<td align="center">>64.5</td>
								<td align="center">高风险</td>
								<td align="center">>73%</td>
								</tr>
								</table>
								<p></p>
								<p>3.检测结果仅供临床治疗参考，不能单独作为确诊或排除病理的依据。</p> 
								<p><strong><h5>备注：本检测仅对本次送检样本负责，仅供临床参考。请结合受检者的临床信息综合考虑治疗方案。</h5></strong></p>
								<p><a href="<%=basePath%>jsp/MethylationAnalysis/AnchorGPS_Result.jsp">如何理解AnchorGPS™检测结果</a></p>
								<p><a href="<%=basePath%>jsp/MethylationAnalysis/PulmonaryNoduleDiagnosis.jsp">肺部结节诊断常见问题</a></p>                   
                    </div>
                    
                </div>
            </div><!--/col-->

        </div><!--/row-->

    </div>
			
			</div><!--/row-->

        <!--/container-->
       </div><!--/row-->

 <script src="<%=basePath%>js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- page scripts -->
	<script src="<%=basePath%>plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="<%=basePath%>plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=basePath%>plugins/moment/moment.min.js"></script>
	<script src="<%=basePath%>plugins/fullcalendar/js/fullcalendar.min.js"></script>
	<!--[if lte IE 8]>
		<script language="javascript" type="text/javascript" src="<%=basePath%>plugins/excanvas/excanvas.min.js"></script>
	<![endif]-->
	<script src="<%=basePath%>plugins/flot/jquery.flot.min.js"></script>
	<script src="<%=basePath%>plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=basePath%>plugins/flot/jquery.flot.stack.min.js"></script>
	<script src="<%=basePath%>plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=basePath%>plugins/flot/jquery.flot.time.min.js"></script>
	<script src="<%=basePath%>plugins/flot/jquery.flot.spline.min.js"></script>
	<script src="<%=basePath%>plugins/autosize/jquery.autosize.min.js"></script>
	<script src="<%=basePath%>plugins/placeholder/jquery.placeholder.min.js"></script>
	<script src="<%=basePath%>plugins/raphael/raphael.min.js"></script>
	<script src="<%=basePath%>plugins/morris/js/morris.min.js"></script>
	<script src="<%=basePath%>plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="<%=basePath%>plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="<%=basePath%>plugins/jvectormap/js/gdp-data.js"></script>
	<script src="<%=basePath%>plugins/gauge/gauge.min.js"></script>
	<!-- theme scripts -->
	<script src="<%=basePath%>js/SmoothScroll.js"></script>
	<script src="<%=basePath%>js/jquery.mmenu.min.js"></script>
	<script src="<%=basePath%>js/core.min.js"></script>
	<script src="<%=basePath%>plugins/d3/d3.min.js"></script>
                        <script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>

	<!-- inline scripts related to this page -->
	<script src="<%=basePath%>js/pages/index.js"></script>

    <script src="<%=basePath%>plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>plugins/datatables/js/dataTables.bootstrap.min.js"></script>

	<!-- end: JavaScript-->
</body>
</html>