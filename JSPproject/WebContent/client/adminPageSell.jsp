<%@page import="dtodao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:useBean id="ReviewBean" class="dtodao.ReviewDTO">
	<jsp:setProperty name="ReviewBean" property="*" />
</jsp:useBean>

	
<jsp:include page="Top.jsp"/>


<style type="text/css">
.relative1 {
	position: relative;
	top: 650px;
	right: 300px;
	background-color: white;
	width: 500px;
}

.relative2 {
	position: relative;
	top: 650px;
	left: 800px;
	background-color: white;
	width: 500px;
}
</style>


</head>
<body>

<%
/* 	int count1 = 0;
	int count2 = 0;
	int count3 = 0;
	int count4 = 0;
	int count5 = 0;
	
	
	

	String month = request.getParameter("month");
	
	ReviewDAO rdao = new ReviewDAO();
	count1 = rdao.getAllGradeCoun1(month);
	count2 = rdao.getAllGradeCoun2(month);
	System.out.println(count2);
	count3 = rdao.getAllGradeCount3(month);
	System.out.println(count3);
	count4 = rdao.getAllGradeCount4(month);
	System.out.println(count4);
	count5 = rdao.getAllGradeCount5(month);
	System.out.println(count5); */

%>



<!-- ------------------------------------------------------------------------------------------- -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {'packages':['corechart']});

      // Draw the pie chart and bar chart when Charts is loaded.
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawAnthonyChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        var piechart_options = {title:'Pie Chart: How Much Pizza I Ate Last Night',
                       width:400,
                       height:300};
        var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        piechart.draw(data, piechart_options);

        var barchart_options = {title:'Barchart: How Much Pizza I Ate Last Night',
                       width:400,
                       height:300,
                       legend: 'none'};
        var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        barchart.draw(data, barchart_options);
      }

           function drawAnthonyChart() {

        // Create the data table for Anthony's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 2],
          ['Onions', 2],
          ['Olives', 2],
          ['Zucchini', 0],
          ['Pepperoni', 3]
        ]);

        // Set options for Anthony's pie chart.
        var options = {title:'How Much Pizza Anthony Ate Last Night',
                       width:400,
                       height:300};

        // Instantiate and draw the chart for Anthony's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
        chart.draw(data, options);
      }
</script>
<body>
	<form action="adminPageSell.jsp" method="post">
		<select class="custom-select" style="position: relative; top: 250px; right: 350px; width: 200px;" name="month">
			<option selected>월별 판매량</option>
			<option value="anchorBoxId_24734">1월</option>
			<option value="anchorBoxId_24734">2월</option>
			<option value="anchorBoxId_24734">3월</option>
		</select>
		<input type="submit" class="btn btn-dark" style="position: relative; top: 250px; right: 340px;" value="Dark">
	</form>


	<div class="relative1" id="chart_div" style="width: 400px; height: 300px;"></div>
	<div class="relative2" id="chart_div2" style="width: 400px; height: 300px;"></div>
    <!--Table and divs that hold the pie charts-->
    <table class="columns">
      <tr>
        <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="barchart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
      </tr>
    </table>

      
</body>
</html>











































