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
                        <h2><i class="fa fa-indent red"></i><strong>欢迎使用基准医疗甲基化测序分析系统</strong></h2>
                        <div class="panel-actions">
                            <a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
                            <a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
                            <a href="#" class="btn-close"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <form method="POST"  action="MethylationAnalysis_action.jsp" class="form-horizontal" name="form1">
                            <input type='hidden' name='csrfmiddlewaretoken' value='j4oUzkwwS5PRiCQG551OlGxvz97l5FYOmwoYgCbfqg0qAuqAiqtpdILPt9VtPRee' />
                           <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="甲基化测序分析" disabled>
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
                                <button class="btn btn-default" formaction="MethylationAnalysis.jsp">取消任务</button>
                            </div>
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
	                                <button class="btn btn-primary" formaction="<%=basePath%>jsp/MethylationAnalysis/Tumor.risk.prediction.jsp">肿瘤风险预测</button>
	                            </div>
                            <br>
                            <div class="form-group">
                           		<div class="controls">
                                	<input type="text" class="form-control" value="" disabled>
                               	</div>
                           </div>
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
    
</body>
</html>