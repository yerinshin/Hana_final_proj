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
     body {
    font-family: 'hana' , verdana, san-serif;
}

	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
		display : flex;
		justify-content : center;
		/* margin-right: 30px; */
		margin-left: 35px;
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
    	width : 1300px;
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
		margin-left: 100px;
   		font-size: 24px;
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
	margin-left : 180px;
	font-size : 22px;
	font-weight : bold;
	
	}
	
	#progress {
	margin-top : 50px;
	margin-left : 170px;
	margin-right : 100px;
	}
	
	.progress {
		height : 45px;
		
	}
	
	.progress-bar {
		font-weight : bold;
		font-size : 22px;
	}
	.feedback-text {
	text-align : center;
	font-weight : bold;
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
	
	//?????? ?????? ?????? ?????????
	let dailyExpense = Math.floor(${myMonthlyBudget.consumption}/lastDate)
	dailyExpenseComma = numberWithCommas(dailyExpense)
	console.log(dailyExpense)
	
	$("#dailyExpense").html(dailyExpenseComma)
	
	//???????????? ?????? ?????????
	let nowDailyExpense = Math.floor(${hanaro.consumptionBalance}/restDate)
	nowDailyExpense = numberWithCommas(nowDailyExpense)
	
	$('#nowDailyExpense').html(nowDailyExpense)
	console.log(nowDailyExpense)
	
	//????????? ?????? ??????
	let nowExpense = ${myMonthlyBudget.consumption} - ${hanaro.consumptionBalance} 	//???????????? ??? ??????
	let avgExpenseOfDay = nowExpense / nowDate										//?????? ?????? ????????????	
	let expectExpense = Math.floor(avgExpenseOfDay * lastDate)								//??? ?????? ?????????
	expectExpense = numberWithCommas(expectExpense)
	$('#expectExpense').html(expectExpense)
	//console.log(nowExpense)
	//console.log(avgExpenseOfDay)
	//console.log(expectExpense)
	
	//???????????? ?????? ?????????
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
<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: {width}% " aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"> ?????? ????????? : {expense1} </div>
 <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: {nowWidth}% " aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> ?????? ????????? : {expense2}</div>
</div>
</script>
</head>
 <!-- body -->
<body class="main-layout">
      <!-- loader  -->
   <%--    <div class="loader_bg">
         <div class="loader"><img src="${ pageContext.request.contextPath }/resources/images/loading.gif" alt="#" /></div>
      </div> --%>
      <!-- end loader --> 
      <!-- header -->
      <header>
 			<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>      
      </header>
      <!-- end header -->
      

      <div class="row main">
      <aside id="side-menu">
			<div id="diyLnb" class="on">
			<h2 class="tit">???????????????</h2>
			<ul class="depth1">
				
						<li class="on"><a href="#//HanaBank" >????????????</a></li>
						
						<li><a href="#//HanaBank">My???????????????</a></li>
						
						<li><a href="#//HanaBank">????????????</a></li>
	
				</ul>
				</div>
		</aside>
   
      <section>
			<div id="title" class="titlepage">????????????</div>
			
			
			
			<div class="widget-tabs-list">
				<ul class="nav nav-tabs">
				<li class=""><a href="${pageContext.request.contextPath}/hanaro/dashBoard/${loginMember.userCode}">?????? ??????</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >?????? ??????</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/dashBoard/savingAnalysis">?????? ??????</a></li>
	
				</ul>
	
				<!-- --------------------- ?????? ------------------------ -->
				<div class="content">
					<div class="border-box">
						<div class="title col">	
							<h2 id="title-h2">??? <strong class="black">??????</strong></h2>	
						</div>
						<div id="div-table">
						<table>
							<tr>
								<th width="30%">??? ?????????</th>
								<th><fmt:formatNumber  value="${myMonthlyBudget.consumption}" type="number"/>??? 
								<span style="font-size : 18px;">&nbsp;(?????? ????????? : ??? <span id="dailyExpense"></span>???)</span>
								</th>
							</tr>
							<tr>
								<th>?????? ??????</th>
								<th><span style="font-size : 36px; color : #009b9d"><fmt:formatNumber value="${hanaro.consumptionBalance}" type="number"/></span>
								&nbsp;??? </th>
							</tr>
						</table>
						</div>
						<div id="div-caution">
						<img src="${pageContext.request.contextPath}/resources/icon/caution3.png"/>
						????????? ???????????? ????????? <span id="nowDailyExpense" style="font-size : 30px"></span>&nbsp;?????? ????????????!<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??? ????????? ????????? ?????? ??? ??????&nbsp; <span id="expectExpense"  style="font-size : 30px"></span>&nbsp;??? ??????!
						</div>
						
						<div id="progress">
						<%-- 	<div id="progressBar1"></div>
 							<!--  <div id="progressBar1" class="progress-bar bg-warning" role="progressbar" style="width:" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div> -->
 							 <div class="progress-bar bg-danger" role="progressbar" style="width: ${(myMonthlyBudget.consumption - hanaro.consumptionBalance) /myMonthlyBudget.consumption * 100 -30}%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div> --%>
						</div>
					</div>
					<div class="border-box">
						<div class="title col">		
						<h2 id="title-h2">??????<strong class="black"> ??????</strong></h2>				
						</div>
						 
						 <div id="menu-title"> ??? ?????? ?????? ??????</div>

				    <!-- Bar Chart area End-->
				    <div class="bar-chart-area">
				        <div class="container">
				       		<div class="row">
				             	
				                <div class="col-md-8">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="110vh" width="180vw" id="barchart1"></canvas>
				                    </div>
				                </div>
				                 
				                  <div class ="feedback-text col-md-4" style="font-size : 25px; padding-top : 110px;"> 
				                  	?????? ???????????????<br><br>
					                  <q> ????????????
					                  <b style="font-size : 32px;"> 35?????? ?????? </b>??????
					                  <br>????????? 
					                  <b style="font-size : 32px;"> 17?????? ?????? </b>?????? </q>
				                  </div>
				       
				            </div>
			
				        </div>
				    </div>
				    <!-- Bar Chart area End-->
												 
					<div id="menu-title"> ????????? ?????? ????????? ?????? ?????? </div>
				 								  <div class="bar-chart-area">
				        <div class="container">
				           <div class="row">
				         
				                <div class="col-md-8">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="110vh" width="180vw" id="barchart2"></canvas>
				                    </div>
				                </div>
				                <div class ="feedback-text col-md-4" style="font-size : 25px; padding-top : 110px;"> 
				                  	????????? ????????? ???????????????<br><br>
					                  <q> ????????????
					                  <b style="font-size : 32px;"> 20?????? ?????? </b>??????
					                  <br>????????? 
					                  <b style="font-size : 32px;"> 60?????? ?????? </b>?????? </q>
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
		
		/*????????????*/
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
				labels: ["?????????", "?????????", "?????????"],
				datasets: [{
	                label: '?????? ?????????',
					data: [agesAvgFixedExpense, agesAvgConsumption, agesAvgSaving],
				
					    backgroundColor:
		                	'#d6d5d5',
						borderColor: 
							'#d6d5d5',
						borderWidth: 1
					
	            }, {
	                label: '???',
					data: [myFixedExpense, myConsumption, mySaving],
					    backgroundColor:
		                	'rgb(75, 192, 192,0.8)',
						borderColor: 
							'rgb(75, 192, 192)',
						borderWidth: 1
	            }]
			},
			options: {
				responsive: true,
					scales: {
					yAxes: [{
						ticks: {
							min : 20,
							position: 'top',
							fontSize: 18,
						}
					}],
			xAxes:[{
				  ticks:{
				  fontColor:'black',
				  fontSize: 18,
				 }
				}]
				},
				 legend: {
		               	labels : {
		               		fontSize : 22,          	
		               	}
	               	},
				title: {
					display: false,
					
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
				labels: ["?????????", "?????????", "?????????"],
				datasets: [{
	                label: '????????? ?????? ?????????',
					data: [55, 100, 160],
					borderWidth: 1,
					   backgroundColor:
		                	'#d6d5d5',
						borderColor: 
							'#d6d5d5',
						borderWidth: 1
	
	            }, {
	                label: '???',
					data: [myFixedExpense, myConsumption, mySaving],
					 	backgroundColor:
		                	'rgb(75, 192, 192,0.8)',
						borderColor: 
							'rgb(75, 192, 192)',
						borderWidth: 1
	            }]
			},
			options: {
				responsive: true,
					scales: {
					yAxes: [{
						ticks: {
							min : 20,
							position: 'top',
							fontSize: 18,
							
						}
					}],
					xAxes:[{
						  ticks:{
						  fontColor:'black',
						  fontSize: 18,
						 }
						}]

				},
				 legend: {
	               	labels : {
	               		fontSize : 22,          	
	               	}
               	},
				title: {
					display: false,
					
				}
			}
		});
		
})(jQuery); 
</script>
</html>