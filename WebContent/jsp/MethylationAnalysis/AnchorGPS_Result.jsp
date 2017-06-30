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
	                   <h4><strong>如何理解AnchorGPS™检测结果</strong></h4>
	              </div>
	       </div>
	       
<p><strong><h5>如何理解受检者的检测结果</h5></strong></p>
<p>（检测结果为高风险）此次AnchorGPS™基因检测结果提示在受检者外周血cfDNA中检测到肺癌特异性甲基化信号，考虑由肺癌细胞释放的概率较大，
提示受检者结节可能为恶性，但鉴于当前检测技术水平的限制和受检者个体差异等因素，并不能完全排除结节为良性的可能性。受检者及受检者的主管医生在参考本次检测结果的基础上，
需结合结节大小、实性/亚实性性质、结节倍增时间和受检者身体状况等临床指征，综合选择治疗方案。具体是否需要接受手术治疗或者药物治疗，谨遵医嘱，如有需要您也可以向基准医疗进行咨询。
</p>
<p>（检测结果为中风险）此次AnchorGPS™基因检测结果提示在受检者外周血cfDNA中检测到疑似肺癌甲基化信号，可能是由肺癌细胞释放，
也可能是由于受检者体内其他疾病导致，例如炎症、感染、自身免疫性疾病、其他器官疾病等造成。鉴于当前检测技术水平的限制和受检者个体差异等因素，不能完全排除结节为恶性的可能性。
受检者及受检者的主管医生在参考本次检测结果的基础上，需结合结节大小、实性/亚实性性质、结节倍增时间和受检者身体状况等临床指征，综合选择治疗方案。
具体是否需要接受手术治疗或者药物治疗，谨遵医嘱，如有需要您也可以向基准医疗进行咨询。
</p>
<p>（检测结果为低风险）此次AnchorGPS™基因检测结果提示在受检者外周血cfDNA中未检测到肺癌甲基化信号，可能是受检者体内没有肺癌细胞，
也可能是受检者外周血由肺癌细胞释放的cfDNA含量过低未被检测到。鉴于当前检测技术水平的限制和受检者个体差异等因素，不能完全排除结节为恶性的可能性。
受检者及受检者的主管医生在参考本次检测结果的基础上，需结合结节大小、实性/亚实性性质、结节倍增时间和受检者身体状况等临床指征，综合选择治疗方案。
具体是否需要接受手术治疗或者药物治疗，谨遵医嘱，如有需要您也可以向基准医疗进行咨询。
</p>
<p><strong><h5>AnchorGPS™检测影响因素</h5></strong></p>
<p><strong><h5>受检者因素</h5></strong></p>
<p>已有研究证明，DNA甲基化状态与受检者取样时的身体状况相关，据目前科学研究及临床不完全统计，包括但不限于以下因素可能会对结果有影响，请在主管医生的指导下使用。</p>
<p>饮食因素：抽血前高蛋白、高脂肪摄入可能导致脂血，直接影响检测及检测结果；</p>
<p>生理因素：严重外伤、感染、炎症类患者；肝脏、肾脏功能差者；自身免疫性疾病携带者；妊娠怀孕者；凝血功能障碍患者；心血管疾病患者；除肺部疾病外的其他器官严重疾病患者；都可能对结果造成影响； </p>
<p>药物因素：抽血前使用抗生素、非甾体类解热镇痛药物、肿瘤相关的化疗药物，直接影响检测及检测结果。</p>
<p><strong><h5>样本因素</h5></strong></p>
<p>高通量测序技术灵敏度极高，检测结果直接受到DNA质量和数量的影响，而DNA质量与样本采集和运输直接相关。为保证检测结果的客观、准确，请严格按照基准医疗提供的标准进行样本采集和运输。</p>

	      
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