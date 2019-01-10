<%@page import="java.util.Vector"%>
<%@page import="dtodao.SalesManagerDAO"%>
<%@page import="dtodao.SalesManagerDTO"%>
<%@page import="dtodao.DealDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

<jsp:useBean id="sdto" class="dtodao.SalesManagerDTO">
	<jsp:setProperty name="sdto" property="*"/>
</jsp:useBean>




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

<%
	/* Date now = new Date();
	 SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");	 
	 String today = sf.format(now);  */

	 
	// 이번달을 구하는 메소드
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MM");	 
	String today = sf.format(now);
	
	
	String month = request.getParameter("month");

	
	if(month == null){
		
		month = today;
	}
	
	System.out.println(month+"월");
	
	
	SalesManagerDAO sdao = new SalesManagerDAO();
	 
	Vector<SalesManagerDTO> vec = sdao.getMonthDeal();
	System.out.println("성공1");
	 
%>

<form action="salesManagerAnalysis.jsp" method="post">
		<select class="custom-select" style="position: relative; top: 200px; right: 30px; width: 200px;" name="month">
			<option selected>월별 구매내역</option>
			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
			<option value="04">4월</option>
			<option value="05">5월</option>
			<option value="06">6월</option>
			<option value="07">7월</option>
			<option value="08">8월</option>
			<option value="09">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<input type="hidden" name="month">
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
		                <%
		                	for(int i =0; i < vec.size(); i++){
		                		sdto = vec.get(i);
		                	}
		                %>
		                
		                    <tr>
		                        <td><img src="../img/Cimage/anchorBoxId_12220.jpg" class="rounded float-left" alt="..." style="width: 100px; height: 100px;"></td>
		                        <td style='text-align:center;vertical-align:middle'>GIGER</td>
		                        <td style='text-align:center;vertical-align:middle'>GE1180MWRG</td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getDealNum()%></td>
		                        <td style='text-align:center;vertical-align:middle'>><%=sdto.getMid() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getQuantity() %></td>
		                        <td style='text-align:center;vertical-align:middle'>239000원</td>
		                        <td style='text-align:center;vertical-align:middle'>3000원</td>
		                        <td style='text-align:center;vertical-align:middle'>4780원</td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getDealDate() %></td>
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
<!--     <table class="columns" style="position: relative; top: 300px; right: 50px;">
      <tr>
        <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="chart_div" style="border: 1px solid #ccc; width: 500px; height: 300px;" ></div></td>
        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
      </tr>
    </table> -->
       <div id="brandRate" style="border: 0px solid #ccc; width: 1100px; height: 500px; position: relative; top: 300px; left: 30px;"></div>
       <div id="monthRate" style="border: 0px solid #ccc; width: 600px; height: 400px; position: relative; top: 425px; right: 270px;"></div>
       <div id="partRate" style="border: 0px solid #ccc; width: 500px; height: 400px; position: relative; top: 50px; left: 350px;"></div>


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
              title: '2018년도 월별 판매액 단위 = 만원'
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('monthRate'));

          chart.draw(data, options);
        }
 /*------------------------------------------------------------------------------------------------------  */     
     function drawDualY() {
      var data = new google.visualization.DataTable();
      data.addColumn('timeofday', '브랜드');
      data.addColumn('number', '판매량(단위 : 개)');
      data.addColumn('number', '판매금액(단위 : 1k = 1천만원)');

      data.addRows([
        [{v: [0, 0, 0], f: '브랜드1'}, 100, 1000],
        [{v: [1, 0, 0], f: '브랜드2'}, 200, 2000],
        [{v: [2, 0, 0], f: '브랜드3'}, 300, 3000],
        [{v: [3, 0, 0], f: '브랜드4'}, 400, 4000],
        [{v: [4, 0, 0], f: '브랜드5'}, 500, 5000],
        [{v: [5, 0, 0], f: '브랜드6'}, 600, 6000],
        [{v: [6, 0, 0], f: '브랜드7'}, 700, 7000],
        [{v: [7, 0, 0], f: '브랜드8'}, 800, 8000],
      ]);

      var options = {
        chart: {
          title: '[2019년도 1월 브랜드 판매량과 판매 금액]',
        },
        /*우측 표시*/
         series: {
          0: {axis: 'MotivationLevel'},
          1: {axis: 'EnergyLevel'}
        }, 
      }; 

      var materialChart = new google.charts.Bar(document.getElementById('brandRate'));
      materialChart.draw(data, options);
    }
 
      /*------------------------------------------------------------------------------------------------------  */  
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