<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">

<style>
	body{
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
    	
    }
    
    .title {
		padding-bottom : 0px;
	}	
	.title h2{
	    font-size: 30px;
	    margin-bottom : 60px;
	}
	
	.title h2:after {
	    height: 0;
	   	font-size: 30px;
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

.fc-col-header {
	background : #f5f5f5;
}
 
.fc-h-event .fc-event-title-container {
    height: 24px;
    font-size: 20px;
}

.fc-day-number {
    float: right;
    font-size: 30px;
}
.fc-toolbar .fc-button {
    color: #fff;
    border: none;
    width: 70px;
    height: 45px;
    font-size: 18px;
    background: #16c89b;
  }
  .fc .fc-toolbar-title {
    font-size: 2.6em;
    margin: 0;
}
  .fc td, .fc th {
 
    font-size: 20px;
}
.card-body, .waves-effect {
    font-size: 20px;
 }
 
 .fc .fc-daygrid-day-number {
    color: black;
  
}

.fc-direction-ltr {
    direction: ltr;
    text-align: right;
    }
    
#historyDetail {
	border-radius : 20px;
/* 	margin-left : 100px;*/
/* 	padding:10px 20px;
	padding-top: 20px; */
	margin-top : 20px;
	margin-bottom : 20px; 
    background: #fffadf; 
    height : 620px; 
}

#historyList {
	padding :20px;
	width : 400px;
	font-size : 20px; 
	 margin-left: 30px;
}

th {
	height : 43px; 
}
#calendar {
	margin-top:15px;
	padding: 20px;
 }
 
 .fc .fc-daygrid-day-bg .fc-highlight {
    z-index: 3;
    background: #fffadf;
}

.fc .fc-daygrid-day.fc-day-today {
    background-color: rgba(188,232,241,.3);
}

#date {
	padding: 10px 30px;
    border-radius: 20px 20px 0 0;
    background: #fff3b5
}

.feedback-text {
	text-align : center;
	font-weight : bold;
}
q {
	/* color : #4bc0c0; */
}
</style>
<script>
$(document).ready(function(){

	getCalendarList()
	let calList
	function getCalendarList(){
		let userCode = ${loginMember.userCode}
		
		let data = {userCode : userCode}
		let calArr = []
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : '${ pageContext.request.contextPath }/myCalendar/calendarList',
			data : JSON.stringify(data),
			success : function(calendarList){
				calList = calendarList
				console.log(calList)
				let json = JSON.parse(calendarList)
/* 				console.log("json !!!!! : " +json) */
				if(calendarList.length > 0){
					json.forEach(function(cal){
						calArr.push(cal)
					
					})
					console.log(calArr)
				}
	
	(function($) {
		"use strict";
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '750px', // calendar 높이 설정
				expandRows: true, // 화면에 맞게 높이 재설정
				slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
				// 해더에 표시할 툴바
				headerToolbar: {
				left: 'prev',
				center: 'title',
				right: 'next'
			}, 
				 dateClick: function(info) {
						let userCode = ${ loginMember.userCode }
	        			let date = info.dateStr	//클릭한 날짜 뽑기
	        			//alert('클릭 날짜: ' + date); 
	        	 		
	        			let url = '${pageContext.request.contextPath }/myCalendar/historyListByDate/' + date 
	        			//alert(url)
	        			
	        			let data = { userCode : userCode }
	        			
			        	$.ajax({
			        	 	type : 'post',
			        		contentType : 'application/json',
			        		url : url,
			        		data : JSON.stringify(data),
			        		
			        		success : function(historyList){
			        			console.log(historyList)
			        			let json = JSON.parse(historyList)
								
			        			let html = ''
			        			if(historyList.length > 0){
			        				
			        		 	json.forEach(function(historyByDate){
			        				let temp = $('#spendingTemplate').text()
			        					temp= temp.replace(/\{category\}/gi, historyByDate.category)
			        								.replace(/\{othersName\}/gi, historyByDate.othersName)
			        								.replace(/\{transMoney\}/gi, historyByDate.transMoney)
												        					
			        				html += temp
			        				
			        				//$('#date').text(historyByDate.transDate)
			        			}) 
			        			}
			        			$('#date').text(date.substring(5,10).replace(/-/gi,'/'))
			        			console.log(html)
			        			$('#historyList').html(html)
			        			
			        		}
			        		
			        /* 		 let html = $('#spendingTemplate').text()
			        	 		$('#spendingList').html(html)
			        	 */
			        	}) //ajax 끝
	        	},
				initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	/* 			initialDate: '2021-09-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.) */
				navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable: true, // 수정 가능?
				selectable: true, // 달력 일자 드래그 설정가능
				nowIndicator: true, // 현재 시간 마크
				dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale: 'ko', // 한국어 설정 

				eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
					console.log(obj);
				},
				eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				
				eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				},
			/* 	eventClick : function(){
					alert('이벤트클릭')
				}, */
				select: function() { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
					
						
						/* 	
					var title = prompt('Event Title:');
					if (title) {
						calendar.addEvent({
							title: title,
							start: arg.start,
							end: arg.end,
							allDay: arg.allDay
						}) 
					} 
					*/
			/* 	calendar.unselect() */
				},
				/* eventColor : 'white', */
				events:
					calArr 
				/*
					 [
				
					{	color : 'white',
						textColor : 'blue',
						title: 'All Day Event',
						start: '2021-09-01'
					},
					{
						color : null,
						title: 'Long Event',
						start: '2021-09-07'
					},
				] 
				
				*/
			
			});
		calendar.render();
		})(jQuery);
	
			}
		})
	
	}
})
</script>
<script id="spendingTemplate" type="text/template">
	<tr>
		<th>{category}</th>
		<th>{othersName}</th>
		<th>{transMoney}</th>
	</tr>

</script>
</head>
 <!-- body -->
<body class="main-layout">
      <!-- loader  -->
 
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
				<li class="active"><a href="${pageContext.request.contextPath}/spending/myCalendar">가계부</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/spending/spendingAnalysis" >소비현황</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/spending/challenge">도전하기</a></li>
			</ul>
			
			
				<div class="content">
							<!-- --------------------- 내용 ------------------------ -->
						<div class="border-box">
							<div class="title col">		
								<h2 id="title-h2">소비<strong class="black"> 달력</strong></h2>				
							</div>
								
							<div id="calendar-container" class="row">
								<div id="calendar" class="col-md-8"></div>
								
								
								<div class="col-md-4" style="padding : 0">
								
									<h2 >총 수입 : </h2>
									<h2 >총 지출 : </h2>
								
								<div id="historyDetail">
									<h2 id="date"></h2>
									
									<table id="historyList">
									<tr>
								
									</tr>
									</table>
								</div>
								</div>
								
							</div>	
							
							
							<!-- <div id="historyDetail">
							<h2 id="date"></h2>
							<table id="historyList">
								<tr>
							
								</tr>
							</table>
							</div> -->

						</div>
						
						<div class="border-box">
							<div class="title col">		
								<h2 id="title-h2">주별<strong class="black"> 소비</strong></h2>				
							</div>
							
							
						<div class="row">
			                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			                <div class ="feedback-text" style="font-size : 25px; padding-left : 20px;"><q> 일주일에 21만원 정도 써요. <br>이번주는 2만원 덜썼어요 </q></div>
			                    <div class="bar-chart-wp mg-t-30 chart-display-nn">
			                        <canvas height="140vh" width="180vw" id="weeklyChart"></canvas>
			                    </div>
			                </div>
			                
			                
			                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			                <div class ="feedback-text" style="font-size : 25px;padding-left : 20px;"><q> 불 '화'를 즐기는 타입 ..? <br> 화요일 소비를 주의하세요! </q></div>
			                    <div class="bar-chart-wp mg-t-30 chart-display-nn">
			                        <canvas height="140vh" width="180vw" id="dayChart"></canvas>
			                    </div>
			                </div>
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
      
</body>
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
<script>
(function ($) {
	 "use strict";
		
		/*----------------------------------------*/
		/*  주별 소비 chart
		/*----------------------------------------*/
	 	let week1 = ${weeklySpending.week1}/10000
	 	let week2 = ${weeklySpending.week2}/10000
	 	let week3 = ${weeklySpending.week3}/10000
	 	let week4 = ${weeklySpending.week4}/10000
	 	let week5 = ${weeklySpending.week5}/10000
	 	let week6 = ${weeklySpending.week6}/10000
	 
		var ctx = document.getElementById("weeklyChart");
		var weeklyChart = new Chart(ctx, {
			type: 'horizontalBar',
			data: {
				labels: ["8월 3주","8월 4주", "9월 1주", "9월 2주", "9월 3주", "9월 4주"],
				datasets: [{
					label: 'Bar Chart',
					data: [week1, week2, week3, week4, week5, week6],
					backgroundColor: 
						'rgb(75, 192, 192)'
						
					,
					borderColor: 
						'rgb(75, 192, 192)'
					
					,
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true,
							fontSize: 18,
						}
					}],
					xAxes:[{
						  ticks:{
						  fontColor:'black',
						  fontSize: 18,
						 }
						}]
				}
			}
		});
		
		/*----------------------------------------*/
		/*  요일 별 소비 chart
		/*----------------------------------------*/
		
		
		let mon = ${daySpending.mon}
		let tue = ${daySpending.tue}
		let wed = ${daySpending.wed}
		let thu = ${daySpending.thu}
		let fri = ${daySpending.fri}
		let sat = ${daySpending.sat}
		let sun = ${daySpending.sun}
		
		var ctx = document.getElementById("dayChart");
		var dayChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ['월','화','수','목','금','토','일'],
				datasets: [{
					label: 'Bar Chart',
					data: [mon, tue, wed, thu, fri, sat, sun],
					backgroundColor: 
						'rgb(75, 192, 192)'
						
					,
					borderColor: 
						'rgb(75, 192, 192)'
					
					,
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true,
							fontSize: 18,
						}
					}],
					xAxes:[{
						  ticks:{
						  fontColor:'black',
						  fontSize: 18,
						 }
						}]
				}
			}
		});
		
})(jQuery); 
</script>
</html>