<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">


<style>
	 #main-layout {
		width : 75%;
		margin: 0 auto;
	}
	
	.main {
		display : flex;
		justify-content : center;
		margin-right: 30px;
	}
	
	#title {
    	color : black;
    	font-size : 28px;
    	font-weight : bold;
/*     	border-bottom: 2px solid #a0a0a0; */
    	padding-top : 55px;
    	margin-bottom : 20px;
    	padding-bottom : 16px;
    }
    
    #menu-title {
    	font-size : 21px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	margin-top : 15px;
    	
    }
	
	section {
    	width : 1000px;
    }
    .nav-tabs>li {
	    border: 2px solid lightgray;
	    border-radius: 7px 7px 0 0;
    }
    
    .widget-tabs-list .nav.nav-tabs>li>a {
    font-size: 25px;
     padding: 8px 45px;
}

	.border-box {
		padding : 30px;
		border : 2px solid #dddddd; 
		border-radius : 5px;
		margin-bottom : 30px;
		margin-top : 30px;
	}
	

/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

} */

	.title {
		padding-bottom : 0px;
	}	
	.title h2{
	    font-size: 30px;
	}
	
	.title h2:after {
	    height: 0;
	   	font-size: 30px;
	}
	
	.bar-chart-area {
		margin-bottom : 60px;
	}
	
	#div-table {
		/* background-color : #dddddd99; 
		border-radius : 7px; */
		border-bottom : 1px solid #dddddd;
	}
	
	table {
		width : 800px;
		margin-left : 50px;
		font-size : 22px;
		margin-bottom : 40px;
	}
	
	td, th {
		height : 60px;
	}
	
	div#div-caution >img {
	width : 40px;
	margin : 10px;
	}
	
	#div-caution {
	margin-top : 50px;
	margin-left : 130px;
	font-size : 21px;
	font-weight : bold;
	
	}
	
	#progress {
	margin-top : 50px;
	margin-left : 120px;
	margin-right : 100px;
	}
	
	.progress {
		height : 45px;
		
	}
	
	.progress-bar {
		font-weight : bold;
		font-size : 22px;
	}
</style>
<script>
$(document).ready(function(){
	 function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} 
	 
	 
	let now = new Date()
	let lastDate = new Date(now.getYear(), now.getMonth()+1,0).getDate();
	let nowDate = now.getDate();
	console.log(lastDate)
	console.log(nowDate)
	
	let restDate = lastDate - nowDate
	console.log(restDate)
	
	//한달 권장 일일 지출액
	let dailyExpense = Math.floor(${myMonthlyBudget.consumption}/lastDate)
	dailyExpenseComma = numberWithCommas(dailyExpense)
	console.log(dailyExpense)
	
	$("#dailyExpense").html(dailyExpenseComma)
	
	//지금부터 권장 지출액
	let nowDailyExpense = Math.floor(${hanaro.consumptionBalance}/restDate)
	nowDailyExpense = numberWithCommas(nowDailyExpense)
	
	$('#nowDailyExpense').html(nowDailyExpense)
	console.log(nowDailyExpense)
	
	//이번달 예상 지출
	let nowExpense = ${myMonthlyBudget.consumption} - ${hanaro.consumptionBalance} 	//오늘까지 쓴 금액
	let avgExpenseOfDay = nowExpense / nowDate										//하루 평균 사용금액	
	let expectExpense = Math.floor(avgExpenseOfDay * lastDate)								//달 예상 지출액
	expectExpense = numberWithCommas(expectExpense)
	$('#expectExpense').html(expectExpense)
	//console.log(nowExpense)
	//console.log(avgExpenseOfDay)
	//console.log(expectExpense)
	
	//오늘까지 권장 지출액
	let expense1= numberWithCommas(dailyExpense * nowDate)
	let expense2 = numberWithCommas(${myMonthlyBudget.consumption - hanaro.consumptionBalance})
	let progressWidth1 = dailyExpense * nowDate / ${myMonthlyBudget.consumption} * 100
	let progressWidth2 = ${(myMonthlyBudget.consumption - hanaro.consumptionBalance) /myMonthlyBudget.consumption * 100 } - progressWidth1
	
	console.log(progressWidth1)
	console.log(progressWidth2)
	text = $('#progressBarTemplate').text()
	text = text.replace(/\{width\}/gi, progressWidth1)
				.replace(/\{nowWidth\}/gi, progressWidth2)
				.replace(/\{expense1\}/gi, expense1)
				.replace(/\{expense2\}/gi, expense2)
	console.log(text)
	$('#progress').html(text)
})
</script>
<script id="progressBarTemplate" type="text/template">
<div class="progress">
<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: {width}% " aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"> 권장 지출액 : {expense1} </div>
 <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: {nowWidth}% " aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> 실제 지출액 : {expense2}</div>
</div>
</script>
</head>
 <!-- body -->
<body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="${ pageContext.request.contextPath }/resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader --> 
      <!-- header -->
      <header>
 			<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>      
      </header>
      <!-- end header -->
      

      <div class="row main">
      <aside id="side-menu">
			<div id="diyLnb" class="on">
			<h2 class="tit">하나로통장</h2>
			<ul class="depth1">
				
						<li class="on"><a href="#//HanaBank" >통장전환</a></li>
						
						<li><a href="#//HanaBank">My하나로통장</a></li>
						
						<li><a href="#//HanaBank">대시보드</a></li>
	
				</ul>
				</div>
		</aside>
   
      <section>
			<div id="title" class="titlepage">대시보드</div>
			
			
			
			<div class="widget-tabs-list">
				<ul class="nav nav-tabs">
				<li class=""><a href="${pageContext.request.contextPath}/hanaro/dashBoard/${loginMember.userCode}">고정지출</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >예산 현황</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/dashBoard/savingAnalysis">저축 현황</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >추천 상품</a></li>
				</ul>
	
				<!-- --------------------- 내용 ------------------------ -->
				<div class="content">
					<div class="border-box">
						<div class="title col">	
							<h2 id="title-h2">내 <strong class="black">예산</strong></h2>	
						</div>
						<div id="div-table">
						<table>
							<tr>
								<th width="30%">월 생활금</th>
								<th><fmt:formatNumber  value="${myMonthlyBudget.consumption}" type="number"/>원 
								<span style="font-size : 18px;">&nbsp;(권장 지출액 : 일 <span id="dailyExpense"></span>원)</span>
								</th>
							</tr>
							<tr>
								<th>남은 예산</th>
								<th><span style="font-size : 36px; color : #009b9d"><fmt:formatNumber value="${hanaro.consumptionBalance}" type="number"/></span>
								&nbsp;원 </th>
							</tr>
						</table>
						</div>
						<div id="div-caution">
						<img src="${pageContext.request.contextPath}/resources/icon/caution3.png"/>
						예산을 맞추려면 하루에 <span id="nowDailyExpense" style="font-size : 30px"></span>&nbsp;원씩 써야해요!<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 추세로 쓴다면 이번 달 지출&nbsp; <span id="expectExpense"  style="font-size : 30px"></span>&nbsp;원 예상!
						</div>
						
						<div id="progress">
						<%-- 	<div id="progressBar1"></div>
 							<!--  <div id="progressBar1" class="progress-bar bg-warning" role="progressbar" style="width:" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div> -->
 							 <div class="progress-bar bg-danger" role="progressbar" style="width: ${(myMonthlyBudget.consumption - hanaro.consumptionBalance) /myMonthlyBudget.consumption * 100 -30}%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div> --%>
						</div>
					</div>
					<div class="border-box">
						<div class="title col">		
						<h2 id="title-h2">또래<strong class="black"> 분석</strong></h2>				
						</div>
						 
						 <div id="menu-title"> 내 또래 평균 예산</div>

				    <!-- Bar Chart area End-->
				    <div class="bar-chart-area">
				        <div class="container">
				       		<div class="row">
				             	<div class="col-md-1">
				             	</div>
				                <div class="col-md-5">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart1"></canvas>
				                    </div>
				                </div>
				                <div>
				                 또래보다 
				                 고정지출 :
				                 한달 생활 예산 :
				                 저축액
				                 원 많습니다.
				                </div>
				            </div>
				<!--            <div class="row">
				                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                    <div class="bar-chart-wp">
				                        <canvas height="140vh" width="180vw" id="barchart1"></canvas>
				                    </div>
				                </div>
				                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart2"></canvas>
				                    </div>
				                </div>
				            </div>
				            <div class="row">
				                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                    <div class="bar-chart-wp mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart3"></canvas>
				                    </div>
				                </div>
				                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				                    <div class="bar-chart-wp mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart4"></canvas>
				                    </div>
				                </div>
				            </div> -->
				        </div>
				    </div>
				    <!-- Bar Chart area End-->
												 
					<div id="menu-title"> 내 또래 상위 10%의 설정 예산 </div>
				 								  <div class="bar-chart-area">
				        <div class="container">
				           <div class="row">
				            	<div class="col-md-1">
				             	</div>
				                <div class="col-md-5">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart2"></canvas>
				                    </div>
				                </div>
				                 <div>
				                 또래  10%보다 
				                 고정지출 :
				                 한달 생활 예산 :
				                 저축액
				                 원 많습니다.
				                </div>
				            </div>
				 	
				        </div>
				    </div> 
					</div>
				</div>
			</div>
		

	    <!-- wow JS
			============================================ -->
	     <script src="${ pageContext.request.contextPath }/resources/template/js/wow.min.js"></script> 
	    <!-- Charts JS
			============================================ -->
	    <script src="${ pageContext.request.contextPath }/resources/template/js/charts/Chart.js"></script>
<%-- 	    <script src="${ pageContext.request.contextPath }/resources/template/js/charts/bar-chart.js"></script> --%>
    
      	<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
   			 <!-- bootstrap JS
		============================================ -->
  			  <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>	
      </section> 
      </div>

      <%-- footer --%>
      <footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
</body>
<script>
(function ($) {
	 "use strict";

		/*----------------------------------------*/
		/*  2.  Bar Chart vertical
		/*----------------------------------------*/
		var ctx = document.getElementById("barchart1");
		
		/*만원단위*/
		let myFixedExpense= ${myMonthlyBudget.fixedExpense}/10000
		let myConsumption = ${myMonthlyBudget.consumption}/10000
		let mySaving = ${myMonthlyBudget.saving}/10000
		
		let agesAvgFixedExpense = ${agesAvgBudget.fixedExpense}/10000
		let agesAvgConsumption = ${agesAvgBudget.consumption}/10000
		let agesAvgSaving = ${agesAvgBudget.saving}/10000
		console.log(agesAvgFixedExpense)
		console.log(agesAvgConsumption)
		console.log(agesAvgSaving)
		
		var barchart1 = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ["기본금", "생활금", "비상금"],
				datasets: [{
	                label: '또래 사용자',
					data: [agesAvgFixedExpense, agesAvgConsumption, agesAvgSaving],
					borderWidth: 1,
	                backgroundColor: [
						'rgba(255, 99, 132, 0.4)',
						'rgba(255, 99, 132, 0.4)',
						'rgba(255, 99, 132, 0.4)',
					],
					borderColor: [
						'rgba(255,99,132,1)',
						'rgba(255,99,132,1)',
						'rgba(255,99,132,1)',
						
					],
	            }, {
	                label: '나',
					data: [myFixedExpense, myConsumption, mySaving],
	                backgroundColor: [
						'rgb(50,205,50, 0.4)',
						'rgb(50,205,50, 0.4)',
						'rgb(50,205,50, 0.4)'
					],
					borderColor: [
						'rgba(54, 162, 235, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(54, 162, 235, 1)',
					],
					borderWidth: 1
	            }]
			},
			options: {
				responsive: true,
					scales: {
					yAxes: [{
						ticks: {
							min : 0,
							position: 'top',
							
						}
					}]
				},
			
				title: {
					display: true,
					text: 'Bar Chart Vertical'
				}
			}
		});
		
		
		/*----------------------------------------*/
		/*  2.  Bar Chart vertical
		/*----------------------------------------*/
		var ctx = document.getElementById("barchart2");
		var barchart2 = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ["기본금", "생활금", "비상금"],
				datasets: [{
	                label: '또래 사용자',
					data: [180, 140, 150],
					borderWidth: 1,
	                backgroundColor: [
						'rgba(255, 99, 132, 0.4)',
						'rgba(255, 99, 132, 0.4)',
						'rgba(255, 99, 132, 0.4)',
					],
					borderColor: [
						'rgba(255,99,132,1)',
						'rgba(255,99,132,1)',
						'rgba(255,99,132,1)',
						
					],
	            }, {
	                label: '나',
					data: [myFixedExpense, myConsumption, mySaving],
	                backgroundColor: [
						'rgb(50,205,50, 0.4)',
						'rgb(50,205,50, 0.4)',
						'rgb(50,205,50, 0.4)'
					],
					borderColor: [
						'rgba(54, 162, 235, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(54, 162, 235, 1)',
					],
					borderWidth: 1
	            }]
			},
			options: {
				responsive: true,
					scales: {
					yAxes: [{
						ticks: {
							min : 0,
							position: 'top',
							
						}
					}]
				},
			
				title: {
					display: true,
					text: 'Bar Chart Vertical'
				}
			}
		});
		
})(jQuery); 
</script>
</html>