<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		justify-content : center;
		/* margin-right: 30px; */
		margin-left: 15px;
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
    
    #text-list {
    	font-size : 24px;
    	font-weight : bold;
    }
    
   /*  #accountList {
    	height : 100%;
   		padding: 35px 0 50px 20px;
    }
    
    .account {
    	margin-bottom : 20px;
    }
    

    
    .accountInfo {
    	font-size : 18px;
    	color : black;
    	width : 800px;
    	height : 110px;
    	background-color : #dddddd;
    	
    	margin-right : 10px;
    	padding : 7px 0 10px 15px;
    }
    
    #balance2 {
    	padding-right :0 0 20px 30px;
    	margin-bottom : 10px;
    	font-size : 22px;
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
    
     */
    
   .info-table {
	    margin : 30px 0 0 0px;
	    width : 1000px;
	    table-layout: fixed;
	    font-size : 19px;
	    text-align : center;
	    border-bottom: 1px solid #999999;
	    border-top: 2px solid #777777 !important;
	    border-collapse: separate;
	    border-spacing: 0;
	    margin-bottom : 40px;
	}
	
	.info-table > thead > tr > th {
	    color: #222a3b;
	   /*  background-color: #f6f6f6; */
	    background-color: #ecf4f8;
	    border-left: 2px solid #e8e8e8;
	    line-height : 50px;
	}
	
	td {
		border-top: 1px solid #e8e8e8;
		border-left: 1px solid #e8e8e8;
		border-collapse: collapse;
		line-height : 100px;
		height : auto;
	}
	
	.in-radio {
		border-top: 1px solid #e8e8e8;
	}
	
	.check {
	    position: absolute;
		width: 50px;
	    height: 50px;
	}
	
	input[type='radio'],
	input[type='radio']:checked {
	  appearance: none;
	  border-radius: 100%;
	  width: 25px;
	  height: 25px;
	  margin-right: 0.1rem;
	}
	
	input[type='radio'] {
		
	  background: url('${ pageContext.request.contextPath }/resources/icon/radio-background.png');
	  background-repeat: no-repeat;
	  background-size: 25px;
	  margin-right: 0.1rem;
	}
	
	input[type='radio']:checked {
	  background: url('${ pageContext.request.contextPath }/resources/icon/radio-check.png');
	  background-repeat: no-repeat;
	  background-size: 25px;
	
	  margin-right: 0.1rem;
	}
	
	#balance {
		text-align : right;
  		padding-right : 15px;
	}
  	
  	#balance > .accent {
		color : #27b2a5;
  	}
  	
/*   	div.btn {
  	width: 910px;
  		
  	}
  	
  	div.btn > .buy{
  		width : 150px;
  		height : 60px;
  		margin : 10px;
  
  	}
  	
  	#cancleBtn {
  		margin-right : 250px;
  	} */
  	
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
  	
  	footer {
  		margin-top : 150px;
  	}
</style>
<script>
function changeToHanaro(accountNo) {
	alert('!!')
	<%-- location.href='<%= request.getContextPath() %>/account/accountDetail.do?accountNo='+accountNo --%>
	
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
     <!--    <div class="brand_color">
         <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>#########</h2>
                    </div>
                </div>
            </div>
         </div>
    	</div> -->
    	
    		<div id="title" class="titlepage">
    			하나로 통장 전환
    		</div>
    		<div id="text-list"> 전환 가능 계좌 리스트 </div>
    		<form action="${ pageContext.request.contextPath}/hanaro/changeToHanaro" method="post">
    		<table class="info-table">
							
							<colgroup>
								<col style="width:135px">
								<col style="width:180px">
								<col style="width:360px">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">전환여부</th>
									<th scope="col">예금종류</th>
									<th scope="col">계좌번호</th>
									<th scope="col">예금잔액</th>
								</tr>
							</thead>
							<tbody>
							
							
								<c:forEach items="${ accountList }" var="account" varStatus="loop">	
									<tr>
										<th class="in-radio">
											<div class="radio-style-type">
												<input type="radio" value=${ account.accountNo } id="acctNo0" name="accountNo">
												<!-- <label for="acctNo0">신청</label> -->
												<div class="check"></div>
											</div>
										</th>
									
										<td>${ account.accountType }</td>
										<td>
											<strong class="account-number"><a href="#">${ account.accountNo }</a></strong>
										</td>
										<td id="balance">
											<strong  class="amount-number accent">${ account.balance }</strong>
											<strong>원</strong>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						
						
						
					<!-- 	<div class="btn">
							<button class="buy" id="submitBtn">확인</button>
							<button class="buy" id="cancleBtn">취소</button>
						</div> -->
						
						   <div class="row send-btn"> 
						<!-- 	<button class="read-more" id="goListBtn">목록</button>
                           <button class="read-more" id="updateBtn" >수정</button> -->
							<button type="submit" class="send" id="submitBtn">확인</button>
							<button class="send" id="cancleBtn">취소</button>
							
                           </div>
             </form>
		<!-- 
    		<div id = "accountList">
    	<c:forEach items="${ accountList }" var="account" varStatus="loop">	
    			<div class = "row account">
				<div class="accountInfo">					
                  <div id="accountType"> 
                     ${ account.accountType }
                   
                  </div>
                     <h4 id="accountNo">${ account.accountNo }</h4>
                     <div class="row">
                     <div  class="col-md-9" id="balanceText" >잔액 </div>
                     <div  class="col-md-3" id="balance2">${ account.balance } 원</div>
                     </div>
                    
	    		</div>
                   <div class="btn-change" onclick="changeToHanaro('${account.accountNo}')">                   
                  		하나로통장 전환
                   </div>          	
	    		</div>
		</c:forEach>
			</div>
		-->				
		
		
		
		
		
		
		
		
		
		
		
		
        </section>
        </div>
        </div>
     <!--  <aside> 
     	 <section> 
     	 <h1>최근글</h1> 
     	 <ul> 
     	 <li>목록1</li> 
     	 <li>목록2</li> 
     	 </ul>
       </section> 
       </aside> -->

      <%-- footer --%>
      <footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
  
</body>
</html>