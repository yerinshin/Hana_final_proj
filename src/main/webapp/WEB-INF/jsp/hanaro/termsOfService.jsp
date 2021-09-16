<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 모달을 위한 css -->
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
	
	section {
    	width : 1000px;
    }
	
	 #title {
    	color : black;
    	font-size : 28px;
    	font-weight : bold;
    	border-bottom: 2px solid #a0a0a0;
    	padding-top : 55px;
    	margin-bottom : 50px;
    	padding-bottom : 16px;
    }
    
    #menu-title {
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	
    }
    
    #accountList {
    	height : 100%;
   		padding: 35px 0 50px 20px;
    }
    
    .account {
    	margin-bottom : 20px;
    }
    
/* 	.line {
		border-bottom : 1px solid gray;
		
	} */
    
    .accountInfo {
    	font-size : 20px;
    	color : black;
    	width : 950px;
    	height : 150px;
    	background-color : rgba(224, 224, 224, 0.5);
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
    .btn-change {
    	color : white;
    	font-size : 18px;
    	width : 110px;
    	height : 110px;
    	background-color : #008485;
    	padding-top : 17px;
    	text-align: center;
    }
    
    h3 {
    margin-top : 7px;
    	font-size : 20px;
    }
    
    .terms {
    	margin-left : 20px;
    }
    
    .termTitle {
    	text-align : center;
    	margin-left : 20px;
    	font-size : 20px;
    	font-weight : bold;
    	color : black;
    	margin-bottom : 5px;
    }
    
    .termTitle > img {
    	margin-right : 5px;
    }
    
    textarea {
     overflow-y: scroll;
     font-size : 19px;
    }
    
    .checkTerms {
    	text-align : right;
    	padding-right : 50px;
    	font-size : 19px;
    	color : black;
    	margin-bottom : 30px;
    	
    }
    
    input[type=checkbox] {
    box-sizing: border-box;
    width: 20px;
    height : 20px;
    margin : 5px;
    vertical-align:middle;
    }
    
   input[type=checkbox]:checked {
   		background: #27b2a5;
   }
    
    label {
    	padding-top : 5px;
    }
    
    .modals-default-cl {
    	/* display : flex;
		justify-content : center; */
		
		margin-top : 30px;
    } 
    
    #checkServiceInfo {
    	width : 650px;
    	height : 70px;
    	margin-left : 20px;
    	font-size : 25px;
    }
    
    .modal-dialog.modal-large .modal-content {
    	padding: 70px 100px;
    }
    
    .modal-content {
    	
    	width: 1000px;
   		height: 1200px;
    }
    
    .modal-large .modal-body h2 {
    	font-size : 28px;
    	color : black;
    } 
    
    
    .modal-large .modal-body p {
   		font-size : 20px;
   		color : black;
    }
    
    
    #btn-close {
	    width: 40px;
    	height: 40px;
    	font-size: 32px;
    	padding : 0 0 10px 0;
    }
    
    .modal-footer {
		
		display : block;
		margin: 0 auto;
    }
    
    .modal-footer > .btn-default {
    	margin-left : 230px;
    	height : 50px;
    	font-size : 25px;
    }
    
    serviceInfo {
    	margin-top : 30px;
    }
    
     .service-checkbox {
     		margin-bottom : 80px;
           padding-top: 15px;
       }
       
    button {
   		margin : 0px auto;
   		border-radius : 12px;
   	}
   	
   	
   	.send {
   		margin-top: 40px;
   		max-width: 190px;
   	}
  	
  	#submitBtn {
  		margin-left : 300px;
  		
  		background: #008485;
  	}
  	
  	#cancleBtn {
  	    margin-right : 310px;
  	    background: #6e7277;
  	  
  	}
  	
 
</style>
<script>
	$(document).ready(function() {
		$('#confirmService1').click(function() {	
			console.log('dd')
		//	alert('dd')
			$("input:checkbox[id='checkService1']").prop("checked", true)	
		})	
		
		$('#confirmService2').click(function() {	
			console.log('dd')
		//	alert('dd')
			$("input:checkbox[id='checkService2']").prop("checked", true)	
		})	
	})	
	
	
	function doSubmit()	{
		
		let f = document.confirmForm
		
		if(f.checkService1.checked == false || f.checkService2.checked == false ||
				f.checkTerm1.checked == false || f.checkTerm2.checked == false ) {
		
			alert('체크하세요')
			
			return false
		}

		return true
	}	
	
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
      
   	<div id="title" class="titlepage">하나로 통장 전환</div>
    
    	<div id="menu-title"> 전환 선택 계좌 </div>
    		
    		<div class="accountInfo">					
                   <div id="accountType"> 
                   <div> <b> ${ account.accountType }</b></div> 
             	   </div>
             	   
                   <h3 id="accountNo">${ account.accountNo }</h3>
                   <div class="row">
                   <div  class="col-md-9" id="balanceText" >잔액 </div>
                   <div  class="col-md-3" id="balance2"><b>${ account.balance } 원</b></div>
             </div>       
	    </div>
	    		
	    	<form action="${ pageContext.request.contextPath}/hanaro/termsOfService" method="post"
	    			name="confirmForm" onsubmit="return doSubmit()">	
	    	<input type="hidden" name="accountNo" value="${ account.accountNo }">
	    	<input type="hidden" name="userCode"  value="${ loginMember.userCode }">
	    	
	    	 <div id="menu-title">상품 정보 확인 </div>
                
                <div class="modals-default-cl">
	                <div class="serviceInfo">
	                    <button id="checkServiceInfo" type="button" class="
	                    btn btn-info col-md-8" data-toggle="modal" data-target="#myModalthree">하나로 통장 상품 안내</button>
				    <div class="checkTerms service-checkbox">
					<input name="checkService1" id="checkService1" type="checkbox" value="agree">
					<label class="inpSchClass00" for="checkbox2">확인했습니다.</label>
				    </div>
	                </div>
                
	             
	                <div class="serviceInfo">
	                    <button id="checkServiceInfo" type="button" class="
	                    btn btn-info col-md-8" data-toggle="modal" data-target="#myModal2">하나로 통장 금리 확인</button>
				    <div class="checkTerms service-checkbox">
					<input name="checkService2" id="checkService2" type="checkbox" value="agree">
					<label class="inpSchClass00" for="checkbox2">확인했습니다.</label>
				    </div>
	                </div>
	                    
	 
	 
	  
	                    <div class="modal fade" id="myModalthree" role="dialog">
	                        <div class="modal-dialog modal-large">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                                </div>
	                                <div class="modal-body">
	                                    <div>Modal title</div>
	                                    <p>Curabitur blandit mollis lacus. Nulla sit amet est. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Donec mi odio, faucibus at, scelerisque quis, convallis in, nisi. Cras sagittis.</p>
	                                </div>
	                                <div class="modal-footer">
	                                	<h3>※ 본인은 상품 설명서를 제공받고 그 내용을 충분히 이해하였음을 확인합니다.</h3>
	                                    <button type="button" class="btn btn-default col-md-4" data-dismiss="modal" id="confirmService1">확인</button>
	                                  <!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                        <div class="modal fade" id="myModal2" role="dialog">
	                        <div class="modal-dialog modal-large">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                                </div>
	                                <div class="modal-body">
	                                    <h2>Modal title</h2>
	                                    <p>Curabitur blandit mollis lacus. Nulla sit amet est. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam. Donec mi odio, faucibus at, scelerisque quis, convallis in, nisi. Cras sagittis.</p>
	                                </div>
	                                <div class="modal-footer">
	                                	<h3>※ 본인은 상품 설명서를 제공받고 그 내용을 충분히 이해하였음을 확인합니다.</h3>
	                                    <button type="button" class="btn btn-default col-md-4" data-dismiss="modal" id="confirmService2">확인</button>
	                                  <!--   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	             
                </div>
                
                
                	
      		<div id="menu-title">상품 정보 확인 및 약관 동의 </div>
      		
      		<div class="termTitle"><%-- <img src="${ pageContext.request.contextPath }/resources/icon/radio-check.png">  --%>하나로 통장 특약</div>
	      		<textarea class="terms" cols = "100" rows = "6" >
	      			
	      			제 1조 적용 범위
	
					봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는제 1조 적용 범위
					봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는제 1조 적용 범위
	
	      		</textarea>
			    <div class="checkTerms">
				<input name="checkTerm1" id="checkbox1" type="checkbox" value="agree">
				<label class="inpSchClass00" for="checkbox1">약관에 동의합니다.</label>
			    </div>	

			<div class="termTitle"><%-- <img src="${ pageContext.request.contextPath }/resources/icon/radio-check.png"> --%> 입출금이 자유로운 예금 약관 </div>
			    <textarea class="terms" cols = "100" rows = "6" >
			      			제 1조 적용 범위
					봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는
			    </textarea>
			    <div class="checkTerms">
				<input name="checkTerm2" id="checkbox2" type="checkbox" value="agree">
				<label class="inpSchClass00 " for="checkbox2">약관에 동의합니다.</label>
			    </div>

             
                   
              <div class="row send-btn"> 
				<!-- 	<button class="read-more" id="goListBtn">목록</button>
                       <button class="read-more" id="updateBtn" >수정</button> -->
				<button type="submit" class="send" id="submitBtn">확인</button>
				<button class="send" id="cancleBtn">취소</button>
					
              </div>
              
            </form>
               
           
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