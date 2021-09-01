<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>

   .accountInfo {
    	font-size : 20px;
    	color : black;
    	width : 950px;
    	height : 150px;
    	background-color : rgba(224, 224, 224, 0.42);
    	border-top: 1px solid #dde2e3;
   		border-bottom: 1px solid #dde2e3;
/*     	background-color : #e8f4f3; */
    	/* box-shadow: #00000040 0px 0px 19px 0px; */
    	margin: 30px 10px 50px 20px;
    	padding: 15px 0 15px 25px;
    }
    
    #accountType {
     font-size : 22px;
    }
    #balanceText {
     	padding-left : 20px;
    }
    #balance2 {
    	text-align : right;
 		padding-right: 50px;
    	font-size : 24px;
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
 /*    	border-bottom: 2px solid #a0a0a0; */
    	padding-top : 55px;
    	margin-bottom : 20px;
    /* 	margin-bottom : 50px; */
    	padding-bottom : 16px;
    }
    
    #menu-title {
    	color : black;
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	
    }
    
    #menu-title:after {
	  content: "";
	  display: block;
	  width: 60px;
	  border-bottom: 2px solid rgb(202 202 202);
	  margin-left : 1px;
	}
	.hanaro{
		padding-left: 20px;
	}
	
	.basic-balance, .consumption-balance, .saving-balance {
		width : 830px;
		border-radius: 20px 0 0 20px;
		border : none;
		padding-left : 20px;
		margin-right :0px;
		margin-bottom : 10px;
	}
	
	.basic-balance {
		background-color: rgba(52, 152, 219, 0.25);
	}
	
	.consumption-balance {
		background-color: rgba(243, 156, 18, 0.25);
	}
	
	.saving-balance {
	    background-color: rgba(231, 76, 60, 0.25);
	}
	
	.splitMoney {
		width : 120px;
		text-align : center;
		border-radius: 0 20px 20px 0;
		font-size : 20px;
    	color : black;
    	height : 150px;
    	margin: 30px 10px 10px 0px;
    	padding: 15px 0 15px 5px;
	}
	
	.splitMoney > img {
		width : 40px;
		height : 40px;
		margin: 37px 5px 10px 0;
	}
	#split-fromBasic{
		background-color: rgba(52, 152, 219, 0.5);
	}
	
	#split-fromConsumption {
		background-color: rgba(243, 156, 18, 0.5);
	}
    
    #split-fromSaving {
  	 	background-color: rgba(231, 76, 60, 0.5);
    }
</style>
<script>
	$(document).ready(function() {
		$('#split-fromBasic').click(function() {	
			alert('dd')	
		})	
		
		$('#split-fromConsumption').click(function() {	
			alert('dd')
		})	
		
		$('#split-fromSaving').click(function() {	
			alert('dd')
		})	
	})	
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
      
      <hr>
  <div id= "main-layout">    
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
    	
    		<div id="title" class="titlepage">My하나로통장</div>
    	
    		<div class="accountInfo">					
                   <div id="accountType"> 
                   <div> <b> ${ hanaroInfo.accountType}</b></div> 
             	   </div>
             	   
                   <h3 id="accountNo">${ hanaroInfo.accountNo }</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3" id="balance2"><b>${ hanaroInfo.balance } 원</b></div>     
            	   </div>       
	   		</div>	
	   		
	   		
	   		
	   		<div id="menu-title"> 잔액 쪼개기 현황 </div>

    		<div class= "row hanaro">
	   			<div class="basic-balance accountInfo">					
                   <div id="accountType"> 
                   <div> <b> 기본금</b></div> 
             	   </div>
             	    <h3 id="accountNo">고정 지출 및 모든 입금과 출금</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3" id="balance2"><b>${ hanaro.basicBalance } 원</b></div>
            	   </div>   
	   			</div>	   			
            	   <div  class="splitMoney" id="split-fromBasic">
            	   <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	   
            	   <div><b>잔액이동</b></div>           	
            	   </div>  
	   		</div>	
	   		
	   		<div class= "row hanaro">
				<div class="consumption-balance accountInfo">					
                   <div id="accountType"> 
                   <div> <b> 생활금</b></div> 
             	   </div>            
 					<h3 id="accountNo">체크 카드로 사용으로 발생하는 생활 소비 관리</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3" id="balance2"><b>${ hanaro.consumptionBalance } 원</b></div>
            	   </div> 
            	   </div>      
            	   <div  class="splitMoney" id="split-fromConsumption">
            		   <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	
					   <div><b>잔액이동</b></div> 
					</div>    
	   		</div>	
	   		
	   		<div class= "row hanaro">
	   			<div class="saving-balance accountInfo">					
                   <div id="accountType"> 
                   <div> <b> 비상금</b></div> 
             	   </div>             	   
					<h3 id="accountNo">저축의 시작은 여기에서, 비상시 사용할 돈 보관</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3" id="balance2"><b> ${ hanaro.savingBalance } 원</b></div>
            	   </div>       
	   			</div>	
            	   <div  class="splitMoney" id="split-fromSaving">
            	   	 <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	
            	     <div><b>잔액이동</b></div> 
            	   </div>    
	   		</div>	
	   			
	   		
    			
	<%--      	<div id = "accountList">
    			<div class = "row">
				<div class="accountInfo">					
                  <div id="accountType"> 
                     ${ account.type}입출금통장
                  </div>
                     <h4 id="accountNo">${ account.accountNo }123-456-789</h4>
                     <h4 id="balance">잔액 :  ${ account.balance }2000원</h4>
                    
	    		</div>
                   <div class="btn-change" onclick="changeToHanaro('${account.accountNo}')">                   
                  		하나로통장 전환
                   </div>
                  	
                  	
	    		</div>
			</div> 				 --%>
			
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