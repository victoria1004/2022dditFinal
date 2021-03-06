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
    <title>doIT - 로그인 페이지</title>
    <link href="/resources/assets/css/users/user-profile.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&amp;display=swap" rel="stylesheet">
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
    <link href="/resources/assets/css/authentication/form-1.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/switches.css">
    <link href="/resources/plugins/loaders/custom-loader.css" rel="stylesheet" type="text/css" />

    <script src="/resources/assets/js/jquery-3.6.0.js"></script>
    <script src="/resources/bootstrap/js/popper.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/components/session-timeout/bootstrap-session-timeout.js"></script>
    <script src="/resources/assets/js/authentication/form-1.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <script src="/resources/assets/js/loader.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
<style type="text/css">
/* 
*{
	border: 1px solid pink;
}
 */
/*sweet alert*/
#hiddenP { display:none;}
#aboutBio {	margin-left: 25px;}
#idDiv{	display: inline-block; width: 288px; margin-right: 5px;}
#genderlab{	display : inline-block; margin-right: 10px; }
#insertForm, #findIdForm, #findPwForm{ width: 88%; max-height: 500px; overflow: auto; margin-left: 6%; }
#insertForm::-webkit-scrollbar { display: none; }
.swal-text{ font-weight: 700; font-size: 18px; color: #3b3f5c;}
.swal-button{ background-color: #1b55e2; color: #fff; font-weight: 600;}
/*모달 영역*/
.modal-title{ margin: 13px 0px 0px 8px;}
.modalA{ margin-left: 53px; margin-top: 30px; color: #515365; font-weight: bold; font-size: 14px;}
#joinModal{	max-width:1000px;}
.test1{	margin: 0px; padding: 0px!important; }
.test1 svg{ margin: 0px 13px -53px 6px;}
.test1 span{ width: auto; max-width: 80%; height: 20px;}
.test2{ padding-left: 35px;}
.test2::placeholder{ color: #515365;}
.test3{ font-size: 1.2em; color: #515365; font-family: 'Quicksand', sans-serif; padding: 8px 0px 0 38px;}
#profile{ width: auto; min-width: 110px;}
#mbrId1{ width: 415px;}
/*로그인 관련*/
.test4{	background-color: transparent;	border-width:0;	border-bottom: 2px solid #fdfdfd; color: #fdfdfd; 
		font-size:18px; margin-top: 20px; margin-right: 10px; width: 200px;}
.test4::placeholder{ color: #fdfdfd; font-size: 18px; font-weight: bold;}
#loginForm{ margin-left: 138px; margin-top: -7px;}
#loginBtn{ border: 1px solid #fdfdfd; font-weight: 700; background-color: #fdfdfd;}
.spanA{ font-size: 1.2em; color: #fdfdfd; font-family: 'Quicksand', sans-serif;}
.chSpan{ color : #29347A;}
#division{ 	margin-left: 47%; margin-top: 20px;	margin-bottom: 3%;}
/*배경화면 관련*/
#actLogo{ margin-top: -17%; margin-left: 36%; width: 30%; border-radius: 18%;}
body { padding: 0px; margin: 0px; background-color: #293279; }
/* .vd-box { width: 100%; margin: 0px auto; position: relative; overflow:auto; background-color: #d8e8e4;}
 video { width: 100%; }
 */
.vd-logo { position: absolute; top: 48%; width: 100%; }
#loginDiv { position: absolute; top: 60%; width: 100%; text-align:center; padding-top:30px;}
#loginDiv *{ display: inline-block;}
.jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #00C2CB; }

</style>  
</head>
<body>
    <!-- 로그인 배경 시작 -->
	   	<div class="vd-logo">
		   	<img id="actLogo" alt="actLogo" src="/resources/assets/img/DoITActiveLogo.gif">
	    </div>
        
        <div id="loginDiv">
        	<form:form class="text-left" modelAttribute="memberVO" method="post" action="/loginPost.do" id="idLogin">
                 <br><br>&nbsp;
                 <div class="form" id="loginForm">

                    <div id="userId-field" class="field-wrapper input">
           		<form:input path="mbrId" class="test4" placeholder="ID를 입력하세요" maxlength="15" />
                    </div>

                    <div id="password-field" class="field-wrapper input mb-2">
           		<form:input class="test4" path="mbrPw" placeholder="비밀번호를 입력하세요" type="passWord" id="pwInput" maxlength="15" />
                    </div>
                 </div>
            </form:form>                     
            <div class="field-wrapper button1">
                <button class="btn " id="loginBtn" type="button" >로그인</button>
                <button class="btn " id="idPw1" type="button" onclick="idPw1()">Demo1</button>
                <button class="btn " id="idPw2" type="button" onclick="idPw2()">Demo2</button>
            </div>
            <br>
            <div class="modalA">
            	<span style="color:#fdfdfd;"><a href="#" data-toggle="modal" data-target="#myModal1" class="forgot-pass-link spanA">회원가입</a>&nbsp;/</span>
            	<span style="color:#fdfdfd;"><a href="#" data-toggle="modal" data-target="#myModal2" class="forgot-pass-link spanA">아이디찾기</a>&nbsp;/</span>
            	<span><a href="#" data-toggle="modal" data-target="#myModal3" class="forgot-pass-link spanA">비밀번호찾기</a></span>
            </div>
        </div>
<!-- 회원 가입 모달 -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<img src="/resources/assets/img/logo.png" style="width: 100px;">
					<h3 class="modal-title">회원 가입</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				</div>
				<div class="modal-body" style="margin-top: -20px;">
                   <form class="mt-0" id="insertForm" name="insertForm" action="/mbrinsert.do" method="post">
                   		<div class="form-group field-wrapper input test1" id="userImg">
	                      <div class="form-group field-wrapper input test1">
					        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-camera"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
					        <strong class="d-block mb-2 test3">프로필 이미지</strong>
					      </div>
							<div class="form-group">
								<div class="imgs_wrap" id="profile"></div>
						    </div>
							<div class="form-group">
								<input type="file" accept="image/*" id="input_imgs" name="mbrProfile">
							</div>
					     </div>
	                      <div class="form-group field-wrapper input test1" id="idDiv">
	                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
	                      	<input type="text" class="form-control mb-2 test2" id="mbrId1" name="mbrId" placeholder="회원 아이디" maxlength="20">
	                      </div>
	                      	<button class="btn btn-outline-primary" id="idBtn" type="button">ID 중복검사</button>
	                      	<span id="idSpan" class="chSpan"></span>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
	                       	<input type="password" class="form-control mb-2 test2" id="mbrPw1" name="mbrPw" placeholder="비밀번호" maxlength="20"><br/>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
	                       	<input type="password" class="form-control mb-2 test2" name="mbrPw1_2" placeholder="비밀번호 확인" maxlength="20"><br/>
	                       	<span id="pwSpan" class="chSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
	                      	<input type="text" class="form-control mb-2 test2" name="mbrNm" placeholder="회원 이름" maxlength="20"><br/>
	                       	<span id="nmSpan" class="chSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
	                       	<input type="text" class="form-control mb-2 test2" name="mbrEml" placeholder="Email 주소" maxlength="50"><br/>
	                       	<span id="miSpan" class="chSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
	                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
	                       	<input type="text" class="form-control mb-2 test2" name="mbrTelno" placeholder="회원 연락처" maxlength="50"><br/>
	                       	<span id="tlSpan" class="chSpan"></span>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
		                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
	                       	  <input type="text" class="form-control mb-2 test2" name="mbrDept" placeholder="소속" maxlength="50"><br/>
	                      </div>
	                      <div class="form-group field-wrapper input test1">
                      	  	  <div class="form-group field-wrapper input test1" id="genderlab">
                               	  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                               	  <strong class=" d-block mb-2 test3">성별</strong>
                              </div>	
	                          <div class="custom-control custom-radio custom-control-inline">
							        <input type="radio" id="customRadioInline1" name="mbrGender" class="custom-control-input" value="M">
							        <label class="custom-control-label" for="customRadioInline1" style="color: #515365;">남성</label>
							        </div>
							  <div class="custom-control custom-radio custom-control-inline">
							        <input type="radio" id="customRadioInline2" name="mbrGender" class="custom-control-input" value="F">
							        <label class="custom-control-label" for="customRadioInline2" style="color: #515365;">여성</label>
							  </div>
	                          
						  </div>
	                      <div class="col-md-11">
                              <div class="form-group">
	                      	  	  <div class="form-group field-wrapper input test1" style="margin-left:-15px;">
				                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pen-tool"><path d="M12 19l7-7 3 3-7 7-3-3z"></path><path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path><path d="M2 2l7.586 7.586"></path><circle cx="11" cy="11" r="2"></circle></svg>
                                  	  <strong class="d-block mb-2 test3">소개글</strong>
                                  </div>	
                                  	<textarea class="form-control" id="aboutBio" name="mbrIntro" rows="5" wrap="hard"></textarea>
                              </div>
                          </div>
                   </form>
			</div>
			<div class="modal-footer" style="border: none;  margin-top: -20px;">
				<button type="button" class="btn btn-outline-primary" id="joinSubmit">가입신청</button>
			</div>
	     </div>
	   </div>
	</div>
	
	<!-- ID찾기 모달  -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<img src="/resources/assets/img/logo.png" style="width: 100px">
					<h3 class="modal-title">아이디 찾기</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				</div>
			<div class="modal-body" style="margin-top: -20px;">
				<div class="modal-body">
                   <form class="mt-0" id="findIdForm">
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2 test2" id="Username1" placeholder="회원 이름" maxlength="20"><br />
                       	<span id="nmSpan2" class="chSpan"></span>
                      	
                      </div>
                      <div class="form-group field-wrapper input test1">
                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                       	<input type="email" class="form-control mb-2 test2" id="Email2" placeholder="Email 주소" maxlength="30"><br />
                       	<span id="miSpan2" class="chSpan"></span><br />
                       	<span id="findIdSpan" class="chSpan"></span>
                      </div>
                      
                   </form>
                 </div>
			</div>
			<div class="modal-footer" style="border: none; margin-top: -20px;">
				<button type="button" class="btn btn-outline-primary" id="findIdBtn">찾기</button>
			</div>
	     </div>
	   </div>
	</div>
	
	
	<!-- PW찾기 모달  -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<img src="/resources/assets/img/logo.png" style="width: 100px">
					<h3 class="modal-title">비밀번호 찾기</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				</div>
			<div class="modal-body">
				<div class="modal-body" style="margin-top: -20px;">
                   <form class="mt-0" id="findPwForm">
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2 test2" id="UserID3" placeholder="회원 아이디" maxlength="20"><br />
                       	<span id="idSpan3" class="chSpan"></span>
                      </div>
                      <div class="form-group field-wrapper input test1">
                      	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                      	<input type="text" class="form-control mb-2 test2" id="Username3" placeholder="회원 이름" maxlength="30"><br />
                       	<span id="nmSpan3" class="chSpan"></span>
                      </div>
                      <div class="form-group field-wrapper input test1">
                       	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                       	<input type="email" class="form-control mb-2 test2" id="Email3" placeholder="Email 주소" maxlength="50"><br />
                       	<span id="miSpan3" class="chSpan"></span><br />
                       	<span id="findPwSpan" class="chSpan"></span>
                      </div>
                      
                   </form>
                   
                 </div>
			</div>
			<div class="modal-footer" style="border: none; margin-top: -20px;">
				<button type="button" class="btn btn-outline-primary" id="findPwBtn">확인</button>
			</div>
	     </div>
	   </div>
	</div>

<script type="text/javascript">

$(function(){
	//로그인(버튼)
	$("#loginBtn").on("click", function(){
		$("#idLogin").submit();
	});
	
	//로그인(Enter)
	$("#pwInput").on("keyup",function(key){
	    if(key.keyCode==13) {
	    	$("#idLogin").submit();
	    }
	});
	
	//회원가입
	//id입력 시 정규식검증
	  $('#mbrId1').on('keyup', function(){
	  	//$('#idSpan').html(' ');
	  	$('#idSpan').empty();
	  	idval = $('#mbrId1').val().trim();
	  	
	  	idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/
	  	
	  	if(!(idreg.test(idval))){
	  		$(this).css('border', '1px solid red');
	  		//중복검사버튼 비활성
	  		$('#idBtn').prop('disabled', true);
	  		//메시지 안내
	  		$('#idSpan').html('ID는 영문+숫자 4~12자 범위로 입력해주세요.')
	  	}else{
	  		$(this).css('border', '1px solid blue');
	  		//중복검사버튼 활성
	  		$('#idBtn').prop('disabled', false);
	  	}
	});
	
	  //아이디 중복검사
	  	$('#idBtn').on('click',function(){
	  		idval = $('#mbrId1').val().trim();
	  		//alert(idval);
	  		if(idval.length < 1){
	  			//alert("ID를 입력하세요");
	  			swal("","ID를 입력하세요");
	  			return false;
	  		}
	  		 		
	  		//서버로 전송하기
	  		$.ajax({
	  			type : 'post',
	  			dataType : "json",
	  			data : {"mbrId" : idval,"mbrId2" : idval, "mbrId3" : [{"test":idval}]},
	  			url : '/mbr/checkId.do',
	  			success : function(res){
	  				console.log("checkId.do : ", JSON.parse(res));
	  				if(res==0){
		  				//$('#spanid').html(res.sw).css('color','green');
		  				$('#idSpan').html('사용 가능한 ID입니다.')
	  				}else{
	  					//전송버튼 비활성
						$('#joinSubmit').prop('disabled', true);
	  					$('#idSpan').html('사용 불가능한 ID입니다.')
	  				}
	  			},
	  			error : function(xhr){
	  				swal("","전송 오류 발생");
	  				console.log(xhr.status);
	  				//alert("상태:"+xhr.status);//404,500,200
	  			},
	  			dataType : 'json'
	  		})
	  	})
		  
		//이름 입력 시 정규식검증
		$('input[name="mbrNm"]').on('keyup', function(){
			$('#nmSpan').empty();
			nameval = $('input[name="mbrNm"]').val().trim();
			namereg = /^[가-힣]{2,5}$/
			
				if(!(namereg.test(nameval))){
					$(this).css('border', '1px solid red');
					//전송버튼 비활성
					$('#joinSubmit').prop('disabled', true);
					//메시지 안내
			  		$('#nmSpan').html('이름은 한글3~6자 범위로 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					//전송버튼 활성
					$('#joinSubmit').prop('disabled', false);
				}
		});
	  
	  //이메일 입력 시 정규식검증
		  $('input[name="mbrEml"]').on('keyup', function(){
			  $('#miSpan').empty();
			  mailval = $('input[name="mbrEml"]').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval))){
					$(this).css('border', '1px solid red');
					$('#joinSubmit').prop('disabled', true);
					//메시지 안내
			  		$('#miSpan').html('이메일 주소 형식에 맞게 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#joinSubmit').prop('disabled', false);
				}
		  });
		  
		  //비밀번호 입력
		   $('#mbrPw1').on('keyup', function(){
			  $('#pwSpan').empty();
			  passval = $('#mbrPw1').val().trim();
			  passreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			  
			  if(!(passreg.test(passval))){
					$(this).css('border', '1px solid red');
					$('#joinSubmit').prop('disabled', true);
					//메시지 안내
			  		$('#pwSpan').html('특수문자,영문,숫자를 조합하여 8자 이상 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#joinSubmit').prop('disabled', false);
				}
		  }); 
		 //비밀번호 확인 입력
		  $('input[name="mbrPw1_2"]').on('keyup', function(){
			  $('#pwSpan').empty();
			  passval2 = $('input[name="mbrPw1_2"]').val().trim();
			  if(passval != passval2){
					//전송버튼 비활성
					$('#joinSubmit').prop('disabled', true);
					//테두리 색 변경
					$(this).css('border', '1px solid red');
					//메시지 안내
			  		$('#pwSpan').html('비밀번호가 일치하지 않습니다.')
				}else{
					$('#joinSubmit').prop('disabled', false);
					$(this).css('border', '1px solid blue');
				}
			 
		  });
		
		  
	  //전화번호 입력 시 정규식검증
		 $('input[name="mbrTelno"]').on('keyup', function(){
			 $('#tlSpan').empty();
			 nameval = $('input[name="mbrTelno"]').val().trim();
			 namereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; 
			
				if(!(namereg.test(nameval))){
					$(this).css('border', '1px solid red');
					//전송버튼 비활성
					$('#joinSubmit').prop('disabled', true);
					//메시지 안내
			  		$('#tlSpan').html('연락처 형식에 맞게 입력해주세요.(-포함)')
				}else{
					$(this).css('border', '1px solid blue');
					//전송버튼 활성
					$('#joinSubmit').prop('disabled', false);
				}
		}); 
	
	//프로필이미지 미리보기	
	$("#input_imgs").on("change", handleImgFileSelect);  
	  
	//회원가입
	$("#joinSubmit").on("click", memberJoin);
	
	//모달 닫을때 정보 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
		//alert("modal close");
		$(this).find('form')[0].reset();
		//$(this).find('form')[0].css({"border-bottom": "1px solid #e0e6ed;"});
		$(this).find(".test1 input").css({"border-left": "0", "border-right": "0", "border-top": "0"});
		$(this).find(".test1 input").css({"border-bottom": "1px solid #e0e6ed"});
		$(this).find("#profile").empty();
		$(this).find(".input span").empty();
	});
	
	//아이디 찾기
  	//이름 입력 시 정규식검증
		$('#Username1').on('keyup', function(){
			$('#nmSpan2').empty();
			nameval2 = $('#Username1').val().trim();
			namereg = /^[가-힣]{2,5}$/
			
				if(!(namereg.test(nameval2))){
					$(this).css('border', '1px solid red');
					//확인버튼 비활성
					$('#findIdBtn').prop('disabled', true);
					//메시지 안내
			  		$('#nmSpan2').html('이름은 한글3~6자 범위로 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					//확인버튼 활성
					$('#findIdBtn').prop('disabled', false);
				}
		});
	  
	  //이메일 입력 시 정규식검증
		  $('#Email2').on('keyup', function(){
			  $('#miSpan').empty();
			  mailval2 = $('#Email2').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval2))){
					$(this).css('border', '1px solid red');
					$('#findIdBtn').prop('disabled', true);
					//메시지 안내
			  		$('#miSpan2').html('이메일 주소 형식에 맞게 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#findIdBtn').prop('disabled', false);
				}
		  });
  	$('#findIdBtn').on('click',function(){
  			nameval2 = $('#Username1').val().trim();
  			mailval2 = $('#Email2').val().trim(); 
  		if(nameval2.length < 1){
  			//alert("이름을 입력하세요");
  			swal("","이름을 입력하세요.");
  			return false;
  		}
  		if(mailval2.length < 1){
  			swal("","이메일주소를 입력하세요");
  			return false;
  		}
  		 		
  		//서버로 전송하기
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
	  				$('#findIdSpan').html('가입되지 않은 회원정보입니다.')
  				}else{
	  				console.log("222")
  					var findMbrId = res.mbrId;
  					$('#findIdSpan').html(' 회원님의 ID는 '+ findMbrId +' 입니다.')
  				}
  			},
  			error : function(xhr){
  				//alert("상태:"+xhr.status);//404,500,200
  				swal("","전송 오류가 발생했습니다.");
	  			console.log(xhr.status);
  			},
  			dataType : 'json'
  		})
  	})
	
	
	
	//비밀번호 찾기
  	//id입력 시 정규식검증
	  $('#UserID3').on('keyup', function(){
	  	$('#idSpan3').empty();
	  	idval3 = $('#UserID3').val().trim();
	  	idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/
	  	
	  	if(!(idreg.test(idval3))){
	  		$(this).css('border', '1px solid red');
	  		//확인버튼 비활성
	  		$('#findPwBtn').prop('disabled', true);
	  		//메시지 안내
	  		$('#idSpan3').html('ID는 영문+숫자 4~12자 범위로 입력해주세요.')
	  	}else{
	  		$(this).css('border', '1px solid blue');
	  		//확인버튼 활성
	  		$('#findPwBtn').prop('disabled', false);
	  	}
	});
	//이름 입력 시 정규식검증
		$('#Username3').on('keyup', function(){
			$('#nmSpan3').empty();
			nameval3 = $('#Username3').val().trim();
			namereg = /^[가-힣]{2,5}$/
			
				if(!(namereg.test(nameval3))){
					$(this).css('border', '1px solid red');
					//확인버튼 비활성
					$('#findPwBtn').prop('disabled', true);
					//메시지 안내
			  		$('#nmSpan3').html('이름은 한글3~6자 범위로 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					//확인버튼 활성
					$('#findPwBtn').prop('disabled', false);
				}
		});
	  
	  //이메일 입력 시 정규식검증
		  $('#Email3').on('keyup', function(){
			  $('#miSpan3').empty();
			  mailval3 = $('#Email3').val().trim(); 
			  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  
			  if(!(mailreg.test(mailval3))){
					$(this).css('border', '1px solid red');
					$('#findPwBtn').prop('disabled', true);
					//메시지 안내
			  		$('#miSpan3').html('이메일 주소 형식에 맞게 입력해주세요.')
				}else{
					$(this).css('border', '1px solid blue');
					$('#findPwBtn').prop('disabled', false);
				}
		  });
  	$('#findPwBtn').on('click',function(){
  		if(idval3.length < 1){
  			swal("","아이디를 입력하세요");
  			return false;
  		}
  		if(nameval3.length < 1){
  			swal("","이름을 입력하세요.");
  			return false;
  		}
  		if(mailval3.length < 1){
  			swal("","이메일 주소를 입력하세요.");
  			return false;
  		}
  		
  		showLoadingBar();
  		//입력받은 정보 전송하기
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
	  				$('#findPwSpan').html('가입되지 않은 회원정보입니다.')
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
		  					hideLoadingBar();
	  						$('#findPwSpan').html(toAddress+'로 임시 비밀번호를 발송했습니다.\n 창을 닫고 새 비밀번호로 다시 로그인해주세요.')
	  					},error : function(xhr2){
	  						swal("","전송 오류가 발생했습니다.");
	  		  				console.log(xhr.status);
	  		  			}
	  				});
  				}
  			},
  			error : function(xhr){
  				swal("","전송 오류가 발생했습니다.");
  				console.log(xhr.status);
  			},
  			dataType : 'json'
  		}); //ajax
  		
  	})
  	
  	
  	
  	$.removeCookie('pjtNo', {path: '/'});  
	  
});


function handleImgFileSelect(e){
	//이벤트가 일어난 파일객체의 이미지 파일들을 가져옴
	var files = e.target.files;
	//파일들을 배열로 만들어 관리
	var filesArr = Array.prototype.slice.call(files);
	//f : 각각의 파일 객체
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			//alert("이미지 파일만 가능합니다");
			swal("","이미지 파일만 가능합니다");
			//업로드 종료(실패)
			return;
		}
		//각 이미지를 reader로 읽어들임
		var reader = new FileReader();
		reader.onload = function(e){
			//$("#img").attr("src",e.target.result);
			var img_html = "<img src=\""+e.target.result+"\" style='width:100px;' />";
			$(".imgs_wrap").html(img_html);
		}
		reader.readAsDataURL(f);
	});//end for each
}

function memberJoin(){
	    
    var formData = new FormData(document.getElementById("insertForm"));
	
	 $.ajax({
		type:'POST',
		data : formData,
		url:"/mbr/mbrinsert.do",
		processData: false,
	    contentType: false,
	    dataType:'json',
		success : function(data) {
						
			if(data.sta=="success"){
				//alert("가입 신청이 완료되었습니다.\n가입 승인 후 로그인해 주세요.");
				swal({
				  title: "",
				  html: "가입 신청이 완료되었습니다.<br>가입 승인 후 로그인해주세요.<br>(가입 승인은 최대 2일 이내 처리됩니다.)",
				  //icon: '${type}',
				  button: '${button}'
			})
			}else{
				//alert("가입 신청에 실패했습니다.\n다시 신청해 주세요.");
				swal({
				  title: "",
				  html: "가입 신청에 실패했습니다.<br>다시 신청해주세요.",
				  //icon: '${type}',
				  button: '${button}'
			})
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			swal("","입력되지 않은 항목이 있습니다.");
			console.log(textStatus);
			console.log(errorThrown);
			//alert("ERROR : " + textStatus + " : " + errorThrown);
		}
	}); 
	$('#myModal1').modal('hide');
};

	function showLoadingBar() {
	    var maskHeight = $(document).height();
	    var maskWidth = window.document.body.clientWidth;
	
	    var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg = '';
	
	    loadingImg += "<div id='loadingImg' style='position:absolute; left:50%; top:40%; display:none; z-index:10000;'>";
	    loadingImg += "    <img src='/resources/assets/img/loading1.gif'/>";
	    loadingImg += "</div>";
	
	    $('body').append(mask).append(loadingImg);
	
	    $('#mask').css({
	        'width' : maskWidth
	        , 'height': maskHeight
	        , 'opacity' : '0.3'
	    });
	
	    $('#mask').show();
	    $('#loadingImg').show();
	}

	function hideLoadingBar() {
	    $('#mask, #loadingImg').hide();
	    $('#mask, #loadingImg').remove();
	}
	
	function idPw1(){
		$('#mbrId').val('jsa1234')
		$('#pwInput').val('jsa1234!')
		$('#idPw1').hide();
		$('#idPw2').hide();
	}
	function idPw2(){
		$('#mbrId').val('lsy1004')
		$('#pwInput').val('lsy1004!')
		$('#idPw1').hide();
		$('#idPw2').hide();
	}

</script>        
</body>

</html>