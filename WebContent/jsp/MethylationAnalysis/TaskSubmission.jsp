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
				<li class="visible-md visible-lg"><a href="#" id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
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

		<!-- start: Content -->

            

   <div class="main ">

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    
                    <div class="panel-body">
                        <form method="POST"  action="MethylationAnalysis_action.jsp" class="form-horizontal" name="form1">
                            <input type='hidden' name='csrfmiddlewaretoken' value='j4oUzkwwS5PRiCQG551OlGxvz97l5FYOmwoYgCbfqg0qAuqAiqtpdILPt9VtPRee' />
                           <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="甲基化测序分析任务设定" disabled>
                               	</div>
                           </div>
                        <div class="form-group">
								  <div class="controls">
                                        <input type="text" class="form-control" value="请在以下文本框中按规定格式输入参数" disabled>
                                  </div>
								  <div class="controls">
									<textarea name="newcontext" id="limit" class="form-control" rows="24" style="width:100%;">					
#原始测序数据的文件夹路径，不填则表示当前(config文件的)路径***
indir = 
							
# 选择那些preLib的样本运行,多个邮箱时用“,”分隔开，不填时则为原始测序数据的文件夹路径下的所有样本
PreLibIDs = 
							
#任务投递的计算机节点名称，可从anchordx01~anchordx07选取一或多个，用“:”隔开，不填则随机调配所有可用的计算机节点(等同all)
nodes = 
							
#建库方法，为SWIFT或者Ironman两种建库方式中的一种，不写默认为Ironman方式
LibraryType = 
							
# 本靶向测序的panel文件区域路径，一般为interval文件，bed文件也可，不写则默认本公司常用的Ironman panel。
targetIntervals = 
							
# 任务完成时的邮箱通知,多个邮箱时用“,”分隔开，不填则不发送邮件提醒
email = 
									</textarea>
								  </div>
								</div>
							<p></p>
                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary">提交任务</button>
                                <button class="btn btn-default" formaction="TaskSubmission.jsp">取消任务</button>
                            </div>
                            <!--
                            <br><br>                        
                            <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="查看分析结果" disabled>
                               	</div>
                           	</div>
	                            <div class="form-actions">
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/01.fastqc.html">01.fastqc</button>
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/03.clean_fastqc.html">03.clean_fastqc</button>
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/04.clean_alignment.html">04.clean_alignment</button>
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/05.clean_methylation.html">05.clean_methylation</button>
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/06.clean_summary.html">06.clean_summary</button>
	                                <button class="btn btn-primary" formaction="<%=basePath%>html/Tumor.risk.prediction.jsp">肿瘤风险预测</button>
	                            </div>
                            <br>
                            <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="" disabled>
                               	</div>
                           </div>
                           /row-->
                            </form>
                        <br>

						 <div class="controlss">
                         	<input type="text" class="form-control" value="以下为参数输入格式及示例，请耐心阅读！" disabled>
                         </div>
                         <div class="alert alert-info">
                            <button type="button" class="close" data-dismiss="alert"></button>
                            ################################***说明***################################<br>
							#                                                                        #<br>
							# 这是config文件的实例文件，请勿改动“=”左侧的参数名称。                  #<br>
							# 请仅修改“=”右侧的数值，且请勿引入多余的空格。                          #<br>
							# 保持默认值则可将“=”右侧设为空。如果希望输入值为空值或者0，             #<br>
							# 则写""和0。希望程序忽略的文字注释可在相应行最前面加“#”。               #<br>
							# “***”标示的项目为必填项目                                              #<br>
							#                                                                        #<br>
							##########################################################################<br>
                        </div>


                        <div class="alert alert-warning">
                            <button type="button" class="close" data-dismiss="alert"></button>
                            <h6 class="alert-heading">#原始测序数据的文件夹路径，不填则表示当前(config文件的)路径***</h6>
                            <p>indir = /home/longhui_deng/script/Ironman_mapping/test/raw.fq/ </p>

                            <h6 class="alert-heading">#选择那些preLib的样本运行,多个邮箱时用“,”分隔开，不填时则为原始测序数据的文件夹路径下的所有样本</h6>
                            <p>PreLibIDs = 161130MALCPS3038</p>

                            <h6 class="alert-heading">#任务投递的计算机节点名称，可从anchordx01~anchordx07选取一或多个，用“:”隔开，不填则随机配所有可用的计算机节点(等同all)</h6>
                            <p>nodes = anchordx04:anchordx06:anchordx07</p>
                            <h6 class="alert-heading">#建库方法，为SWIFT或者Ironman两种建库方式中的一种，不写默认为Ironman方式</h6>
                            <p>LibraryType = Ironman</p>

                            <h6 class="alert-heading"># 本靶向测序的panel文件区域路径，一般为interval文件，bed文件也可，不写则默认本公司常用的Ironman panel。</h6>
                            <p>targetIntervals = /home/longhui_deng/script/Ironman_mapping/intervals/130912_HG19_CpGiant_4M_EPI.interval</p>

                            <h6 class="alert-heading"># 任务完成时的邮箱通知,多个邮箱时用“,”分隔开，不填则不发送邮件提醒</h6>
                            <p>email = longhui_deng@anchordx.com,zhirong_lu@anchordx.com</p>


                        </div>



                    </div>
                </div>
            </div><!--/col-->

        </div><!--/row-->

    </div>

    <script>
        var $sampleID = $("#sampleID");
        var $sampleID2 = $("#sampleID2");
        var $checkboxes = $("#checkboxes");
        var $checkboxes_div = $("#checkboxes_div");
        var $checkboxes2 = $("#checkboxes2");
        var $checkboxes_div2 = $("#checkboxes_div2");
        var $filtercol = $("#filtercol");
        var $switch_checkbox = $("#switch_checkbox");
        var $switch_checkbox2 = $("#switch_checkbox2");

        $sampleID.chosen({no_results_text: "Oops, nothing found!", search_contains: true});
        $sampleID2.chosen({no_results_text: "Oops, nothing found!", search_contains: true});
        $filtercol.chosen({no_results_text: "Oops, nothing found!",  search_contains: true});

        $filtercol.on('change', function(event, params) {
            var value;
            var text;
            if (params.selected){
                value =  params.selected;
                $sampleID.find("option[value='"+value+"']").remove();
                $sampleID2.find("option[value='"+value+"']").remove();
                $sampleID.trigger("chosen:updated");
                $sampleID2.trigger("chosen:updated");

            }
            else if (params.deselected){
                value =  params.deselected;
                text = $filtercol.find("option[value='"+value+"']").text();
                $sampleID.append('<option value="'+ value +'">'+ text +'</option>');
                $sampleID2.append('<option value="'+ value +'">'+ text +'</option>');
                $sampleID.trigger("chosen:updated");
                $sampleID2.trigger("chosen:updated");
            }

        });

        $sampleID.on('change', function(event, params) {
            var value;
            var text;
            if (params.selected){
                value =  params.selected;
                $('#checkbox'+ value +  '').prop('checked', true);

            }
            else if (params.deselected){
                value =  params.deselected;
                $('#checkbox'+ value +  '').prop('checked', false);
            }

        });

        

         $sampleID2.on('change', function(event, params) {
            var value;
            if (params.selected){
                value =  params.selected;
                $('#checkbox'+ value +  '2').prop('checked', true);

            }
            else if (params.deselected){
                value =  params.deselected;
                $('#checkbox'+ value +  '2').prop('checked', false);
            }

        });

        



        $switch_checkbox.on('change', function(event, params) {
            if (this.checked){
                $checkboxes_div.hide();

            }
            else {
                $checkboxes_div.show();
            }
        });

        $switch_checkbox2.on('change', function(event, params) {
            if (this.checked){
                $checkboxes_div2.hide();

            }
            else {
                $checkboxes_div2.show();
            }
        });
    </script>




        <!--/container-->


	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Warning Title</h4>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="clearfix"></div>
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