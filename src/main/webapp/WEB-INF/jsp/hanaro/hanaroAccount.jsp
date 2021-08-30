<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>

#main {
	width : 70%;
	margin:0 auto;

}

#side-menu {

    margin: 0 0 50px 20px;
    border-top: none;
/* float: left;   */
    width: 300px;
    box-sizing: border-box;
}

#side-menu .tit {
	font-size: 28px;
	font-weight : bold;
    color: #008485;
    border-bottom: 3px solid #008485;
    padding: 64px 0 16px 8px;
    }
    
    #side-menu li  {
    margin: 0;
    border-top: 1px solid #ddd;
    }
    
    #side-menu li > a {
        font-size: 22px;
	    color: #637079;
	    padding: 10px 25px 8px 8px;
	    line-height: 65px;
    }
    
    #title {
    	font-size : 28px;
    	font-weight : bold;
    	padding : 70px 0 0 120px;
    }
    
    #accountList {
    	height : 100%;
   		padding: 35px 0 50px 150px;
    }
    
    .accountInfo {
    	width : 700px;
    	height : 100px;
    	background-color : #dddddd;
    	margin-right : 10px;
    	padding : 5px 0 0 15px;
    }
    
    .btn-change {
    	color : white;
    	font-size : 18px;
    	width : 100px;
    	height : 100px;
    	background-color : #008485;
    	padding-top : 17px;
    	text-align: center;
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
  <div id= "main">    
  	<div class="row">
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
    			My하나로통장
    		</div>
    
    		<div id = "accountList">
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
			</div>
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