<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">


    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/font-awesome.min.css">

<%--     <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/owl.carousel.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/owl.theme.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/owl.transitions.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/normalize.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/responsive.css">
      <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/animate.css">
     <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/scrollbar/jquery.mCustomScrollbar.min.css">
         <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/wave/waves.min.css"> --%>
           
     <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/main.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/meanmenu/meanmenu.min.css">
    
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/notika-custom-icon.css">
   <link rel="shortcut icon" type="resources/image/x-icon" href="img/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

    <script src="${ pageContext.request.contextPath }/resources/template/js/vendor/modernizr-2.8.3.min.js"></script>

<head>
    <meta charset="utf-8">
<!--     <meta http-equiv="x-ua-compatible" content="ie=edge"> -->
    <title>Modals | Notika - Notika Admin Template</title>
<!--     <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">


</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- Start Header Top Area -->

    <!-- End Header Top Area -->
    <!-- Mobile Menu start -->
  
	<!-- Breadcomb area End-->
    <!-- Form Element area Start-->
    <div class="form-element-area">
        <div class="container">
           
                   
        
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Bootstrap Seelct - Custom Select</h2>
                            <p>Bootstrap-select is a jQuery plugin that utilizes Bootstrap's dropdown.js to style and bring additional functionality to standard select elements.</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn">
                                    <h2>Basic Example</h2>
                                </div>
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select class="selectpicker">
											<option>Drama</option>
											<option>Cariska</option>
											<option>Cheriska</option>
											<option>Malias</option>
											<option>Kamines</option>
											<option>Austranas</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Serach Option</h2>
                                </div>
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select class="selectpicker" data-live-search="true">
											<option>Drama</option>
											<option>Cariska</option>
											<option>Cheriska</option>
											<option>Malias</option>
											<option>Kamines</option>
											<option>Austranas</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Option Groups</h2>
                                </div>
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select class="selectpicker">
											<optgroup label="Picnic">
												<option>Drama</option>
												<option>Cariska</option>
												<option>Cheriska</option>
											</optgroup>
											<optgroup label="Camping">
												<option>Malias</option>
												<option>Kamines</option>
												<option>Austranas</option>
											</optgroup>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Disabled Options</h2>
                                </div>
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select class="selectpicker">
											<option disabled="disabled">Drama</option>
											<option>Cariska</option>
											<option>Kamines</option>
											<option disabled="disabled">Malias</option>
											<option>Cheriska</option>
										</select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn mg-t-30">
                                    <h2>Multi Select</h2>
                                </div>
                                <div class="bootstrap-select">
                                    <select class="selectpicker" multiple>
											<option>Drama</option>
											<option>Cariska</option>
											<option>Cheriska</option>
											<option>Malias</option>
											<option>Kamines</option>
											<option>Austranas</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn mg-t-30">
                                    <h2>Limit Selection - Set to 2</h2>
                                </div>
                                <div class="bootstrap-select">
                                    <select class="selectpicker" multiple data-max-options="2" title='Choose some of...'>
											<option>Drama</option>
											<option>Cariska</option>
											<option>Cheriska</option>
											<option>Malias</option>
											<option>Kamines</option>
											<option>Austranas</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn mg-t-30">
                                    <h2>Display Count</h2>
                                </div>
                                <div class="bootstrap-select">
                                    <select class="selectpicker" multiple data-selected-text-format="count">
											<option>Drama</option>
											<option>Cariska</option>
											<option>Cheriska</option>
											<option>Malias</option>
											<option>Kamines</option>
											<option>Austranas</option>
										</select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Chosen</h2>
                            <p>Make long, unwieldy select boxes more user friendly.</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn">
                                    <h2>Basic Example</h2>
                                </div>
                                <div class="chosen-select-act fm-cmp-mg">
                                    <select class="chosen" data-placeholder="Choose a Country...">
											<option value="United States">United States</option>
											<option value="United Kingdom">United Kingdom</option>
											<option value="Afghanistan">Afghanistan</option>
											<option value="Aland Islands">Aland Islands</option>
											<option value="Albania">Albania</option>
											<option value="Algeria">Algeria</option>
											<option value="American Samoa">American Samoa</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Disabled Items</h2>
                                </div>
                                <div class="chosen-select-act fm-cmp-mg">
                                    <select class="chosen" data-placeholder="Choose a Country...">
											<option value="United States">United States</option>
											<option value="United Kingdom">United Kingdom</option>
											<option disabled value="Afghanistan">Afghanistan</option>
											<option disabled value="Aland Islands">Aland Islands</option>
											<option value="Albania">Albania</option>
											<option disabled value="Algeria">Algeria</option>
											<option value="American Samoa">American Samoa</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Multiple Example</h2>
                                </div>
                                <div class="chosen-select-act fm-cmp-mg">
                                    <select class="chosen" multiple data-placeholder="Choose a Country...">
											<option value="United States">United States</option>
											<option value="United Kingdom">United Kingdom</option>
											<option value="Afghanistan">Afghanistan</option>
											<option value="Aland Islands">Aland Islands</option>
											<option value="Albania">Albania</option>
											<option value="Algeria">Algeria</option>
											<option value="American Samoa">American Samoa</option>
										</select>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                    <h2>Option Group</h2>
                                </div>
                                <div class="chosen-select-act">
                                    <select class="chosen" data-placeholder="Your Favorite Football Team">
											<optgroup label="NFC EAST">
												<option>Dallas Cowboys</option>
												<option>New York Giants</option>
												<option>Philadelphia Eagles</option>
												<option>Washington Redskins</option>
											</optgroup>
											<optgroup label="NFC NORTH">
												<option>Chicago Bears</option>
												<option>Detroit Lions</option>
												<option>Green Bay Packers</option>
												<option>Minnesota Vikings</option>
											</optgroup>
										</select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
					
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="themesaller-forms">
									<div id="eq2" class="slider-group purple-slider">
										<div class="sliderv-wrapper"><span>77</span>
										</div>
										<div class="sliderv-wrapper"><span>55</span>
										</div>
										<div class="sliderv-wrapper"><span>40</span>
										</div>
										<div class="sliderv-wrapper"><span>55</span>
										</div>
										<div class="sliderv-wrapper"><span>77</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
    <!-- Form Element area End-->
    <!-- Datepicker area Start-->
    <div class="datepicker-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="datepicker-int mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Date Picker</h2>
                            <p>Date picker widget based on twitter bootstrap</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group nk-datapk-ctm form-elet-mg" id="data_1">
                                    <label>Simple data input format</label>
                                    <div class="input-group date nk-int-st">
                                        <span class="input-group-addon"></span>
                                        <input type="text" class="form-control" value="03/19/2018">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group nk-datapk-ctm form-elet-mg" id="data_2">
                                    <label>One Year view</label>
                                    <div class="input-group date nk-int-st">
                                        <span class="input-group-addon"></span>
                                        <input type="text" class="form-control" value="03/19/2018">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group nk-datapk-ctm form-elet-mg" id="data_3">
                                    <label>Decade view</label>
                                    <div class="input-group date nk-int-st">
                                        <span class="input-group-addon"></span>
                                        <input type="text" class="form-control" value="03/19/2018">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Datepicker area End-->
    <!-- Color Picker area Start-->
    <div class="colorpicker-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="colorpicker-int mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Color Picker</h2>
                            <p>Simplt HEX and HSL color picker with customizable options</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="nk-container fm-cmp-mg">
                                    <div class="input-group form-group form-elet-mg">
                                        <span class="input-group-addon"><i class="notika-icon notika-success"></i></span>
                                        <div class="nk-line dropdown nk-int-st">
                                            <input type="text" class="form-control nk-value" value="#00c292" data-toggle="dropdown">
                                            <div class="dropdown-menu">
                                                <div class="color-picker" data-cp-default="#00c292"></div>
                                            </div>
                                            <i class="nk-value"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="nk-container fm-cmp-mg">
                                    <div class="input-group form-group form-elet-mg">
                                        <span class="input-group-addon"><i class="notika-icon notika-success"></i></span>
                                        <div class="nk-line dropdown nk-int-st">
                                            <input type="text" class="form-control nk-value" value="#8BC34A" data-toggle="dropdown">
                                            <div class="dropdown-menu">
                                                <div class="color-picker" data-cp-default="#8BC34A"></div>
                                            </div>
                                            <i class="nk-value"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="nk-container">
                                    <div class="input-group form-group form-elet-mg">
                                        <span class="input-group-addon"><i class="notika-icon notika-success"></i></span>
                                        <div class="nk-line dropdown nk-int-st">
                                            <input type="text" class="form-control nk-value" value="#F44336" data-toggle="dropdown">
                                            <div class="dropdown-menu">
                                                <div class="color-picker" data-cp-default="#F44336"></div>
                                            </div>
                                            <i class="nk-value"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Color Picker area End-->
    <!-- Summernote area Start-->
    <div class="summernote-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="summernote-wrap mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>HTML Editor</h2>
                            <p>Super Simple WYSIWYG Editor on Bootstrap</p>
                        </div>
                        <div class="cmp-tb-hd bsc-smp-sm">
                            <label>Basic Example</label>
                        </div>
                        <div class="html-editor"></div>
                        <div class="cmp-tb-hd mg-t-20">
                            <h2>Click to edit</h2>
                            <p>You can edit content on the fly</p>
                        </div>
                        <div class="summernote-clickable">
                            <button class="btn btn-primary btn-sm hec-button">Click here to edit the content
                                </button>
                            <button class="btn btn-success btn-sm hec-save" style="display:none;">Save</button>
                        </div>
                        <div class="html-editor-click">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vehicula erat sit amet aliquam vehicula. Aliquam aliquet et risus et consequat. Quisque ultrices nulla eu magna vulputate, quis varius massa tempor. Suspendisse
                                sed condimentum purus, eget consequat dolor. Fusce aliquet ultricies porta. Nunc semper commodo leo at maximus. Duis maximus maximus leo, id lobortis nisi aliquam sit amet. Nullam vel ex id augue scelerisque congue sit
                                amet eget urna.</p>
                        </div>
                        <div class="cmp-tb-hd mg-t-20 air-mode-ctn">
                            <h2>Air-mode</h2>
                            <p>Air-mode gives clearer interface with hiddened toolbar. To reveal toolbar, select a text below where you want to shape up. </p>
                        </div>
                        <div class="html-editor-airmod" contenteditable="true">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce euismod quam vel lacinia facilisis. Sed condimentum nisi vel ante maximus, sit amet vestibulum leo euismod. Curabitur viverra faucibus nisi eu molestie. Donec convallis
                                finibus felis porttitor tristique. Nulla pretium est et ante dignissim.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Summernote area End-->
    <!-- Dropzone area Start-->
    <div class="dropzone-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="dropdone-nk mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Drag and Drop File Uploader</h2>
                            <p>DropzoneJS is an open source library that provides Drag and Drop file uploads with image previews. It’s lightweight, doesn't depend on any other library (like jQuery) and is highly customizable.</p>
                        </div>
                        <div id="dropzone1" class="multi-uploader-cs">
                            <form action="/upload" class="dropzone dropzone-nk needsclick" id="demo1-upload">
                                <div class="dz-message needsclick download-custom">
                                    <i class="notika-icon notika-cloud"></i>
                                    <h2>Drop files here or click to upload.</h2>
                                    <p><span class="note needsclick">(This is just a demo dropzone. Selected files are <strong>not</strong> actually uploaded.)</span>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Dropzone area End-->
    <!-- Start Footer area-->
    <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2018 
. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>
 
    
  <!--       wow JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/wow.min.js"></script>
    price-slider JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/jquery-price-slider.js"></script>
    owl.carousel JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/owl.carousel.min.js"></script>
    scrollUp JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/jquery.scrollUp.min.js"></script>
    meanmenu JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/meanmenu/jquery.meanmenu.js"></script>
    counterup JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/counterup/jquery.counterup.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/counterup/waypoints.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/counterup/counterup-active.js"></script>
    mCustomScrollbar JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    sparkline JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/sparkline/sparkline-active.js"></script>
    flot JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/flot/jquery.flot.resize.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/flot/flot-active.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/flot/jquery.flot.js"></script>
    knob JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/knob/jquery.knob.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/knob/jquery.appear.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/knob/knob-active.js"></script>
     wave JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/wave/waves.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/template/js/wave/wave-active.js"></script>
     Chat JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/chat/jquery.chat.js"></script>
     todo JS
		============================================
    <script src="${ pageContext.request.contextPath }/resources/template/js/todo/jquery.todo.js"></script> -->
    	<!-- tawk chat JS
    	 <script src="${ pageContext.request.contextPath }/resources/template/js/tawk-chat.js"></script>
    	   <!-- plugins JS
		============================================ 
    <script src="${ pageContext.request.contextPath }/resources/template/js/plugins.js"></script>
    <!-- main JS
		============================================ 
    <script src="${ pageContext.request.contextPath }/resources/template/js/main.js"></script>
    
		============================================ 
   
    
    <!-- End Footer area-->
    <!-- jquery
		============================================  -->
	

</body>

</html>