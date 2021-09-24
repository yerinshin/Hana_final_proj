<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	div.nice-select{
		display : none;
	}
	#transDate {
		height : 50px;
	}
	
	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
		display : flex;
		justify-content : center;
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
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 40px;
    	
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
		padding : 40px;
		border : 2px solid #dddddd; 
		border-radius : 5px;
		margin-bottom : 30px;
		margin-top : 30px;
	}
	
	#btn-plus {
	    margin: 5px 0 0 10px;
		width: 40px;
	}
	
	
	.table{
	 margin-bottom : 0;
	     font-size: 30px;
     }
	

	
	#btn-add, .btn-delete {
		margin: 0px 0 0 10px;
		width : 35px;
		padding :0px;
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

.form-control{
	text-align : center;
	height : 50px;
	font-size : 20px;
}

#table thead tr th{
	color : black;
	font-size : 23px;
	text-align : center;
	line-height : 40px;
}

#table tbody tr td {
color : black;
	font-size : 23px;
	text-align : center;
	line-height : 40px;
}

    .checkTerms {
    	padding-left : 35px; 
    	font-size : 19px;
    	color : black;
    }
    
    input[type=checkbox] {
	    box-sizing: border-box;
	    width: 20px;
	    height : 20px;
	    margin : 10px;
	    vertical-align:middle;
    }
    
   input[type=checkbox]:checked {
   		background: #27b2a5;
   }
   
   #btn-add-div {
   		padding-right: 0px;
   }
   
	input#fixed_sum2 {
		text-align : right;
	    font-size: 35px;
	    background-color: white;
	    border: none;
	    width: 180px;
	    font-weight: bold;
	    margin: 20px 0px;
	    color: #14b98f;
	}
	
	.input-cal {
		width : 280px;
		text-align : right;
		font-size : 30px;
		padding-right : 10px;
		border : none;
	}
	
	.input_month {
        background: white;
	    color: #14b98f;
	    font-size : 33px;
	    font-weight: 700;
	    height: 50px;
	    width: 370px;
	    border: none;
	    border-bottom: 1px solid #16c89b;
	    text-align: right;
	    margin : 5px;
    } 
    
   .btn-auto {
    	background-color :#009b9d;
    	color : white;
    	border-radius : 5px;
    	width : 65px;
    	height : 45px;
    	margin-top : 5px;
    }
    
</style>
<script>
$(document).ready(function() {
	
	let userCode = ${loginMember.userCode}	//usercode	
 	
	
	getSalary() 
	
	/*
	//설정 버튼
	$('#btn-setSalary').click(function(){
		
		let payday = $('#select-payday').val()
		let tmp_payday = $('#select-payday').val().split(' ');  
		payday = tmp_payday[1];
		let salary = $('#totalBudget').val()
		
		let data = {payDay : payday, salary : salary}
		console.log(data)
		
		$.ajax({
			type: 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/hanaro/setSalary',
			data : JSON.stringify(data),
			success : function() {
				getSalary()
			}
		})
			
	})
	*/
	
	$(document).on("click", "#btn-setSalary", function(e){
		
		let payday = $('#select-payday').val()
		let tmp_payday = $('#select-payday').val().split(' ');  
		payday = tmp_payday[1];
		let salary = $('#totalBudget').val()
		
		let data = {payDay : payday, salary : salary}
		console.log(data)
		
		$.ajax({
			type: 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/hanaro/setSalary',
			data : JSON.stringify(data),
			success : function() {
				getSalary()
			}
		})
		
	})
	
	//수정버튼
 	$(document).on("click", "#btn-updateSalary", function(e){
 		
 	 	let html = $('#updateSalaryTemplate').text()
 		$('#div-salary').html(html)
	}) 
	
	//내 설정 월급 가져오기
	
	function getSalary() {
		
		let data = { userCode : userCode }	
		
		$.ajax({
			type: 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/hanaro/getSalary',
			data : JSON.stringify(data),
			async : false,
			success : function(hanaro){
				let hanaroAccount = JSON.parse(hanaro)
				console.log(hanaro)
				let html = ''
				if(hanaroAccount.payDay != null){
					html = $('#getSalaryTemplate').text()
					html = html.replace(/\{salary\}/gi, hanaroAccount.salary)
								.replace(/\{payDay\}/gi, hanaroAccount.payDay)	
					console.log(html)
				} else {
					html = $('#updateSalaryTemplate').text()
				}
				
				$('#div-salary').html(html)
			}
		})
	} 

	
	//이체일 설정
	//생활금 :l
	$('#btn-toConsumption').click(function(){
		
		let setDate = $('#lSetDate').val()
		let setMoney = $('#lSetMoney').val() + '원'
		
		let splitDate = $('#lSetDate').val().split(' ');  
		splitDate = splitDate[1];
		let money = $('#lSetMoney').val() 
		
		let data = { splitDate : splitDate , moneyToConsumption : money }
		
		$('#div-lSetDate').text(setDate)
		$('#div-lSetMoney').text(setMoney)
		
	})
	
	//저축금:e
	$('#btn-toSaving').click(function(){
		
		let setDate = $('#eSetDate').val()
		let setMoney = $('#eSetMoney').val() + '원'
		
		$('#div-eSetDate').text(setDate)
		$('#div-eSetMoney').text(setMoney)
		
	})
})
</script>
<script>
$(document).ready(function() {
	

	var myAccNo = '${accountNo}'
/* 	var totalExpense = 0 */
	getFixedExpense() 
	
	console.log(myAccNo)
/*	
	$('#btn-plus').click(function(){
 		alert('dd') 
		$('#addFixedExpense').show()
	
	})
*/

	$('#btn-add').click(function() {
		
		let expenseInfo = $('#expenseInfo').val()
		let transDate = $('#transDate').val()
		let tmp_transDate = $('#transDate').val().split(' ');  
		transDate = tmp_transDate[1];
		let transMoney = $('#transMoney').val()
			
			
			
		console.log(myAccNo)
		console.log(expenseInfo)
		console.log(transDate)
		console.log(transMoney)
		
		let data = { expenseInfo : expenseInfo, transDate : transDate, transMoney : transMoney, myAccNo : myAccNo }
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/addFixedExpense',
			data : JSON.stringify(data),
			success : function() {
				alert('추가완료')
				getFixedExpense()
		 		$('#expenseInfo').val('')
				$('#transDate').val('')
				$('#transMoney').val('')
		
			}
		})
		
		
	})	
	
/* 	$('.btn-remove').click(function() {
		alert('dd')
	/* 	let expenseCode = $(this).attr('id')
		console.log(expenseCode) 
		
	})
	 */
	$(document).on("click", ".btn-delete", function (e) { 
		let expenseCode = $(this).attr('id')
		console.log(expenseCode) 
		
		let data = { code : expenseCode }
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/deleteFixedExpense',
			data : JSON.stringify(data),
			success : function() {
				alert('삭제완료')
				getFixedExpense()
				
			}
			
		})
	})

	
	function getFixedExpense() {
		
		let userCode = ${ loginMember.userCode }
		let url = '${ pageContext.request.contextPath }/hanaro/fixedExpense'
		
		console.log(userCode)
		console.log(url)
		
		let data = { userCode : userCode }
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : url,
			data : JSON.stringify(data),
			success : function(fixedExpenseList) {
				console.log(fixedExpenseList)
				
				let json = JSON.parse(fixedExpenseList)
				
				if(fixedExpenseList.length > 0 ) {
					let html=''
					json.forEach(function(fixedExpense){
						myAccNo = fixedExpense.myAccNo	//목록 불러올 때 해당 계좌번호 저장
						console.log(fixedExpense)
						let temp = $('#fixedExpenseTemplate').text()
						temp = temp.replace(/\{transInfo\}/gi, fixedExpense.expenseInfo)
									.replace(/\{transDate\}/gi, fixedExpense.transDate)
									.replace(/\{transMoney\}/gi, fixedExpense.transMoney)
									.replace(/\{expenseCode\}/gi, fixedExpense.code)
									
						console.log(temp)
				/* 		totalExpense += fixedExpense.transMoney */
						html += temp;
					})	
					
		/* 			$('#fixed_sum').val(totalExpense) */
					
/* 
					totalExpenseDiv = totalExpenseDiv.replace(/\{totalExpense\}/gi, totalExpense)
					
					$('#totalExpenseDiv2').html(totalExpenseDiv) */
					$('#fixedExpenseList').html(html)
					
				}
			
			
			}
		})
	}
})

</script>
<script>
function numberWithCommas(x) {
  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
  x = x.replace(/,/g,'');          // ,값 공백처리
/*   $('#totalBudget').val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가  */
}
</script>
<script>

	$(document).ready(function() {
		 	 function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			} 
		 	 
	/* 	 	function removeCommas(x){		 		
			 	var strCheck = /\,/g 
			 	return x.replace(strCheck, '')
		 	} */
			
		 	
			let totalBudget = $('#totalBudget').val()
			
			console.log("!!!!!!!!!!!!" + totalBudget)
			let fixed_sum = 0  // 고정지출 합계
			let cal_result = $('#cal_result').val();
			console.log(cal_result)
			
			// 고정지출 합계(dom 구성시)
			$('.fixedTransMoney').each(function(){ 			//클래스가 money인 항목의 갯수만큼 진행
				fixed_sum += parseInt($(this).val());
				})
		
				
		
			
			$('#fixed_sum').val(fixed_sum)
 		 	$('#fixed_sum2').val(numberWithCommas(fixed_sum));
			
			
			// 고정지출 합계 변경(고정지출 추가시)
			$('#btn-add').on('click' ,function(){
				let sum = parseInt($('#fixed_sum').val());		// 고정지출
				console.log(sum)
				let result = parseInt($('#cal_result').val());	// 지출합계
				let add = parseInt($('#transMoney').val());		// 고정지출 추가 금액
				
				sum = parseInt(sum + add);			// 고정지출 합계 갱신
				result = parseInt(result - add);	// 지출합계 갱신
				
				$('#fixed_sum').val(sum);			// 값 변경
				$('#fixed_sum2').val(numberWithCommas(sum));	//콤마찍어서 보여줌
				$('#cal_result').val(result);
				$('#cal_result2').val(result);
				
				
			});
			
			//(고정지출 삭제시)
			$(document).on("click", ".btn-delete", function (e) { 
				let sum = parseInt($('#fixed_sum').val());		// 고정지출
				console.log(sum)
				let result = parseInt($('#cal_result').val());	// 지출합계
				let add = parseInt( $(this).closest("div").attr('id'));		// 고정지출 삭제 금액
				
				sum = parseInt(sum - add);			// 고정지출 합계 갱신
				result = parseInt(result
						+ add);	// 지출합계 갱신
				
				$('#fixed_sum').val(sum);			// 값 변경
				$('#fixed_sum2').val(numberWithCommas(sum));	//콤마찍어서 보여줌
				$('#cal_result').val(result);
				$('#cal_result2').val(result);
				
				
			});
			
			// 총 지출 합계(dom 구성시)
			cal_result = parseInt(totalBudget - fixed_sum)
			$('#cal_result').val(cal_result);
			$('#cal_result2').val(numberWithCommas(cal_result));
			$('#cal_total').val(totalBudget);
			$('#cal_total2').val(numberWithCommas(totalBudget));	
			
			// 기본금 -> 생활비 금액 입력시
			$('#lSetMoney').on('keyup' ,function(){
				let sub1 = parseInt($('#lSetMoney').val());
				let sub2 = parseInt($('#eSetMoney').val());	
				
				//NaN인 경우 0 세팅
				if(isNaN(sub1)){
					sub1 = 0;
				}
				if(isNaN(sub2)){
					sub2 = 0;
				}
				
				
				let totalBudget = $('#totalBudget').val();
				cal_result = parseInt(totalBudget - fixed_sum)
				
				cal_result = Number(cal_result - sub1 - sub2);
				
				$('#cal_result').val(cal_result);
				$('#cal_result2').val(numberWithCommas(cal_result))
			});
			
			// 기본금 -> 예비금 금액 입력시
			$('#eSetMoney').on('keyup' ,function(){
				let sub1 = parseInt($('#lSetMoney').val());
				let sub2 = parseInt($('#eSetMoney').val());	
				
				//NaN인 경우 0 세팅
				if(isNaN(sub1)){
					sub1 = 0;
				}
				if(isNaN(sub2)){
					sub2 = 0;
				}
				
				let totalBudget = $('#totalBudget').val();
				cal_result = parseInt(totalBudget - fixed_sum)
				
				cal_result = Number(cal_result - sub1 - sub2)
				
				$('#cal_result').val(cal_result);
				$('#cal_result2').val(numberWithCommas(cal_result))
			});
			
			$(document).on("change keyup", "#totalBudget", function(){
				let totalBudget = $('#totalBudget').val();	// 한달 예산의 값
				$('#cal_total').val(totalBudget);		// 총 예산의 값을 변경
				$('#cal_total2').val(numberWithCommas(totalBudget));
				
				
				cal_result = parseInt(totalBudget - fixed_sum)
				$('#cal_result').val(cal_result);
				$('#cal_result2').val(numberWithCommas(cal_result))
			})
			/*
			// 총 예산 변경
			$('#totalBudget').on('change keyup' ,function(){
				let totalBudget = $('#totalBudget').val();	// 한달 예산의 값
				$('#cal_total').val(totalBudget);		// 총 예산의 값을 변경
				$('#cal_total2').val(numberWithCommas(totalBudget));
				
				
				cal_result = parseInt(totalBudget - fixed_sum)
				$('#cal_result').val(cal_result);
				$('#cal_result2').val(numberWithCommas(cal_result))
				
			});
			*/
	});
</script>

<script id = "fixedExpenseTemplate" type="text/template">
<table class="table" id="table">
 <tbody>
	    <tr>
			<input type="hidden" value="{expenseCode}">
			<td width="40%">{transInfo}</td>
			<td width="20%">{transDate}일</td>    
			<td>
		      <div class="row">
					      <div class="col-md-9" >
					      <b>{transMoney}</b> 원
					      </div>
					      <div class="col-md-2" id="{transMoney}">
					      <img class="btn-delete" src="${pageContext.request.contextPath}/resources/icon/remove.png" id="{expenseCode}"/>
			  </div>
				</div>
			</td>
		</tr>
</tbody>
</table>
</script>
<script id="updateSalaryTemplate" type="text/template">
	<div class="title">						
			 <h2 id="title-h2" style="margin-bottom : 0px">월 급여 <strong class="black">설정</strong>
			 </h2>
			 <h4  style="font-size: 20px; margin-bottom:35px;">
				월 급여액을 입력하면 정확한 예산 설정이 가능합니다</h4>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-3">
			<select id="select-payday" style="width : 180px; font-size : 25px;" class="input_month" name="setDate">					
					<c:forEach begin="1" end="28" var="x">
						<option>매달
							<c:out value="${x}" /> 일
						</option>
						<br>
					</c:forEach>
			</select>
			</div>
			<div class="col-md-5">
			<input class="input_month" type="text"
				id="totalBudget" name="totalBudget" onkeyup="numberWithCommas(this.value)"
				value="">
				<span style="color: #14b98f; font-size : 26px; font-weight: 700;">원</span>					
			</div>
			<div class="col-md-2">
			<button id="btn-setSalary" class="send" style="width: 80px; border-radius:15px; margin:10px 0;"><b>설정</b></button>
		</div>								
	</div>		
</script>
<script id="getSalaryTemplate" type="text/template">
	<div class="row">
		<div class="title col">
			 <h2 id="title-h2">월<strong class="black">급여액 </strong></h2>
		</div>
		<div class="col-md-5">
			<input class="input_month" type="text"
				style="border : none; width : 300px;"
				id="totalBudget" name="totalBudget" onkeyup="numberWithCommas(this.value)"
				value="{salary}"><span style="font-size : 22px; font-weight: 700;">원 (매달 {payDay}일)</span>						
		</div>
		<div class="col-md-2">
		<button id="btn-updateSalary" class="send" style="width: 80px; border-radius:15px; margin:10px 0;">
			<b>수정</b></button>
		</div>	
	</div>
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
			<li class="active"><a href="${pageContext.request.contextPath}/hanaro/dashBoard/${loginMember.userCode}">예산설정</a></li>
			<li class=""><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >예산 현황</a></li>
			<li class=""><a href="${pageContext.request.contextPath}/dashBoard/savingAnalysis">저축 현황</a></li>
			<li class=""><a href="${pageContext.request.contextPath}/dashBoard/budgetAnalysis" >추천 상품</a></li>
			</ul>
			
			  <div class="border-box" id="div-salary">
			  					<div class="row">
								<div class="title col">
									 <h2 id="title-h2">월<strong class="black">급여액 </strong></h2>
								</div>
								
								<div class="col-md-5">
									<input class="input_month" type="text"
										style="border : none; width : 300px;"
										id="totalBudget" name="totalBudget" onkeyup="numberWithCommas(this.value)"
										value="{2000000}"><span style="font-size : 22px; font-weight: 700;">원 (매달 {2}일)</span>						
								</div>
								<div class="col-md-2">
								<button id="btn-updateSalary" class="send" style="width: 80px; border-radius:15px; margin:10px 0;">
									<b>수정</b></button>
									</div>	
								</div>
							
				<!-- *******한달 예산****** -->
							
								<div class="title">
							
									 <h2 id="title-h2" style="margin-bottom : 0px">월 급여 <strong class="black">설정</strong>
									 </h2>
									 <h4  style="font-size: 20px; margin-bottom:35px;">
										월 급여액을 입력하면 정확한 예산 설정이 가능합니다</h4>
								</div>
								
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-3">
								
									<select style="width : 180px; font-size : 25px;" class="input_month" name="setDate" 
														aria-label="Example select with button addon">					
											<c:forEach begin="1" end="28" var="x">
												<option>매달
													<c:out value="${x}" /> 일
												</option>
												<br>
											</c:forEach>
									</select>
								
									</div>
									<div class="col-md-5">
									<input class="input_month" type="text"
										id="totalBudget" name="totalBudget" onkeyup="numberWithCommas(this.value)"
										value="">
										<span style="color: #14b98f; font-size : 28px; font-weight: 700;">원</span>					
									</div>
									<div class="col-md-2">
									<button id="btn-setSalary" class="send" style="width: 80px; border-radius:15px; margin:10px 0;">
									<b>설정</b></button>
									</div>								
							
								</div>

				<!-- *******#/한달 예산****** -->
			</div>
			
			
			<div  class="border-box"  id="product fixed_transfer_list">    
       <div class="title history-title" >
                     <h2 id="title-h2">고정 지출 <strong class="black">내역</strong></h2>
                  </div>
           <%--        <div class="col-md-11">
          <!--         <div id="menu-title"> 고정지출 내역 </div> -->
                  </div>
                  <div class="col-md-1">
                  	<img id="btn-plus" src="${pageContext.request.contextPath}/resources/icon/plus.png" />
                  </div> --%>
                  	<div class="col">
						<input class="form-control form-control-lg" type="hidden" 
						id="fixed_sum" name="fixedSum"
						value="">
						<span style="font-size : 26px;">
						<b>총 월 고정 지출액 :</b> 
						</span>
						
						<input class="" type="text" disabled
						id="fixed_sum2" name="fixedSum2"
						value="">		
						<span style="font-size : 26px;">
						<b> 원</b> 
						</span>
					</div>
                  	<div class="col" id="totalExpenseDiv2">
						</div>
                  <table class="table" id="table">
                  	<c:forEach items="${ fixedExpenseList }" var="fixedExpense" varStatus="loop">
                  	<input type="hidden" class="fixedTransMoney" value="${ fixedExpense.transMoney }">
					 </c:forEach>
					  <thead>
					    <tr>
					      <th scope="col" width="40%">예산명</th>
					      <th scope="col" width="20%">이체일</th>
					      <th scope="col" >
					      <div class="col-md-9">
					      	금액
					      </div>
					      <div class="col-md-3">
					      </div>
					      	</th>
					    </tr>
					  </thead>
					  </table>
				<%-- 	  <div >
					  
					  <table class="table">
 					<tbody>
					  	<c:forEach items="${ fixedExpenseList }" var="fixedExpense" varStatus="loop">
					    <tr>
					      <th id="trans-date-col">${ fixedExpense.expenseInfo }</th>
					      <th id="trans-info-col">${ fixedExpense.transDate }</th>
					     
					     <th id="trans-money-col"> ${ fixedExpense.transMoney } 원
					     <input type="hidden" class="fixedTransMoney" value="${ fixedExpense.transMoney }">
					     </th>
 
					    </tr>
					 </c:forEach> 
					  </tbody>
					</table>	
					</div>	 --%>	
					 
					<div id="fixedExpenseList"></div>
					<div id="addFixedExpense2"></div>
					<div id="addFixedExpense">
				
					 <table class="table" id="table">
					  <tbody>
					    <tr>
					      <th scope="col" width="40%"><input id="expenseInfo" class="form-control" type="text"></th>
					      <th scope="col" width="20%"><select class="form-control" name="setDate" id="transDate" 
														aria-label="Example select with button addon">
															
															<c:forEach begin="1" end="28" var="x">
																<option>매달 
																	<c:out value="${x}" /> 일
																</option>
																<br>
															</c:forEach>
													</select></th>
<!-- 					      <th scope="col" id="trans-info-col"><input id="transDate" class="form-control" type="number" name="day" min="1" max="31" placeholder="매월 O일"/></th> -->
					      <th scope="col">
					      <div class="row">
					      <div class="col-md-9" >
					      <input id="transMoney" class="form-control" type="text" placeholder="(원)">
					      </div>
					      <div class="col-md-2" id="btn-add-div">
					      <img id="btn-add" src="${pageContext.request.contextPath}/resources/icon/plus.png" />
<!-- 					      <button type="button" >추가</button> -->
					      </div>
					      </div>
					      </th>
					    </tr>
					  </tbody>
					</table>
					
					</div>

        
      </div>
      <div  class="border-box"  id="product fixed_transfer_list">
         
              
            <div class="title history-title">
                     <h2><strong class="black">자동 </strong>금액 이동</h2>
                  </div>  
                 <!--  <div class="col-md-11">
                  <div id="menu-title"> 자동 금액이동 </div>
                  </div> -->
                    <div class="col-md-9">

                  </div>
                  <div class="col-md-3">
                  	    <div class="checkTerms service-checkbox">
					<input name="checkService1" id="checkService1" type="checkbox" value="agree">급여일로 설정
				    </div>
                  </div>
             
					  <table class="table" id="table">
					  <thead>
					  <tr>
							<th colspan="5"
									style="text-align: center; background-color: #e2e9f5; font-size: 27px;">총
									예산 <strong style="color: red;">
									<input
										type="hidden" disabled id="cal_total"
										value="">
									<input
										class="input-cal"
										type="text" disabled id="cal_total2"
										value="">
										</strong> 원 중 
										<strong
									style="color: blue;">
									<input
										type="hidden" disabled id="cal_result">
									<input
										class="input-cal"
										type="text" disabled id="cal_result2">
										</strong> 원 남음
								</th>
							</tr>
					    <tr>
					      <th scope="col" width="19%" >예산명</th>
					      <th scope="col" width="30%" >금액이동</th>
					      <th scope="col" width="25%">금액</th>
					      <th scope="col" >이체일</th>
					      <th></th>
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
									<td>월 소비</td>
					  				<td>기본금 → 생활금</td>
								<td>
									<div class="col-auto my-1" id="div-lSetMoney">
										<input type="text" name="setMoney" class="form-control" id="lSetMoney" value= "${ autoInfo.moneyToLiving }" style="height: 50px;">
	                                   		</div>
								</td>
		
								<!-- 여기 기본->생활 -->
								<td>
								<div class="col-auto my-1" id="div-lSetDate">
									<select name="setDate" class="custom-select mr-sm-2" id="lSetDate" style="height: 50px;">
						
											<c:forEach begin="1" end="28" var="x">
												<option><c:out value="매달 ${x} 일" /></option>
												<br>
											</c:forEach>
									</select>
								</div>
								</td>
								<td><button id="btn-toConsumption" class="btn-auto">설정</button></td>
							</tr>
							<tr>
							<td>월 저축</td>
					  		<td>기본금 → 비상금</td>
								<td>
									<div class="col-auto my-1" id="div-eSetMoney">
										<input type="text" name="setMoney" class="form-control" id="eSetMoney" value="${ autoInfo.moneyToExtra }" style="height: 50px;">
	                                   		</div>
	                                   	</td>
								<!-- 여기 기본 -> 예비 -->
								<td>
								<div class="col-auto my-1" id="div-eSetDate">
									<select name="setDate" class="custom-select mr-sm-2" id="eSetDate" style="height: 50px;">
									
											<c:forEach begin="1" end="28" var="x">
												<option><c:out value="매달 ${x} 일" /></option>
												<br>
											</c:forEach>
									</select>
								</div>
								</td>
								<td>
									<button id="btn-toSaving" class="btn-auto">설정</button>
								</td>
							</tr>
			
					  </tbody>
					</table>
				
				
					  
          
          </div>
      
			</div>
			
			
			<!-- -------------------------------------------------------------------- -->
			
		
      </section> 
			</div>
		
		
      	<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
   			 <!-- bootstrap JS
		============================================ -->
  			  <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>	

      <%-- footer --%>
      <footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
</body>
</html>