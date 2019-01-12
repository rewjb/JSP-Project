<%@page import="java.util.Calendar"%>
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
	String thisMonth = sf.format(now);
	
	
	// 올해를 구하는 메소드	
	SimpleDateFormat sf2 = new SimpleDateFormat("YYYY");	 
	String thisYear = sf2.format(now);
	

	// 문자열을 인트로 변환해서 날짜 계산을 하기 위해 달력 메소드 호출
	Calendar calendar = Calendar.getInstance();
	
	
	String year1 = request.getParameter("year");
	String month1 = request.getParameter("month");

	
	// 널값 처리를 위해 최초 실행시 널값이기 때문에 년도는 올해와, 월은 이번달
	if(year1 == null){
		
		year1 = thisYear;
	}
	if(month1 == null){
		month1 = thisMonth;
	}
	
	
	// 날짜를 계산하기 위해 문자열 을 인트로 변환
	int yearS = Integer.parseInt(year1);	
	int monthS = Integer.parseInt(month1);

		
	calendar.set(yearS, monthS, 0);
	
	//매월 그 달의 마지막날을 계산
	int DayOfMonthS = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// DAO로 인자로 전달하기 위해 계산된 인트형 숫자를 다시 스트링으로 변환시켜주는 과정이 필요
	String year = Integer.toString(yearS);
	String month = Integer.toString(monthS);
	String DayOfMonth = Integer.toString(DayOfMonthS);
	
	
	String mStart = "";
	String mEnd = "";
	
	String mStart2 = "";
	String mEnd2 = "";
	
	// 전달시 YYYY-MM-DD 형태로 전달될 수 있게 
	mStart = year+"-"+"0"+month+"-"+"01";
	mEnd = year+"-"+"0"+month+"-"+DayOfMonth;

	mStart2 = year+"-"+"01"+"-"+"01";
	mEnd2 =  year+"-"+"12"+"-"+"31";
		
	SalesManagerDAO sdao = new SalesManagerDAO();
	 
	Vector<SalesManagerDTO> vec = sdao.getMonthDeal(mStart, mEnd);
	
	
	
	Vector<SalesManagerDTO> vec2 = sdao.getYearRate(mStart2, mEnd2);


	
	 
%>

<form action="salesManager.jsp" method="post">
		<select class="custom-select" style="position: relative; top: 200px; left: 94px; width: 150px;" name="month">
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
		<select class="custom-select" style="position: relative; top: 200px; right: 180px; width: 120px;" name="year">
			<option selected>년도 선택</option>
			<option value="2019">2019년</option>
			<option value="2018">2018년</option>
			<option value="2017">2017년</option>
			<option value="2016">2016년</option>
			<option value="2015">2015년</option>

		</select>
		<input type="hidden" name="month">
		<input type="hidden" name="year">
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
		                        <th width="50px;">제품</th>
		                        <th width="100px;">브랜드</th>
		                        <th width="100px;">모델</th>
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
		                	int price = 0;
		                	int saveMoney = 0;
		                	
		                	int totalQuantityGeiger = 0;
		                	int totalPriceGeiger = 0;
		                	
		                	int totalQuantityDiesel = 0;
		                	int totalPriceDiesel = 0;
		                	
		                	int totalQuantityDwM = 0;
		                	int totalPriceDwM = 0;
		                	
		                	int totalQuantityLuminox = 0;
		                	int totalPriceLuminox = 0;
		                	
		                	int totalQuantityGucci = 0;
		                	int totalPriceGucci = 0;
		                	
		                	int totalQuantityDKNY = 0;
		                	int totalPriceDKNY = 0;
		                	
		                	int totalQuantityMJ = 0;
		                	int totalPriceMJ = 0;
		                	
		                	int totalQuantityDwW = 0;
		                	int totalPriceDwW = 0;
		                	int tototal = 0;
		                	
		                	for(int i =0; i < vec.size(); i++){
		                		sdto = vec.get(i);
		                		price = sdto.getPrice() * sdto.getQuantity();
		                		saveMoney = sdto.getQuantity() * sdto.getSaveMoney();
		                		tototal = tototal + price;
		                		
								if(sdto.getBrand().equals("가이거")){
		                			
									totalQuantityGeiger = totalQuantityGeiger + sdto.getQuantity();
									totalPriceGeiger = totalPriceGeiger + price;

		                		}else if(sdto.getBrand().equals("디젤")){
		                			
		                			totalQuantityDiesel = totalQuantityDiesel + sdto.getQuantity();
		                			totalPriceDiesel = totalPriceDiesel + price;

		                		}else if(sdto.getBrand().equals("루미눅스")){
		                			
		                			totalQuantityLuminox = totalQuantityLuminox + sdto.getQuantity();
		                			totalPriceLuminox = totalPriceLuminox + price;

		                		}else if(sdto.getBrand().equals("다니엘 웰링턴(남)")){
		                			
		                			totalQuantityDwM = totalQuantityDwM + sdto.getQuantity();
		                			totalPriceDwM = totalPriceDwM + price;

		                		}else if(sdto.getBrand().equals("구찌")){
		                			
		                			totalQuantityGucci = totalQuantityGucci + sdto.getQuantity();
		                			totalPriceGucci = totalPriceGucci + price;

		                		}else if(sdto.getBrand().equals("DKNY")){
		                			
		                			totalQuantityDKNY = totalQuantityDKNY + sdto.getQuantity();
		                			totalPriceDKNY = totalPriceDKNY + price;

		                		}else if(sdto.getBrand().equals("마크제이콥스")){
		                			
		                			totalQuantityMJ = totalQuantityMJ + sdto.getQuantity();
		                			totalPriceMJ = totalPriceMJ + price;

		                		}else if(sdto.getBrand().equals("다니엘 웰링턴(여)")){
		                			
		                			totalQuantityDwW = totalQuantityDwW + sdto.getQuantity();
		                			totalPriceDwW = totalPriceDwW + price;

		                		}
								
		                %>
		                
		                    <tr>
		                        <td><img src="<%=sdto.getImgAddr() %>" class="rounded float-left" alt="..." style="width: 100px; height: 100px;"></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getBrand() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getModelName() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getDealNum()%></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getMid() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getQuantity() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=price%></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getDeliverPrice() %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=saveMoney %></td>
		                        <td style='text-align:center;vertical-align:middle'><%=sdto.getDealDate() %></td>
		                    </tr> 
		                      <%
		                	}
		                      %>             
		                </tbody>
		            </table>
		            <hr>
		        </div>
		    </div>
		</div>
		<%
		
		System.out.println("가이거 토탈 판매량  : "+totalQuantityGeiger+"개");
		System.out.println("가이거 토탈 판매약  : "+totalPriceGeiger+"원" );
		System.out.println();
		System.out.println("디젤 토탈 판매량  : "+totalQuantityDiesel+"개");
		System.out.println("디젤 토탈 판매약  : "+totalPriceDiesel+"원" );
		System.out.println();
		System.out.println("루미눅스 토탈 판매량  : "+totalQuantityLuminox+"개");
		System.out.println("루미눅스 토탈 판매약  : "+totalPriceLuminox+"원" );
		System.out.println();
		System.out.println("다니엘남 토탈 판매량  : "+totalQuantityDwM+"개");
		System.out.println("다니엘남 토탈 판매약  : "+totalPriceDwM+"원" );
		System.out.println();
		System.out.println("구찌 토탈 판매량  : "+totalQuantityGucci+"개");
		System.out.println("구찌 토탈 판매약  : "+totalPriceGucci+"원" );
		System.out.println();
		System.out.println("DK 토탈 판매량  : "+totalQuantityDKNY+"개");
		System.out.println("DK 토탈 판매약  : "+totalPriceDKNY+"원" );
		System.out.println();
		System.out.println("마크제 토탈 판매량  : "+totalQuantityMJ+"개");
		System.out.println("마크제 토탈 판매약  : "+totalPriceMJ+"원" );
		System.out.println();
		System.out.println("다니엘여 토탈 판매량  : "+totalQuantityDwW+"개");
		System.out.println("다니엘여 토탈 판매약  : "+totalPriceDwW+"원" );
		System.out.println();
		System.out.println(year+"년"+"1월 총 판매 금액 : "+ tototal+"원");

		

		
		
		int monthTotal1=0;
		int monthTotal2=0;
		int monthTotal3=0;
		int monthTotal4=0;
		int monthTotal5=0;
		int monthTotal6=0;
		int monthTotal7=0;
		int monthTotal8=0;
		int monthTotal9=0;
		int monthTotal10=0;
		int monthTotal11=0;
		int monthTotal12=0;
		int price2 =0;
		int tototal2 = 0;


		for(int i =0; i < vec2.size(); i++){
    		SalesManagerDTO sdto2 = vec2.get(i);
    		price2 = sdto2.getPrice() * sdto2.getQuantity();
    		tototal2 = tototal2 + price2;
    		
    	 	if(sdto2.getDealDate().contains(year+"-"+"01")){
    			
    			monthTotal1 = monthTotal1 + price2;
    			
    		}else if(sdto2.getDealDate().contains(year+"-"+"02")){
    			
    			monthTotal2 = monthTotal2 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"03")){
    			
    			monthTotal3 = monthTotal3 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"04")){
    			
    			monthTotal4 = monthTotal4 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"05")){
    			
    			monthTotal5 = monthTotal5 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"06")){
    			
    			monthTotal6 = monthTotal6 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"07")){
    			
    			monthTotal7 = monthTotal7 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"08")){
    			
    			monthTotal8 = monthTotal8 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"09")){
    			
    			monthTotal9 = monthTotal9 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"10")){
    			
    			monthTotal10 = monthTotal10 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"11")){
    			
    			monthTotal11 = monthTotal11 + price2;
    		}else if(sdto2.getDealDate().contains(year+"-"+"12")){
    			
    			monthTotal12 = monthTotal12 + price2;
    		}
    			
    			
    		
    		
		
		}
    	System.out.println(year+"년"+"1월 총액 : " + monthTotal1+"원");
    	System.out.println(year+"년"+"2월 총액 : " + monthTotal2+"원");
    	System.out.println(year+"년"+"3월 총액 : " + monthTotal3+"원");
    	System.out.println(year+"년"+"4월 총액 : " + monthTotal4+"원");
    	System.out.println(year+"년"+"5월 총액 : " + monthTotal5+"원");
    	System.out.println(year+"년"+"6월 총액 : " + monthTotal6+"원");
    	System.out.println(year+"년"+"7월 총액 : " + monthTotal7+"원");
    	System.out.println(year+"년"+"8월 총액 : " + monthTotal8+"원");
    	System.out.println(year+"년"+"9월 총액 : " + monthTotal9+"원");
    	System.out.println(year+"년"+"10월 총액 : " + monthTotal10+"원");
    	System.out.println(year+"년"+"11월 총액 : " + monthTotal11+"원");
    	System.out.println(year+"년"+"12월 총액 : " + monthTotal12+"원");
		%>
		

       <div id="brandRate" style="border: 0px solid #ccc; width: 1100px; height: 500px; position: relative; top: 300px; left: 30px;"></div>
        <div id="monthRate" style="border: 0px solid #ccc; width: 600px; height: 400px; position: relative; top: 425px; right: 270px;"></div>
       <div id="partRate" style="border: 0px solid #ccc; width: 500px; height: 400px; position: relative; top: 50px; left: 350px;"></div>


<!-- ------------------------------------------------------------------------------------------- -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {packages: ['corechart', 'bar']});

      // Draw the pie chart and bar chart when Charts is loaded.
      
      google.charts.setOnLoadCallback(drawDualY);
      google.charts.setOnLoadCallback(drawBasic);
      google.charts.setOnLoadCallback(drawAnthonyChart);

 
      function drawDualY() {
      var data = new google.visualization.DataTable();
      data.addColumn('timeofday', '브랜드');
      data.addColumn('number', '판매량(단위 : 개)');
      data.addColumn('number', '판매금액(단위 : 1k = 1천만원)');
   
     

      data.addRows([
        [{v: [0, 0, 0], f: '가이거'}, <%=totalQuantityGeiger%>, <%=totalPriceGeiger%>],
        [{v: [1, 1, 1], f: '디젤'}, <%=totalQuantityDiesel%>, <%=totalPriceDiesel%>],
        [{v: [2, 2, 2], f: '루미눅스'}, <%=totalQuantityLuminox%>, <%=totalPriceLuminox%>],
        [{v: [3, 3, 3], f: '다니엘웰링턴(남)'}, <%=totalQuantityDwM%>, <%=totalPriceDwM%>],
        [{v: [4, 4, 4], f: '구찌'}, <%=totalQuantityGucci%>, <%=totalPriceGucci%>],
        [{v: [5, 5, 5], f: 'DKNY'}, <%=totalQuantityDKNY%>, <%=totalPriceDKNY%>],
        [{v: [6, 6, 6], f: '마크제이콥스'}, <%=totalQuantityMJ%>, <%=totalPriceMJ%>],
        [{v: [7, 7, 7], f: '다니엘웰링턴(여)'}, <%=totalQuantityDwW%>, <%=totalPriceDwW%>],
      ]);
      

      var options = {
        chart: {
          title: '[<%=year%>년도 <%=month%>월 브랜드 판매량과 판매 금액]',
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
   /* ------------------------------------------------------------------------------------------------------ */   
      function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('number', 'number');
          data.addColumn('number', '판매금액');

          data.addRows([
            [1, <%=monthTotal1%>],  [2, <%=monthTotal2%>],  [3, <%=monthTotal3%>],  [4, <%=monthTotal4%>],  [5, <%=monthTotal5%>],
            [6, <%=monthTotal6%>],  [7, <%=monthTotal7%>],  [8, <%=monthTotal8%>],  [9, <%=monthTotal9%>],  [10, <%=monthTotal10%>], 
            [11, <%=monthTotal11%>],[12, <%=monthTotal12%>]
          ]);

          var options = {
            hAxis: {
              title: '1월~12월'
            },
            vAxis: {
              title: '<%=year%>년도 월별 판매액 단위 = 만원'
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('monthRate'));

          chart.draw(data, options);
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