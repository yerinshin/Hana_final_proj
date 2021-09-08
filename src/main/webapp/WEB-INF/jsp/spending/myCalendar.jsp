<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
     <jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>
     	
 <!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>   -->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link href="${ pageContext.request.contextPath }/resources/template2/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
    <link href="${ pageContext.request.contextPath }/resources/template2/assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
    <link href="${ pageContext.request.contextPath }/resources/template2/dist/css/style.min.css" rel="stylesheet">
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
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	
    }
	
	section {
    	width : 1100px;
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

.fc-day-number {
    float: right;
    font-size: 30px;
}

.fc-toolbar .fc-button {
    background: #2961ff;
    color: #fff;
    border: none;
    width: 70px;
    height: 37px;
    font-size: 18px;
  }
  
  .fc td, .fc th {
 
    font-size: 20px;
}

.card-body, .waves-effect {
    font-size: 20px;
 }
</style>
</head>

<body class="main-layout">
		<!-- loader  -->
   <%--    <div class="loader_bg">
         <div class="loader"><img src="${ pageContext.request.contextPath }/resources/images/loading.gif" alt="#" /></div>
      </div> --%>
      <!-- end loader --> 
      
     <header>
 			<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>      
      </header>
      
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
	
						<div class="content">
							<!-- --------------------- 내용 ------------------------ -->
									<div class="border-box">
							 <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="">
                               
                                    <div class="border-right p-r-0">
                                        <div class="card-body border-bottom">
                                            <h4 class="card-title m-t-10">Drag & Drop Event</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div id="calendar-events" class="">
                                                        <div class="calendar-events m-b-20" data-class="bg-info"><i class="fa fa-circle text-info m-r-10"></i>Event One</div>
                                                        <div class="calendar-events m-b-20" data-class="bg-success"><i class="fa fa-circle text-success m-r-10"></i> Event Two</div>
                                                        <div class="calendar-events m-b-20" data-class="bg-danger"><i class="fa fa-circle text-danger m-r-10"></i>Event Three</div>
                                                        <div class="calendar-events m-b-20" data-class="bg-warning"><i class="fa fa-circle text-warning m-r-10"></i>Event Four</div>
                                                    </div>
                                                    <!-- checkbox -->
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="drop-remove">
                                                        <label class="custom-control-label" for="drop-remove">Remove after drop</label>
                                                    </div>
                                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#add-new-event" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
                                                            <i class="ti-plus"></i> Add New Event
                                                        </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="">
                                        <div class="card-body b-l calender-sidebar">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
                              
                            </div>
                        </div>
                    </div>
                </div>
                <!-- BEGIN MODAL -->
                <div class="modal none-border" id="my-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Add Event</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-new-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Add</strong> a category</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                                <option value="inverse">Inverse</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MODAL -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
 
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
   
  <script src="${ pageContext.request.contextPath }/resources/template2/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template2/dist/js/jquery-ui.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template2/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!--Custom JavaScript -->
   <%--  <script src="${ pageContext.request.contextPath }/resources/template2/dist/js/custom.min.js"></script> --%>
     <!-- this page js -->
    <script src="${ pageContext.request.contextPath }/resources/template2/assets/libs/moment/min/moment.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template2/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template2/dist/js/pages/calendar/cal-init.js"></script>
</body>
<footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
  <%--     
  <jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include> --%>
<%--     <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.0.0.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/plugin.js"></script> 
      <!-- sidebar --> 
      <script src="${ pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
         $(document).ready(function(){
         $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         $(".zoom").hover(function(){
         
         $(this).addClass('transition');
         }, function(){
         
         $(this).removeClass('transition');
         });
         }); --%>
         
      </script> 
</html>