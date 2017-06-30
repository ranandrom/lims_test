<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>测序分析-基准医疗甲基化测序分析系统</title>

	    <!-- Css files -->
	    <link href="<%=basePath%>css/MethylationAnalysis/bootstrap.min.css" rel="stylesheet">
	    
</head>

<body>
    <div class="main ">

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                
                    <div class="panel-heading">
                        <h2><i class="fa fa-indent red"></i><strong>肿瘤风险预测结果</strong></h2>
                        <div class="panel-actions">
                            <a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
                            <a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
                            <a href="#" class="btn-close"><i class="fa fa-times"></i></a>
                        </div>
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
                                	<input type="text" class="form-control" value="备注" disabled>
                               	</div>
                           </div>
								<p>1.在肺部结节患者外周血样本中的灵敏度和特异性分别为82.5%和83.3%，在此灵敏度和特异性的基础上通过生物信息学计算得出受检者生物信息学评分，该评分越高，受检者肺部结节为恶性的可能性越大.</p>
								<p>2.对肺部结节恶性风险的定性检测，根据生物信息学评分将肺部结节恶性风险划分为低风险、中风险、高风险三个等级.	</p>                        
                    </div>
                    
                </div>
            </div><!--/col-->

        </div><!--/row-->

    </div>
    
</body>
</html>