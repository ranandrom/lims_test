<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String)session.getAttribute("username");
	
	if (username == null) {
		response.sendRedirect(basePath+"jsp/login/login.jsp");
	}
	//System.out.println("username: " + username);
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
			
		<div class="main">

			<div class="row">
	              <div class="panel-heading" style="text-align:center">
	                   <h4><strong>肺部结节诊断常见问题</strong></h4>
	              </div>
	       </div>
	       
<p><strong><h5>肺部结节与肺癌的关系</h5></strong></p>
<p>肺部结节（Pulmonary Nodule，PN）是指影像学检查表现为肺内直径≤3cm的阴影。严格上说肺部结节并非一种疾病，而是多种疾病的一种临床表现，如肺部炎症、肺部肿物以及肺癌。当结节直径>0.8cm时，应该高度警惕为肺癌的可能。</p>
<p>目前，肺部结节常规检查方法包括影像学检查、细胞学检查和组织活检病理诊断。常规鉴别方法假阴性导致的漏诊率高达70%，而假阳性会导致患者接受不必要手术治疗及心理负担。</p>
<p><strong><h5>肺部结节缺乏准确科学的鉴别方法，是肺部结节过度治疗也是延误肺癌诊断和治疗的一个重要因素。</h5></strong></p>
<br><br><p></p>

<p><strong><h5>DNA甲基化与疾病的关系</h5></strong></p>
<p>DNA甲基化是基因表达的开关，控制着生物体内各项生理生化活动正常进行。有研究发现DNA甲基化改变参与肿瘤的发生，
是肿瘤发生的早期事件。在肿瘤发生、发展的不同发展阶段中，DNA甲基化位点和程度不尽相同。ctDNA是肿瘤细胞释放到外周血中的DNA，
携带与原发肿瘤组织一致的分子遗传信息，能够实时反映受检者基因信息。无需经历辐射暴露或者有创伤性的活检病理诊断，通过外周血即可反映受检者的疾病状态。</p>
<p><strong><h5>因此，cfDNA甲基化可用于早期肿瘤诊断及筛查，实时反映受检者疾病状况。</h5></strong></p>
<br><br>

<p><strong><h5>AnchorGPS™检测助力肺部结节精准诊断</h5></strong></p>
<p>良性与恶性的肺部结节之间的DNA甲基化存在差异，AnchorGPS™以中国人群遗传信息为基础，筛选出与肺癌密切相关的基因甲基化位点，
基于DNA高通量测序技术，检测患者血液中肺癌特异性DNA，精度高达万分之一，从基因层面分析肺部结节的良恶性，是现有肺部结节检查的有效补充手段。
在肿瘤发生的早期，通过AnchorGPS™检测，可提示疾病发生，及时干预，将肿瘤扼杀在摇篮中。</p>
<p><strong><h5>AnchorGPS™肺部结节辅助诊断基因检测通过定性检测外周血中cfDNA的甲基化状态，安全、便捷的诊断出肺部结节的良恶性。</h5></strong></p>
<br>
 
<p><strong><h5>AnchorGPS™检测的准确性</h5></strong></p>
<p>区别于低灵敏度的血清学检测、有辐射暴露风险的影像学检查和有创伤的活检病理诊断方式，AnchorGPS™以受检者外周血为标本进行肺部结节良恶性辅助诊断，
仅需抽取受检者8-10mL外周血，采用先进的检测技术，对受检者不会造成任何副作用，安全、便捷、可靠的得出肺部结节良恶性的鉴定结果。</p>
<p>实验证实，随着结节大小的增加，AnchorGPS™灵敏度增加；随着临床分期的增加，AnchorGPS™灵敏度增加。</p>
<br><br><p></p>

<p><strong><h5>AnchorGPS™检测对肺部结节治疗的帮助</h5></strong></p>
<p>AnchorGPS™基因检测灵敏度高，可检测到早期肿瘤患者cfDNA甲基化的异常情况，比传统影像学和血清学检查更早预警肿瘤存在，可对受检者进行早期干预和治疗。</p>
<p>各种检测手段各有优势和局限性，不同的检测方法可从不同的角度反映疾病的真实情况。由于AnchorGPS™属于辅助诊断类检测产品，所以必须要结合现有的临床诊断结果，以及受检者的身体状况，综合分析病情，制定合适的治疗方案，避免耽误最佳的治疗时机。</p>
<br><br><p></p>

<p><strong><h5>AnchorGPS™检测适用人群及使用时间</h5></strong></p>
<p>低剂量螺旋CT（LDCT）或CT发现肺部结节的患者</p>
				<p style="text-align:center">
					<img src="<%=basePath%>images/AnchorDx_GPS/Anchordx_GPS.png" height="200" width="800">
				</p>
				<br><br><p></p>
	      
       </div>

</div></div>

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