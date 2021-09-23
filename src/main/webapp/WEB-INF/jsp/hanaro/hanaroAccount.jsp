<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	#head-top {
       width: 1500px;
   	   margin: 0 460px 0 350px;
}

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
    	border-radius : 20px;
    }
     
     h3 {
     	margin-top : 7px;
    	font-size : 20px;
    }
    #accountType {
     font-size : 22px;
    }
    #balanceText {
     	padding-left : 20px;
    }
    .balance2 {
    	text-align : right;
 		padding-right: 50px;
    	font-size : 24px;
    	font-weight : bold;
    }

 	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
	width : 90%;
		display : flex;
		justify-content : center;
		margin-left: 15px;
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
		border: 4px solid rgba(52, 152, 219, 0.4);
	}
	
	.consumption-balance {
		background-color: rgba(243, 156, 18, 0.25);
		border: 4px solid rgba(243, 156, 18, 0.4);
	}
	
	.saving-balance {
	    background-color: rgba(231, 76, 60, 0.25);
	    border: 4px solid rgba(231, 76, 60, 0.4);
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
    
     .modals-default-cl {
    	/* display : flex;
		justify-content : center; */
		
		margin-top : 30px;
    } 
     .modal-dialog.modal-large .modal-content {
    	padding: 70px 100px;
    }
    
    .modal-content {
    	padding : 40px 40px;
    	margin-top: 300px;
    	width: 850px;
   		height: 600px;
    }
    
    #btn-close {
	    width: 40px;
    	height: 40px;
    	font-size: 32px;
    	padding : 0 0 10px 0;
    }
    
    .modal-large .modal-body h2 {
    	font-size : 28px;
    	color : black;
    } 
    
    
    .modal-large .modal-body p {
   		font-size : 20px;
   		color : black;
    }
    
    .modal-footer > div > .btn-default {

    	width: 200px;
    	height : 50px;
    	font-size : 25px;
    }
    
    #close-btn {
    	margin-right : 130px;
    }
    
    serviceInfo {
    	margin-top : 30px;
    }
    
    	div.nice-select{
		display : none;
	}
	
	#splitTo, #splitTo2, #splitTo3 {
		height : 67px;
		font-size : 23px;
	}
	
	table {
		width : 600px;
		height : 330px;
     	font-size : 25px;
     }
     		
     th {
     	text-align :center;
        padding-right : 25px;
     	width : 40%;
     }
     td {
     	padding-left : 15px;
     	}
     		
     input.form-control {
     	height: 67px;
     	font-size :23px;
     	margin-top : 20px;
     }
     .choose_bg {
    background: none;
}
.choose_bg .white_bg {
  	height : 460px;
  	text-align : center;
}
</style>
<script>
	$(document).ready(function() {
		 function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			} 
		
		getHanaroBalance()	
		
		//console.log(basicBalance)
		//console.log(consumptionBalance)
		//console.log(savingBalance)
		
		$('.split-money').click(function(){
			var id_check = $(this).attr('id')
			console.log(id_check)
			let accountNo = '${ hanaroInfo.accountNo }'
			let splitFrom =''
			let splitTo =''
			let transMoney =''
			let b_balance = parseInt($('#b_balance').val())
			let c_balance = parseInt($('#c_balance').val())
			let s_balance = parseInt($('#s_balance').val())
			
	 		if(id_check == 'splitFromBasic'){
				splitFrom = 'basic_balance'
				splitTo = $('#splitTo').val()
				transMoney = parseInt($('#transMoney').val())
				
				b_balance -=  transMoney
				if(splitTo == 'consumption_balance'){
					c_balance += transMoney
				}else if(splitTo == 'saving_balance'){
					s_balance += transMoney
				}
				
			} else if(id_check == 'splitFromConsumption'){
				splitFrom = 'consumption_balance'
				splitTo = $('#splitTo2').val()
				transMoney = parseInt($('#transMoney2').val())
				c_balance -= transMoney
					if(splitTo == 'basic_balance'){
						b_balance += transMoney
					}else if(splitTo == 'saving_balance'){
						s_balance += transMoney
					}
			} else if(id_check == 'splitFromSaving') {
				splitFrom = 'saving_balance'
				splitTo = $('#splitTo3').val()
				transMoney = parseInt($('#transMoney3').val())
				s_balance -= transMoney
					if(splitTo == 'basic_balance'){
						b_balance += transMoney
					}else if(splitTo == 'consumption_balance'){
						c_balance += transMoney
					}
			}
			
		//	let splitFrom = $('#splitFrom').val()
		//	let splitTo = $('#splitTo').val()
		//	let transMoney = $('#transMoney').val()
			
		
		//	console.log(s_balance)
			console.log(accountNo)
			console.log(splitFrom)
			console.log(splitTo)
			console.log(transMoney)
			
			/* let data = { accountNo : accountNo, splitFrom : splitFrom, splitTo : splitTo, transMoney : transMoney} */
			 let data = { accountNo : accountNo, splitFrom : splitFrom, splitTo : splitTo, transMoney : transMoney , basicBalance : b_balance, consumptionBalance : c_balance, savingBalance : s_balance}
				console.log(data)
		 	$.ajax({
				type : 'post',
				contentType: 'application/json',
				url : '${pageContext.request.contextPath}/hanaro/splitMoney',
				data : JSON.stringify(data),
				success : function() {
					/* alert('잔액쪼개기 완료') */
					getHanaroBalance() 
					
				}
				
			})  
		})

		
	 	
	function getHanaroBalance() {
			

			let url= '${ pageContext.request.contextPath }/hanaro/ajax/${ loginMember.userCode }'
			console.log(url)
			$.ajax({
				type: 'get',
				url : url,
				
				success : function(hanaroAccount) {
					console.log(hanaroAccount)
					
					let json = JSON.parse(hanaroAccount)
					
					if(hanaroAccount != null) {
						console.log(hanaroAccount)
					//	basicBalance = json.basicBalance
						$('#basicBalance').html( numberWithCommas(json.basicBalance)+ " 원")
						$('#consumptionBalance').html(numberWithCommas(json.consumptionBalance) + " 원")
						$('#savingBalance').html(numberWithCommas(json.savingBalance) + " 원")
						
						$('#b_balance').val(json.basicBalance)
						$('#c_balance').val(json.consumptionBalance)
						$('#s_balance').val(json.savingBalance)
						
						
					}
					
					
				}
			})
		}  
		
	})	
</script>
<script>
$(document).ready(function() {
$('#basic-balance').click(function(){
	location.href="${ pageContext.request.contextPath }/hanaro/detail/basic"
})
$('#consumption-balance').click(function(){
	location.href="${ pageContext.request.contextPath }/hanaro/detail/consumption"
})
$('#saving-balance').click(function(){
	location.href="${ pageContext.request.contextPath }/hanaro/detail/saving"
})
})
</script>
</head>
 <!-- body -->
<body class="main-layout">

      <!-- loader  -->
 <%--      <div class="loader_bg">
         <div class="loader"><img src="${ pageContext.request.contextPath }/resources/images/loading.gif" alt="#" /></div>
      </div> --%>
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
	                   <div  class="col-md-3 balance2">
	                   <b>
	                    <fmt:formatNumber value="${ hanaroInfo.balance }" type="number"/>원
	                 </b></div>     
            	   </div>       
	   		</div>	
	   		
	   		
	   		
	   		<div id="menu-title"> 잔액 쪼개기 현황 </div>
			
	
    		<div class= "row hanaro">
	   			<div class="basic-balance accountInfo" id="basic-balance">					
                   <div id="accountType"> 
                   <div> <b> 기본금</b></div> 
             	   </div>
             	    <h3 id="accountNo">고정 지출 및 모든 입금과 출금</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3 balance2" id="basicBalance">
	                   <b>
	            <%--        <fmt:formatNumber value="${ hanaro.basicBalance }" pattern="#,###"/>  --%>
	                   원
	                   </b></div>
	                       <input id="b_balance" type="hidden" value=""/>
            	   </div>   
	   			</div>	   			
            	   <div  class="splitMoney" id="split-fromBasic"  data-toggle="modal" data-target="#basic-modal">
            	   <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	   
            	   <div><b>잔액이동</b></div>           	
            	   </div>  
	   		</div>	
	   		
	   		<div class= "row hanaro">
				<div class="consumption-balance accountInfo" id="consumption-balance">					
                   <div id="accountType"> 
                   <div> <b> 생활금</b></div> 
             	   </div>            
 					<h3 id="accountNo">체크 카드로 사용으로 발생하는 생활 소비 관리</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3 balance2" id="consumptionBalance"><b>
	                 <%--   ${ hanaro.consumptionBalance }  --%>
	                   원</b></div>
	                   <input id="c_balance" type="hidden" value=""/>
            	   </div> 
            	   </div>      
            	   <div  class="splitMoney" id="split-fromConsumption" data-toggle="modal" data-target="#consumption-modal">
            		   <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	
					   <div><b>잔액이동</b></div> 
					</div>    
	   		</div>	
	   		
	   		<div class= "row hanaro">
	   			<div class="saving-balance accountInfo" id="saving-balance">					
                   <div id="accountType"> 
                   <div> <b> 비상금</b></div> 
             	   </div>             	   
					<h3 id="accountNo">저축의 시작은 여기에서, 비상시 사용할 돈 보관</h3>
                   <div class="row">
	                   <div  class="col-md-9" id="balanceText" >잔액 </div>
	                   <div  class="col-md-3 balance2" id="savingBalance"><b> 
	           <%--         ${ hanaro.savingBalance }  --%>
	                   원</b></div>
	                    <input id="s_balance" type="hidden" value=""/>
            	   </div>       
	   			</div>	
            	   <div  class="splitMoney" id="split-fromSaving" data-toggle="modal" data-target="#saving-modal">
            	   	 <img src="${ pageContext.request.contextPath }/resources/icon/splitMoney.png"/>          	
            	     <div><b>잔액이동</b></div> 
            	   </div>    
	   		</div>	
	   		
	   		<!-------------------- 모달 창 --------------------->
	   		
	   		<div class="modals-default-cl">
	<!--          <div class="serviceInfo"> -->
	   		 <div class="modal fade" id="basic-modal" role="dialog">
	             <div class="modal-dialog modal-large">
	                 <div class="modal-content">
	                    <div class="modal-header">
	                         <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                    </div>
	                    <div class="modal-body">
							<div class="choose_bg">
          					<div class="white_bg">
           
		<%-- 	 <form class="main_form" action="${ pageContext.request.contextPath }/hanaro/splitMoney/${ loginMember.userCode }" method="post">  --%>
			                  <!--   <form class="main_form" action="#" method="post"> -->
			                    	<%--   <input type="hidden" name="accountNo" value="${ hanaroInfo.accountNo }"/>  --%>
			                    <%-- 	<input type="hidden" name="accountNo" value="${ loginMember.userCode }"/> --%>
			                          <table>
			                           		<tr>
				                         		 <th>기본금 에서 </th>
			                           			<td>
						                    	  <input type="hidden" id="splitFrom" name="splitFrom" value="basic_balance"/>
			                           				<select id="splitTo" name="splitTo" class="form-select mb-3 form-control" aria-label="Default select example">
													  <option selected></option>
													  <option value="consumption_balance">생활금</option>
													  <option value="saving_balance">비상금</option>
													</select>										
			                           			</td>                                               			
			                           		</tr>
			                           		<tr>		
			                           		<th>이동 금액</th>
			                           			<td>  <input class="form-control" placeholder="보낼 금액(원)" type="text" id="transMoney" name="transMoney"></td>
			                           		</tr>	                          		
			                           </table>   
				                      <div class="modal-footer">
				                    	<div class="col-md-6">
				                         <!--   <button type="submit" class="splitMoney send btn btn-default" id="confirmService1">잔액 이동</button> -->
				                          		<button class="split-money btn btn-default" id="splitFromBasic" data-dismiss="modal"
				                          		data-toggle="modal" data-target="#confirm-modal">잔액 이동</button> 
				                    	</div>
				                    	<div class="col-md-6">
				                        <button type="button" id="close-btn" class="btn btn-default" data-dismiss="modal">Close</button>
				                    	</div>
				                      </div>
			                 <!--  </form>  -->
			        		</div>	
			      			</div>
	                    </div>
	                      
	                  </div>
	              </div>
	          </div>
	          
	          
	          
	   		 <div class="modal fade" id="consumption-modal" role="dialog">
	             <div class="modal-dialog modal-large">
	                 <div class="modal-content">
	                     <div class="modal-header">
	                          <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                      </div>
	                      <div class="modal-body">
							<div class="choose_bg">
          					<div class="white_bg">
			                          <table>
			                           		<tr>
				                         		 <th>생활금 에서 </th>
			                           			<td>
						                    	    <input type="hidden" id="splitFrom" name="splitFrom" value="consumption_balance"/>
			                           				<select id="splitTo2" name="splitTo" class="form-select mb-3 form-control" aria-label="Default select example">
													  <option selected></option>
													  <option value="basic_balance">기본금</option>
													  <option value="saving_balance">비상금</option>
													</select>										
			                           			</td>                                               			
			                           		</tr>
			                           		<tr>		
			                           		<th>이동 금액</th>
			                           			<td>  <input class="form-control" placeholder="보낼 금액(원)" type="text" id="transMoney2" name="transMoney"></td>
			                           		</tr>	                          		
			                           </table>   
				                      <div class="modal-footer">
				                    	<div class="col-md-6">
				                          		<button class="split-money btn btn-default" id="splitFromConsumption" data-dismiss="modal"
				                          		data-toggle="modal" data-target="#confirm-modal">잔액 이동</button> 
				                    	</div>
				                    	<div class="col-md-6">
				                        <button type="button" id="close-btn" class="btn btn-default" data-dismiss="modal">Close</button>
				                    	</div>
				                      </div>
			        		</div>	
			      			</div>
	                    </div>
	                  </div>
	              </div>
	          </div>
	          
	   		 <div class="modal fade" id="saving-modal" role="dialog">
	             <div class="modal-dialog modal-large">
	                 <div class="modal-content">
	                     <div class="modal-header">
	                          <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                      </div>
	                <div class="choose_bg">
          					<div class="white_bg">
			                          <table>
			                           		<tr>
				                         		<th>비상금 에서 </th>
			                           			<td>
						                    	    <input type="hidden" id="splitFrom" name="splitFrom" value="saving_balance"/>
			                           				<select id="splitTo3" name="splitTo" class="form-select mb-3 form-control" aria-label="Default select example">
													  <option selected></option>
													  <option value="basic_balance">기본금</option>
													  <option value="consumption_balance">생활금</option>
													</select>										
			                           			</td>                                               			
			                           		</tr>
			                           		<tr>		
			                           		<th>이동 금액</th>
			                           			<td>  <input class="form-control" placeholder="보낼 금액(원)" type="text" id="transMoney3" name="transMoney"></td>
			                           		</tr>	                          		
			                           </table>   
				                      <div class="modal-footer">
				                    	<div class="col-md-6">
				                          		<button class="split-money btn btn-default" id="splitFromSaving" data-dismiss="modal"
				                          		data-toggle="modal" data-target="#confirm-modal">잔액 이동</button> 
				                    	</div>
				                    	<div class="col-md-6">
				                        <button type="button" id="close-btn" class="btn btn-default" data-dismiss="modal">Close</button>
				                    	</div>
				                      </div>
			        		</div>	
			      			</div>
	                  </div>
	              </div>
	          </div>
	          
	          
	   		 <div class="modal fade" id="confirm-modal" role="dialog">
	             <div class="modal-dialog modal-large">
	                 <div class="modal-content">
	                     <div class="modal-header">
	                          <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                      </div>
	             <div class="choose_bg">
          					<div class="white_bg">
			                          
			                            <h2> 잔액이동이 완료되었습니다</h2>            		
			                           
				                      <div class="modal-footer">
				                    	<div class="col-md-12">
				                          		<button class=" btn btn-default" id="splitFromSaving" data-dismiss="modal"
				                          		data-toggle="modal">확인</button> 
				                    	</div>
				                    
				                      </div>
			        		</div>	
			      			</div>
	                  </div>
	              </div>
	          </div>
	          
	          

	          
	  <!--  		</div> -->
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
			<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
   			 <!-- bootstrap JS
		============================================ -->
  			  <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>	
  			  
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