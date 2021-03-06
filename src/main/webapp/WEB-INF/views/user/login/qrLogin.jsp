<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>doIT - Login Cover Page</title>
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
    <link href="/resources/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="/resources/assets/js/loader.js"></script>
    <script src="/resources/assets/js/jquery-3.6.0.js"></script>
    <script src="/resources/assets/js/components/session-timeout/bootstrap-session-timeout.js"></script>
    <link href="/resources/assets/css/users/user-profile.css" rel="stylesheet" type="text/css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&amp;display=swap" rel="stylesheet">
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
    <link href="/resources/assets/css/authentication/form-1.css" rel="stylesheet" type="text/css">
    <!-- END GLOBAL MANDATORY STYLES -->
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/switches.css">
<style type="text/css">
/* *{
	border: 1px solid pink;
} */
/*sweet alert*/
.swal-text{
    font-weight: 700;
    font-size: 18px;
    color: #3b3f5c;
}
.swal-button{
	background-color: #1b55e2;
	color: #fff;
    font-weight: 600;
}
/* ?????? ?????? */
#pwP, #svP{
	font-weight: 600;
    color: #3b3f5c;
    margin-bottom: 0;
}
/*?????? ??????
#myModal1 *{
	border: 1px solid pink;
}
*/
.modal-title{
	margin: 28px 0px 0px 8px;
}
.modalA{
	margin-left: 10%;
}
#joinModal{
	max-width:1000px; 
}
.test1{
	margin: 0px;
	padding: 0px!important;
}
.test1 span{
	width: auto;
	max-width: 80%;
	height: 20px;
	color: red;
}
.test2{
	padding: 8px 0px 0px 35px!important;
}
.test3{
	font-size: 1.2em;
	color: #3b3f5c;
	font-family: 'Quicksand', sans-serif;
	padding: 16px 0px 0px 35px;
}
#profile{
	width: auto;
	min-width: 110px;
}
/*????????? ??????*/
.button1{
	margin-left: 20%;
}
.spanA{
	font-size: 1.2em;
	color: #1b55e2;
	font-family: 'Quicksand', sans-serif;
}
#division{
	margin-left: 47%;
	margin-top: 20px;
	margin-bottom: 3%;
}
#git{
	color: #e7515a;
	background: white;
	border-color: #e7515a;
}
#fb{
	margin-left: 18%;
	color: #1b55e2;
	background: white;
	border-color: #1b55e2;
}
</style>  
</head>
<body class="form">

    <div class="form-container">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

						<img src="/resources/assets/img/logo.png" style="width: 410px" height="200px">
                        <form:form class="text-left" modelAttribute="memberVO" method="post" action="/loginPost.do" id="idLogin">
                        <br><br>&nbsp;
                             <div class="form">

                                <div id="userId-field" class="field-wrapper input">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
		                     		<form:input path="mbrId" class="form-control" placeholder="userId *" />
                                </div>

                                <div id="password-field" class="field-wrapper input mb-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
		                     		<form:input class="form-control" path="mbrPw" placeholder="Password *" type="passWord"/>
                                </div>
                             </div>
                        </form:form>                        
                                <div class="d-sm-flex justify-content-between">
                                        <p class="d-inline-block" id="pwP">Show Password</p>
                                        <label class="switch s-primary">
                                            <input type="checkbox" id="toggle-password" class="d-none" onclick="toggle(this)">
                                            <span class="slider round" id="pwSlider"></span>
                                        </label>
                                        <div Style="width:50px;"></div>
                                        <p class="d-inline-block" id="svP">Keep me logged in</p>
                                        <label class="switch s-primary">
                                            <input type="checkbox" id="toggle-loggedin" class="d-none">
                                            <span class="slider round"></span>
                                        </label>
                                </div>
                                <br>
                                <div class="field-wrapper button1">
                                    <button class="btn btn-primary" id="loginBtn" type="button">ID?????????</button>
                                    <button class="btn btn-secondary" id="QRBtn" type="button">QR?????????</button>
                                </div>
                                <br>

                                <!-- <div class="field-wrapper text-center keep-logged-in">
                                    <div class="n-chk new-checkbox checkbox-outline-primary">
                                        <label class="new-control new-checkbox checkbox-outline-primary">
                                          <input type="checkbox" class="new-control-input">
                                          <span class="new-control-indicator"></span>Keep me logged in
                                        </label>
                                    </div>
                                </div> -->

                                <div class="modalA">
                                	<span><a href="#" data-toggle="modal" data-target="#myModal1" class="forgot-pass-link spanA">????????????</a>&nbsp;/</span>
                                	<span><a href="#" data-toggle="modal" data-target="#myModal2" class="forgot-pass-link spanA">???????????????</a>&nbsp;/</span>
                                	<span><a href="#" data-toggle="modal" data-target="#myModal3" class="forgot-pass-link spanA">??????????????????</a></span>
                                </div>

                        <p class="terms-conditions">?? 2021 All Rights Reserved. <a href="index.html">doIT</a> is a product of Designreset. <a href="javascript:void(0);">Cookie Preferences</a>, <a href="javascript:void(0);">Privacy</a>, and <a href="javascript:void(0);">Terms</a>.</p>
                            </div>

    <!-- ?????? ?????? ?????? -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<img src="/resources/assets/img/logo.png" style="width: 100px; height:60px;">
					<h3 class="modal-title">Member Join</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">??</span></button>
				</div>
				<div class="modal-body">
                   <form class="mt-0" id="insertForm" name="insertForm" action="/mbrinsert.do" method="post">
                   		<div class="form-group field-wrapper input test1" id="userImg">
	                      <div class="form-group field-wrapper input test1">
					        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-camera"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
					        <strong class="text-muted d-block mb-2 test3">UserProfile</strong>
					      </div>
							<div class="form-group">
								<div class="imgs_wrap" id="profile"></div>
						    </div>
							<div class="form-group">
								<input type="file" accept="image/*" id="input_imgs" name="mbrProfile">
							</div>
					     </div>
	                      <div class="form-group field-wrapper input test1">
	                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
	                      	<input type="text" class="form-control mb-2 test2" id="mbrId1" name="mbrId" placeholder="UserId">
	                      	<button class="btn btn-info mb-2" id="idBtn" type="button">ID????????????</button>
	                      	<span id="idSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
	                       	<input type="password" class="form-control mb-2 test2" id="mbrPw1" name="mbrPw" placeholder="Password"><br/>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
	                       	<input type="password" class="form-control mb-2 test2" name="mbrPw1_2" placeholder="Password check"><br/>
	                       	<span id="pwSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
	                      	<input type="text" class="form-control mb-2 test2" name="mbrNm" placeholder="Username"><br/>
	                       	<span id="nmSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
	                       	<input type="text" class="form-control mb-2 test2" name="mbrEml" placeholder="Email"><br/>
	                       	<span id="miSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
	                       	<input type="text" class="form-control mb-2 test2" name="mbrTelno" placeholder="Telephone number"><br/>
	                       	<span id="tlSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
		                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
	                       	  <input type="text" class="form-control mb-2 test2" name="mbrDept" placeholder="Department"><br/>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
                      	  	  <div class="form-group field-wrapper input test1">
                               	  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                               	  <strong class="text-muted d-block mb-2 test3">Gender</strong>
                              </div>	
	                          <div class="custom-control custom-radio custom-control-inline">
							        <input type="radio" id="customRadioInline1" name="mbrGender" class="custom-control-input" value="M">
							        <label class="custom-control-label" for="customRadioInline1">??????</label>
							        </div>
							  <div class="custom-control custom-radio custom-control-inline">
							        <input type="radio" id="customRadioInline2" name="mbrGender" class="custom-control-input" value="F">
							        <label class="custom-control-label" for="customRadioInline2">??????</label>
							  </div>
	                          
						  </div>
	                      <div class="col-md-11 mx-auto">
                              <div class="form-group">
	                      	  	  <div class="form-group field-wrapper input test1">
				                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pen-tool"><path d="M12 19l7-7 3 3-7 7-3-3z"></path><path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path><path d="M2 2l7.586 7.586"></path><circle cx="11" cy="11" r="2"></circle></svg>
                                  	  <strong class="text-muted d-block mb-2 test3">Introduce</strong>
                                  </div>	
                                  	<textarea class="form-control" id="aboutBio" name="mbrIntro" rows="10"></textarea>
                              </div>
                          </div>
                   </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="joinSubmit">????????????</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
			</div>
	     </div>
	   </div>
	</div>
	
	<!-- ID?????? ??????  -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<img src="/resources/assets/img/logo.png" style="width: 100px" height="60px">
					<h3 class="modal-title">find ID</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">??</span></button>
				</div>
			<div class="modal-body">
				<div class="modal-body">
                   <form class="mt-0">
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2" id="Username1" placeholder="Username"><br />
                       	<span id="nmSpan2"></span>
                      	
                      </div>
                      <div class="form-group field-wrapper input test1">
                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                       	<input type="email" class="form-control mb-2" id="Email2" placeholder="Email"><br />
                       	<span id="miSpan2"></span><br />
                       	<span id="findIdSpan"></span>
                      </div>
                      
                   </form>
                 </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="findIdBtn">??????</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
			</div>
	     </div>
	   </div>
	</div>
	
	
	<!-- PW?????? ??????  -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<img src="/resources/assets/img/logo.png" style="width: 100px" height="60px">
					<h3 class="modal-title">find Password</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">??</span></button>
				</div>
			<div class="modal-body">
				<div class="modal-body">
                   <form class="mt-0">
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2" id="UserID3" placeholder="UserID"><br />
                       	<span id="idSpan3"></span>
                      </div>
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2" id="Username3" placeholder="Username"><br />
                       	<span id="nmSpan3"></span>
                      </div>
                      <div class="form-group field-wrapper input test1">
                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                       	<input type="email" class="form-control mb-2" id="Email3" placeholder="Email"><br />
                       	<span id="miSpan3"></span><br />
                       	<span id="findPwSpan"></span>
                      </div>
                      
                   </form>
                   <!-- <div id="division" class="division">
                         <span>OR</span>
                   </div>
                   <div class="social">
                       <a href="javascript:void(0);" class="btn social-fb" id="fb"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg> <span class="brand-name">Facebook</span></a>
                       <a href="javascript:void(0);" class="btn social-github" id="git"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg> <span class="brand-name">Github</span></a>
                   </div> -->
                 </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="findPwBtn">??????</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
			</div>
	     </div>
	   </div>
	</div>


                    </div>                    
                </div>
            </div>
        <div class="form-image" style="background-color: lightblue; border-radius: 45% 0% 0% 45%;">
        	<!-- ??????????????? png??? 720*720 -->
        	<div class="login-image">
        		<img alt="" src="/resources/assets/img/illustration.bbfd1da0.png" style="margin-top:40%; margin-left:30%">
        	</div>
        </div>

</div>

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="/resources/bootstrap/js/popper.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="/resources/assets/js/authentication/form-1.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>

<script type="text/javascript">

$(function(){
	//?????????(??????)
	$("#loginBtn").on("click", function(){
		$("#idLogin").submit();
	});
	
	//?????????(Enter)
	$(".input").on("keyup",function(key){
	    if(key.keyCode==13) {
	    	$("#idLogin").submit();
	    }
	});
	
	//????????????
	//id?????? ??? ???????????????
	  $('#mbrId1').on('keyup', function(){
	  	//$('#idSpan').html(' ');
	  	$('#idSpan').empty();
	  	idval = $('#mbrId1').val().trim();
	  	
	  	idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/
	  	
	  	if(!(idreg.test(idval))){
	  		$(this).css('border', '1px solid red');
	  		//?????????????????? ?????????
	  		$('#idBtn').prop('disabled', true);
	  		//????????? ??????
	  		$('#idSpan').html('ID??? ??????+?????? 4~12??? ????????? ??????????????????.')
	  	}else{
	  		$(this).css('border', '1px solid blue');
	  		//?????????????????? ??????
	  		$('#idBtn').prop('disabled', false);
	  	}
	});
	
	  //????????? ????????????
	  	$('#idBtn').on('click',function(){
	  		idval = $('#mbrId1').val().trim();
	  		//alert(idval);
	  		if(idval.length < 1){
	  			//alert("ID??? ???????????????");
	  			swal("","ID??? ???????????????");
	  			return false;
	  		}
	  		 		
	  		//????????? ????????????
	  		$.ajax({
	  			type : 'post',
	  			dataType : "json",
	  			data : {"mbrId" : idval,"mbrId2" : idval, "mbrId3" : [{"test":idval}]},
	  			url : '/checkId.do',
	  			success : function(res){
	  				console.log("checkId.do : ", JSON.parse(res));
	  				if(res==0){
		  				//$('#spanid').html(res.sw).css('color','green');
		  				$('#idSpan').html('?????? ????????? ID?????????.')
	  				}else{
	  					//???????????? ?????????
						$('#joinSubmit').prop('disabled', true);
	  					$('#idSpan').html('?????? ???????????? ID?????????.')
	  				}
	  			},
	  			error : function(xhr){
	  				swal("","?????? ?????? ??????");
	  				console.log(xhr.status);
	  				//alert("??????:"+xhr.status);//404,500,200
	  			},
	  			dataType : 'json'
	  		})
	  	})
		  
		//?????? ?????? ??? ???????????????
		$('input[name="mbrNm"]').on('keyup', function(){
			$('#nmSpan').empty();
			nameval = $('input[name="mbrNm"]').val().trim();
			namereg = /^[???-???]{2,5}$/
			
				if(!(namereg.test(nameval))){
					$(this).css('border', '1px solid red');
					//???????????? ?????????
					$('#joinSubmit').prop('disabled', true);
					//????????? ??????
			  		$('#nmSpan').html('????????? ??????3~6??? ????????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					//???????????? ??????
					$('#joinSubmit').prop('disabled', false);
				}
		});
	  
	  //????????? ?????? ??? ???????????????
		  $('input[name="mbrEml"]').on('keyup', function(){
			  $('#miSpan').empty();
			  mailval = $('input[name="mbrEml"]').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval))){
					$(this).css('border', '1px solid red');
					$('#joinSubmit').prop('disabled', true);
					//????????? ??????
			  		$('#miSpan').html('????????? ?????? ????????? ?????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#joinSubmit').prop('disabled', false);
				}
		  });
		  
		  //???????????? ??????
		   $('#mbrPw1').on('keyup', function(){
			  $('#pwSpan').empty();
			  passval = $('#mbrPw1').val().trim();
			  passreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			  
			  if(!(passreg.test(passval))){
					$(this).css('border', '1px solid red');
					$('#joinSubmit').prop('disabled', true);
					//????????? ??????
			  		$('#pwSpan').html('????????????,??????,????????? ???????????? 8??? ?????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#joinSubmit').prop('disabled', false);
				}
		  }); 
		 //???????????? ?????? ??????
		  $('input[name="mbrPw1_2"]').on('keyup', function(){
			  $('#pwSpan').empty();
			  passval2 = $('input[name="mbrPw1_2"]').val().trim();
			  if(passval != passval2){
					//???????????? ?????????
					$('#joinSubmit').prop('disabled', true);
					//????????? ??????
			  		$('#pwSpan').html('??????????????? ???????????? ????????????.')
				}else{
					$('#joinSubmit').prop('disabled', false);
					//$('input[name="mbrPw1_2"]').empty();
				}
			 
		  });
		
		  
	  //???????????? ?????? ??? ???????????????
		 $('input[name="mbrTelno"]').on('keyup', function(){
			 $('#tlSpan').empty();
			 nameval = $('input[name="mbrTelno"]').val().trim();
			 namereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; 
			
				if(!(namereg.test(nameval))){
					$(this).css('border', '1px solid red');
					//???????????? ?????????
					$('#joinSubmit').prop('disabled', true);
					//????????? ??????
			  		$('#tlSpan').html('????????? ????????? ?????? ??????????????????.(-??????)')
				}else{
					$(this).css('border', '1px solid blue');
					//???????????? ??????
					$('#joinSubmit').prop('disabled', false);
				}
		}); 
	
	
});
function toggle(element){ //???????????? ?????????/?????????
	//console.log(element.checked);
	 if (element.checked) {        
		 mbrPw.type = 'text';      
     } else {                    
    	 mbrPw.type = 'password';   
     }
	
}
$(function(){ //?????????????????? ????????????
	$("#input_imgs").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e){
	//???????????? ????????? ??????????????? ????????? ???????????? ?????????
	var files = e.target.files;
	//???????????? ????????? ????????? ??????
	var filesArr = Array.prototype.slice.call(files);
	//f : ????????? ?????? ??????
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			//alert("????????? ????????? ???????????????");
			swal("","????????? ????????? ???????????????");
			//????????? ??????(??????)
			return;
		}
		//??? ???????????? reader??? ????????????
		var reader = new FileReader();
		reader.onload = function(e){
			//$("#img").attr("src",e.target.result);
			var img_html = "<img src=\""+e.target.result+"\" style='width:100px;' />";
			$(".imgs_wrap").html(img_html);
		}
		reader.readAsDataURL(f);
	});//end for each
}
$(function(){
	$("#joinSubmit").on("click", memberJoin);
	
// 	$(document).on("click", "#joinSubmit", function(){	
// 		$("#insertForm").find("input").val("");
// 	});
	
});
function memberJoin(){
	    
    var formData = new FormData(document.getElementById("insertForm"));
	
	 $.ajax({
		type:'POST',
		data : formData,
		url:"/mbrinsert.do",
		processData: false,
	    contentType: false,
	    dataType:'json',
		success : function(data) {
			/* alert("????????? ????????? ?????????????????????.");
			console.log(data);
			console.log(data.sta);
			console.log(data.msg); */
			
			if(data.sta=="success"){
				//alert("?????? ????????? ?????????????????????.\n?????? ?????? ??? ???????????? ?????????.");
				swal({
				  title: "",
				  html: "?????? ????????? ?????????????????????.<br>?????? ?????? ??? ?????????????????????.",
				  //icon: '${type}',
				  button: '${button}'
			})
			}else{
				//alert("?????? ????????? ??????????????????.\n?????? ????????? ?????????.");
				swal({
				  title: "",
				  html: "?????? ????????? ??????????????????.<br>?????? ??????????????????.",
				  //icon: '${type}',
				  button: '${button}'
			})
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			swal("","?????? ????????? ??????????????????.");
			console.log(textStatus);
			console.log(errorThrown);
			//alert("ERROR : " + textStatus + " : " + errorThrown);
		}
	}); 
	$('#myModal1').modal('hide');
};

$(function(){
	$('.modal').on('hidden.bs.modal', function (e) {
		//alert("modal close");
		$(this).find('form')[0].reset();
		//$(this).find('form')[0].css({"border-bottom": "1px solid #e0e6ed;"});
		$(this).find(".test1 input").css({"border-left": "0", "border-right": "0", "border-top": "0"});
		$(this).find(".test1 input").css({"border-bottom": "1px solid #e0e6ed"});
		$(this).find("#profile").empty();
		$(this).find(".input span").empty();
	});
	
});

$(function(){
	//????????? ??????
  	//?????? ?????? ??? ???????????????
		$('#Username1').on('keyup', function(){
			$('#nmSpan2').empty();
			nameval2 = $('#Username1').val().trim();
			namereg = /^[???-???]{2,5}$/
			
				if(!(namereg.test(nameval2))){
					$(this).css('border', '1px solid red');
					//???????????? ?????????
					$('#findIdBtn').prop('disabled', true);
					//????????? ??????
			  		$('#nmSpan2').html('????????? ??????3~6??? ????????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					//???????????? ??????
					$('#findIdBtn').prop('disabled', false);
				}
		});
	  
	  //????????? ?????? ??? ???????????????
		  $('#Email2').on('keyup', function(){
			  $('#miSpan').empty();
			  mailval2 = $('#Email2').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval2))){
					$(this).css('border', '1px solid red');
					$('#findIdBtn').prop('disabled', true);
					//????????? ??????
			  		$('#miSpan2').html('????????? ?????? ????????? ?????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#findIdBtn').prop('disabled', false);
				}
		  });
  	$('#findIdBtn').on('click',function(){
  			nameval2 = $('#Username1').val().trim();
  			mailval2 = $('#Email2').val().trim(); 
  		if(nameval2.length < 1){
  			//alert("????????? ???????????????");
  			swal("","????????? ???????????????.");
  			return false;
  		}
  		if(mailval2.length < 1){
  			swal("","?????????????????? ???????????????");
  			return false;
  		}
  		 		
  		//????????? ????????????
  		$.ajax({
  			type : 'post',
  			dataType : "json",
  			data : {"mbrNm" : nameval2, "mbrEml" : mailval2},
  			url : '/findId.do',
  			success : function(res){
  				console.log(res);
  				if(res.sta=="fail"){
	  				console.log("111")
  					//$('#spanid').html(res.sw).css('color','green');
	  				$('#findIdSpan').html('???????????? ?????? ?????????????????????.')
  				}else{
	  				console.log("222")
  					var findMbrId = res.mbrId;
  					$('#findIdSpan').html(' ???????????? ID??? '+ findMbrId +' ?????????.')
  				}
  			},
  			error : function(xhr){
  				//alert("??????:"+xhr.status);//404,500,200
  				swal("","?????? ????????? ??????????????????.");
	  			console.log(xhr.status);
  			},
  			dataType : 'json'
  		})
  	})
});

$(function(){
	//???????????? ??????
  	//id?????? ??? ???????????????
	  $('#UserID3').on('keyup', function(){
	  	//$('#idSpan').html(' ');
	  	$('#idSpan3').empty();
	  	idval3 = $('#UserID3').val().trim();
	  	
	  	idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/
	  	
	  	if(!(idreg.test(idval3))){
	  		$(this).css('border', '1px solid red');
	  		//???????????? ?????????
	  		$('#findPwBtn').prop('disabled', true);
	  		//????????? ??????
	  		$('#idSpan3').html('ID??? ??????+?????? 4~12??? ????????? ??????????????????.')
	  	}else{
	  		$(this).css('border', '1px solid blue');
	  		//???????????? ??????
	  		$('#findPwBtn').prop('disabled', false);
	  	}
	});
	//?????? ?????? ??? ???????????????
		$('#Username3').on('keyup', function(){
			$('#nmSpan3').empty();
			nameval3 = $('#Username3').val().trim();
			namereg = /^[???-???]{2,5}$/
			
				if(!(namereg.test(nameval3))){
					$(this).css('border', '1px solid red');
					//???????????? ?????????
					$('#findPwBtn').prop('disabled', true);
					//????????? ??????
			  		$('#nmSpan3').html('????????? ??????3~6??? ????????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					//???????????? ??????
					$('#findPwBtn').prop('disabled', false);
				}
		});
	  
	  //????????? ?????? ??? ???????????????
		  $('#Email3').on('keyup', function(){
			  $('#miSpan3').empty();
			  mailval3 = $('#Email3').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval3))){
					$(this).css('border', '1px solid red');
					$('#findPwBtn').prop('disabled', true);
					//????????? ??????
			  		$('#miSpan3').html('????????? ?????? ????????? ?????? ??????????????????.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#findPwBtn').prop('disabled', false);
				}
		  });
  	$('#findPwBtn').on('click',function(){
  		if(idval3.length < 1){
  			//alert("???????????? ???????????????");
  			swal("","???????????? ???????????????");
  			return false;
  		}
  		if(nameval3.length < 1){
  			//alert("????????? ???????????????");
  			swal("","????????? ???????????????.");
  			return false;
  		}
  		if(mailval3.length < 1){
  			//alert("???????????? ???????????????");
  			swal("","????????? ????????? ???????????????.");
  			return false;
  		}
  		 		
  		//???????????? ?????? ????????????
  		$.ajax({
  			type : 'post',
  			dataType : "json",
  			data : {"mbrId" : idval3, "mbrNm" : nameval3, "mbrEml" : mailval3},
  			url : '/findPw.do',
  			success : function(res){
  				console.log(res);
  				if(res.sta=="fail"){
	  				console.log("111")
  					//$('#spanid').html(res.sw).css('color','green');
	  				$('#findPwSpan').html('???????????? ?????? ?????????????????????.')
  				}else{
	  				console.log("222")
	  				var findMbrEml = res.mbrEml;
	  				var findMbrId = res.mbrId;
	  				$.ajax({
	  					type : 'post',
	  					dataType : 'text',
	  					data : {"mbrEml" : findMbrEml, "mbrId" : findMbrId},
	  					url : '/mailSend.do',
	  					success : function(res2){
	  						console.log("res2");
	  						console.log(res2);
		  					var toAddress = res2;
	  						$('#findPwSpan').html(toAddress+'??? ?????? ??????????????? ??????????????????.\n ?????? ?????? ??? ??????????????? ?????? ?????????????????????.')
	  					},error : function(xhr2){
	  						swal("","?????? ????????? ??????????????????.");
	  		  				console.log(xhr.status);
	  		  				//alert("??????:"+xhr.status);//404,500,200
	  		  			}
	  				});
  				}
  			},
  			error : function(xhr){
  				swal("","?????? ????????? ??????????????????.");
  				console.log(xhr.status);
  				//alert("??????:"+xhr.status);//404,500,200
  			},
  			dataType : 'json'
  		}); //ajax
  		
  	})
});
</script>
</body>
</html>