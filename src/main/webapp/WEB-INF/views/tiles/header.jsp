<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet"
	type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet"
	type="text/css" class="structure">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/elements/miscellaneous.css"
	rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<link href="/resources/plugins/notification/snackbar/snackbar.min.css"
	rel="stylesheet" type="text/css">

<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#spanStts {
	font-size: 16px;
	text-align: left;
	margin-top: 10px;
	padding-top: 10px;
	position: absolute;
	top: -13px;
	left: -10px;
	font-weight: 600;
}

.stts {
	position: relative;
	font-size: 14px;
}

#clock {
	position: absolute;
	top: 31px;
	right: 84px;
}

.sessionBadge {
	position: absolute;
	top: 31px;
	right: 17px;
}
#editForm{
	overflow: auto;
    height: 600px;
    padding: 10px; 
}
#editForm::-webkit-scrollbar {
    display: none;
}

#profileImg, #profileImg1 {
	width: 130px;
	height: 130px;
}

.test5 {
	margin: 0px;
	padding: 0px !important;
	position: relative;
}

.test5 svg, .test5 input {
	display: inline-block;
	max-width: 40%;
	margin-bottom: 3px;
}

.test5 span {
	display: inline-block;
	color: red;
}

.test2 {
	padding: 8px 0px 0px 35px !important;
	border-left: 0;
	border-right: 0;
	border-top: 0;
	border-bottom: 1px solid #e0e6ed;
}

.test3 {
	margin-top: 10px;
	margin-bottom: 15px;
}

.contacts-block__item span, .contacts-block__item h6 {
	display: inline-block;
	font-size: 1.2em;
	margin-left: -10px;
	margin-right: 25px;
}

#infoIntro {
	display: inline-block;
	overflow-y: auto;
	border: 0px;
	color: #3B3F5C;
	font-family: SpoqaHanSansNeo-Regular;
	font-size: 15.6px;
	font-weight: 500;
}
/*sweet alert*/
.swal-text {
	font-weight: 700;
	font-size: 18px;
	color: #3b3f5c;
}

.swal-button {
	background-color: #1b55e2;
	color: #fff;
	font-weight: 600;
}
#mbrInfoEdit1{
	-webkit-box-shadow:none;
	font-size: 1.2em;
}
</style>

<script>
	var mbrId = '<c:out value="${member.mbrId}" />';

	//?????? ???????????? ??????
	var socket = null;
	//????????? ????????? ????????? ?????? alarmCount ?????? ?????? 
	var alarmCount = 0;

	$(document).ready(function() {

		connectWs(); //?????? ??????
		getMyStts(); //??? ??????

		setTimeout(function() {
			//????????? 0.3?????? ??????????????? ????????????
			sock.send("${member.mbrId}");
		}, 300);

		//5????????? ??????????????? ????????????
		//setInterval("autoScript()", 5000);
	});

	function autoScript() {
		sock.send("${member.mbrId}");
	}
	function connectWs() {
		sock = new SockJS('http://192.168.142.4/alarm');
		//sock = new SockJS('http://localhost/alarm');
// 		sock = new SockJS('http://192.168.136.214/alarm');
		//console.log(sock);
		socket = sock;
		sock.onopen = function() {
			console.log('connect onopen');
		};

		sock.onmessage = function(evt) {
			//console.log("msg!!");
			var data = evt.data;
			//console.log("ReceiveMessage : " + data + "\n");
			if (data != null){
				const obj = JSON.parse(data);
				alarmData(obj);
			} else {
				$("#alarmlight").hide(); //???????????? ???????????? ??????~~!     
			}
		};

		sock.onclose = function() {
			console.log('connect close');
			//setTimeout(function(){connectWs();} , 1000);
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};
	}

	function alarmListMove() {
		location.href = "${pageContext.request.contextPath}/alarmAllRead";
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};

	function alarmData(obj) {
		var alarmCount = obj.countMsg;
		console.log("??????", alarmCount);
		var msg = obj.msg;
		//console.log("??????????", msg);
		//?????? ?????????
		if (msg.length > 0) {

			if (!sessionStorage.getItem("stts")) { //????????? ??????????????? ???????????? ?????? ??? 
				sessionStorage.setItem("stts", obj.countMsg);
				Snackbar.show({
					text : '?????????????????? ??????????????????.',
					pos : 'top-right'
				});
			}

			var stts = sessionStorage.getItem("stts");
			if (parseInt(stts) < obj.countMsg) { //?????????  ????????? ????????? ?????? ?????????????????? ??? ??? 
				Snackbar.show({
					text : '?????????????????? ??????????????????.',
					pos : 'top-right'
				});
				sessionStorage.setItem("stts", obj.countMsg);
			}
			
			$("#alarmlight").addClass("badge badge-success");
			$("#alarmlight").text(alarmCount); //???????????? ?????????
			$(".notification-scroll").empty();
			str = "";
			for (var i = 0; i < msg.length; i++) {
				//console.log("????????????", msg[i]);
				if (msg[i].todo) {
					var pjtNo = msg[i].location.split('/')[0];
					var tdNo = msg[i].location.split('/')[1];
					str += '<div class="dropdown-item"><div class="media server-log" >';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-server"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect><rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect><line x1="6" y1="6" x2="6" y2="6"></line><line x1="6" y1="18" x2="6" y2="18"></line></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<a onclick=alarmClick("'
							+ msg[i].alrmNo
							+ '") href="/project/todoDetail.do?pjtNo='
							+ pjtNo
							+ '&tdNo='
							+ tdNo
							+ '"><h6 class="" style="margin-top:5px;">'
							+ msg[i].todo
							+ '</h6></div><input type="hidden" value="'+ msg[i].alrmNo+'"></a>';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				} else if (msg[i].chat) {
					str += '<div class="dropdown-item"><div class="media" style="color: #762b95;" >';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgb(67 0 150 / 37%)" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<a onclick=chatClick("'
							+ msg[i].alrmNo
							+ '") href="#"><h6 class="" style="margin-top:5px;">'
							+ msg[i].chat
							+ '</h6></div><input type="hidden" value="'+ msg[i].alrmNo+'"></a>';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				} else if (msg[i].mail) {
					str += '<div class="dropdown-item"><div class="media" style="color: #2b5595;">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(0 57 150 / 37%)" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<a onclick=alarmClick("'
							+ msg[i].alrmNo
							+ '") href="/user/email.do?mbrId='
							+ mbrId
							+ '"><h6 class="" style="margin-top:5px;">'
							+ msg[i].mail
							+ '</h6></div><input type="hidden" value="'+ msg[i].alrmNo+'"></a>';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				} else if (msg[i].mension) {
					//console.log(msg[i].location);
					var pjtNo = msg[i].location.split('/')[0];
					var pstNo = msg[i].location.split('/')[1];
					str += '<div class="dropdown-item"><div class="media" style="color: #2e6213;">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(27 150 0 / 37%)" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<a onclick=alarmClick("'
							+ msg[i].alrmNo
							+ '") href="/feed/main.do?pjtNo='
							+ pjtNo
							+ '#'
							+ pstNo
							+ '"><h6 class="" style="margin-top:5px;">'
							+ msg[i].mension
							+ '</h6></div><input type="hidden" value="'+ msg[i].alrmNo+'"></a>';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				} else if (msg[i].pjt) {
					console.log(msg[i].pjtNo);
					str += '<div class="dropdown-item"><div class="media" style="color: #aba501;">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(150 148 0 / 37%)" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<a onclick=alarmClick("'+ msg[i].alrmNo+ '") href="/project/projectInfo.do?pjtNo='+ msg[i].pjtNo
							+ '"><h6 class="" style="margin-top:5px;">'+ msg[i].pjt+ '</h6></a></div><input type="hidden" value="'+ msg[i].alrmNo+'">';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				} else if (msg[i].mtr) {
					str += '<div class="dropdown-item"><div class="media" style="color: #952b2b;">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="rgba(150 0 0 / 37%)" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>';
					str += '<div class="media-body"><div class="data-info">';
					str += '<h6 class="" style="margin-top:5px;">'
							+ msg[i].mtr
							+ '</h6></div><input type="hidden" value="'+ msg[i].alrmNo+'">';
					str += '<div class="icon-status">';
					str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>';
					str += '</div></div></div></div>';
				}
			}
			$(".notification-scroll").append(str);
			var x = document.querySelectorAll(".icon-status"); // ?????? x??????
			var y = document.querySelectorAll("input[type=hidden]"); //?????? ????????????

			for (var i = 0; i < x.length; i++) { // x????????? ?????? ?????? ??????
				x[i].addEventListener("click", alarmClick.bind(this, y[i].value)); //??????function??? ?????? ???????????? binding
			}

		} else { //????????? ?????????
			console.log("no msg");
			$("#alarmlight").hide();
		}

	}

	//??????????????? ?????? ?????? ??? ???????????? ??? ???????????? ????????? ??????
	function chatClick(alrmNo) {
		//console.log("????????????!!", alrmNo);
		$.ajax({
			url : "/alarm/readAlarm",
			data : {
				alrmNo : alrmNo
			},
			type : "get",
			async : false,
			success : function(res) {
				autoScript();
				window.open('/chat/chatMain.do', 'chatting',
						'width=700, height=483');
			}
		})
	}

	// x ?????? ?????? ??? ????????????
	function alarmClick(alrmNo) {
		console.log("????????????!!", alrmNo);
		$.ajax({
			url : "/alarm/readAlarm",
			data : {
				alrmNo : alrmNo
			},
			type : "get",
			success : function(res) {
				autoScript();
			}
		})
	}

	var pjtNo = "<c:out value='${project.pjtNo}' />"; //?????? ?????? ??? ??????
	//?????? ?????? ????????????
	function getMyStts() {
		var mbrId = '<c:out value="${member.mbrId}" />';

		$.ajax({

					url : "/user/getMyStts",
					data : {mbrId : mbrId}, // name=value, queryString ????????????
					type : "get",
					dataType : "json",
					success : function(res) {
						var str = ''; //????????? ????????? ??????
						var txt = ''; //??? ?????? ????????? ??????				
						if (res == '4') {
							txt += '<span id="badge4"  class="badge badge-pills outline-badge-primary">????????????</span></td><td>';
							$("#spanStts").html(txt);
							str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell-off"><path d="M13.73 21a2 2 0 0 1-3.46 0"></path><path d="M18.63 13A17.89 17.89 0 0 1 18 8"></path><path d="M6.26 6.26A5.86 5.86 0 0 0 6 8c0 7-3 9-3 9h14"></path><path d="M18 8a6 6 0 0 0-9.33-5"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>';
							$("#notificationDropdown").html(str); //?????????????????? ????????? ????????????
							return;
						} else {
							str += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">';
							str += '<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>';
							str += '<path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>';
							str += '<span id="alarmlight" class="badge badge-success"></span>';
							$("#notificationDropdown").html(str); //???????????? ?????? ???????????? ?????? ??????

							if (res == '1') {
								txt += '<span id="badge2" class="badge badge-pills outline-badge-primary">?????? ???</span></td><td>';
								$("#spanStts").html(txt);
								return;
							}
							if (res == '2') {
								txt += '<span class="badge badge-pills outline-badge-primary">?????? ???</span></td><td>';
								$("#spanStts").html(txt);
								return;
							}
							if (res == '3') {
								txt += '<span id="badge3" class="badge badge-pills outline-badge-primary">?????? ?????? ???</span></td><td>';
								$("#spanStts").html(txt);
								return;
							}
						}
					}
				})
	}
	//??? ?????? ?????????
	function changeMyStts(changeVal) {
		$.ajax({
			url : "/user/changeMyStts",
			data : {
				stts : changeVal,
				mbrId : '<c:out value="${member.mbrId}" />'
			},
			type : "get",
			success : function(res) {
				getMyStts();
				getAllMbr(pjtNo, userList);
			}
		})
	}

	//???????????? ?????? ?????? ?????????
	function infoEdit() {
		$('#myInfoModal').modal('hide');
		$('#myInfoEdit').modal('show');
	}

	$(function() {
		//???????????? ??????
		//?????? ?????? ??? ???????????????
		$('input[name="mbrNm"]').on('keyup', function() {
			$('#nmSpan').empty();
			nameval = $('input[name="mbrNm"]').val().trim();
			namereg = /^[???-???]{2,5}$/

			if (!(namereg.test(nameval))) {
				$(this).css('border', '1px solid red');
				//???????????? ?????????
				$('#editSubmit').prop('disabled', true);
				//????????? ??????
				$('#nmSpan').html('????????? ??????3~6??? ????????? ??????????????????.')
			} else {
				$(this).css('border', '1px solid blue');
				//???????????? ??????
				$('#editSubmit').prop('disabled', false);
			}
		});

		//????????? ?????? ??? ???????????????
		$('input[name="mbrEml"]').on('keyup',function() {
			$('#miSpan').empty();
			mailval = $('input[name="mbrEml"]').val().trim();
			mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			if (!(mailreg.test(mailval))) {
				$(this).css('border', '1px solid red');
				$('#editSubmit').prop('disabled', true);
				//????????? ??????
				$('#miSpan').html('????????? ?????? ????????? ?????? ??????????????????.')
			} else {
				$(this).css('border', '1px solid blue');
				$('#editSubmit').prop('disabled', false);
			}
		});

		//???????????? ??????
		$('#mbrPw1').on('keyup',function() {
			$('#pwSpan').empty();
			passval = $('#mbrPw1').val().trim();
			passreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

			if (!(passreg.test(passval))) {
				$(this).css('border', '1px solid red');
				$('#editSubmit').prop('disabled', true);
				//????????? ??????
				$('#pwSpan').html(
						'????????????,??????,????????? ???????????? 8??? ?????? ??????????????????.')
			} else {
				$(this).css('border', '1px solid blue');
				$('#editSubmit').prop('disabled', false);
			}
		});
		//???????????? ?????? ??????
		$('input[name="mbrPw1_2"]').on('keyup', function() {
			$('#pwSpan').empty();
			passval2 = $('input[name="mbrPw1_2"]').val().trim();
			if (passval != passval2) {
				//???????????? ?????????
				$('#editSubmit').prop('disabled', true);
				//????????? ??????
				$('#pwSpan').html('??????????????? ???????????? ????????????.')
			} else {
				$('#editSubmit').prop('disabled', false);
				//$('input[name="mbrPw1_2"]').empty();
			}

		});

		//???????????? ?????? ??? ???????????????
		$('input[name="mbrTelno"]').on('keyup', function() {
			$('#tlSpan').empty();
			nameval = $('input[name="mbrTelno"]').val().trim();
			namereg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

			if (!(namereg.test(nameval))) {
				$(this).css('border', '1px solid red');
				//???????????? ?????????
				$('#editSubmit').prop('disabled', true);
				//????????? ??????
				$('#tlSpan').html('????????? ????????? ?????? ??????????????????.(-??????)')
			} else {
				$(this).css('border', '1px solid blue');
				//???????????? ??????
				$('#editSubmit').prop('disabled', false);
			}
		});

		//?????????????????? ????????????
		$("#input_imgs").on("change", handleImgFileSelect);

		//???????????? ??????
		$("#editSubmit").on("click", memberUpdate);

		//???????????? ???????????? ?????? ??? ?????? ?????????
		$('#myInfoEdit').on('hidden.bs.modal', function(e) {
			//alert("modal close");
			$(this).find('form')[0].reset();
			$(this).find(".test5 input").css({
				"border-left" : "0",
				"border-right" : "0",
				"border-top" : "0"
			});
			$(this).find(".test5 input").css({
				"border-bottom" : "1px solid #e0e6ed"
			});
			$(this).find("#profile").empty();
			$(this).find(".input span").empty();
		});

		//???????????? ?????? ??? ??? ??? ??????
		$('#myInfoModal').on('show.bs.modal',function(e) {
			var sesMbrId = '${member.mbrId}';
			//?????????????????? ???????????? ????????????
			$.ajax({
				url : "/mbr/mbrSelect.do",
				data : {
					"sesMbrId" : sesMbrId
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.sta == "success") {
						var mbrId = data.member.mbrId;
						var mbrNm = data.member.mbrNm;
						var mbrDept = data.member.mbrDept;
						var mbrEml = data.member.mbrEml;
						if (data.member.mbrGender == 'M') {
							var mbrGender = '???';
						} else {
							var mbrGender = '???';
						}
						var mbrImg = data.member.mbrImg;
						var mbrProfileImg = "\\resources\\profileImage\\"
								+ mbrImg;
						var mbrTelno = data.member.mbrTelno;
						var mbrIntro = data.member.mbrIntro;
						mbrIntro = mbrIntro.replaceAll(
								"\n", "<br/>");
						//alert(mbrNm);
						$('#infoId').text(mbrId);
						$('#infoNm').text(mbrNm);
						$('#infoDept').text(mbrDept);
						$('#infoEml').text(mbrEml);
						$('#infoGender')
								.text(mbrGender);
						$('#infoTelno').text(mbrTelno);
						$('#infoIntro').html(mbrIntro);
						$('#profileImg').attr("src",
								mbrProfileImg);
					} else {
						//swal("", "?????? ?????? ????????? ??????????????????.");
					}
				},
				error : function(jqXHR, textStatus,
						errorThrown) {
					//swal("", "?????? ????????? ??????????????????.");
					console.log(textStatus);
					console.log(errorThrown);
				}
			}); //ajax
		});

		//???????????? ?????? ?????? ??? ??? ??? ??????
		$('#myInfoEdit').on('show.bs.modal', function(e) {
			var sesMbrId = '${member.mbrId}';
			//?????????????????? ???????????? ????????????
			$.ajax({
				url : "/mbr/mbrSelect.do",
				data : {
					"sesMbrId" : sesMbrId
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.sta == "success") {
						var mbrId = data.member.mbrId;
						var mbrNm = data.member.mbrNm;
						var mbrDept = data.member.mbrDept;
						var mbrEml = data.member.mbrEml;
						if (data.member.mbrGender == 'M') {
							$('#mbrGender1').attr("checked", true);
						} else {
							$('#mbrGender2').attr("checked", true);
						}
						var mbrImg = data.member.mbrImg;
						var mbrProfileImg = "\\resources\\profileImage\\"
								+ mbrImg;
						var mbrTelno = data.member.mbrTelno;
						var mbrIntro = data.member.mbrIntro;
						//alert(mbrNm);
						$('#mbrId1').val(mbrId);
						$('#mbrNm').val(mbrNm);
						$('#mbrDept').val(mbrDept);
						$('#mbrEml').val(mbrEml);
						$('#mbrTelno').val(mbrTelno);
						$('#mbrIntro').val(mbrIntro);
						$('#profileImg1').attr("src",
							mbrProfileImg);
					} else {
						//swal("", "?????? ?????? ????????? ??????????????????.");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					//swal("", "?????? ????????? ??????????????????.");
					console.log(textStatus);
					console.log(errorThrown);
				}
			}); //ajax
		});

		$('.logo').on('click', function() {
			$.ajax({
				url : "/aside/selectPrj",
				data : {
					"prjNo" : 'null'
				},
				type : "post",
				success : function() {
					console.log('success')
				}
			})
		})

	});

	//????????? ????????????
	function handleImgFileSelect(e) {
		//?????? ???????????? ????????? ??????
		$("#profileImg1").hide();
		//???????????? ????????? ??????????????? ????????? ???????????? ?????????
		var files = e.target.files;
		//???????????? ????????? ????????? ??????
		var filesArr = Array.prototype.slice.call(files);
		//f : ????????? ?????? ??????
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						//alert("????????? ????????? ???????????????");
						swal("", "????????? ????????? ???????????????");
						//????????? ??????(??????)
						return;
					}
					//??? ???????????? reader??? ????????????
					var reader = new FileReader();
					reader.onload = function(e) {
						var img_html = "<img src=\""+e.target.result+"\" style='width:100px;' />";
						$(".imgs_wrap").html(img_html);
					}
					reader.readAsDataURL(f);
				});//end for each
	}

	//???????????? ??????
	function memberUpdate() {

		$('#mbrId1').prop('disabled', false);
		var mbrPw = $("#mbrPw1").val();
		console.log(mbrPw);
		var reMbrPw = $("#mbrPw1_2").val();
		console.log(reMbrPw);
		var formData = new FormData(document.getElementById("updateForm"));
		
		if(mbrPw.length < 1){
  			swal("","??????????????? ???????????????.");
  			return false;
  		}
		if(reMbrPw.length < 1){
  			swal("","???????????? ????????? ???????????????.");
  			return false;
  		}

		$.ajax({
			type : 'POST',
			data : formData,
			url : "/mbr/mbrUpdate.do",
			processData : false,
			contentType : false,
			dataType : 'json',
			success : function(data) {

				if (data.sta == "success") {
					swal({
						title : "",
						text : "?????? ????????? ?????????????????????.",
						button : "??????"
					}).then(function() {
						document.location.reload();
					});
				} else {
					/* swal({
						title : "",
						text : "?????? ????????? ??????????????????.",
						button : "??????"
					}) */
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//swal("", "?????? ????????? ??????????????????.");
				console.log(textStatus);
				console.log(errorThrown);
			}
		}); //ajax
		$('#mbrId1').prop('disabled', true);
		$('#myModal1').modal('hide');
	};
</script>
<!--  BEGIN NAVBAR  -->

<div id="msgStack"></div>


<div class="header-container fixed-top">
	<header class="header navbar navbar-expand-sm">
		<ul class="navbar-item flex-row">
			<li style=""><a href="/" class="logo"> <img
					width="130px" height="auto" src="/resources/assets/img/logo.png"
					alt="logo">
			</a></li>
		</ul>
		<ul class="navbar-item flex-row search-ul">
			<li class="nav-item align-self-center search-animated"></li>
		</ul>
		<ul style="width: 500px; position:relative; right : -100px;" class="navbar-item flex-row navbar-dropdown">
			<li title="????????? ??????" class="navbar-item dropdown" style="margin-top:15px; margin-right:13px;"><a href="/mtr/mtr.do" class="logo">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
				<circle cx="12" cy="12" r="10"></circle>
				<polyline points="12 6 12 12 16 14"></polyline></svg>
			</a></li>
			<li title="?????? ??????" class="navbar-item dropdown" style="margin-top:15px; margin-right:10px;"><a href="/gds/gdsList.do" class="logo">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-archive">
				<polyline points="21 8 21 21 3 21 3 8"></polyline>
				<rect x="1" y="3" width="22" height="5"></rect>
				<line x1="10" y1="12" x2="14" y2="12"></line></svg></a></li>
			<li style="width: 120px;"
				class="nav-item dropdown user-profile-dropdown  order-lg-0"><a
				title="??? ??????" href="#"
				class="nav-link dropdown-toggle user" id="userProfileDropdown"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<img class="img-fluid mr-2"
					src="/resources/profileImage/<c:if test='${member.mbrImg == null}'>profileimage.png</c:if><c:if test='${member.mbrImg != null}'>${member.mbrImg}</c:if>">
					<span style="font-size: 18px; font-weight: 600;">${member.mbrNm}</span><span
					style="font-size: 15px;"> ???</span>
			</a>
				<div class="dropdown-menu position-absolute animated fadeInUp"
					aria-labelledby="userProfileDropdown">
					<div class="user-profile-section">
						<div class="media mx-auto">
							<img class="img-fluid mr-2"
								src="/resources/profileImage/<c:if test='${member.mbrImg == null}'>profileimage.png</c:if><c:if test='${member.mbrImg != null}'>${member.mbrImg}</c:if>"
								alt="${member.mbrNm}">
							<div class="media-body">
								<h5>${member.mbrNm}</h5>
							</div>
						</div>
					</div>
					<div class="dropdown-item">
						<a href="/mbr/myTask.do"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-inbox">
								<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
								<path
									d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path></svg>
							<span>??? ??????</span>
						</a>
					</div>
					<div class="dropdown-item">
						<a href="#" data-toggle="modal" data-target="#myInfoModal"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-user">
								<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle></svg> <span>??? ??????</span>
						</a>
					</div>
					<div class="dropdown-item">
						<a href="/logout.do"> <svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round" class="feather feather-log-out">
								<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
								<polyline points="16 17 21 12 16 7"></polyline>
								<line x1="21" y1="12" x2="9" y2="12"></line></svg> <span>????????????</span>
						</a>
					</div>
				</div></li>
			<li class="nav-item dropdown dropleft"
				style="margin-right: 10px; vertical-align: bottom;"><a href="#"
				style="text-align: left; vertical-align: bottom;"
				class="nav-link dropdown-toggle" id="messageDropdown"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
				title="??? ?????? ??????"> <span id="spanStts"></span>
			</a>
				<div class="dropdown-menu dropleft" style="will-change: transform;">
					<a href="#" onclick="changeMyStts(1)" class="dropdown-item"> <span
						class="stts">?????? ???</span></a> <a href="#" onclick="changeMyStts(2)"
						class="dropdown-item"> <span class="stts">?????? ???</span></a> <a
						href="#" onclick="changeMyStts(3)" class="dropdown-item"> <span
						class="stts">?????? ?????? ???</span></a> <a href="#" onclick="changeMyStts(4)"
						class="dropdown-item"> <span class="stts">?????? ??????</span></a>
				</div></li>
				<li class="nav-item dropdown notification-dropdown">
				<a title="??????" href="#" class="nav-link dropdown-toggle"
				id="notificationDropdown" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <svg
						xmlns="http://www.w3.org/2000/svg" width="32" height="32"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-bell">
						<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
						<path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
<!-- 						<span id="alarmlight" class="badge badge-success"></span> -->
						<span id="alarmlight"></span>
			</a>
				<div class="dropdown-menu position-absolute animated fadeInUp"
					style="min-width: 30rem;" aria-labelledby="notificationDropdown">
					<div class="notification-scroll"></div>
				</div></li>
		</ul>
	</header>
</div>
<!--  END NAVBAR  -->

<!-- ???????????? ?????? ?????? -->
<div class="modal fade" id="myInfoModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="user-profile layout-spacing">
				<div class="widget-content widget-content-area"	style="padding-top: 20px;">
					<div class="d-flex justify-content-between" style=" padding: 0px 20px 0px;">
						<h3 class="">?????? ??????</h3>
						<a href="#" class="mt-2 edit-profile" onclick="infoEdit();"><svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-edit-3">
								<path d="M12 20h9"></path>
								<path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg></a>
					</div>
					<div class="text-center user-info">
						<img class="img-fluid mr-2" id="profileImg"
							src="<c:if test='${member.mbrImg == null}'>/resources/assets/img/profileimage.png</c:if><c:if test='${member.mbrImg != null}'>/resources/profileImage/${member.mbrImg}</c:if>"
							alt="${member.mbrNm}">
						<p id="infoNm">${member.mbrNm}</p>
					</div>
					<div class="user-info-list">
						<div class="">
							<ul class="contacts-block list-unstyled" style="max-width: 70%;">
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-heart">
										<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
									<span>??????</span>
									<h6 id="infoGender"></h6></li>
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-smile">
										<circle cx="12" cy="12" r="10"></circle>
										<path d="M8 14s1.5 2 4 2 4-2 4-2"></path>
										<line x1="9" y1="9" x2="9.01" y2="9"></line>
										<line x1="15" y1="9" x2="15.01" y2="9"></line></svg> <span>?????? ?????????</span>
									<h6 id="infoId"></h6></li>
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-users">
										<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
										<circle cx="9" cy="7" r="4"></circle>
										<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
										<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg> <span>??????</span>
									<h6 id="infoDept"></h6></li>
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-mail">
										<path
											d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
										<polyline points="22,6 12,13 2,6"></polyline></svg> <span>Email</span>
									<h6 id="infoEml"></h6></li>
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-phone">
										<path
											d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
									<span>?????????</span>
									<h6 id="infoTelno"></h6></li>
								<li class="contacts-block__item"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-feather">
										<path d="M20.24 12.24a6 6 0 0 0-8.49-8.49L5 10.5V19h8.5z"></path>
										<line x1="16" y1="8" x2="2" y2="22"></line>
										<line x1="17.5" y1="15" x2="9" y2="15"></line></svg> <span>????????????</span><br>
									<div class="container" id="infoIntro" style="max-width: 90%"></div>
								</li>
							</ul>
						</div>
					</div>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="infoBtn" style="margin: 0px 43% 10px;">??????</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ???????????? ?????? ??? -->

<!-- ???????????? ?????? ?????? ?????? -->
<div class="modal fade" id="myInfoEdit" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width: 600px; padding: 10px;">
			<div class="user-profile layout-spacing">
				<div id="mbrInfoEdit1" class="widget-content widget-content-area"	style="padding-top: 20px;">
					<div class="d-flex justify-content-between"  style=" padding: 0px 20px 0px;">
						<h3 class="" style="margin-top: -12px;">?????? ?????? ??????</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">??</span>
						</button>
					</div>
					<div id="editForm">
						<form class="mt-0" id="updateForm" name="updateForm"
							action="/mbrUpdate.do" method="post">
							<div class="form-group field-wrapper input test5" id="userImg">
								<div class="form-group field-wrapper input test5">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-camera">
										<path
											d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
										<circle cx="12" cy="13" r="4"></circle></svg>
									<strong class="text-muted mb-2 test3">????????? ??????</strong>
								</div>
								<br>
								<div class="form-group">
									<div class="imgs_wrap" id="profile"></div>
								</div>
								<br>
								<div class="form-group">
									<img class="img-fluid mr-2" id="profileImg1"
										src="<c:if test='${member.mbrImg == null}'>/resources/assets/img/profileimage.png</c:if><c:if test='${member.mbrImg != null}'>/resources/profileImage/${member.mbrImg}</c:if>"
										alt="${member.mbrNm}"><br> <input type="file"
										accept="image/*" id="input_imgs" name="mbrProfile"
										value="${member.mbrImgPath}\\${member.mbrImg}">
								</div>
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-user">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
									<circle cx="12" cy="7" r="4"></circle></svg>
								<strong class="text-muted mb-2 test3">?????? ????????? : </strong> <input
									type="text" class="form-control test2" id="mbrId1" name="mbrId"
									value="${member.mbrId}" disabled="disabled"> <span
									id="idSpan"></span>
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-smile">
									<circle cx="12" cy="12" r="10"></circle>
									<path d="M8 14s1.5 2 4 2 4-2 4-2"></path>
									<line x1="9" y1="9" x2="9.01" y2="9"></line>
									<line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
								<strong class="text-muted mb-2 test3">?????? : </strong> <input
									type="text" class="form-control test2" id="mbrNm" name="mbrNm">
								<span id="nmSpan"></span>
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-lock">
									<rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
									<path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
								<strong class="text-muted mb-2 test3">???????????? : </strong> <input
									type="password" class="form-control test2" id="mbrPw1"
									name="mbrPw"><br />
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-check">
									<polyline points="20 6 9 17 4 12"></polyline></svg>
								<strong class="text-muted mb-2 test3">???????????? ?????? : </strong> 
									<input type="password" class="form-control test2" name="mbrPw1_2" id="mbrPw1_2" >
								<span id="pwSpan"></span>
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-users">
									<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="9" cy="7" r="4"></circle>
									<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
									<path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
								<strong class="text-muted mb-2 test3">?????? : </strong> <input
									type="text" class="form-control test2" id="mbrDept"
									name="mbrDept"><br />
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-phone">
									<path
										d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
								<strong class="text-muted mb-2 test3">????????? : </strong> 
									<input type="text" class="form-control test2" id="mbrTelno"
									name="mbrTelno"> <span id="tlSpan"></span>
							</div>
							<div class="form-group field-wrapper input test5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-at-sign">
									<circle cx="12" cy="12" r="4"></circle>
									<path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
								<strong class="text-muted mb-2 test3">Email : </strong> <input
									type="text" class="form-control test2" id="mbrEml"
									name="mbrEml"> <span id="miSpan"></span>
							</div>
							<div class="form-group field-wrapper input test3">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-heart">
									<path
										d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
								<strong class="text-muted mb-2 test3">?????? : </strong>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="mbrGender1" name="mbrGender"
										class="custom-control-input" value="M"> <label
										class="custom-control-label" for="mbrGender1"
										style="width: 100px;">??????</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="mbrGender2" name="mbrGender"
										class="custom-control-input" value="F"> <label
										class="custom-control-label" for="mbrGender2"
										style="width: 100px;">??????</label>
								</div>
							</div>
							<div class="form-group field-wrapper input test3">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-pen-tool">
									<path d="M12 19l7-7 3 3-7 7-3-3z"></path>
									<path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path>
									<path d="M2 2l7.586 7.586"></path>
									<circle cx="11" cy="11" r="2"></circle></svg>
								<strong class="text-muted mb-2 test3">?????? ??????</strong>
								<textarea class="form-control" id="mbrIntro" name="mbrIntro"
									rows="5" wrap="hard"></textarea>
							</div>
						</form>
					</div>
					<button type="button" class="btn btn-primary" id="editSubmit" style="float: right; margin: 10px;">??????</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ?????????????????? ?????? ??? -->

