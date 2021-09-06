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
      
      <body class="main-layout">
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
				    </div>
				    <!-- Bar Chart area End-->
												 
					<div id="menu-title"> 내 또래 상위 10%의 설정 예산 </div>
				 								  <div class="bar-chart-area">
				        <div class="container">
				           <div class="row">
				            	<div class="col-md-1">
				             	</div>
				                <div class="col-md-7">
				                    <div class="bar-chart-wp sm-res-mg-t-30 chart-display-nn">
				                        <canvas height="140vh" width="180vw" id="barchart2"></canvas>
				                    </div>
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
	    <script src="${ pageContext.request.contextPath }/resources/template/js/charts/bar-chart.js"></script>
    
      	<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
   			 <!-- bootstrap JS
		============================================ -->
  			  <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>	
      </section> 
      </div>
</body>
      <%-- footer --%>
      <footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
</body>
</html>