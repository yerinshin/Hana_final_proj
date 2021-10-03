<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">
<!-- 	<script src="/com/js/Chart.PieceLabel.js"></script> -->
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
	
	#topSpending{
		text-align : center;
	}
	
	#selectMonth{
	    height: 49px;
    	width: 250px;
    	font-size: 23px;
	}
	
	#legend-div {
		padding: 30px;
		
	}
	/*10개*/
	#legend-div >table {
		/* margin-top: 17px;
   		font-size: 23px;
   		height: 405px; */
   		color :#666666;
   		margin-top: 8px;
   		margin-left : 10px;
    	font-size: 25px;
/*     	height: 432px; */
		text-align : right;
	}
	
	#legend-div >table > tbody>tr > td {
	 text-align : right;
	 height : 43px;
	}
	
	#table-div > table {
		width : 900px;
		height : 300px;
		font-size : 25px;
		margin : 0 auto;
	}
	
	
	#table-div >table > tbody>tr> th, #table-div >table > tbody> tr> td{
		text-align : center;
	}
	
	button {
		width: 200px;
    	height: 50px;
    	font-weight: bold;
    	background-color: #e9f3fd;
    	border-radius: 20px;
    	color: #0c4b7d;
	}
	
/* 	#doughnut-chart-wp {
	 transition: 5s;
	} */
	
/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

} */


     .modals-default-cl {
		margin-top : 30px;
    } 
     .modal-dialog.modal-large .modal-content {
    	padding: 70px 100px;
    }
    
    .modal-content {
    	padding : 40px 40px;
    	margin-top: 220px;
    	width: 850px;
   		height: 630px;
    }
    .modal-dialog.modal-large {
    width: 910px;
    margin-top: 110px;
    margin-left: 650px;
}
    #btn-close {
	    width: 40px;
    	height: 40px;
    	font-size: 32px;
    	padding : 0 0 10px 0;
    }
    
    .modal-large .modal-body h2 {
    	font-size : 28px;
    	color : black;
    } 
    
    
    .modal-footer {
		
		display : block;
		margin: 0 auto;
    }
    
    .modal-footer > .btn-default {
    	height : 50px;
    	font-size : 25px;
    }
    
    
   .modal-input, #penaltyRate {
		height : 67px;
		font-size : 23px;
	}
	

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
				<li class=""><a href="${pageContext.request.contextPath}/spending/myCalendar">소비현황</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/spending/spendingAnalysis" >카테고리별 소비</a></li>
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
				        <div>
				        <div class="col-md-9">
				        </div>
				         <div>
				                	<select class="form-control" name="setDate" id="selectMonth" aria-label="Example select with button addon">
										<option value="202109">2021년 9월</option>	
										<option value="202108">2021년 8월</option>
										<option value="202107">2021년 7월</option>
										<option value="202106">2021년 6월</option>
										<option value="202105">2021년 5월</option>
									</select>
									</div>
								
				        </div>
				           <div class="row">
				            	<div class="col-md-1">
				             	</div>
				                <div class="col-md-7">
				                    <div class="doughnut-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="doughnutchart"></canvas>
				                    </div>
				                </div>
				                <div id="legend-div">
				                	<table id="legend-spending">
				
				                	<!-- 	<tr id="trtr">
				                		<td>dd</td>
				                		</tr> -->
				                	</table>
				                </div>
				            </div>
				 	
				        </div>
				         </div> 
				         
		<!-- ---------------------------------------------------------------------- -->
				         <div id="menu-title"> 지출 TOP 3</div>
				 <div class="modals-default-cl">
				         <div id="table-div">
				         <table id="topSpending">
				         	<tr>
				         		<th>TOP1</th>
				         		<th>쇼핑</th>
				         		<td width="50%">
				    
				         		</td>
				         	</tr>
				         	<tr>
				         		<th>TOP2</th>
				         		<th>식사</th>
				         		<td width="50%"><button>줄이기 도전</button></td>
				         	</tr>
				         	<tr>
				         		<th>TOP3</th>
				         		<th>운동</th>
				         		<td width="50%"><button>줄이기 도전</button></td>
				         	</tr>
				         </table>
				         </div>
				  <!--       <div id="topSpending">
				        </div> -->
				   
			
			
	<!-- ----------------------------------------모달 --------------------------------------->

	 <div class="modal fade" id="myModalthree" role="dialog">
	             <div class="modal-dialog modal-large">
	                       <form action="${pageContext.request.contextPath}/insert" method="post">
	                     	<input type="hidden" name="title" value="쇼핑줄이기">
	                     	<input type="hidden" name="category" value="쇼핑">
	                     
	                     <div class="modal-content">
	                          <div class="modal-header">
	                              <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                          </div>
	                          <div class="modal-body">
	                             <h2 style="font-size : 35px; text-align: center; color : #009b9d; margin-bottom : 45px">쇼핑 줄이기 <span style="font-size : 35px; color :black">도전</span></h2>
	                             
	    
	                             <div class="row">
	                             <h2 class="col-md-6" style="font-size : 22px">지난달 '쇼핑' 지출 : </h2>
	                             <div class="col-md-6">
	                             <h2 style="text-align : right;padding-right : 7px; font-size : 22px">456,200원</h2>
	                             </div>
	                             </div>
	                             <div class="row">
	                             <h2 class="col-md-6" style="font-size : 22px">이번달 오늘까지 지출 : </h2>
	                             <div class="col-md-6">
	                             <h2 style="text-align : right;padding-right : 7px;font-size : 20px">165,600원</h2>
	                             </div>
	                             </div>
	                             <div class="row" style="text-align:center">
	                             <h2 class="col-md-6" style="padding-top:17px;">도전 예산 : </h2>
	                             <div class="col-md-6">
	                             <input class="form-control modal-input" type="text" placeholder="(원)" name="savingGoal"/>
	                             </div>
	                             </div>
	                             
	                             
	                               <div class="row" style="text-align:center">
	                               <h2 class="col-md-6" style="padding-top:17px">패널티 : </h2>
	                               <div class="col-md-6">
	                             	<select class="form-control modal-input" name="penaltyRate" id="penaltyRate">
										<option value="0.1">10%</option>	
										<option value="0.2">20%</option>
										<option value="0.3">30%</option>
									</select>
	                               </div>
									</div>
									<h4 style="color : red; font-size : 23px; margin-bottom :20px"> *초과 소비 발생 시!<br>
									소비금액의 패널티의 비율만큼 [생활금에서 비상금으로] 저축됩니다.</h4>
	                          </div>
	                          <div class="modal-footer">
	                             <button type="submit" class="btn btn-default" >확인</button>
	                        	   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                          </div>
	                     </div>
	                       </form>
	                  </div>
	              </div>
	         </div>
	          </div>
	 <!-- ----------------------------------------모달 -------------------------------------->

			
			<div class="border-box">
				<div class="title col">	
					<h2 id="title-h2">소비 <strong class="black">분석</strong></h2>	
				</div>
				
			</div>
			</div>
			</div>
			
			
			
	
		
<%-- 	 <script src="${ pageContext.request.contextPath }/resources/template/js/charts/Chart.js"></script> --%>
			<script src="${ pageContext.request.contextPath }/resources/template/js/plugins.js"></script>
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
	
	 function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		} 
	 
	let labelArr = []
	let datasetArr = []
	
	let now = new Date();
	let year = now.getFullYear()
	let month = (now.getMonth()+1)
	console.log(year)
	
	if(month <10){
		month = '0'+month
	}
//	console.log(month)
	let yearMonth = year + month
	
	getCategorySpending(yearMonth)
	
	
	$('#selectMonth').change(function(){
		labelArr=[]
		datasetArr=[]
		yearMonth = this.value
		//alert(yearMonth)
		
		getCategorySpending(yearMonth)
	})
	
	
	
	
	function getCategorySpending(yearMonth) {
	
		let userCode = ${ loginMember.userCode }
	
		let spendingMoney = 0
		
		//let yearMonth = yearMonth 
		
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
					let html=''
					json.forEach(function(categorySpending){
						console.log(categorySpending)
						
						//라벨, 데이터 배열에 넣기
						labelArr.push(categorySpending.category)
						datasetArr.push(categorySpending.spendingMoney)
						
						//카테고리 별 사용 금액 (template 사용)
						let temp = $('#legendSpending').text()
						spendingMoney = numberWithCommas(categorySpending.spendingMoney)
						temp = temp.replace(/\{spending\}/gi, spendingMoney+"원")
						console.log(temp)
						
						html += temp
					})
					
					
					console.log(labelArr)
					console.log(datasetArr)
					console.log(html)
					$('#legend-spending').html(html)
			}
			
				
			(function ($) {
				 "use strict";

				var ctx = document.getElementById("doughnutchart")
				var doughnutchart = new Chart(ctx, {
			  		  type: 'doughnut',
			  		  data: {
			    		labels: labelArr,
			    		datasets: [{
			    	   /*  	label: 'My First Dataset', */
			    	  	  	data: datasetArr,
			    	    	backgroundColor: [
			    	      		'rgb(255, 99, 132)',
			    	      		'rgb(54, 162, 235)',
			    	      		'rgb(255, 205, 86)',
			    	      		'rgb(54, 205, 86)',
			    	      		'rgb(167, 116, 243)',			    	      		
			    	    		'rgb(255, 159, 64)', 
			    	    		'rgb(75, 192, 192)', 
			    	    		'rgb(255, 157, 154)',
			    	    		'rgb(26, 188, 156)',
			    	    	],
			    	    	hoverOffset: 4
			    	  	}]
			    	},
			    	options: {
			   	  		title: {
			   	     	display: true,
			  		    },
			  		  	animation: {
		                    animateScale : true,
		                    animateRotate : true
		                }, 
		                legend: {
		                	  display: true,
		                	  position: 'right',
		                	  align :'start',
		                	labels : {
		                		fontSize : 23,
		                		padding : 20,
		                		boxWidth: 40
		                	}
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
					let cnt = 0
					if(topSpendingList.length > 0) {
					json.forEach(function(topSpending){
						cnt ++
						
						let temp = $('#topSpendingTemplate').text()
						temp = temp.replace(/\{count\}/gi, cnt)
									.replace(/\{category\}/gi, topSpending)
						/* 			.replace(/\{spending\}/gi, spendingMoney) */
						html += temp
					})
			}
		//		html = temp
				console.log(html)
				$('#topSpending').html(html)
			}
			
			
			
		})	
		}
	})
	
	
	
	
</script>
<script id="legendSpending" type="text/template">
	<tr>
	<td height="43px">{spending}</td>
	</tr>
</script>

<script id="topSpendingTemplate" type="text/template">
    	<tr>
			<th>TOP{count}</th>
			<th>{category}</th>
	<%--		<td>사용금액 : {spending}</td> --%>
			<td width="50%">
<button type="button" class="
	                    col-md-8" data-toggle="modal" data-target="#myModalthree"> 줄이기 도전</button>
</td>
		</tr>
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