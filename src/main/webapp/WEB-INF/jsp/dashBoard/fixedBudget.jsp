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
	div.nice-select{
		display : none;
	}
	#transDate {
		height : 50px;
	}
	
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
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 40px;
    	
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

/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

} */

/*
.product .title {
		padding-bottom : 0px;
	}
	
	.product .title h2:after {
		width : 1140px;
	}
	
	.product .title h2 {
		font-size : 40px;
		margin-bottom : 12px;
	}
*/
	.border-box {
		padding : 30px;
		border : 2px solid #dddddd; 
		margin-bottom : 30px;
	}
	
	#btn-plus {
	    margin: 5px 0 0 10px;
		width: 40px;
	}
	
	
	.table{
	 margin-bottom : 0;
	     font-size: 30px;
     }
	
	#trans-info-col {
		width : 25%;
		text-align : center;
		
	}
	
	#btn-add{
		margin: 5px 0 0 10px;
		width : 40px;
		padding :0px;
	}
	
	#trans-money-col {
		text-align : right ;
		padding-right :150px;
	}

	
	th#trans-date-col{
		width : 40%;
		/* padding-left : 40px; */
		text-align : center;
	}
	th#send-trans-money {
		color : #d74351;
		text-align:right;
		padding-right :150px;
	}
	
/* 	th#receive-trans-money {
		color : #0c7ffa;
		text-align:right;
		padding-right :150px;
	} */
	
	th#trans-date-col, th#trans-info-col ,th#trans-money-col {
		font-size: 21px;
   		line-height: 40px;
}
	
/* 	
 	#addFixedExpense {
		display : none;
	}
	  */
	
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
	font-size : 21px;
	text-align : center;
	line-height : 40px;
}

#table tbody tr td {
	font-size : 21px;
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
</style>
<script>
$(document).ready(function() {
	
	var myAccNo = ${accountNo}
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
			
			console.log(totalBudget)
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
			
			
			// 총 지출 합계(dom 구성시)
			cal_result = parseInt(totalBudget - fixed_sum)
			$('#cal_result').val(cal_result);
			$('#cal_result2').val(numberWithCommas(cal_result));
			
			
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
				
				cal_result = Number(cal_result - sub1 - sub2);
				
				$('#cal_result').val(cal_result);
				$('#cal_result2').val(numberWithCommas(cal_result))
			});
			
			
			// 총 예산 변경
			$('#totalBudget').on('change keydown' ,function(){
				let totalBudget = $('#totalBudget').val();	// 한달 예산의 값
				$('#cal_total').val(totalBudget);		// 총 예산의 값을 변경
				$('#cal_total2').val(numberWithCommas(totalBudget));
			});
	});
</script>
<script id = "fixedExpenseTemplate" type="text/template">
<table class="table">
 <tbody>
	    <tr>
			<th id="trans-date-col">{transInfo}</td>
			<th id="trans-info-col">{transDate}일</td>    
			<th id="trans-money-col" class="fixedTransMoney"> {transMoney} 원</th>
		</tr>
</tbody>
</table>
</script>
<script id="addFixedExpense" type="text/template">
<table class="table">
 <tbody>
	    <tr>
			<th><input></th>
			<th>{transDate}일</th>    
			<th> {transMoney} 원</th>
		</tr>
</tbody>
</table>
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
			<li class="active"><a data-toggle="tab" href="/hanaro/dashBoard" aria-expanded="true">고정지출</a></li>
			<li class=""><a data-toggle="tab" href="/hanaro/dashBoard" aria-expanded="false">예산 현황</a></li>
			<li class=""><a data-toggle="tab" href="#menu2" aria-expanded="false">저축 현황</a></li>
			<li class=""><a data-toggle="tab" href="#menu2" aria-expanded="false">추천 상품</a></li>
			</ul>
			<div class="tab-content tab-custom-st">
			<div id="home" class="tab-pane fade active in">
			<div class="tab-ctn">
			
			  <div class="border-box">
				<!-- *******한달 예산****** -->
							<div class="row">
								<div class="title col">
									 <h2 id="title-h2">월<strong class="black">급여액 </strong></h2>
									<p>월 급여액을 입력하면 정확한 예산 설정이 가능합니다</p>
								</div>
								
								<div class="col">
									<input class="form-control form-control-lg" type="text"
										id="totalBudget" name="totalBudget" onkeyup="numberWithCommas(this.value)"
										value="${ hanaro.totalBudget }">						
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
						<input class="form-control form-control-lg" type="text" disabled
						id="fixed_sum2" name="fixedSum2"
						value="">		
					</div>
                  	<div class="col" id="totalExpenseDiv2">
						</div>
                  <table class="table">
                  	<c:forEach items="${ fixedExpenseList }" var="fixedExpense" varStatus="loop">
                  	<input type="hidden" class="fixedTransMoney" value="${ fixedExpense.transMoney }">
					 </c:forEach>
					  <thead>
					    <tr>
					      <th scope="col" id="trans-date-col">예산명</th>
					      <th scope="col" id="trans-info-col">이체일</th>
					      <th scope="col" id="trans-money-col">금액</th>
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
				
					 <table class="table">
					  <tbody>
					    <tr>
					      <th scope="col" id="trans-date-col"><input id="expenseInfo" class="form-control" type="text"></th>
					      <th scope="col" id="trans-info-col"><select class="form-control" name="setDate" id="transDate" 
														aria-label="Example select with button addon">
															<option value="없음" selected>매달 O일</option>
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
												<th colspan="4"
													style="text-align: center; background-color: rgb(233, 236, 239);">총
													예산 <strong style="color: red; font-size: 25px;">
													<input
														type="hidden" disabled id="cal_total"
														value="${ onepickInfo.totalBudget }">
													<input
														type="text" disabled id="cal_total2"
														value="${ onepickInfo.totalBudget }">
														</strong> 원 중 
														<strong
													style="color: blue; font-size: 25px;">
													<input
														type="hidden" disabled id="cal_result">
													<input
														type="text" disabled id="cal_result2">
														</strong> 원 남음
												</th>
											</tr>
					    <tr>
					      <th scope="col" width="19%" >예산명</th>
					      <th scope="col" width="35%" >금액이동</th>
					      <th scope="col" width="25%">금액</th>
					      <th scope="col" >이체일</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
													<td>월 예산액</td>
					  								<td>기본금 → 생활금</td>
												<td>
													<div class="col-auto my-1">
														<input type="text" name="setMoney" class="form-control" id="lSetMoney" value= "${ autoInfo.moneyToLiving }" style="height: 50px;">
	                                           		</div>
												</td>
		
												<!-- 여기 기본->생활 -->
												<td>
												<div class="col-auto my-1">
													<select name="setDate" class="custom-select mr-sm-2" id="eSetDate" style="height: 50px;">
															<option selected>매달 O일</option>
															<c:forEach begin="1" end="28" var="x">
																<option><c:out value="매달 ${x} 일" /></option>
																<br>
															</c:forEach>
													</select>
												</div>
												</td>
											
											</tr>
											<tr>
											<td>월 저축액</td>
					  						<td>기본금 → 비상금</td>
												<td>
													<div class="col-auto my-1">
														<input type="text" name="setMoney" class="form-control" id="eSetMoney" value="${ autoInfo.moneyToExtra }" style="height: 50px;">
	                                           		</div>
	                                           	</td>
												<!-- 여기 기본 -> 예비 -->
												<td>
												<div class="col-auto my-1">
													<select name="setDate" class="custom-select mr-sm-2" id="eSetDate" style="height: 50px;">
															<option selected>매달 O일</option>
															<c:forEach begin="1" end="28" var="x">
																<option><c:out value="매달 ${x} 일" /></option>
																<br>
															</c:forEach>
													</select>
												</div>
												</td>
			
											</tr>
					 <!--  <tr>
					  	<td>월 예산액</td>
					  	<td>기본금 → 생활금</td>
					  	<td><input type="text"></td>
					  	<td></td>
					  </tr>
					  <tr>
					  	<td>월 저축액</td>
					  	<td>기본금 → 비상금</td>
					  	<td></td>
					  	<td></td>
		
					  </tr> -->
					  </tbody>
					</table>
				
				
					  
          
          </div>
      
			</div>
			</div>
			
			<!-- -------------------------------------------------------------------- -->
			
				<div id="menu1" class="tab-pane fade">
				<div class="tab-ctn">
					고정지출
				</div>
				</div>
				<div id="menu2" class="tab-pane fade">
				<div class="tab-ctn">
					고정지출
				</div>
				</div>
			</div>
			</div>
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