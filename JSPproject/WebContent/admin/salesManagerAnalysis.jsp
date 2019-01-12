<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
</head>
<body>

	   <div id="monthRate" style="border: 0px solid #ccc; width: 600px; height: 400px; position: relative; top: 425px; right: 270px;"></div>
       <div id="partRate" style="border: 0px solid #ccc; width: 500px; height: 400px; position: relative; top: 50px; left: 350px;"></div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {packages: ['corechart', 'bar']});

      // Draw the pie chart and bar chart when Charts is loaded.
      google.charts.setOnLoadCallback(drawBasic);
      google.charts.setOnLoadCallback(drawAnthonyChart);
	 
      function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('number', 'number');
          data.addColumn('number', '판매금액');

          data.addRows([
            [1, 0],  [2, 1000],  [3, 2000],  [4, 3000],  [5, 4000],
            [6, 5000],  [7, 6000],  [8, 7000],  [9, 8000],  [10, 9000], [11, 11000],
            [12, 12000]
          ]);

          var options = {
            hAxis: {
              title: '1월~12월'
            },
            vAxis: {
              title: '18년도 월별 판매액 단위 = 만원'
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('monthRate'));

          chart.draw(data, options);
        }
      
      function drawAnthonyChart() {

          // Create the data table for Anthony's pizza.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'string');
          data.addColumn('number', 'number');
          data.addRows([
            ['1분기', 2],
            ['2분기', 2],
            ['3분기', 2],
            ['4분기', 5]
          ]);

          // Set options for Anthony's pie chart.
          var options = {title:'- - - - -[2018년도 분기별 판매금액] - - - - -',
                         width:600,
                         height:450};

          // Instantiate and draw the chart for Anthony's pizza.
          var chart = new google.visualization.PieChart(document.getElementById('partRate'));
          chart.draw(data, options);
        }
             
                       

  </script>

</body>
</html>