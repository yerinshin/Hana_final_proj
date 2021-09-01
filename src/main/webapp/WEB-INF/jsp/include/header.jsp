<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

         <!-- header inner -->
         <div class="header">
            <div class="head_top">
               <div class="container">
                  <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                       <div class="top-box">
                        <ul class="sociel_link">
                         <li> <a href="#"><i class="fa fa-facebook-f"></i></a></li>
                         <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                         <li> <a href="#"><i class="fa fa-instagram"></i></a></li>
                         <li> <a href="#"><i class="fa fa-linkedin"></i></a></li>
                     </ul>
                    </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                       <div class="top-box">
                       <c:if test="${not empty loginMember}">
                        <p> ${ loginMember.name } 님 </p>
                       </c:if>
                    </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="container" id="head-top">
            <div class="row">
               <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                  <div class="full">
                     <div class="center-desk">
                        <div  id="logo" class="logo"> <a href="index.html"><img src="${ pageContext.request.contextPath }/resources/images/hanabank-logo.png" id="hana-logo" alt="logo"/></a> </div>
                     </div>
                  </div>
               </div>
              
              
              
               <div class="col-xl-7 col-lg-7 col-md-9 col-sm-9">
                  <div class="menu-area">
                     <div class="limit-box">
 
		<nav class="main-menu">                    
           <ul class="menu-area-main">
   
             <li class="active"> <a href="${ pageContext.request.contextPath }">Home</a> </li>
                          <%--     <li> <a href="/about.jsp">계좌생성</a> </li> --%>
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            계좌관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/account/accountOpen.do">계좌생성</a></li>
            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/account/accountList.do">계좌조회</a></li>
            <li><a class="dropdown-item" href="#">계좌송금</a></li>
          </ul>
      	</li>
         
         <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="${ pageContext.request.contextPath }/hanaro" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            하나로통장
          </a>
          
         <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">             		  	
     	    <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/hanaro/changeToHanaro/${loginMember.userCode}">통장전환</a></li>
            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/hanaro/${loginMember.userCode}">My하나로통장</a></li>
            <li><a class="dropdown-item" href="${ pageContext.request.contextPath }/hanaro/dashBoard">대시보드</a></li>
         </ul>
         </li>
        
        <c:choose>
	        <c:when test="${ empty loginMember }">
	        	<li> <a href="${ pageContext.request.contextPath }/board/boardList.do">Q&A</a> </li>
            </c:when>
	        <c:otherwise>
	            <li> <a href="/product.jsp">MyPage</a> </li>
	        </c:otherwise>	
        </c:choose>
                       	       	
                               
      </ul>
      </nav>
                         <!-- 
                        <nav class="main-menu">
                           <ul class="menu-area-main">
                              <li class="active"> <a href="${ pageContext.request.contextPath }">Home</a> </li>
                              <li> <a href="${ pageContext.request.contextPath }/about.jsp">Account</a> </li>
                              <li> <a href="${ pageContext.request.contextPath }/blog.jsp">Q&A</a> </li>
                             	<li class="mean-last"> <a href="${ pageContext.request.contextPath }/contact.jsp">signup</a> </li>
                       	     
                       	       		<li> <a href="${ pageContext.request.contextPath }/product.jsp">MyPage</a> </li>
                            </ul>
                        </nav>
                        -->
                     </div>
                  </div>
               </div>
               <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
                     <c:choose>
                     	<c:when test="${ empty loginMember }">
                    	 	<li><a id="loginBtn" class="buy" href="${ pageContext.request.contextPath }/member/login">Login</a></li>
                    	</c:when>
               			<c:otherwise>
                       		<li><a id="loginBtn" class="buy" href="${ pageContext.request.contextPath }/member/logout">Logout</a></li>
                     	</c:otherwise>
                     </c:choose>
          		</div>
            </div>
         </div>
        
         </div>
         <!-- end header inner --> 