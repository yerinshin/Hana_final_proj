<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">
	<script src="/com/js/Chart.PieceLabel.js"></script>
<style>
	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
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
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	margin-top : 75px;
    	
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
	
	div.nice-select{
		display : none;
	}
	#selectMonth{
	    height: 49px;
    	width: 150px;
    	font-size: 23px;
	}
/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

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
				<li class=""><a href="${pageContext.request.contextPath}/spending/myCalendar">가계부</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/spending/spendingAnalysis" >소비현황</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/spending/challenge">도전하기</a></li>
			</ul>
			
			<div class="content">
			
			<div class="border-box">
				<div class="title col">	
					<h2 id="title-h2">카테고리 별 <strong class="black">지출</strong></h2>	
				</div>
				
				<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
											  <div class="bar-chart-area">
				        <div class="container">
				           <div class="row">
				            	<div class="col-md-2">
				             	</div>
				                <div class="col-md-7">
				                    <div class="doughnut-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="doughnutchart"></canvas>
				                         <div id='legend-div' class="legend-div"></div>
				                    </div>
				                </div>
				                <div>
				                	<select class="form-control" name="setDate" id="selectMonth" aria-label="Example select with button addon">
										<option value="없음" selected="">이번달</option>	
										<option>1달전</option>
										<option>2달전</option>
										<option>3달전</option>
									</select>
				                </div>
				            </div>
				 	
				        </div>
				        <div id="topSpending">
				         <div id="menu-title"> 카테고리 별 TOP 3</div>
				        </div>
				    </div> 
			</div>
			
			<div class="border-box">
				<div class="title col">	
					<h2 id="title-h2">소비 <strong class="black">분석</strong></h2>	
				</div>
				
			</div>
			
			</div>
			
			
			
		</div>
		 <script src="${ pageContext.request.contextPath }/resources/template/js/charts/Chart.js"></script>
			
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
$(document).ready(function(){
	let labelArr = []
	let datasetArr = []

	getCategorySpending()
	
	
/* 	function getTopSpending() {
		let userCode = ${ loginMember.userCode }
		let url = '${ pageContext.request.contextPath }/spending/topSpending'
		
		
		
	} */
	
	function getCategorySpending() {
	
		let userCode = ${ loginMember.userCode }
	
		
		let now = new Date();
		let year = now.getFullYear()
		let month = (now.getMonth()+1)
		console.log(year)
		
		if(month <10){
			month = '0'+month
		}
	//	console.log(month)
		let yearMonth = year + month
		
		let data = {yearMonth : yearMonth}
		
		$.ajax({
			type: 'post',
			contentType : 'application/json',
			url : '${ pageContext.request.contextPath }/spending/categoryChart',
			data : JSON.stringify(data),
			success : function(categorySpendingList) {
				console.log(categorySpendingList)
				
				let json = JSON.parse(categorySpendingList)
			
				if(categorySpendingList.length > 0) {
					json.forEach(function(categorySpending){
						console.log(categorySpending)
						
						labelArr.push(categorySpending.category)
						datasetArr.push(categorySpending.spendingMoney)
					})
			
					console.log(labelArr)
					console.log(datasetArr)
			}
			
				
			(function ($) {
				 "use strict";

				var ctx = document.getElementById("doughnutchart")
				var doughnutchart = new Chart(ctx, {
			  		  type: 'doughnut',
			  		  data: {
			    		labels: labelArr,
			    		datasets: [{
			    	    	label: 'My First Dataset',
			    	  	  	data: datasetArr,
			    	    	backgroundColor: [
			    	      		'rgb(255, 99, 132)',
			    	      		'rgb(54, 162, 235)',
			    	      		'rgb(255, 205, 86)',
			    	      		'rgb(54, 205, 86)',
			    	      		'rgb(56, 205, 90)',			    	      		
			    	    		'rgb(255, 159, 64)', 
			    	    		'rgb(75, 192, 192)', 
			    	    		'rgb(153, 102, 255)'
			    	    	],
			    	    	hoverOffset: 4
			    	  	}]
			    	},
			    	options: {
			   	  		title: {
			   	     	display: true,
			   	   		pieceLabel: { mode:"label", position:"outside", fontSize: 11, fontStyle: 'bold' }
			  		    }	
			  		},
			    
				});
			
			})(jQuery); 
						
			}
		})
		//top3뽑기
		$.ajax({
			type: 'post',
			contentType : 'application/json',
			url : '${ pageContext.request.contextPath }/spending/topSpending',
			data : JSON.stringify(data),
			success : function(topSpendingList){
				console.log(topSpendingList)
				let json = JSON.parse(topSpendingList)
					let html = ''
					if(topSpendingList.length > 0) {
					json.forEach(function(topSpending){
						console.log(topSpending)
							html += topSpending
					})
			}
		//		html = temp
				
				$('#topSpending').html(html)
			}
			
			
			
		})	
		}
	})
</script>
<script type="text/template" id="topSpendingTemplate">
	
</script>
<!-- <script>
(function ($) {
	 "use strict";

		var ctx = document.getElementById("doughnutchart")
		var doughnutchart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		    	labels: [
		    	    'Red',
		    	    'Blue',
		    	    'Yellow'
		    	  ],
		    	  datasets: [{
		    	    label: 'My First Dataset',
		    	    data: [200000, 200000, 400000],
		    	    backgroundColor: [
		    	      'rgb(255, 99, 132)',
		    	      'rgb(54, 162, 235)',
		    	      'rgb(255, 205, 86)',
		    	      'rgb(54, 205, 86)'
		    	    ],
		    	    hoverOffset: 4
		    	  }]
		    },
		    options: {
		      title: {
		        display: true,
		        text: 'Predicted world population (millions) in 2050'
		      }
		    }
		});
		
})(jQuery); 
</script> -->
</html>