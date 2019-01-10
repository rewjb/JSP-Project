<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<jsp:include page="adminTop.jsp"></jsp:include>




<style type="text/css">

.row-padding {
    margin-top: 25px;
    margin-bottom: 25px;
}

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

<form action="adminPageSell.jsp" method="post">
		<select class="custom-select" style="position: relative; top: 200px; right: 30px; width: 200px;" name="month">
			<option selected>월별 구매내역</option>
			<option value="anchorBoxId_24734">1월</option>
			<option value="anchorBoxId_24734">2월</option>
			<option value="anchorBoxId_24734">3월</option>
			<option value="anchorBoxId_24734">4월</option>
			<option value="anchorBoxId_24734">5월</option>
			<option value="anchorBoxId_24734">6월</option>
			<option value="anchorBoxId_24734">7월</option>
			<option value="anchorBoxId_24734">8월</option>
			<option value="anchorBoxId_24734">9월</option>
			<option value="anchorBoxId_24734">10월</option>
			<option value="anchorBoxId_24734">11월</option>
			<option value="anchorBoxId_24734">12월</option>
		</select>
		<input type="submit" class="btn btn-dark" style="position: relative; top: 200px; right: 35px;" value="검색">
</form>

	
		 <div class="container" style="position: relative; top: 230px; left: 10px; width:100%; height:400px; overflow:auto;"> 
		
		    <div class="row">
		        <div class="col-lg-4 col-lg-offset-4">
		            <input type="search" id="search" value="" class="form-control" placeholder="Search using Fuzzy searching">
		        </div>
		    </div>
		    <div class="row">
		        <div class="col-lg-12">
		            <table class="table" id="table" style=" margin: auto; text-align: center;">
		                <thead>
		                    <tr>
		                        <th>제품</th>
		                        <th>브랜드</th>
		                        <th>모델</th>
		                        <th>구매번호</th>
		                        <th>고객이름</th>
		                        <th>수량</th>
		                        <th>가격</th>
		                        <th>배송비</th>
		                        <th>적립금</th>
		                        <th>구매날짜</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td><img src="../img/Cimage/anchorBoxId_12220.jpg" class="rounded float-left" alt="..." style="width: 100px; height: 100px;"></td>
		                        <td style='text-align:center;vertical-align:middle'>GIGER</td>
		                        <td style='text-align:center;vertical-align:middle'>GE1180MWRG</td>
		                        <td style='text-align:center;vertical-align:middle'>1235</td>
		                        <td style='text-align:center;vertical-align:middle'>장민</td>
		                        <td style='text-align:center;vertical-align:middle'>1</td>
		                        <td style='text-align:center;vertical-align:middle'>239000원</td>
		                        <td style='text-align:center;vertical-align:middle'>3000원</td>
		                        <td style='text-align:center;vertical-align:middle'>4780원</td>
		                        <td style='text-align:center;vertical-align:middle'>2019-01-01</td>
		                    </tr>
		                    <tr>
		                        <td><img src="../img/Cimage/anchorBoxId_12220.jpg" class="rounded float-left" alt="..." style="width: 100px; height: 100px;"></td>
		                        <td style='text-align:center;vertical-align:middle'>GIGER</td>
		                        <td style='text-align:center;vertical-align:middle'>GE1180MWRG</td>
		                        <td style='text-align:center;vertical-align:middle'>1235</td>
		                        <td style='text-align:center;vertical-align:middle'>장민</td>
		                        <td style='text-align:center;vertical-align:middle'>1</td>
		                        <td style='text-align:center;vertical-align:middle'>239000원</td>
		                        <td style='text-align:center;vertical-align:middle'>3000원</td>
		                        <td style='text-align:center;vertical-align:middle'>4780원</td>
		                        <td style='text-align:center;vertical-align:middle'>2019-01-01</td>
		                    </tr>
		                  	 <tr>
		                        <td><img src="../img/Cimage/anchorBoxId_12220.jpg" class="rounded float-left" alt="..." style="width: 100px; height: 100px;"></td>
		                        <td style='text-align:center;vertical-align:middle'>GIGER</td>
		                        <td style='text-align:center;vertical-align:middle'>GE1180MWRG</td>
		                        <td style='text-align:center;vertical-align:middle'>1235</td>
		                        <td style='text-align:center;vertical-align:middle'>장민</td>
		                        <td style='text-align:center;vertical-align:middle'>1</td>
		                        <td style='text-align:center;vertical-align:middle'>239000원</td>
		                        <td style='text-align:center;vertical-align:middle'>3000원</td>
		                        <td style='text-align:center;vertical-align:middle'>4780원</td>
		                        <td style='text-align:center;vertical-align:middle'>2019-01-01</td>
		                    </tr>	                    
		                </tbody>
		            </table>
		            <hr>
		        </div>
		    </div>
		</div>
		





<!-- 
	<div class="relative1" id="chart_div" style="width: 400px; height: 300px;"></div>
	<div class="relative2" id="chart_div2" style="width: 400px; height: 300px;"></div> -->
    <!--Table and divs that hold the pie charts-->
    <table class="columns" style="position: relative; top: 300px; right: 50px;">
      <tr>
        <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="chart_div" style="border: 1px solid #ccc; width: 500px; height: 300px;" ></div></td>
        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
      </tr>
    </table>



<!-- ------------------------------------------------------------------------------------------- -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {packages: ['corechart', 'bar']});

      // Draw the pie chart and bar chart when Charts is loaded.
      google.charts.setOnLoadCallback(drawBasic);
      google.charts.setOnLoadCallback(drawDualY);
      google.charts.setOnLoadCallback(drawAnthonyChart);


      function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('number', 'X');
          data.addColumn('number', 'Dogs');

          data.addRows([
            [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
            [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
            [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
            [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
            [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
            [30, 55], [31, 60], [32, 61], [33, 59], [34, 62], [35, 65],
            [36, 62], [37, 58], [38, 55], [39, 61], [40, 64], [41, 65],
            [42, 63], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
            [48, 72], [49, 68], [50, 66], [51, 65], [52, 67], [53, 70],
            [54, 71], [55, 72], [56, 73], [57, 75], [58, 70], [59, 68],
            [60, 64], [61, 60], [62, 65], [63, 67], [64, 68], [65, 69],
            [66, 70], [67, 72], [68, 75], [69, 80]
          ]);

          var options = {
            hAxis: {
              title: '1월~12월'
            },
            vAxis: {
              title: '월별 판매액'
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('piechart_div'));

          chart.draw(data, options);
        }
 /*------------------------------------------------------------------------------------------------------  */     
     function drawDualY() {
      var data = new google.visualization.DataTable();
      data.addColumn('timeofday', 'Time of Day');
      data.addColumn('number', '판매량');
      data.addColumn('number', '판매금액');

      data.addRows([
        [{v: [8, 0, 0], f: '브랜드1'}, 1, .25],
        [{v: [9, 0, 0], f: '브랜드2'}, 2, .5],
        [{v: [10, 0, 0], f:'브랜드3'}, 3, 1],
        [{v: [11, 0, 0], f: '브랜드4'}, 4, 2.25],
        [{v: [12, 0, 0], f: '브랜드5'}, 5, 2.25],
        [{v: [13, 0, 0], f: '브랜드6'}, 6, 3],
        [{v: [14, 0, 0], f: '브랜드7'}, 7, 4],
        [{v: [15, 0, 0], f: '브랜드8'}, 8, 5.25],
      ]);

      var options = {
        chart: {
          title: '월별 브랜드 판매량과 판매 금액',
        },
        series: {
          0: {axis: 'MotivationLevel'},
          1: {axis: 'EnergyLevel'}
        },
        axes: {
          y: {
            판매량: {label: '판매량 (1개-100개)'},
            판매금액: {label: '판매금액 (10만-1000천만)'}
          }
        },
        hAxis: {
          title: '1월 판매량 및 판매금액',
          format: 'h:mm a',
          viewWindow: {
            min: [7, 30, 0],
            max: [17, 30, 0]
          }
        },
        vAxis: {
          title: 'Rating (scale of 1-10)'
        }
      };

      var materialChart = new google.charts.Bar(document.getElementById('chart_div'));
      materialChart.draw(data, options);
    }
 
      /*------------------------------------------------------------------------------------------------------  */  
          function drawAnthonyChart() {

        // Create the data table for Anthony's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['1분기', 2],
          ['2분기', 2],
          ['3분기', 2],
          ['4분기', 5]
        ]);

        // Set options for Anthony's pie chart.
        var options = {title:'[년간 분기별 판매금액]',
                       width:400,
                       height:300};

        // Instantiate and draw the chart for Anthony's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
        chart.draw(data, options);
      }
           
                     

</script>
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<script type="text/javascript">
$(function () {
    $( '#table' ).searchable({
        striped: true,
        oddRow: { 'background-color': '#f5f5f5' },
        evenRow: { 'background-color': '#fff' },
        searchType: 'fuzzy'
    });
    
    $( '#searchable-container' ).searchable({
        searchField: '#container-search',
        selector: '.row',
        childSelector: '.col-xs-4',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
});
</script>


</body>
</html>