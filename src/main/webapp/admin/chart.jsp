<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!doctype html>
<base href="http://localhost:8080/admin/">
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>查看投票统计详情</title>


    <link href="css/bootstrap.min.css" rel="stylesheet" />
    

    <!--  Light Bootstrap Dashboard core CSS    -->
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
	<script src="js/jquery-2.1.4.min.js"></script>


    <!--     Fonts and icons     -->

</head>
<body>

<script>
//header.jsp加载完毕后 去服务器端获得所有的category数据

$(function(){
	var content = "";
	$.post(
		"/ChartDataGetServlet",
		{"vid":"${vid}","vname":"${vname}"},
		function(data){
				var name=[];
				var value=[];
				/* alert(data.length); */
				for(var i=0;i<data.length;i++)
				{
						name[i]=data[i].itemname;
						value[i]=data[i].itemvalue;
						
				}
				console.log(name);
				console.log(value);
				demo.UpCharts(name,value);
		},
		"json"
	);
});
</script>
<!--测试换表用 -->
<!-- <script type="text/javascript">
    function changechart()
    {
        var data=[];
        var value=[];
        data[0]="1";
        data[1]="2";
        data[2]="3";
        data[3]="6";
        data[4]="5";
        value[0]="7";
        value[1]="2";
        value[2]="20";
        value[3]="7";
        value[4]="5";
        demo.UpCharts(data,value);
    }

</script>
 -->
<%-- <c:if test="${!empty vid }">
	
		<script type="text/javascript">
			
					alert("!31231313");			
		
		</script>
</c:if> --%>



<div class="chart-header" style="width: 52%;margin-left: 25%;margin-top: 70px">


    <table class="table">
        <caption>投票详情统计</caption>
        <thead>
        <tr>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>投票名称</th>
            <th>${vname }</th>
        </tr>
        <tr>
            <td>投票编号</td>
            <td>${vid }</td>
        </tr>
        </tbody>
    </table>


</div>


    <div class="content" style="margin-left: 350px;margin-top: 30px">
            <div class="container-fluid">


                <div class="row" style="width: 1500px">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                Views
                                <p class="category">Bar Chart</p>
                            </div>
                            <div class="content" >
                                <div id="chartViews" class="ct-chart ">


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


 
 
<div class="chart-foot" style="width: 50px;margin-top: -610px;margin-left: 2%">

    <button type="button" class="btn btn-default">
    <!-- 返回页面  -->
    	<a class="btn-default" href="/InitVoteListServlet?curPage=${curPage}">
    		返回页面
    	</a>
    </button>

</div>
<!-- 
	<script type="text/javascript">
	
				$(function(){
					alert(1);
					var vid=1;
					$.post(
							"/Semester_Demo/ChartDataGetServlet",
							{"vid":vid},
							function(data)
							{
								alert("Success");
							},
							"json"
					
					)
					
				});
				
				
	</script> -->




</body>
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>


	<!--  Forms Validations Plugin -->
	<script src="js/jquery.validate.min.js"></script>

	<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
	<script src="js/moment.min.js"></script>

    <!--  Date Time Picker Plugin is included in this js file -->
    <script src="js/bootstrap-datetimepicker.js"></script>

    <!--  Select Picker Plugin -->
    <script src="js/bootstrap-selectpicker.js"></script>

	<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
	<script src="js/bootstrap-checkbox-radio-switch-tags.js"></script>

	<!--  Charts Plugin -->
	<script src="js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/bootstrap-notify.js"></script>

    <!-- Sweet Alert 2 plugin -->
	<script src="js/sweetalert2.js"></script>

    <!-- Vector Map plugin -->
	<script src="js/jquery-jvectormap.js"></script>

    <!--  Google Maps Plugin    -->
    <script src="js/aa743e8f448a4792bad10d201a7080f6.js"></script>

	<!-- Wizard Plugin    -->
    <script src="js/jquery.bootstrap.wizard.min.js"></script>

    <!--  Bootstrap Table Plugin    -->
    <script src="js/bootstrap-table.js"></script>

	<!--  Plugin for DataTables.net  -->
    <script src="js/jquery.datatables.js"></script>


    <!--  Full Calendar Plugin    -->
    <script src="js/fullcalendar.min.js"></script>

    <!-- Light Bootstrap Dashboard Core javascript and methods -->
	<script src="js/light-bootstrap-dashboard.js"></script>

	<!--   Sharrre Library    -->
    <script src="js/jquery.sharrre.js"></script>

	<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>



   





    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-46172202-1', 'auto');
      ga('send', 'pageview');

    </script>

</html>
    