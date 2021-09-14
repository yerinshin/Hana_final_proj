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
/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

} */

	
div.accountList {
		margin-top : 80px;
	}
	
	#btn-read-more {
		margin : 30px 50px 0px 50px auto;
	}
	
	.account-box {
		margin : 20px;
	
	}
	
	.account-box:hover {
		border : 3px solid #e2e2e2; 
		opacity :0.9;
	}
	
	.account-add-box {
		margin : 40px 20px;
	}
	
	#nickname {
		color : black;
		/* text-align : left; */
		font-size : 24px;
		font-weight : bold;
		/* color : #ffc221; */
		margin-left:10px;
	}	
	#accountNo {
	/* 	text-align : left; */
		font-size : 18px;
	}
	
	#balance {
		font-size : 26px;
	}
	
	.progress {
		width : 380px;
		margin-left : 40px;
		margin-top : 20px;
	}
	
	.progress-bar {
	    background-color: rgb(46 204 113);
	}	
	
	.service {
		padding-top : 0;
	}
	
	.service-box {
		background-color: rgb(222 238 249);
    	border-radius: 20px;
	}
	
	#add-box {
		background-color: rgb(255 255 255);
		height: 220px;
   		margin: 30px 20px 30px;
	}
	
	#penalty-box {
		background-color: rgb(255, 6, 6, 0.85);
    	border-radius: 40px;
    	color: white;
    	height: 35px;
    	padding-top: 5px;
    	margin-bottom: 20px;
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
				<li class=""><a href="${pageContext.request.contextPath}/spending/myCalendar">가계부</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/spending/spendingAnalysis" >소비현황</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/spending/challenge">도전하기</a></li>
			</ul>
			
			<div class="content">
			
			<div class="border-box">
				<div class="title col">	
					<h2 id="title-h2">내 도전 <strong class="black">목록</strong></h2>	
				</div>
			
      
      	<!-- service --> 
      <div class="service"> 

         
        
            <div class="container accountList">
            <div class="row">
                  <div class="col-md-6">
                  <div class="service-box account-box">
                  <div class="row">
                  <div id="nickname" class="col-md-9"> 
                     커피 값 아끼기
                  </div>
                  <div class="col-md-2" id="penalty-box">
                     <h4 id="accountNo">30%</h4>
                  </div>
                  </div>
                  <div class="row">
                  	<div class="col-md-6">현재 지출액</div>
                  	<div class="col-md-6">목표금액</div>
                  </div>
                  <div class="row">
                     <h1 id="balance" class="col-md-6"> 23500원</h1>
                     <h1 id="balance" class="col-md-6"> 50000원</h1>
                  </div>
             
                  <div class="progress">
  					<div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">45%</div>
             <!--      	<button id="btn-read-more" class="col-md-5 read-more">이체</button>
                  	<button id="btn-read-more" class="col-md-5 read-more">이용내역</button> -->
                 
                  </div>
                  </div>
               </div>
				
				
				
			<c:forEach items="${ challengeList }" var="challenge" varStatus="loop">	
              	       <div class="col-md-6">
                  <div class="service-box account-box">
                  <div class="row">
                  <div id="nickname" class="col-md-9"> 
                  		  ${challenge.title}
                  </div>
                  <div class="col-md-2" id="penalty-box">
                     <h4 id="accountNo">
                     <fmt:formatNumber value="${challenge.penaltyRate}" type="percent"/>
                     </h4>
                  </div>
                  </div>
                  <div class="row">
                  	<div class="col-md-6">현재 지출액</div>
                  	<div class="col-md-6">목표금액</div>
                  </div>
                  <div class="row">
                     <h1 id="balance" class="col-md-6">
                     <fmt:formatNumber value="${ challenge.nowSpending }" type="number"/>원
                     </h1>
                     <h1 id="balance" class="col-md-6">
                      <fmt:formatNumber value="${ challenge.savingGoal }" type="number"/>원
                      </h1>
                  </div>
             
                  <div class="progress">
  					<div class="progress-bar" role="progressbar" style="width: ${ challenge.nowSpending / challenge.savingGoal *100 }%" 
  					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
  					<fmt:formatNumber value="${challenge.nowSpending / challenge.savingGoal}" type="percent"/>
  					</div>
             <!--      	<button id="btn-read-more" class="col-md-5 read-more">이체</button>
                  	<button id="btn-read-more" class="col-md-5 read-more">이용내역</button> -->
                 
                  </div>
                  </div>
               </div>
              
              
              
             <%--   <div class="col-md-6">
                  <div class="service-box account-box" onclick="goAccountDetail('${account.accountNo}')">
                  <div id="nickname"> 
                     ${ account.accountNickName }
                  </div>
                     <h4 id="accountNo">${ account.accountNo }</h4>
                     <h1 id="balance"> ${ account.balance }원</h1>
                    <div class="row">
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이체</button>
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이용내역</button>
                  	</div>
                  </div>
               </div> --%>
               </c:forEach>
            
               
               <div class="col-md-6">
                  <div class="service-box account-add-box" id="add-box">
                  <div>
                  <img src="${pageContext.request.contextPath}/resources/icon/service5.png">
                  </div>
                  	<div>
                  	<div class="col-md-3"></div>
                     <button id="btn-read-more btn-add" class="col-md-6 read-more">도전 추가하기</button>
                  	</div>
                  	</div> 
                  </div>
               </div>
            
              
            </div>
         </div>
				
				
				
			</div>
			
			
			</div>
			
			
			
		</div>
		
			
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
</html>