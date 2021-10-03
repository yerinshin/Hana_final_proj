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
	body {
	    /* background: #f8f8ff3b; */
	    /*#fbfbfb*/
   font-family: 'hana' , verdana, san-serif;
    }
    
 /*    .survey__item{
    	margin : 20px;
    }
     */
    .input_month, .input_won {
        background: white;
	    color: #14b98f;
	    font-size : 30px;
	    font-weight: 700;
	    height: 50px;
	    width: 270px;
	    border: none;
	    border-bottom: 3px solid #16c89b;
	    text-align: right;
    }
    
    .ul-month, .ul-won {
    	margin : 10px 0 0 0px;
    }
    
    .btn-month, .btn-won {
    	font-size : 18px;
    	border : none;
    	font-weight : 530;
    	width : 70px;
    	height : 35px;
    	margin : 2px;
    }
    
    .input_span {
    color : darkslategray;
    font-size : 21px;
    font-weight: 600;
    }
    
     input[type=radio] {
    	display : none;
    	margin : 10px;
    } 
    
    input[type=radio] + label {
  		margin : 5px;
    	padding-top : 10px;
    	font-size : 22px;
    	text-align : center;
    	display : inline-block;
    	border : 3px solid #16c89b;
    	width : 230px;
    	height : 60px;
    	
    }
    input[type=radio]:checked + label {
    	background-color : #16c89b;
    	color : white;
    }
    

    
    .survey__box {
    	 /* background: #fbfbfb; */
    	border : 1px solid #fbfbfb;
    	margin : 60px 30px;
    }
    
    .survey__item {
   
    	padding: 40px 20px;
    	border-bottom: 1px dotted #dddddd;
    }
    
	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
		justify-content : center;
		/* margin-right: 30px; */
		margin-left: 35px;
	}
	
	section {
    	width : 1300px;
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
	.essential{
		/* text-align: center; */
	padding-left : 10px;	
	font-size : 20px;
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
	
	    .btn-submit {
   		font-size : 22px;
    	margin-top: 45px;
    	width : 200px;
    	height : 60px;
    	border-radius : 20px;
    }
    
    /* ajax style */ 

    
    table#resultProductList{
    	width : 95%;
    	margin: auto; 
     	font-size: 20px; 
     	border : 3px solid #f9f9f9;
    }
    .basicRate {
    	font-size : 28px;
    	font-weight : 800;
    }
	.div-pRateList {
		margin-top : 20px;
		padding-left : 60px;
	}    
    .myRateInput {
    	/* font-style: italic; */
    	text-align : right;
    	border : none;
    	font-size : 32px;
    	font-weight : 900;
    	color :#14b98f;
    	width : 70px;
  
    }
    
    input[type=checkbox] {

    width: 20px;
    height : 20px;
    margin : 7px;

    }
    .btn-addRateList {
    	border : none;
    	background-color : white;
    }
    
    table {
    	border : 3px soild #f9f9f9;
    }
    
	th {
		text-align : center;
		border : 3px solid #f9f9f9;
	}
	td {
		padding : 10px 5px;
		text-align : left;
		font-size : 22px;
		border : 3px solid #f9f9f9;
	}
	
	.read-more {
		margin-top : 5px;
		margin-bottom : 20px;
	}
</style>
<script>
$(document).ready(function(){
	 $('.div-survey').hide()
	
	function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} 
	
	//적금 만기 지급액
	function interestCalculator(rate, payment, term ){
		let totalInterest = payment * term * (term + 1 )/2 * rate /12;
		let finalMoney = term * payment + totalInterest
		finalMoney = finalMoney.toFixed(0)
		
		return finalMoney
	}
	
	//재검색 버튼 click!
	$('#btn-search').click(function(){
		
		$('.div-survey').show()
	})
	 
	 
	let month
	let won
	let totalPay
	$('.btn-month').click(function(){
		month = $(this).attr('id')
	//	alert(month)
		$('#input_month').val(month)
		
		if($('#input_won').val() != '' ){
			
			totalPay = month * won
			$('#input_total_pay').val(totalPay)
			$('#input_total_pay_comma').val(numberWithCommas(totalPay))
		} else {
			$('#input_total_pay_comma').val('')
		}
		
	})
	
	$('.btn-won').click(function() {
		won = $(this).attr('id')
		$('#input_won').val(won)
		$('#input_won_comma').val(numberWithCommas(won))
		totalPay = month * won
	//	alert(totalPay)
		$('#input_total_pay').val(totalPay)
		$('#input_total_pay_comma').val(numberWithCommas(totalPay))
	})
	
	//검색된 예/적금 상품 list
	$('#btn-submit').click(function(){
		
		let type =  $('[name=type]:checked').val()			//상품 타입

		let year = new Date().getFullYear()
		let now = year-2000
		let age = '${loginMember.ss1}'.substring(0,2)
		
		if(age > now){
			let temp = '19'+age				//97 -> 1997
			age = year - temp			//나이 구하기
		}
	//	alert(age)
		let url = '${pageContext.request.contextPath}/dashBoard/savingProductList'
		//data : 상품 type, 나이, 기간 ,저축(예치)금액
		let data = { type : type, age: age, period : month, savingMoney : won}
		console.log(data)
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : url,
			data : JSON.stringify(data),
			async : false, 
			success : function(savingProductList){
				console.log(savingProductList)
				let json = JSON.parse(savingProductList)
				
				let html = ''
				
				let tableTitle = $('#tableTitleTemplate').text()
				if(savingProductList.length > 0 ){
					json.forEach(function(savingProduct){
						let temp = $('#productListTemplate').text()
						let pRateListId = savingProduct.name
							pRateListId = pRateListId.replace(/\s/gi, "")
						let maxInterestRate =  (savingProduct.interestRate + savingProduct.maxPRate).toFixed(2)
						console.log(won + ':' + month)
						let finalMoney = interestCalculator(savingProduct.interestRate /100, parseInt(won), parseInt(month))
							temp = temp.replace(/\{name\}/gi, savingProduct.name)					//상품명
										.replace(/\{pRateListId\}/gi, pRateListId)					//우대금리 list div의 id
										.replace(/\{interestRate\}/gi, savingProduct.interestRate)	//기본 금리
										.replace(/\{maxPRate\}/gi, savingProduct.maxPRate)	//기본 금리
										.replace(/\{maxInterestRate\}/gi, maxInterestRate)	//기본 금리
										.replace(/\{nameWithoutSpace\}/gi, pRateListId)				//내 기준 적용 금리
										.replace(/\{finalMoney\}/gi, numberWithCommas(finalMoney))				//내 금리 적용 만기 지급액
										
										/* .replace(/\{category\}/gi, savingProduct.category) */
								
							html += temp
					})
				}			
							console.log(html)
							$('#tableTitle').html(tableTitle)
							$('#resultProductList').html(html)
			
			}
		}) /*ajax 끝*/
	})
	
	
	//상품 별 우대금리 목록 보기
	$(document).on("click", ".btn-addRateList", function (e) { 
		
		//alert('dd')
		//$('#myRate').val('55')
		let productName = $(this).attr('id')
		//alert(productName) 
		
		let data = { productName : productName }
		
		$.ajax({
			type : 'post',
			contentType : 'application/json',
			url : '${pageContext.request.contextPath}/dashBoard/preferentialRateList',
			data : JSON.stringify(data),
			success : function(preferentialRateList) {
				console.log(preferentialRateList)
				
				let json = JSON.parse(preferentialRateList)
				
				if(preferentialRateList.length > 0) {
					let html = ''
					let nameWithoutSpace = productName.replace(/\s/gi, "")   //상품명에서 공백 제거
					json.forEach(function(pRate){
						let temp = $('#pRateListTemplate').text()
						temp = temp.replace(/\{pRate\}/gi, pRate.rate)
									.replace(/\{condition\}/gi, pRate.condition)
							 		.replace(/\{nameWithoutSpace\}/gi, nameWithoutSpace) 
						html +=temp
					})
						//productName 은 공백 포함 한글, 공백 지우기
						let pRateListId = nameWithoutSpace
						console.log(pRateListId)
						$('#' + pRateListId).html(html)
					
				}
			}
			
		}) 
	})
	
	 $(document).on("change", ".check-pRate", function (e) { 
		 	let pRate = $(this).val()					//체크 한 우대금리
	
		 	let productName = $(this).attr('id')
		 	console.log(productName)
		 	let finalMoney
		 	let myRate
	        if($(this).is(":checked")){
	          //  alert("체크박스 체크했음!");
	           		
	           	myRate = parseFloat($('#'+productName+'myRate').val()) + parseFloat(pRate)
	           	console.log(myRate)
	           	$('#'+productName+'myRate').val(myRate.toFixed(2))
				finalMoney = interestCalculator(myRate /100, parseInt(won),parseInt(month))
				$('.'+productName).text(numberWithCommas(finalMoney) +'원')
				
	            
	        }else{
	           // alert("체크박스 체크 해제!");
	           	myRate = parseFloat($('#'+productName+'myRate').val()) - parseFloat(pRate)
	            $('#'+productName+'myRate').val(myRate.toFixed(2))
	            finalMoney = interestCalculator(myRate /100, parseInt(won),parseInt(month))
	            $('.'+productName).text(numberWithCommas(finalMoney) +'원')
	        }
	    
	 })
})
</script>
<script id="tableTitleTemplate" type="text/template">
		<tr style="height : 80px;">
			<th width="25%">상품명</th>
			<th width="44%">기본금리/우대금리/최대금리</th>
			<th width="10%">내 금리</th>
			<th width="17%">만기지급금</th>
			<th></th>
		</tr>								
</script>					 
<script id="productListTemplate" type="text/template">
	<tr>
	<td width="25%" style="text-align : center;">{name}</td>
	<td width="45%">
		<div class="basicRate">
		{interestRate}<span style="font-size : 18px;">%</span>
		+ <span style="color : #14b98f; font-size : 18px;">우대금리 최대</span>
		<span style="color : #14b98f">{maxPRate}</span>
		<span style="color : #14b98f;font-size : 18px;">%</span>
		= <span style="font-size : 18px;">최대금리 </span>
		<span style="font-size : 30px;"><i>{maxInterestRate}</i></span>
		<span style="font-size : 18px;">%</span>
		</div>
		<div class="div-pRateList" id="{pRateListId}">

    	</div>
	</td>
	<td width="10%"><input class="myRateInput" id="{nameWithoutSpace}myRate" type="text" value="{interestRate}">%</td>
	<td class="{nameWithoutSpace}" width="17%" style="font-size : 26px; font-weight : 700; text-align:right;">{finalMoney}원</td>
	<td><input class="btn-addRateList" type="button" id="{name}" value="▼"></td>
	</tr>
</script>
<script id="pRateListTemplate" type="text/template">
	<input class="check-pRate " id="{nameWithoutSpace}" type="checkbox" name="pRate" value="{pRate}">{condition} :<b style="color : #14b98f"> {pRate}</b>% <br>
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
				<li class=""><a href="${pageContext.request.contextPath}/hanaro/dashBoard/${loginMember.userCode}">예산설정</a></li>
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
							<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/icon/caution3.png"/>
								하나로 통장 비상금 한도의  <span style="font-size : 32px; color : red;"><fmt:formatNumber value="${savingBalance/5000000}" type="percent"/></span> 가 채워졌어요.<br>
							<div class="col-md-2">
						 		<button class="send">추천 상품<br> 보러가기</button>
						 	</div>
							</c:otherwise>
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
				             	
				                <div class="col-md-6">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart1"></canvas>
				                    </div>
				                    <h2><span style="font-size : 20px;">(최근 6개월)</span>한달 평균 저축액 : 76.3만원</h2>	
				                </div>
				                <div class="col-md-6">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="linechart"></canvas>
				                    </div>
				                    <h2> 하나로 통장 총 보유 저축금 : 459.4만원</h2>
				                </div>
				            </div>
		
				        
				    </div>
				    <!-- Bar Chart area End-->

					</div>
					</div>
					<div class="border-box">
						<div class="title col">		
						<h2 id="title-h2">추천 예/적금<strong class="black"> 상품</strong></h2>				
						</div>
					
					<div class="row">
					 	<h2 class="col-md-8">금융비서가 찾은 최적의 정기 예금/적금 상품입니다</h2>
					 	<button style="background :white; border : none; font-size : 28px; padding-left : 120px;" id="btn-search" class="col-md-3">
					 		<b>조건검색</b>
					 		<img style="width : 45px; margin-left : 5px" id="img-search" src="${pageContext.request.contextPath}/resources/icon/research2.png">
					 		</button>
					</div>
					<div>
					  	<!-- service --> 
					  	<!-- #f5f7fb -->
					  	<table style="width : 1100px; margin : 40px auto; background: #eff2f7">
					  	<tr style="border: 5px white solid;">
					  		<td width="11%"><img style="width : 60px; margin-left : 40px" src="${pageContext.request.contextPath}/resources/icon/medal1.png"></td>
					  		<td>
					  		  <div class="row">
				                    <div class="col-md-6" style="text-align : center;">
				                    <h2 style="margin-top : 40px;">하나 원큐 적금<span style="font-size: 19px; color : #009b9d"> 정기적금</span> </h2>
				                                   
				                     <h4 id="accountNo">간편하게 우대금리를 제공하는 스마트폰 적금</h4>
				                    </div>
				                    <div class="col-md-3">
				                     <span style="font-size : 15px">기본 금리</span><h2>1.0%</h2>
				                     <span style="font-size : 15px">최대 금리</span><h2>2.3%</h2>
				                    </div>
				                  	<div class="col-md-2" style="padding-top : 20px">
				                  	<button class="read-more">상세보기</button>
				                  	<button class="read-more">가입하기</button>
				                  	</div>
				                  	</div>
					  		</td>
					  	</tr>
					  	<tr style="border: 5px white solid;">
					  		<td><img style="width : 60px; margin-left : 40px" src="${pageContext.request.contextPath}/resources/icon/medal2.png"></td>
					  		<td>
					  		  <div class="row">
				                    <div class="col-md-6" style="text-align : center;">
				                    <h2 style="margin-top : 40px;">하나 더 예금 <span style="font-size: 19px; color : #009b9d"> 정기예금</span> </h2>
				                                   
				                     <h4 id="accountNo">목돈마련의 기본, 재테크의 시작!</h4>
				                    </div>
				                    <div class="col-md-3">
				                     <span style="font-size : 15px">기본 금리</span><h2>0.9%</h2>
				                     <span style="font-size : 15px">최대 금리</span><h2>1.4%</h2>
				                    </div>
				                  	<div class="col-md-2" style="padding-top : 20px">
				                  	<button class="read-more">상세보기</button>
				                  	<button class="read-more">가입하기</button>
				                  	</div>
				                  	</div>
					  		
					  		</td>
					  	</tr>
					  	<tr style="border: 5px white solid;">
					  		<td><img style="width : 60px; margin-left : 40px" src="${pageContext.request.contextPath}/resources/icon/medal3.png"></td>
					  		<td>
				
				                  	  <div class="row">
				                    <div class="col-md-6" style="text-align : center;">
				                    <h2 style="margin-top : 40px;">주거래 정기예금<span style="font-size: 19px; color : #009b9d"> 정기예금</span> </h2>
				                                   
				                     <h4 id="accountNo"> KEB하나은행 주거래 고객을 위한 주거래 정기예금</h4>
				                    </div>
				                    <div class="col-md-3">
				                     <span style="font-size : 15px">기본 금리</span><h2>0.75%</h2>
				                     <span style="font-size : 15px">최대 금리</span><h2>1.25%</h2>
				                    </div>
				                  	<div class="col-md-2" style="padding-top : 20px">
				                  	<button class="read-more">상세보기</button>
				                  	<button class="read-more">가입하기</button>
				                  	</div>
				                  	</div>
					  		</td>
					  	</tr>
					  	
					  	</table>
    <!--   <div class="service">
         
            <div class="row">
               <div class="col-md-12">
                  <div class="service-box account-box" style="margin :10px auto; width:1000px; height : 180px;">
                    <div class="row">
                    <div class="col-md-6">
                    <h2 style="margin-top : 25px">하나더예금 <span style="font-size: 19px; color : #009b9d"> 정기예금</span> </h2>
                                   
                     <h4 id="accountNo">목돈마련의 기본, 재테크의 시작!</h4>
                    </div>
                    <div class="col-md-3">
                     <span>기본 금리</span><h2>2.3%</h2>
                     <span>최대 금리</span><h2>2.3%</h2>
                    </div>
                  	<div class="col-md-2">
                  	<button class="read-more">상세보기</button>
                  	<button class="read-more">상담하기</button>
                  	</div>
                  	</div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="service-box account-box" style="margin :10px auto; width:1000px; height : 180px;">
                    <div class="row">
                    <div class="col-md-6">
                    <h2 style="margin-top : 25px">하나더예금 <span style="font-size: 19px; color : #009b9d"> 정기예금</span> </h2>
                                   
                     <h4 id="accountNo">목돈마련의 기본, 재테크의 시작!</h4>
                    </div>
                    <div class="col-md-3">
                     <span>기본 금리</span><h2>2.3%</h2>
                     <span>최대 금리</span><h2>2.3%</h2>
                    </div>
                  	<div class="col-md-2">
                  	<button class="read-more">상세보기</button>
                  	<button class="read-more">상담하기</button>
                  	</div>
                  	</div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="service-box account-box" style="margin : 10px auto; width:1000px; height : 180px;">
                    <div class="row">
                    <div class="col-md-6">
                    <h2 style="margin-top : 25px">하나더예금 <span style="font-size: 19px; color : #009b9d"> 정기예금</span> </h2>
                                   
                     <h4 id="accountNo">목돈마련의 기본, 재테크의 시작!</h4>
                    </div>
                    <div class="col-md-3">
                     <span>기본 금리</span><h2>2.3%</h2>
                     <span>최대 금리</span><h2>2.3%</h2>
                    </div>
                  	<div class="col-md-2">
                  	<button class="read-more">상세보기</button>
                  	<button class="read-more">상담하기</button>
                  	</div>
                  	</div>
                  </div>
               </div>
            </div>
      
      </div> -->
					</div>
					
					
						<div class="div-survey">
					<form>
						<ul class="survey__box content row" >
							<li class="survey__item col-md-4">
								<h5 class="essential">가입기간</h5>
								<div class="form__input month">
									<input name="period" id="input_month" class="input_month" type="number" >
									<span class="input_span">개월</span>
								</div>
								<ul class="ul-month row">
									<li><input class="btn-month" type="button" id="6" value="6개월" ></li>
									<li><input class="btn-month" type="button" id="12" value="12개월" ></li>
									<li><input class="btn-month" type="button" id="24" value="24개월" ></li>
									<li><input class="btn-month" type="button" id="36" value="36개월" ></li>
								</ul>
							</li>
							<li class="survey__item col-md-4">
								<h5 class="essential">월 납입금액</h5>
								<div class="form__input won">
									<input id="input_won" class="input_won" type="hidden" name="won">
									<input id="input_won_comma" class="input_won" type="text" placeholder="" disabled>
									<span class="input_span">원</span>
								</div>
								<ul class="ul-won row">
									<li><input class="btn-won" type="button" id="100000" value="10만원" ></li>
									<li><input class="btn-won" type="button" id="300000" value="30만원" ></li>
									<li><input class="btn-won" type="button" id="500000" value="50만원" ></li>
									<li><input class="btn-won" type="button" id="1000000" value="100만원" ></li>	
								</ul>
							</li>
								<li class="survey__item col-md-4">
								<h5 class="essential">총 저축금액</h5>
								<div class="form__input won">
									<input id="input_total_pay" class="input_won" type="hidden" >
									<input id="input_total_pay_comma" class="input_won" type="text" placeholder="" disabled>
									<span class="input_span">원</span>
								</div>
								
							</li>
							<li class="survey__item col-md-9">
								<h5 class="essential">상품 분류</h5>
								<ul class="form__radio row">
									<li><input type="radio" class="input_type" name="type" value="2001" id="type1"><label for="type1">정기예금</label></li>
									<li><input type="radio" class="input_type" name="type" value="2002" id="type2"><label for="type2">정기적금</label></li>
									<li><input type="radio"class="input_type" name="type" value="2003" id="type3"><label for="type3">자유적금</label></li>
								</ul>
							</li>
							<li class="survey__item col-md-3">
								
								<input id="btn-submit" class="btn-submit send" type="button" value="결과보기">
							</li>
							<!-- 	<li class="survey__item">
								<h5 class="essential">원하는 가입경로</h5>
								<ul class="form__check button"><li>
								<input type="checkbox" id="eba650" value="on"
								><label for="eba650">모바일뱅킹</label></li>
								<li><input type="checkbox" id="eba651" value="on">
								<label for="eba651">영업점</label></li>
								<li><input type="checkbox" id="eba652" value="on">
								<label for="eba652">인터넷뱅킹</label></li>
								<li><input type="checkbox" id="eba653" value="on">
								<label for="eba653">콜센터</label></li></ul>
								</li> -->
							</ul>
							
					</form>
						</div><!-- 재검색 border -->
						<div id="table-product">
						<table id="tableTitle" style="width : 95%; margin: auto; font-size: 20px; background: #f9f9f9; border-top : 5px solid #14b98f;">
							<!-- 	<tr style="height : 80px;">
									<th width="25%">상품명</th>
									<th width="40%">기본금리/우대금리/최대금리</th>
									<th width="10%">기준 적용 금리</th>
									<th width="17%">만기지급금</th>
									<th>더</th>
								</tr> -->
								
							</table>
							<table id="resultProductList">
	<!-- 							<tr>
	<td width="25%">하나적금 적금</td>
	<td width="40%">
		<div class="basicRate">0.8<span style="font-size : 20px;">%</span> 
					+ <span style="color : #14b98f; font-size : 20px;">우대금리</span>
					<span style="color : #14b98f">1.3</span>
					<span style="color : #14b98f;font-size : 20px;">%</span>
					 = <span style="font-size : 20px;">최대금리 </span> 
					 2.1 <span style="font-size : 20px;">%</span>
		</div>
		<div class = "div-pRateList" id="{pRateListId}">
<input class="check-pRate " id="{nameWithoutSpace}" type="checkbox" name="pRate" value="{pRate}">1년이상 유지 시 : 0.5</label> <br>
<input class="check-pRate " id="{nameWithoutSpace}" type="checkbox" name="pRate" value="{pRate}">1년이상 유지 시 : 0.5 <br>
<input class="check-pRate " id="{nameWithoutSpace}" type="checkbox" name="pRate" value="{pRate}">1년이상 유지 시 : 0.5 <br>

    	</div>
	</td>
	<td width="10%"><input class="myRateInput" id="{nameWithoutSpace}myRate" type="text" value="0.2">%</td>
	<td width="17%" style="font-size : 25px; font-weight : 700; text-align:right;">6,015,000원</td>
	<td><input class="btn-addRateList" type="button" id="{name}" value="더"></td>
	<tr> -->
							</table>
						</div>
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
	let lineChartData=[]
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
				
				let json = JSON.parse(monthlySavingList)
				console.log(' json !!: ' + monthlySavingList)
				
				if(monthlySavingList.length > 0 ) {	
					let sum = 0
					json.forEach(function(monthlySaving){
						console.log(monthlySaving)
						let month ="'"+ monthlySaving.month + '월'+"'"
						monthArr.push(month)
						savingArr.push(monthlySaving.savingMoney/10000)
						
						sum += monthlySaving.savingMoney/10000
						lineChartData.push(sum)
						
					})	
					text='<script>'
					let temp = $('#graphTemplate').text()
					temp = temp.replace(/\{label\}/gi, '[' + monthArr + ']')
						   		.replace(/\{data\}/gi,'['+ savingArr +']')
						   		.replace(/\{lineData\}/gi,'['+ lineChartData +']')
						   		
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
					label: '한달 저축액',
					data: {data},
					backgroundColor: 
						
						'rgba(75, 192, 192, 0.8)',
					
					borderColor: 	
						'rgba(255,99,132,0)',
				
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
		})

		 /*----------------------------------------*/
		/*  2.  line Chart
		/*----------------------------------------*/

		ctx = document.getElementById("linechart");
		var linechart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: {label},
				datasets: [{
					label: '총 보유 비상금',
					data: {lineData},
					fill: true,
					backgroundColor :'#78d0d085',
    				borderColor: 'rgb(75, 192, 192)',
   					tension: 0.1,
					borderWidth: 4
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
						  fontColor:'white',
						  fontSize: 18,
						 }
						}]
				}
			}
		})
		
		
	})(jQuery);
</script>
</html>