<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/animate.css">

<style>
	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
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
    	width : 1200px;
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
	
	.progress {
		margin-top: 45px;
		height : 30px;
		background-color: darkgray;
	
	}
	
	#money {
		margin-top : 25px;
		text-align : right;
		padding-right : 45px;
		font-size: 28px;
		font-weight : bold;
	}
	
	
	#money > h5 {
		font-size : 16px;
		margin : 0;
		padding : 0;
		color : red;
	}
	
	#divCaution {
		margin : 45px 20px;
		padding-left : 35px;
		font-size: 24px;
		font-weight : bold;
		
	}
	
	#divCaution > img {
		width : 45px;
		margin : 10px;
		padding-top : 10px;
	}
	
	#grayDiv {
	margin: 10px 20px;
	height: 110px;
	background-color : #dddddd99; 
	border-radius : 7px;
	}
	
	.send {
		margin-top : 15px;
		margin-left :20px;
	}
/* 	
	.skill .progress-bar > span {
	background: #333 none repeat scroll 0 0;
    margin-right: 10px;
    margin-top: -40px;
    width : 70px;

}

.skill-content-3 {
    margin-top: 35px;
    overflow: hidden;
}
.skill .progress {
    background-color: darkgray;
    height: 15px;
}
.skill .progress:nth-child(1) .progress-bar {
    background: #e46a76;
} */
</style>
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
				<li class=""><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >예산 현황</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/dashBoard/savingAnalysis">저축 현황</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >추천 상품</a></li>
				</ul>
	
				<!-- --------------------- 내용 ------------------------ -->
				<div class="content">
					
					<div class="border-box">
						<div class="title col">		
						<h2 id="title-h2">내 비상금<strong class="black"> 현황</strong></h2>				
						</div>
						 <div id="divCaution" class="row"> 
						 <c:choose>
							<c:when test="${savingBalance/5000000*100 gt 90}">
						 	<div class="col-md-9">
								<img src="${pageContext.request.contextPath}/resources/icon/caution3.png"/>
								하나로 통장 비상금 한도의  <span style="font-size : 32px; color : red;"><fmt:formatNumber value="${savingBalance/5000000}" type="percent"/></span> 가 채워졌어요!!<br>
								&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;다른 저축 창고를 마련하세요!!
						 	</div>
						 	<div class="col-md-2">
						 		<button class="send">추천 상품<br> 보러가기</button>
						 	</div>
							</c:when>
							<c:otherwise> ... </c:otherwise>
						</c:choose>
						
						 </div>
						 
						<div class="row" id="grayDiv">
						 <div id="money" class="col-md-6"> 
						 	<h5>* 비상금 저축한도</h5>
						 	비상금 : <span style="color: #009b9d"><fmt:formatNumber value="${savingBalance}" type="number"/> </span>/ 5,000,000
						 </div>
						 <div class="col-md-6">
						 <div class="progress">
						  <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" id="progressBar" role="progressbar" style="width: ${savingBalance/5000000*100}%" 
						  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" >
					  		<span style="font-size: 21px">
					  			<fmt:formatNumber value="${savingBalance/5000000}" type="percent"/>
					  		</span>
					  	  </div>
						</div>
                    <%--     <div class="skill-content-3 ongoing-tsk">
                            <div class="skill progress">
                       
                                <div class="progress progress-bt">
                                    <div class="progress-bar wow fadeInLeft" data-progress="${savingBalance/5000000}" style="width: ${savingBalance/5000000*100}%" data-wow-duration="1.5s" data-wow-delay="1.2s"><span><fmt:formatNumber value="${savingBalance/5000000}" type="percent"/></span> </div>
                                </div>
                            </div>
                            </div> --%>
                         
                        </div>
                  		
                        </div>
						
					</div>
						<div class="border-box">
						<div class="title col">		
						<h2 id="title-h2">내 저축<strong class="black"> 현황</strong></h2>				
						</div>
						 <div id="menu-title"> 저축 금액 - 비상금 잔액이동 금액 </div>

				    <!-- Bar Chart area End-->
		
				    <div class="bar-chart-area">
				        <div class="container">
				       		<div class="row">
				             	<div class="col-md-1">
				             	</div>
				                <div class="col-md-7">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart1"></canvas>
				                    </div>
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
				    <!-- Bar Chart area End-->
					(최근 6개월)한달 평균 저축액 :<br>
					저축액 쌓여가는 그래프 ...????
					</div>
					 <div id="menu-title"> 추천 예/적금 상품 </div>
					
					</div>
				</div>
			</div>
		

	
	
	    <script src="${ pageContext.request.contextPath }/resources/template/js/charts/Chart.js"></script>
      	<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
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
  		<div id="graphScript">
  		
		</div>
</body>
<script>
$(document).ready(function(){
//	var now = new Date();
//	var year = now.getFullYear(); // 년
//	var month = (now.getMonth()+1); //월
	
//	console.log(year)
//	console.log(month)

	var monthArr=[]
	var savingArr=[]
	getMonthlySaving() 
		
		
	function getMonthlySaving() {
		let userCode = ${ loginMember.userCode }
		let url = '${ pageContext.request.contextPath }/dashBoard/monthlySaving'
		console.log(url)
		
		let data = { userCode : userCode }
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : url,
			data : JSON.stringify(data),
			success : function(monthlySavingList) {
				console.log(monthlySavingList)
				
				let json = JSON.parse(monthlySavingList)
				
				if(monthlySavingList.length > 0 ) {	
					
					json.forEach(function(monthlySaving){
						console.log(monthlySaving)
						let month ="'"+ monthlySaving.month + '월'+"'"
						monthArr.push(month)
						savingArr.push(monthlySaving.savingMoney/10000)
					
					})	
					text='<script>'
					let temp = $('#graphTemplate').text()
					temp = temp.replace(/\{label\}/gi, '[' + monthArr + ']')
						   		.replace(/\{data\}/gi,'['+ savingArr +']')
						   		
					text +=temp
					text +='</script' + '>'
					
					
			
						console.log(monthArr)
						console.log(savingArr)
						console.log(text)
					$('#graphScript').html(text)
				}	
			}
		})

	}
	
})
</script>
<script id="graphTemplate" type="text/template">
(function ($) {
	 "use strict";

		/*만원단위*/
	/* 	let myFixedExpense= ${myMonthlyBudget.fixedExpense}/10000
		let myConsumption = ${myMonthlyBudget.consumption}/10000
		let mySaving = ${myMonthlyBudget.saving}/10000
		
		let agesAvgFixedExpense = ${agesAvgBudget.fixedExpense}/10000
		let agesAvgConsumption = ${agesAvgBudget.consumption}/10000
		let agesAvgSaving = ${agesAvgBudget.saving}/10000
		console.log(agesAvgFixedExpense)
		console.log(agesAvgConsumption)
		console.log(agesAvgSaving) */
		
		let monthArr=[]
		
		 
	 /*----------------------------------------*/
		/*  1.  Bar Chart
		/*----------------------------------------*/

		var ctx = document.getElementById("barchart1");
		var barchart1 = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: {label},
				datasets: [{
					label: 'Bar Chart',
					data: {data},
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgb(50,205,50, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgb(50,205,50, 0.2)',
						'rgb(50,205,50, 0.2)'
					],
					borderColor: [
						'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(75, 192, 192, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true
						}
					}]
				}
			}
		})
		
		
	})(jQuery);
</script>

</html>