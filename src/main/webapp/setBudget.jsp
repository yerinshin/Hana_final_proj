<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.btn-area {
	margin-bottom: 50px;
}
.content-body {
	margin-left: 0px;
}
.ct-chart .ct-label {
	fill: black;
	font-size: 13px;
	font-weight: 600;
}
.card .card-size {
	min-height: 400px;
}
#banner-title {
	position: absolute;
	top: 40%;
	left: 35%;
}
#banner-title .animated.fadeInDown {
	font-size: 40px;
	font-weight: 800;
	color: #2F4F4F;
}
.carousel-item.active:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: inherit;
	z-index: -1;
	filter: blur(6px);
	-webkit-filter: blur(6px);
	-moz-filter: blur(6px);
	-o-filter: blur(6px);
	filter: url(#blur);
}
.sub-nav {
	margin-bottom: 40px;
}
#DataTables_Table_0_length {
	display: none;
}
#DataTables_Table_1_length {
	display: none;
}
#DataTables_Table_0_filter {
	display: none;
}
#DataTables_Table_1_filter {
	display: none;
}
#DataTables_Table_0_info {
	display: none;
}
#DataTables_Table_1_info {
	display: none;
}
#DataTables_Table_0_paginate {
	display: none;
}
#DataTables_Table_1_paginate {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">   
	$(document).ready(function() {
		
		$("#append_row").on("click", function() {
			let fixedBudget = $('#fixed-table > table');
			let accNo = '${ onepickInfo.accNo }';
			let category = $("#add_category").val();
			let budgetName = $("#add_budgetName").val(); 
			let budget = $("#add_budget").val();
			let view_setDate = $("#add_setDate").val();
			let tmp_setDate = $("#add_setDate").val().split(' ');  
			let setDate = tmp_setDate[1];
			let budgetNo = '${ bidget.budgetNo }';
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/makeBudget',
				type : 'post',
				data : {
					accNo : accNo,
					category : category,
					budgetName : budgetName,
					budget : budget,
					setDate : setDate,
					view_setDate : view_setDate,
					budgetNo : budgetNo + 1
				},
				success : function(data) {	
					console.log("??????");
					let str = '';
					str += '<tr>'
					str += '<td>' + category + '</td>'
					str += '<td>' + budgetName + '</td>'
					str += '<td>' + budget + '</td>'
					str += '<input type="hidden" class="cal-budget" id="' + budgetNo + '" value="' + budget + '">'
					str += '<td>' + view_setDate + '</td>'
 					str += '<td> <button class="delete-btn" " value="' + budgetNo + '">??????</button></td>'
					str += '</tr>'
						
					$('#append-area').append(str);
					$('.input-area').val('');
					$('#add_category').val('?????????').prop("selected",true);
					$('#add_setDate').val('??????').prop("selected",true);
					
					$('#add_budgetName').empty();
					$('#add_budget').empty();
					
				},
				error : function() {
					console.log("??????");
				}
			})
		})
	});
</script>
<script>
	$(document).ready(function() {
		// ???????????? ??????
		$("#totalBudget").keyup( function() {
			let accNo = '${ onepickInfo.accNo }';
			let totalBudget = $('#totalBudget').val(); 
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/totalBudget',
				type : 'post',
				data : {
					accNo : accNo,
					totalBudget : totalBudget
				},
				success : function(data) {		
					console.log("yes");
				},
				error : function() {
					console.log("??????");
				}
			})
		})
		
		// ???????????? ??????( ????????? -> ????????? )
		$("#lCost-submit").on("click", function() {
			let flag = 'living';
			let accNo = '${ onepickInfo.accNo }';
			let moneyToLiving = $('#lSetMoney').val(); 
			let tmp_dateToLiving = $('#lSetDate').val().split(' '); 
			let dateToLiving = tmp_dateToLiving[1];
			
			console.log(accNo + " : " + moneyToLiving + " : " + dateToLiving);
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/autoSend',
				type : 'post',
				data : {
					flag : flag,
					accNo : accNo,
					moneyToLiving : moneyToLiving,
					dateToLiving : dateToLiving
				},
				success : function(data) {	
					console.log("yse")
				},
				error : function() {
					console.log("??????");
				}
			})
		})
		
		// ???????????? ??????( ????????? -> ????????? )
		$("#eCost-submit").on("click", function() {
			let flag = 'extra';
			let accNo = '${ onepickInfo.accNo }';
			let moneyToExtra = $('#eSetMoney').val(); 
			let tmp_dateToExtra = $('#eSetDate').val().split(' '); 
			let dateToExtra = tmp_dateToExtra[1];
			
			console.log(accNo + " : " + moneyToExtra + " : " + dateToExtra)
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/autoSend',
				type : 'post',
				data : {
					flag : flag,
					accNo : accNo,
					moneyToExtra : moneyToExtra,
					dateToExtra : dateToExtra
				},
				success : function(data) {	
					console.log("yes")
				},
				error : function() {
					console.log("??????");
				}
			})
		})
	});
</script>
<script>
$(document).ready(function() {
		// ?????? ??????
		$(document).on('click', '.delete-btn', function() {
 			let budgetNo = $(this).val();
			let accNo = '${ onepickInfo.accNo }';
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/deleteBudget',
				type : 'post',
				data : {
					budgetNo : budgetNo
				},
				success : function(data) {
					// ?????? ????????? ???????????? ajax ??????
					$.ajax({
						url : '${ pageContext.request.contextPath }/product/onepick/budgetList/${ onepickInfo.accNo }',
						type : 'get',
						success : function(data) {
							
							$('#append-area').empty();
							
							$(data).each(function() {
								let str = '';
								str += '<tr>';
								str += '<td>' + this.category + '</td>';
 								str += '<td>' + this.budgetName + '</td>';
 								str += '<td>' + this.budget + '<input type="hidden" class="cal-budget" value="' + this.budget + '"></td>';
								str += '<td>?????? ' + this.setDate +' ???</td>';
								str += '<td><button class="delete-btn" value="' + this.budgetNo  + '">??????</button>';
								str += '</td></tr>';
								
								$('#append-area').append(str);
							})
							
							let fixed_sum = 0
							$('.cal-budget').each(function(){ 			//???????????? money??? ????????? ???????????? ??????
								fixed_sum = fixed_sum + Number($(this).val());
							});
							
							console.log("??????" + fixed_sum);
							$('#fixed_sum').val(fixed_sum);
							
							let cal_total = $('#cal_total').val();
							cal_total = cal_total - fixed_sum;
							
							$('#cal_result').val(cal_total);
						},
						error : function() {
							console.log("??????");
						}
					})
				},
				error : function() {
					console.log("??????");
				}
		})
	})
})
</script>
<script>
	$(document).ready(function() {
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		
			let totalBudget = $('#totalBudget').val();
			let fixed_sum = 0; // ???????????? ??????
			let cal_result = $('#cal_result').val();
			
			
			// ???????????? ??????(dom ?????????)
			$('.cal-budget').each(function(){ 			//???????????? money??? ????????? ???????????? ??????
				fixed_sum += Number($(this).val());
				});
			
			$('#fixed_sum').val(numberWithCommas(fixed_sum));
			
			
			// ???????????? ?????? ??????(???????????? ?????????)
			$('#append_row').on('click' ,function(){
				let sum = parseInt($('#fixed_sum').val());		// ???????????? 
				let result = parseInt($('#cal_result').val());	// ????????????
				let add = parseInt($('#add_budget').val());		// ???????????? ?????? ??????
				
				sum = parseInt(sum + add);			// ???????????? ?????? ??????
				result = parseInt(result - add);	// ???????????? ??????
				
				$('#fixed_sum').val(sum);			// ??? ??????
				$('#cal_result').val(result);
			});
			
			
			// ??? ?????? ??????(dom ?????????)
			cal_result = parseInt(totalBudget - fixed_sum)
			$('#cal_result').val(cal_result);
			
			
			// ????????? -> ????????? ?????? ?????????
			$('#lSetMoney').on('keyup' ,function(){
				let sub1 = parseInt($('#lSetMoney').val());
				let sub2 = parseInt($('#eSetMoney').val());	
				
				//NaN??? ?????? 0 ??????
				if(isNaN(sub1)){
					sub1 = 0;
				}
				if(isNaN(sub2)){
					sub2 = 0;
				}
				
				
				let totalBudget = $('#totalBudget').val();
				cal_result = parseInt(totalBudget - fixed_sum)
				
				cal_result = Number(cal_result - sub1 - sub2);
				
				$('#cal_result').val(cal_result);
			});
			
			// ????????? -> ????????? ?????? ?????????
			$('#eSetMoney').on('keyup' ,function(){
				let sub1 = parseInt($('#lSetMoney').val());
				let sub2 = parseInt($('#eSetMoney').val());	
				
				//NaN??? ?????? 0 ??????
				if(isNaN(sub1)){
					sub1 = 0;
				}
				if(isNaN(sub2)){
					sub2 = 0;
				}
				
				let totalBudget = $('#totalBudget').val();
				cal_result = parseInt(totalBudget - fixed_sum)
				
				cal_result = Number(cal_result - sub1 - sub2);
				
				$('#cal_result').val(cal_result);
			});
			
			
			// ??? ?????? ??????
			$('#totalBudget').on('change keydown' ,function(){
				totalBudget = $('#totalBudget').val();	// ?????? ????????? ???
				$('#cal_total').val(totalBudget);		// ??? ????????? ?????? ??????
			});
	});
</script>
</head>
<body>
	<!-- Navigation -->


	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">??????
							????????????</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Home</a></li>
				</ol>
			</div>
		</div>

		<!-- banner****************************** -->
		<div class="carousel-item active"
			style="background-image: url('${pageContext.request.contextPath }/resources/images/dashboard_main.jpg'); height: 200px; margin-bottom: 50px;">
			<div id="banner-title">
				<h2 class="animated fadeInDown">Financial Report</h2>
			</div>
		</div>

		<!-- tab****************************** -->
		<div class="sub-nav">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/product/onepick/budget">??????
						??????</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/dashboard">????????????</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/analysis">????????????</a>
				</li>
			</ul>
		</div>



		<!-- ******content-body******* -->
		<div class="content-body">

			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******?????? ??????****** -->
		
							<div class="row">
								<div class="col">
									<h4 style="margin-bottom: 5px;">??? ??? ??????</h4>
									<p style="font-size: 14px; color: grey;">??? ???????????? ???????????? ????????? ??????
										????????? ???????????????</p>
								</div>
								<div class="col">
									<input class="form-control form-control-lg" type="text"
										id="totalBudget" name="totalBudget"
										value="${ onepickInfo.totalBudget }">
								</div>
							</div>
				
				<!-- *******#/?????? ??????****** -->
			</div>
			<!-- ******#/content-row******* -->



			<!-- ******content-row******* -->
			<div class="row">

				<!-- *******????????? ????????????****** -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body">
							<div class="row">
								<div class="col" style="text-align: left;">
									<h4 id="tableTitle">????????????</h4>
									<p style="font-size: 14px; color: grey;">??????????????? ?????? ???????????????
										??????????????? ?????????????????????</p>
								</div>
								<div class="col">
									<input class="form-control form-control-lg" type="text" disabled
										id="fixed_sum" name="fixedSum"
										value="${ onepickInfo.totalBudget }">
										
								</div>
							</div>
							<div class="mt-4">
								<div class="table-responsive" id="fixed-table">
									<table
										class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th style="width: 10%;">??????</th>
												<th style="width: 20%;">?????????</th>
												<th style="width: 20%;">????????????</th>
												<th style="width: 10%;">?????????</th>
												<th style="width: 30%;">??????</th>
											</tr>
										</thead>
										<tbody id="append-area">
											<c:forEach items="${ budgetList }" var="budget"
												varStatus="loop">
												<tr>
													<td>${ budget.category }</td>
													<td>${ budget.budgetName }</td>
													<td><fmt:formatNumber value="${ budget.budget }" type="number" />
													<input type="hidden" id="${ budget.budgetNo }"
														class="cal-budget" value="${ budget.budget }">
													</td>
													<td>?????? ${ budget.setDate } ???</td>
													<td>
														<button class="delete-btn" value="${ budget.budgetNo }">??????</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tr id="" style="background-color: white; size: 10;">
											<td>
											<select name="category" 
												id="add_category" style="">
													<option value="?????????" selected>?????????</option>
													<option value="?????????">?????????</option>
													<option value="??????">??????</option>
											</select></td>
											<td style="text-align: center;">
													<div class="form-group col-md-2" style="margin: 0;">
														<input type="text" name="budgetName" class="form-control" id="add_budgetName" style="height: 10px; width: 10px;">
	                                           		</div>
	                                        </td>
	                                        <td style="text-align: center;">
													<div class="form-group col-md-2" style="margin: 0;">
														<input type="text" name="budget" class="form-control" id="add_budget" style="height: 10px; width: 10px;">
	                                           		</div>
	                                        </td>
											<td>
												<div class="col-auto my-1"  >
													<select class="form-control" name="setDate" id="add_setDate" 
														aria-label="Example select with button addon">
															<option value="??????" selected>??????</option>
															<c:forEach begin="1" end="28" var="x">
																<option>??????
																	<c:out value="${x}" /> ???
																</option>
																<br>
															</c:forEach>
													</select>
												</div>
											</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="5" style="margin: 0; padding: 0;"
												style="text-align: center;">
												<button id="append_row"
													style="width: 100%; height: 49px; border: 0px; font-weight: 800;">
													<i class="fas fa-plus"
														style="font-size: 20px; padding-right: 7px;"></i>???????????? ??????
												</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<!-- #/ container -->
					</div>
				</div>
				<!-- *******#/????????? ????????????****** -->
			</div>
			<!-- ******#/content-row******* -->



			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******?????? ?????? ?????? ?????????******* -->
				<div class="col-lg">
			
							<h4 id="tableTitle">????????????</h4>
							<p style="font-size: 14px; color: grey;">??????????????? ?????????/??????????????? ??????
								???????????? ???????????? ????????? ???????????????</p>
							<div class="mt-4">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th colspan="4"
													style="text-align: center; background-color: rgb(233, 236, 239);">???
													?????? <strong style="color: red; font-size: 25px;"><input
														type="text" disabled id="cal_total"
														value="${ onepickInfo.totalBudget }"></strong> ??? ??? <strong
													style="color: blue; font-size: 25px;"><input
														type="text" disabled id="cal_result"></strong> ??? ??????
												</th>
											</tr>
											<tr>
												<th style="width: 30%; text-align: center;">????????????</th>
												<th style="width: 30%; text-align: center;">????????????</th>
												<th style="width: 20%; text-align: center;">?????????</th>
												<th style="width: 20%; text-align: center;"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center; vertical-align: middle;">?????????&nbsp;&nbsp;<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;?????????
												</td>
												<td style="text-align: center;">
													<div class="col-auto my-1" style="margin: 0;">
														<input type="text" name="setMoney" class="form-control" id="lSetMoney" value= "${ autoInfo.moneyToLiving }" style="height: 10px;">
	                                           		</div>
												</td>
												
												
												<!-- ?????? ??????->?????? -->
												<td style="text-align: center;">
												<div class="col-auto my-1">
													<select name="setDate" class="custom-select mr-sm-2" id="eSetDate"
														aria-label="Example select with button addon">
															<option selected>??????</option>
															<c:forEach begin="1" end="28" var="x">
																<option><c:out value="?????? ${x} ???" /></option>
																<br>
															</c:forEach>
													</select>
												</div>
												</td>
												<td style="text-align: center; vertical-align: middle;">
													<button class="label label-pill label-primary" id="eCost-submit" style="width: 70px; border: 0px; ">??????</button>
												</td>
											</tr>
											<tr>
												<td style="text-align: center; vertical-align: middle;">?????????&nbsp;&nbsp;<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;?????????
												</td>
												<td style="text-align: center;">
													<div class="form-group col-md-2" style="margin: 0;">
														<input type="text" name="setMoney" class="form-control" id="eSetMoney" value="${ autoInfo.moneyToExtra }" style="height: 10px;">
	                                           		</div>
	                                           	</td>
												<!-- ?????? ?????? -> ?????? -->
												<td style="text-align: center;">
												<div class="col-auto my-1">
													<select name="setDate" class="custom-select mr-sm-2" id="eSetDate"
														aria-label="Example select with button addon">
															<option selected>??????</option>
															<c:forEach begin="1" end="28" var="x">
																<option><c:out value="?????? ${x} ???" /></option>
																<br>
															</c:forEach>
													</select>
												</div>
												</td>
												<td style="text-align: center; vertical-align: middle;">
												<button class="label label-pill label-primary" id="eCost-submit" style="width: 70px; border: 0px; ">??????</button></td>
											</tr>
										</tbody>
									</table>
							
						</div>
					</div>
					<br>

					<!-- 	
					<div class="btn-area">
						<div class="btn-wrap" id="cancle_btn">
							<input type="submit" id="submit-btn2" class="btn btn-outline-info" value="???????????? ??????"
								onclick="check('modify')" style="width: ;">
						</div>
					</div> 
					-->
				</div>
				<!-- *******#/?????? ?????? ?????? ?????????******* -->
			</div>
			<!-- ******#/content-row******* -->
		</div>

		<!-- ****** #/content-body******* -->
	</div>