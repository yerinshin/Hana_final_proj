<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>
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
	

    
    .card {
    	border-radius : 20px;
    	border : 5px solid #009b9d;
    
    }
    
    .card:hover {
  		background : #dddddd70;
	}
    
    .card-deck{
    	margin-top : 50px;
    }
    
    .card-title {
    	color : #009b9d;
    	font-weight : bold;
    	font-size : 26px;
    }
    .card-text{
    	 font-size :19px; 
    }
    
</style>
<script>
	function changeAccount(userCode){
		//alert('dd')
		location.href = "${ pageContext.request.contextPath }/hanaro/changeToHanaro/${loginMember.userCode}"
		
	}
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
      <hr>
    <div id= "main-layout"> 
      <div class="row main">
      <aside id="side-menu">
			<div id="diyLnb" class="on">
			<h2 class="tit">하나로통장</h2>
			<ul class="depth1">
				
						<li class="on"><a href="#//HanaBank" >상품가입</a></li>
						
						<li><a href="#//HanaBank">My하나로통장</a></li>
						
						<li><a href="#//HanaBank">대시보드</a></li>
	
				</ul>
				</div>
		</aside>
   
      <section>
     

        <div class="title col" style="margin-top : 30px;">	
					<h2 id="title-h2">하나로 통장 <strong class="black">가입</strong></h2>	
	</div>
  <!--      <div class="brand_color">
         <div class="container">
            <div class="row">
                <div class="col-md-12">
            
                   <div class="titlepage">
                        <h2>하나로 통장 개설</h2>
                    </div>

                </div>
            </div>
         </div>
    	</div> -->
 
      <div class="container ">
	<div class="card-deck row justify-content-center">
		<div class="card consulting-card col-lg-4" id="change-account" onclick="changeAccount('${loginMember.userCode}')">
			<img src="${pageContext.request.contextPath}/resources/images/change-account.png" class="" alt="...">
			<div class="card-body">
				<h2 class="card-title">통장 전환 </h2>
				<p class="card-text"> 기존에 보유한 통장을 하나로 통장으로 전환하여 가입하기</p>
			</div>
		</div>
		<div class="card consulting-card col-lg-4">
			<img src="${pageContext.request.contextPath}/resources/images/new-account.png" class="" style="width : 300px; margin: 22px auto"alt="...">
			<div class="card-body">
				<h2 class="card-title">신규 개설</h2>
				<p class="card-text">신규 통장을 개설하여 하나로 통장에 가입합니다</p>
			</div>
		</div>
		
	</div>
</div>     
      </section> 
      </div>
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