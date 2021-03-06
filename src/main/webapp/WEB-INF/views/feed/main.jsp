<%@page import="kr.or.ddit.project.vo.ProjectVO"%>
<%@page import="kr.or.ddit.user.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//줄바꿈 처리
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<title>Feed</title>
<link href="/resources/assets/img/favicon.ico" rel="icon" type="image/x-icon" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure" />

<script src="/resources/assets/js/jsa/projectMain.js"></script>
<!-- END GLOBAL MANDATORY STYLES -->
<link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">

<!--  BEGIN CUSTOM STYLE FILE  -->
<link href="/resources/plugins/editors/quill/quill.snow.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/apps/todolist.css" rel="stylesheet" type="text/css" />

<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />

<link href="/resources/assets/css/forms/theme-checkbox-radio.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/forms/switches.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/main.css" rel="stylesheet" type="text/css" />

<link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/noUiSlider/nouislider.min.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/noUiSlider/custom-nouiSlider.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/assets/css/widgets/modules-widgets.css" />
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<script src="https://d3js.org/d3.v4.js"></script>

<!--  END CUSTOM STYLE FILE  -->
<!-- 장소검색, 주소-좌표 변환을 하는 services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95e764b8c3b2e13e8d83e25d522784b0&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95e764b8c3b2e13e8d83e25d522784b0"></script>

<style type="text/css">
#fbtn {
	margin: 10px;
}

#pstCn {
	border: 1px solid #bfc9d4;
	color: #3b3f5c;
	font-size: 16px;
	letter-spacing: 1px;
	padding: 0.75rem 1.25rem;
	border-radius: 6px;
}

.LikesSection {
	margin: 16px;
}

.comment {
	margin: 10px;
}

.notification {
	font-size: 14px;
/* 	margin-top: 10px; */
	margin-left: 8px;
	width: 75px;
	height: 30px;
	line-height: 30px;
	color: #fff !important;
	background-color: #29347a;
	border-color: #8dbf42;
	border-radius: 1.875rem !important;
}

.switch, .slider {
	margin: 10px 0px 0px;
}

.input-group mb-3 {
	margin-left: 4px;
}

.vtContent, .voteResult {
	margin: 30px;
	padding: 25px;
	cursor: pointer;
	/* 	 	border:2px solid #acb0c3; */
	border : 3px solid #29347a;
	width: 500px;
	border-radius: 6px;
}

.vtContent label {
	color: #515365;
}

#mbrCollect {
	width: 330px;
	height: 80px;
	margin-top: 10px;
	display: flex;
	vertical-align: middle;
	padding-top: 5px;
	background: #ffffff;
	margin-bottom: 8px;
	border-radius: 6px;
	box-shadow: 0px 2px 4px rgb(126 142 177/ 12%);
}

#imgDiv {
	padding-top: 20px;
	margin-right: 5px;
	padding-left: 5px;
}

.memList {
	color: black;
	background-color: #ffffff;
	box-shadow: 4px 2px 2px #e6e6e6;
	border-radius: 50px;
	width: 65px;
	height: 28px;
	margin-right: 5px;
	text-align: center;
	padding-top: 3px;
	padding-left: 3px;
}

.feedProfile {
	border-radius: 50px;
	width: 90px;
	height: 90px;
}
.br-img{
	width : 55px;
	height : 55px;
	border-radius: 50px;
}

.comment {
	font-size : 17px;
}

.input-group>.custom-select:not(:first-child), .input-group>.form-control:not(:first-child) {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.commentBox{
	 margin : 30px 0px 20px 0px;
/* 	 border-top-style: solid; */
	 border-top-width: 1px;
  	 border-top-color: #29347a;
	 margin-top: 10px; 
	 padding : 20px 20px 0px 20px;
}

.pstCon{
/* 	 border-bottom-style: solid; */
/* 	 border-bottom-width: 1px; */
/*   	 border-top-color: #29347a; */
  	 margin-top: 20px;

}

.outline-badge-primary {
    width: auto;
    height: 30px;
    font-size: 1.12em;
    text-align: center;
}
.commentBox::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}


</style>
<%
	session = request.getSession();
	MemberVO memVO = (MemberVO)session.getAttribute("member");
	String mbrId = memVO.getMbrId();
	String mbrPic = memVO.getMbrImg();
	
	ProjectVO projectVO = (ProjectVO)session.getAttribute("project");
	String pjtNo = projectVO.getPjtNo();
%>
<script type="text/javascript">
	var total = "<c:out value='${changeMb}' />";
	var userId = [];
	var pjtNo = "<c:out value='${project.pjtNo}' />";
	var mbrId = "<c:out value='${member.mbrId}' />";
	var map = "";
	
	//이미지 미리보기
	var sel_files = [];
	
	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
		console.log("프젝번호?"+pjtNo);
		getAllMbr(pjtNo); //프로젝트 메인페이지 접속 시 구성원 목록 보여주기

		triggerTransition(); //프로젝트 사용량 
		
		//클라우드 사용량 버튼 클릭 시 클라우드 화면으로 넘어간다.
		$("#usingAmount").on("click",function(){
			location.href="/cloud/main.do?pjtNo="+pjtNo;
		})
	});
	
	$(document).on("click","table tbody tr td", function(e){
		//console.log("클릭!!", e.target);
		var findID = $(e.target).parents(".table").find("td:eq(0)").find(".mbrIdspan").text();
		getUserProfile(findID);
	});
	
	function displayUsers(userList) {
		console.log("userlist:",userList);
		getAllMbr(pjtNo, userList);
	}
	
	//클라우드 사용량 표시	
	function triggerTransition(){
	  d3.select("#rectArea")
	    .transition()
	    .delay(100)
	    .duration(3000)
	    .attr("width", total)
	}
	
	function handleImgFileSelect(e){
		var files = e.target.files; //이벤트가 일어난 파일 객체의 이미지 파일 가져오기
		var filesArr = Array.prototype.slice.call(files); //파일을 배열로 만들기
		
		//파일 개수만큼 반복문 돌리기
		filesArr.forEach(function(f){
			//이미지 파일만 미리보기 가능
			if(!f.type.match("image.*")){
				swal("","이미지 확장자만 가능합니다");
				return;
			}
			sel_files.push(f);
			
			//각 이미지를 reader로 읽어들이기
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\""+e.target.result+"\" style='width : 300px; margin-left:60px;'/>";
				$(".img_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
			
		});
		
	}
	
	
	function fn_insert(){
		
		//익명여부 선택 확인
		var cbox = $('input:checkbox').prop('checked');
		var flag = "";
		if (cbox){ //체크 시
			flag = "Y";
		}else{
			flag = "N";
		}
		//console.log(flag);
		
		//마감일
		var deadline = $("#basicFlatpickr").val();
		//console.log(deadline);
		
		var data = [];
		
		//피드내용
		var pstCn = $("#pstCn2").val();
		
		//공지여부
		var nyn = $("#ntcYn").val();
		
		//지도
		var addr = $("input[name=address]").val(); //주소
		var lat = $("input[name=lat]").val(); //위도
		var lng = $("input[name=lng]").val(); //경도 
		
		data.push(mbrId);
		data.push(pjtNo);
		data.push(pstCn);
		data.push(nyn);
		data.push(flag);
		data.push(deadline);
		data.push(addr);
		data.push(lat);
		data.push(lng);
		
		
		//작성한 투표 항목 가져오기
		var voteForm = $("input[name=vtItm]").length;
		var arr = new Array(voteForm);
		for(var i=0; i<voteForm; i++){
			if(arr[i] != null){
				console.log("array:"+arr[i]);
				arr[i] = $("input[name=vtItm]").eq(i).val();
			}
			console.log(arr[i]);
		}
			data.push(arr[i]);
		
		console.log("결과!!"+ data);
		
		$.ajax({
			type : "post",
			url : "/feed/insert.do",
			data : {
				"data" : JSON.stringify(data)
			},
			dataType: 'json',
			async : false,
			success : function(res) {
				console.log("success");
				$("#feedModal").hide();

				location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
			},
			error : function(res){
// 				alert("상태 : " + xhr.status);
				$("#feedModal").hide();
				location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
			}
		})
		
		//이미지 보내기
		if(sel_files.length > 0){
			console.log("sel_files",sel_files);
			
			var formData = new FormData();
			
			for(var i=0; i<sel_files.length; i++){
				console.log(sel_files[i]);
				formData.append("uploadFile",sel_files[i]);
			}
			
			$.ajax({
				type : "post",
				url : '/feed/pstFileInsert.do',
				data : formData,
				contentType: false,               
			    processData: false,    
			    async : false,
				success : function(res){
					console.log("파일업로드 성공");
				},
				error : function(res){
					console.log("파일업로드 실패");
				}
				
			})
			
		}

	}
		//피드 수정 버튼 클릭
		$(document).on("click", ".updateBtn", function(e){
			//기존 내용 보이게
			console.log($(this));

			var pstVal = $("p", $(this).parent().next()).text();
			var pstNo = $(".pstNo", $(this).parent()).val();
			var ntcYn = $(".ntcYn", $(this).parent()).val();
			console.log("수정버튼 클릭시@", pstVal);
			console.log("수정버튼 클릭시@", pstNo);
			console.log("수정버튼 클릭시@", ntcYn);
			
			$("#pstCn2").val(pstVal);
			$("#pstCn").val(pstVal);
			$("#pstNo").val(pstNo);
			$("#ntcYn").val(ntcYn);
			var noticeYn = $("#ntcYn").val();
			console.log("noticeYn",noticeYn);

			//수정 모달창 생성 시 등록버튼 가리기
			$("#submit").hide();
			//수정 버튼 보이게
			$("#modify").show();
			
			//수정할 내용이 공지라면 공지버튼 색 눌려있게
			if(noticeYn === 'Y'){
				$("#notifyC").show();
				$("#notifyB").hide();
			}
		})
			
		//댓글 수정 버튼 클릭 시
		$(document).on("click", ".cmntUpdate", function(e){
			//수정할 번호 가져오기
			var updateNo = $(".cmntNo", $(this).parent().prev()).val();
			console.log(updateNo);
			
			//수정창 띄우기
			$("#ctUpdateform", $(this).parent().prev()).show();
			
			//수정할 내용 가져오기
			var ctCn = $("#cmntCn", $(this).parent().prev()).text();
			console.log(ctCn);
			$(".ctUpdate").val(ctCn);
			
			//수정창에서 입력한 내용 가져오기
			$(".ctUpdate").on("change", function(){
				var ctCn = $(this).val();
				console.log(ctCn);
				$("#ctUpdate").val(ctCn);
				
			})
			
		})

	//피드 수정 내용 전달
	function fn_update(pstCn, pstNo, ntcYn) {
		var pstCn = pstCn.value;
		var pstNo = pstNo.value;
		var ntcYn = ntcYn.value;
		
		console.log("pstCn", pstCn);
		console.log("pstNo", pstNo);
		console.log("ntcYn", ntcYn);

		$.ajax({
			type : "post",
			url : "/feed/update.do",
			data : {
				"pstCn" : pstCn,
				"pstNo" : pstNo,
				"ntcYn" : ntcYn
			},
			dataType : 'text',
			success : function() {
				console.log("success");
				location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
			},
			error : function() {
				console.log("error");
			}
		})

	}
	
	//피드 등록 시 공지 버튼 클릭
	function fn_notify(e){
		console.log(e.className);
		
		if(e.className === 'btn btn-outline-success btn-rounded mb-2'){
			//클릭된 버튼 색 바꾸기
			$(e).removeClass('btn btn-outline-success btn-rounded mb-2').addClass('btn btn-success btn-rounded mb-2');
			//공지 여부 바꾸기
			//현재 값 가져오기
			var res = $("input[name=ntcYn]").val();
			console.log(res);
			//현재 값 비우기
			$("input[name=ntcYn]").empty();
			//변경 값 넣기
			var resChange = $("input[name=ntcYn]").attr('value','Y');
			//변경 값 확인
			console.log($("input[name=ntcYn]").val());
		}else{
			//클릭된 버튼 색 해제
			$(e).removeClass('btn btn-success btn-rounded mb-2').addClass('btn btn-outline-success btn-rounded mb-2');
			//공지 여부 바꾸기
			//현재 값 가져오기
			var res = $("input[name=ntcYn]").val();
			console.log(res);
			//현재 값 비우기
			$("input[name=ntcYn]").empty();
			//변경 값 넣기
			var resChange = $("input[name=ntcYn]").attr('value','N');
			//변경 값 확인
			console.log($("input[name=ntcYn]").val());
		}
		
		
	}
	
	//피드 등록 시 투표 버튼 클릭
	function fn_vote(e){
		console.log(e.className);
		
		if(e.className === 'btn btn-outline-warning btn-rounded mb-2'){
			//클릭된 버튼 색 바꾸기
			$(e).removeClass('btn btn-outline-warning btn-rounded mb-2').addClass('btn btn-warning btn-rounded mb-2');
			//버튼 창 추가
			$(".voteSection").show();
			
		}else{
			//클릭된 버튼 색 해제
			$(e).removeClass('btn btn-warning btn-rounded mb-2').addClass('btn btn-outline-warning btn-rounded mb-2');
			$(".voteSection").empty();
			$(".voteSection").hide();
		}
		
	}
	
		//투표 등록 화면
		//투표 +버튼 눌렀을 때 아래 input태그 추가하기
		var maxAppend = 1; //버튼 클릭 횟수 저장
		$(document).on("click", ".votePlus", function(){
			
			maxAppend++;
			
			var voteCon = '<div class="input-group mb-3">';
			voteCon += '<input type="text" name="vtItm" class="form-control" placeholder=" 투표 내용을 입력해주세요" style="width:340px; height: 37px;">';
			voteCon += '<div class="input-group-append">';
			voteCon += '<button class="btn btn-outline-dark mb-1 votePlus" type="button" style="margin-right: 0px;">';
			voteCon += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>';
			voteCon += '</button>';
			voteCon += '<button class="btn btn-outline-dark mb-1 voteMinus" type="button">';
			voteCon += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg>';
			voteCon += '</button>';
			voteCon += '</div>';
			voteCon += '</div>';
			
			if(maxAppend < 6){ //최대 5개까지 제한
				$(".voteSection").append(voteCon);
			}else{
				return false;
			}
			
			
		})
		
	//투표 -버튼 눌렀을 때 해당 내용 지우기
	$(document).on("click", ".voteMinus", function(e){
		$(this).parent().parent().remove();
	})
	
	//투표 선택했을 때
	function fn_doVote(e, vtNo){
		//선택지 항목 가져오기
		var vtIt = $("input:radio[name=vtItem]:checked", $(e).parent().prev()).val();
		console.log(vtIt);

		//선택한 항목의 번호 가져오기
		var optnNo = $("input[name=optnNo]", $(e).parent().prev()).val();
		console.log(optnNo);
		
		$.ajax({
			type : "post",
			url : "/vote/insertRslt.do",
			data : {
				"vtNo" : vtNo,
				"optnNo" : optnNo,
				"mbrId" : mbrId
			},
			dataType : 'text',
			success : function(res) {
				console.log("success");
				//내가 누른 항목 checked 유지
				
				
				//투표 카운트 바꾸기
				
			},
			error : function(res) {
				console.log("error");
			}
		});
		
	}
	
	//피드 등록 시 위치 버튼 클릭
	function fn_map(e){
		
		//위치버튼 눌렀을 때
		if(e.className === 'btn btn-outline-info btn-rounded mb-2'){
			//클릭된 버튼 색 바꾸기
			$(e).removeClass('btn btn-outline-info btn-rounded mb-2').addClass('btn btn-info btn-rounded mb-2');
			//버튼 창 추가
			$(".mapSection").show();
			
		}else{
			//클릭된 버튼 색 해제
			$(e).removeClass('btn btn-info btn-rounded mb-2').addClass('btn btn-outline-info btn-rounded mb-2');
			$(".mapSection").empty();
			$(".mapSection").hide();
		}
		
	}
	//다음 우편번호 검색
	function openHomeSearch(){
		
		new daum.Postcode({
	        oncomplete: function(data) {
	            $("#address").val(data.address);
	            $("#address").prop("readonly",true);
	            $("input[name=place]").val(data.sido);
	            var juso =  $("#address").val();
	            
	            var geocoder = new kakao.maps.services.Geocoder();
	        	geocoder.addressSearch(juso, callback);  
				$("#map").show();
	        }
	    }).open()
	}
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			//경도
			var lng = $("input[name=lng]").val(result[0].x);
			var lg = lng.val();
			//위도
			var lgt = $("input[name=lat]").val(result[0].y);
			var lt = lgt.val();
			
			var addr = $("input[name=address]").val();
			console.log(addr);
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(lt, lg), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lt, lg); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var iwContent = '<div style="padding:5px; width: 250px; height: 30px; text-align:center;">'+addr+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(lt, lg); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			
		}
	};
	
	//피드 등록 시 이미지 버튼 클릭
	function fn_image(e){
		
		//이미지 버튼 눌렀을 때
		if(e.className === 'btn btn-outline-danger btn-rounded mb-2'){
			//클릭된 버튼 색 바꾸기
			$(e).removeClass('btn btn-outline-danger btn-rounded mb-2').addClass('btn btn-danger btn-rounded mb-2');
			
			//파일 담을 모달창 띄우고
			
			$(".imageSection").show();
			
		}else{
			//클릭된 버튼 색 해제
			$(e).removeClass('btn btn-danger btn-rounded mb-2').addClass('btn btn-outline-danger btn-rounded mb-2');
			$(".imageSection").empty();
			$(".imageSection").hide();
		}
		
	}

	//피드 삭제 버튼 클릭 시 이벤트 발생
	function fn_delete(pstNo) {
		  const swalWithBootstrapButtons = swal.mixin({
				confirmButtonClass : 'btn btn-success btn-rounded',
				cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			    buttonsStyling: false,
			  })
			
			  swalWithBootstrapButtons({
			    title: '삭제하시겠습니까?',
			    text : "",
			    type: 'warning',
			    showCancelButton: true,
			    confirmButtonText: '삭제하기',
			    cancelButtonText: '취소하기',
			    reverseButtons: true,
			    padding: '2em'
			  }).then(function(result) {
			    if (result.value) {
			      swalWithBootstrapButtons('삭제되었습니다', '', 'success'
			      ).then(function(result){
				  	if(result){
				  		location.href="/feed/main.do?pjtNo="+<%=pjtNo%>; 
				  	}
			  		})
			      
				    $.ajax({
					type : "post",
					url : "/feed/delete.do",
					data : {"pstNo" : pstNo},
					dataType : 'text',
					success : function(res) {
						console.log("success");
					}
				})
			      	
			    } else if (
				      // Read more about handling dismissals
				      result.dismiss === swal.DismissReason.cancel) {
				      swalWithBootstrapButtons('삭제가 취소되었습니다.', '', 'error')}
				}   
		      ).then(function(result){
			  	if(result){
<%-- 				  		location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;  --%>
					return false;
			  	}
		  		})
			    
		}
		
	
	//취소 버튼 클릭 시 피드 새로고침 -> 다른 방법 찾기
	function fn_cancel(){
		return false;
	}
	
	//좋아요
	var change;
	function fn_like(e, pstNo){
		console.log(e.className);
		
		//좋아요 클릭한 피드번호
		console.log(pstNo);
		
		//해당 피드 좋아요 개수 가져오기
		var $count = $(e).parent().next();
		console.log("$count",$count);
		$.ajax({
			type : "post",
			url : "/feed/checkLikes.do",
			data : {
				"pstNo" : pstNo,
				"mbrId" : mbrId,
			},
			dataType : 'json',
			success : function(res) {
// 				console.log("res",res)
				//좋아요 버튼 바꾸기
				e.removeChild(e.children[0]);
				console.log(">>>>>>>>"+res);
				if(res.myLike==0){  //나의 좋아요 체크
					change = "<svg class='colorLike' xmlns='http://www.w3.org/2000/svg' width='32' height='32' fill='currentColor' class='bi bi-hand-thumbs-up-fill' viewBox='0 0 16 16'><path d='M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z'/></svg>"
				}else{ //나의 좋아요 해제
					change = "<svg class='blankLike' xmlns='http://www.w3.org/20 00/svg' width='32' height='32' fill='currentColor' class='bi bi-hand-thumbs-up' viewBox='0 0 16 16'><path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/></svg>"
				}
				$(e).append(change);
				$count.text(res.count);
				
			},
			error : function() {
				console.log("error");
			}
		});
		
	}
	//댓글
	
	//댓글 등록
	function fn_cmntInsert(e, pstNo) {
		console.log(pstNo);
		
		
		var thisCl = $(e).prev().prev().attr("class");
		console.log("지금 클래스 이름",thisCl);
		
		var cmntIn = ""; //댓글 내용을 담을 변수
		
		if(thisCl == "skills form-control col-md-10 mx-auto"){
			cmntIn = $(e).parent().parent().find(".skills").text();
			$(e).parent().parent().find(".skills").empty();
		}else if(thisCl == "skillsChange form-control col-md-10 mx-auto"){
			cmntIn = $(e).parent().parent().find(".skillsChange").text();
			$(e).parent().parent().find(".skillsChange").empty();
		}
		
// 		if(userId != null){
// 			console.log(userId);
// 		}
		
// 		var section = $('.commentBox', $(e).prev().parent().prev()).val();
		
		$.ajax({
			type : "post",
			url : "/feed/cmntInsert.do",
			data : {
				"pstNo" : pstNo,
				"cmntCn" : cmntIn,
				"alertId" : JSON.stringify(userId) //멘션 시 알려줄 아이디
			},
			dataType : 'json',
			async : false,
			success : function(res) {
				console.log("success");
				console.log("res.rcvId", res.rcvId);
				console.log("res.vo", res.vo.MBR_ID);
				//멘션 보여주기
             	sock.send(res.rcvId);
				
				//성공 시 댓글 목록에 추가하기
				var str = '<div class="media comment">';
                str += '<div class="usr-img mr-2">';
                str += '<img src="/resources/profileImage/'+res.vo.MBR_IMG+'"class="br-img">';
                str += '</div>';
                str += '<div class="media-body align-self-center" style="margin-left: 10px;">';
                str += '<input type="hidden" class="cmntNo" name="cmntNo" value="'+res.vo.CMNT_NO+'">';
                str += '<p class="d-inline" style="display: inline-block;"><b>'+res.vo.MBR_NM+'</b></p>&nbsp;&nbsp;';
                str += '<p id="cmntCn" style="display: inline-block;">'+res.vo.CMNT_CN+'</p>';
                str += '<div id="ctUpdateform" style="display:none; margin-top: 10px; text-align: center;">';
                str += '<input type="text" class="ctUpdate form-control col-md-10 mx-auto" id="ctUpdate" style="display: inline-block;">';
                str += '<button id="ctUndateBtn" class="btn btn-success mb-2" type="button" style="display: inline-block;" onclick="fn_cmntUpdate('+res.vo.CMNT_NO+')">수정</button>';
                str += '</div>';
                str += '</div>';
                str += '<div class="media-notation">';
                str += '<p id="cmntDt" style="margin-top : 15px; margin-right :15px; display: inline-block; font-size: 15px; color: #36454f; ">'+res.vo.CMNT_DT+'</p>';
                str += '<a href="javascript:void(0);" class="cmntUpdate"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16"><path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"/></svg></a>';
                str += '&nbsp;';
                str += '<a href="javascript:void(0);" class="cmntDelete" onclick="fn_cmntDelete('+res.vo.CMNT_NO+')"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></a>';
                str += '</div>';
                str += '</div>';
                

				//댓글창 마지막에 추가
				$(e).parents(".input-form").prev().append(str);

		        //댓글 입력창 비워주기
				$(".skillsChange").empty();
				//바꾼 클래스명 되돌리기
			    $(".skillsChange form-control col-md-10 mx-auto").attr("class","skills form-control col-md-10 mx-auto");
			},
			error : function() {
				console.log("error");
			}
		});
	}
	
	//수정내용 보내기
	function fn_cmntUpdate(cmntNo){
		
		var ctCon = $("#ctUpdate").val();
		console.log(ctCon);
		
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})

		swalWithBootstrapButtons({
			title : '수정하시겠습니까?',
			text : "",
			type : 'warning',
			showCancelButton : true,
			confirmButtonText : '수정하기',
			cancelButtonText : '취소하기',
			reverseButtons : true,
			padding : '2em'
		}).then(function(result) {
			if (result.value) {
				swalWithBootstrapButtons('수정되었습니다', '', 'success'
		).then(function(result){
		  	if(result){
		  		location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
		  	}
	  	})
		
		$.ajax({
			type : "post",
			url : "/feed/cmntUpdate.do",
			data : {
				"cmntNo" : cmntNo,
				"cmntCn" : ctCon
			},
			dataType : 'text',
			success : function(res) {
				console.log("success");
				//해당 댓글을 수정한 목록 가져오기
<%-- 				location.href="/feed/main.do?pjtNo="+<%=pjtNo%>; --%>
			},
			error : function(res) {
				console.log("error");
			}
		})
		
		} else if (
				// Read more about handling dismissals
				result.dismiss === swal.DismissReason.cancel) {
					swalWithBootstrapButtons('댓글 삭제가 취소되었습니다', '', 'error')}
	}
			).then(function(result){
				if (result) {
					location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
				}
			})
		}
	
	//댓글 삭제
// 	$(document).on("click", ".voteMinus", function(cmntNo){
	function fn_cmntDelete(cmntNo){
		
		//삭제할 댓글 번호
		console.log(cmntNo);
		
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})

		swalWithBootstrapButtons({
			title : '삭제하시겠습니까?',
			text : "",
			type : 'warning',
			showCancelButton : true,
			confirmButtonText : '삭제하기',
			cancelButtonText : '취소하기',
			reverseButtons : true,
			padding : '2em'
		}).then(function(result) {
			if (result.value) {
				swalWithBootstrapButtons('삭제되었습니다', '', 'success'
		).then(function(result){
		  	if(result){
		  		location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
		  	}
	  	})
			$.ajax({
				type : "post",
				url : "/feed/cmntDelete.do",
				data : {"cmntNo" : cmntNo},
				dataType : 'text',
				success : function() {
					console.log("success");
// 					location.href="/feed/main.do?pjtNo="+getpjtNo;
				},
				error : function() {
					console.log("error");
				}
			})

			} else if (
					// Read more about handling dismissals
					result.dismiss === swal.DismissReason.cancel) {
						swalWithBootstrapButtons('댓글 삭제가 취소되었습니다', '', 'error')}
		}
				).then(function(result){
					if (result) {
						location.href="/feed/main.do?pjtNo="+<%=pjtNo%>;
					}
				})
		}
	
	//웹소켓
	var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint';
	console.log("위치",url);
	webSocket = connection(url);
	var connectionType;

	webSocket.onopen = function(){ processOpen(); };
	webSocket.onmessage = function(message) { processMessage(message); };
	function connection(url) {
		var webSocket = null;
		if ('WebSocket' in window) {
			webSocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			webSocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return webSocket;
	}
	
	function processOpen() {
		connectionType = "firstConnection";
		username = "${member.mbrId}";
		webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
	}
	
	var jsonDataTemp;
	//server에서 메시지가 넘어왔을때
	function processMessage(message) {
		var jsonData = JSON.parse(message.data);

		console.log("jsonData.allUsers : " + jsonData.allUsers);
		console.log("jsonData.disconnectedUser : " + jsonData.disconnectedUser);
		
		
		if (jsonData.allUsers != null) {
			jsonDataTemp = jsonData.allUsers;
			//다른 사용자 접속 시,
			displayUsers(jsonData.allUsers);
		} 
		
		if (jsonData.disconnectedUser != null) {
			console.log("jsonDataTemp : " + JSON.stringify(jsonDataTemp));	//백업
			console.log("jsonData.disconnectedUser : " + JSON.stringify(jsonData.disconnectedUser)); //나간회원
			
			let jsonDataArr = new Array();
			let cnt = 0;
			let exitUser = JSON.stringify(jsonData.disconnectedUser);
			exitUser = exitUser.replace(/\"/gi, "");
			//백업 - 나간회원
			$.each(jsonDataTemp,function(i,value){
					console.log("value : " + value + ", value2 : " + exitUser);
					if(value!=exitUser){
						jsonDataArr[cnt] = value;
						cnt++;
					}
			});
			
			console.log("jsonDataArr : " + jsonDataArr);
			//json
			jsonDataTemp = jsonDataArr;
			
			//다른 사용자가 접속을 끊을 때,
			$("#"+jsonData.disconnectedUser).remove();
			//배열
			displayUsers(jsonDataArr);
			webSocket.close();
		}
	}
	
	
	function displayUsers(userList) {
		console.log("userlist:",userList);
		getAllMbr(pjtNo, userList);
	}
	
	window.onbeforeunload = function() {
		webSocket.close();
	};
	
	//클라우드 사용량 표시	
	function triggerTransition(){
	  d3.select("#rectArea")
	    .transition()
	    .delay(100)
	    .duration(3000)
	    .attr("width", total)
	}
</script>

<!-- 피드 section 시작 -->
<div class="layout-px-spacing">
	<div class="bodyDiv">
		<div class="leftDiv" style="width:78%;">
			<div id="timelineProfile" class="col-lg-12 layout-spacing">
					<div class="widget-header">
					
							<div class="col-xl-12 col-md-12 col-sm-12 col-12" style="padding-top: 10px; margin-bottom:25px;">
								<h4>
									<button type="button" class="btn btn-outline-primary writeBtn" style="float:right; margin-right:10px;" data-toggle="modal" data-target="#addTaskModal">
<!-- 										<font><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" -->
<!-- 												stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2"> -->
<!-- 												<path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></font> -->
											피드 추가
									</button>
								</h4>
							</div>
							<br>
						
					<!-- 피드 section 시작 -->
					<c:if test="${size <= 0 }">
					<div class="widget-content widget-content-area" style="padding : 20px 0px 10px 10px; margin-bottom: 10px;">
						<h4 style="text-align: center">해당 피드에 게시글이 없습니다.</h4>
					</div>
					</c:if>
					<c:forEach var="vo" items="${list}">
					<div class="widget-content widget-content-area" style="padding : 20px 0px 10px 10px; margin-bottom: 10px;">
								<div class="pstCon">
									<span id="${vo.PST_NO}"></span>
									<div class="timeline-simple">
										<div class="timeline-list" style="margin-top: 10px;">
											<div class="timeline-post-content" style="margin-left: 40px; margin-right: 40px;">
												<div class="user-profile" style="display: inline-block; height: 200px;">
													<!-- 공지 라벨 시작-->
													<c:if test="${vo.NTC_YN eq'Y'}">
<!-- 														<div class="notification" class="badge badge-pills outline-badge-primary";  style="display: flex; justify-content: center; margin-bottom : 10px;"> -->
														<span class="badge badge-pills outline-badge-primary" style="display: flex; justify-content: center; margin-bottom : 10px;">
															<svg "http://www.w3.org/2000/svg" width="24" height="24"
																viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
																stroke-linejoin="round" class="feather feather-bell">
														<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
														<path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
															공지
														</span>
													</c:if>
													<!-- 공지 라벨 끝-->
													<!-- 프로필 사진 -->
													<img src="/resources/profileImage/${vo.MBR_IMG}" class="feedProfile">
												</div>
												<div class="feedSection" style="float: right; width: 85%; margin-bottom: 30px;">
													<div class="feed" style="margin-bottom: 20px;">
														<h4>${vo.MBR_NM}</h4>
														 <p class="writeDate" style="font-size: 17px; color: #515365;">${vo.PST_WRT_DT}</p>
														<input type="hidden" class="pstNo" name="pstNo" value="${vo.PST_NO}"> <input type="hidden" class="ntcYn" name="ntcYn" value="${vo.NTC_YN}">
														<!-- 로그인한 아이디가 작성자 아이디와 같을 때 수정 삭제 버튼 보여주기 -->
														<!-- 피드 삭제 -->
														<c:if test="${vo.MBR_ID eq member.mbrId }">
														<button type="button" class="btn btn-outline-primary" style="float: right; margin: 5px; margin-right:30px;" onclick="fn_delete(${vo.PST_NO})">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"> <polyline points="3 6 5 6 21 6"></polyline>
																<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
																<line x1="10" y1="11" x2="10" y2="17"></line>
																<line x1="14" y1="11" x2="14" y2="17"></line></svg>
														</button>
														<!-- 피드 수정 -->
														<button type="button" class="btn btn-outline-primary updateBtn" style="float: right; margin: 5px;" data-toggle="modal" data-target="#addTaskModal">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
															  <path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z" />
															</svg>
														</button>
														</c:if>
													</div>
												<div class="feedCn" style="font-size: 17px; margin-left:80px;">
													<p class="post-text" data-todohtml="<p>${vo.PST_CN}</p>">${fn:replace(vo.PST_CN, cn, br)}</p>
													<br><br>
												</div>	
													<!-- 이미지, 투표, 지도 들어갈 부분 -->
													
													<!-- 이미지 들어갈 공간 -->	
														<c:forEach var="pstImg" items="${image}">
		<!-- 												<img src="/resources/assets/img/90x90.jpg" alt=""> -->
															<c:if test="${vo.imageYn == true && vo.PST_NO eq pstImg.pstNo}">
																<div class="imagePart" style="margin-top: 10px; display : inline-block;">
																	<img src="/feed/imageView.do?fileName=${pstImg.trsmFileNm}" style="width : 345px; margin-left:28px; margin-bottom:20px; display : inline-block;" alt="">
																</div>
															</c:if>
														</c:forEach>
													
													<!-- 투표  -->
													<!-- 투표 내용 들어갈 공간 -->
													<div class="voteContent">
														<c:forEach var="fr" items="${vtFrmtList }">
															<c:if test="${vo.PST_NO eq fr.pstNo && fr.vtDt != null}">
																<div class="vtContent">
																	<p style="display: inline-block;">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bookmark"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
																		<b>마감일 : </b>&nbsp;${fr.vtDt }&nbsp;
																	</p>
																	<c:choose>
																		<c:when test="${fr.annYn eq 'Y'}">
																			<p style="display: inline-block; float: right">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
																			&nbsp;익명투표</p>
																		</c:when>
																		<c:otherwise>
																			<p style="display: inline-block; float: right">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
																			&nbsp;실명투표</p>
																		</c:otherwise>
																	</c:choose>
																	<br>
																	<!-- 투표 내용 출력 -->
																	<c:forEach var="vt" items="${vote}">
																		<c:if test="${fr.vtNo eq vt.vtNo}">
																			<label class="new-control new-radio radio-primary" style="display: block; margin-left: 10px;">
																				<input type="radio" class="new-control-input" name="vtItem" id="vtItem" value="${vt.vtItm }" size="20px;">
																				<input type="hidden" id="optnNo" name="optnNo" value="${vt.optnNo }">
																				<span class="new-control-indicator"></span>
																				<span class="new-radio-content" style="font-size: 17px;">${vt.vtItm }</span>
																				<div class="vtRes" style="display: inline-block; float: right; margin-right: 10px;">
																				
																					<!-- 투표 전체 결과 출력 -->
																					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
																					<div style="display: inline-block;" id="${vt.optnNo }">0</div>
																					<c:forEach var="resVote" items="${resVt}">
																							<c:if test="${vt.optnNo eq resVote.optnNo && vt.vtItm != null}">
																							<script>
																							$(function(){
																								$.ajax({
																									url: "/feed/resultVote",
																									data: {"optnNo" : '${resVote.optnNo}', "vtNo":'${vt.vtNo}'},
																									type: "post",
																									dataType: "text",
																									success: function(res){
																										$('#${resVote.optnNo}').text(res.substr(9, 1))
																									}
																								})
																							})
																							
																							</script>
																							<%-- <p id="count" style="display: inline-block; font-size : 23px;">${vo.count}</p> --%>
																									<!-- 투표 항목 별 수 카운트 -->
<%-- 																									<c:forEach var="getCnt" items="${getCount}"> --%>
<%-- 																										<c:if test="${resVote.optnNo eq getCnt.OPTN_NO}"> --%>
<%-- 																										&nbsp;<b id="vtCount" style="font-size:17px;">${getCnt.CNT}</b> --%>
<%-- 																										</c:if> --%>
<%-- 																									</c:forEach> --%>
																									<!-- 익명 투표가 아니면 각 항목별 투표자 출력 -->
																									<c:if test="${fr.annYn eq 'N'}">
																										<c:forEach var="vtVr" items="${vtVoter}">
																											<c:if test="${resVote.optnNo eq vtVr.OPTN_NO}">
							                                    										&nbsp;<b id="vtName">${vtVr.MBR_NM}</b></c:if>
							                                    										</c:forEach>
																									</c:if>
																							</c:if>
																					</c:forEach>

																				</div>
																			</label>
																		</c:if>
																	</c:forEach>
																	<div class="voteBtn" style="display: block; text-align: center;">
																		<button class="btn btn-outline-primary" id="doVote" type="button" onclick="fn_doVote(this,${fr.vtNo})">투표하기</button>
																	</div>
																</div>
															</c:if>
														</c:forEach>
													</div>

								<!-- 지도 들어갈 공간 -->
								<c:forEach var="mapInfo" items="${map}">
									<c:if test="${vo.PST_NO eq mapInfo.pstNo && mapInfo.mapLat != null}">
<!-- 										<h6 style="display: inline-block;"> -->
<!-- 											<svg xmlns="http://www.w3.org/2000/svg" width="24" -->
<!-- 												height="24" viewBox="0 0 24 24" fill="none" -->
<!-- 												stroke="currentColor" stroke-width="2" -->
<!-- 												stroke-linecap="round" stroke-linejoin="round" -->
<!-- 												class="feather feather-map-pin"> -->
<!-- 												<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path> -->
<%-- 												<circle cx="12" cy="10" r="3"></circle></svg> --%>
<!-- 											<strong>주소</strong> -->
<!-- 										</h6> -->
<%-- 										<span style="display: inline-block;">&nbsp;&nbsp;${mapInfo.mapAddr}</span> --%>

										<div class="map${vo.PST_NO}" id="map${vo.PST_NO}" style="width: 345px; height: 345px; margin-left:30px; display:inline-block;">
											<script>
		                                    
		                                    var mapContainer2 = document.getElementById('map${vo.PST_NO}'), // 지도를 표시할 div
		                                    mapOption2 = {
		                                        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		                                        level: 3 // 지도의 확대 레벨
		                                    };

		                               		//지도를 미리 생성
		                               		var map2 = new daum.maps.Map(mapContainer2, mapOption2);
		                               		//주소-좌표 변환 객체를 생성
		                               		var geocoder2 = new daum.maps.services.Geocoder();
		                               		//마커를 미리 생성
		                              		var marker2 = new daum.maps.Marker({
		                              		position: new daum.maps.LatLng(37.537187, 127.005476),
		                              		map: map2
		                             		});
		                                    // 주소로 상세 정보를 검색
		                                    geocoder2.addressSearch('${mapInfo.mapAddr}', function(results, status) {
		                                        // 정상적으로 검색이 완료됐으면
		                                        if (status === daum.maps.services.Status.OK) {

		                                            var result = results[0]; //첫번째 결과의 값을 활용

		                                            // 해당 주소에 대한 좌표를 받아서
		                                            var coords2 = new daum.maps.LatLng('${mapInfo.mapLat}', '${mapInfo.mapLot}');
		                                            // 지도를 보여준다.
		                                            mapContainer2.style.display = "block";
		                                            map2.relayout();
		                                            // 지도 중심을 변경한다.
		                                            map2.setCenter(coords2);
		                                            // 마커를 결과값으로 받은 위치로 옮긴다.
		                                            marker2.setPosition(coords2);
		                                            
		                                			var iwContent2 = '<div style="padding:5px; width:300px; height: 30px; text-align:center;">'+'${mapInfo.mapAddr}'+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		                            			    iwPosition2 = new kakao.maps.LatLng('${mapInfo.mapLat}', '${mapInfo.mapLot}'); //인포윈도우 표시 위치입니다
						
			                            			// 인포윈도우를 생성
			                            			var infowindow2 = new kakao.maps.InfoWindow({
			                            			    position : iwPosition2, 
			                            			    content : iwContent2 
			                            			});
		                            			  
		                            			// 마커 위에 인포윈도우를 표시 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨
		                            				infowindow2.open(map2, marker2); 
		                                        }
		                                    });
		                    	        	
		                                   
	                                      	</script>
											</div>
										</c:if>
									</c:forEach>
												</div>
												<!-- 좋아요 시작 -->
												<div class="LikesSection col-md-12" style="display: inline-block;">
													<a class="likeBtn" href="javascript:" style="display: inline-block;">
														<!-- 내가 누른 좋아요가 아닐때 -->
														<c:if test="${vo.yn == false}">
<!-- 															<div class="likeb"> -->
															<div class="likeb" onclick="fn_like(this, ${vo.PST_NO})">
																<!-- 좋아요 버튼  들어갈 공간-->
																<svg class="blankLike" xmlns="http://www.w3.org/20 00/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
																	<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" /></svg>
															</div>
														</c:if>
														<!-- 내가 누른 좋아요 일때 -->
														<c:if test="${vo.yn == true}">
<!-- 															<div class="likec"> -->
															<div class="likec" onclick="fn_like(this, ${vo.PST_NO})">
																<svg class="colorLike" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
																	<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" /></svg>
															</div>
														</c:if>

													</a>
													<p id="count" style="display: inline-block; font-size : 23px;">${vo.count}</p>
												</div>
												<!-- 좋아요 끝 -->
											</div>
											<!-- 댓글 -->
											<div class="cmntSection col-md-12 mx-auto">
												<!-- 댓글 목록 -->
<!-- 												<blockquote class="blockquote media-object" style="box-shadow: none; margin-top: 10px;"> -->
<!-- 													<div class="commentBox" style="border: 1px solid #29347a; border-radius: 5px; margin-top: 10px; padding-bottom: 20px;"> -->
													<div class="commentBox" style="overflow-y: scroll;max-height: 200px;">
														<c:forEach var="cmnt" items="${cmnt}">
															<c:if test="${vo.cmntyn == true && vo.PST_NO eq cmnt.PST_NO}">
																<div class="media comment">
																	<div class="usr-img mr-2">
																		<img src="/resources/profileImage/${cmnt.MBR_IMG}" class="br-img">
																	</div>
																	<div class="media-body align-self-center" style="margin-left: 10px;">
																		<!-- 댓글 1개 -->
																		<input type="hidden" class="cmntNo" name="cmntNo" value="${cmnt.CMNT_NO}">
																		<p class="d-inline" style="display: inline-block;">
																			<b>${cmnt.MBR_NM}</b>
																		</p>
																		&nbsp;&nbsp;
																		<p id="cmntCn" style="display: inline-block;">${cmnt.CMNT_CN}</p>

																		<!-- 해당 댓글 수정창 -->
																		<div id="ctUpdateform" style="display: none; margin-top: 10px; text-align: center;">
																			<input type="text" class="ctUpdate form-control col-md-10 mx-auto" id="ctUpdate" style="display: inline-block;">
																			<button id="ctUndateBtn" class="btn btn-outline-primary" type="button" style="display: inline-block;" onclick="fn_cmntUpdate(${cmnt.CMNT_NO})">수정</button>
																		</div>
																	</div>

																	<!-- 로그인한 아이디가 작성자 아이디와 같을 때 수정 삭제 버튼 보여주기 -->
																	<div class="media-notation">
																	<p id="cmntDt" style="margin-top: 15px; margin-right: 15px; display: inline-block; font-size: 15px; color: #36454f;">${cmnt.CMNT_DT}</p>
																	<c:if test="${cmnt.MBR_ID eq member.mbrId }">
																		<!-- 댓글 수정버튼 -->
																		<a href="javascript:void(0);" class="cmntUpdate">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-eraser-fill" viewBox="0 0 16 16">
																				<path d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm.66 11.34L3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z" /></svg></a>
																		&nbsp;
																		<!-- 댓글 삭제버튼 -->
																		<a href="javascript:void(0);" class="cmntDelete" onclick="fn_cmntDelete(${cmnt.CMNT_NO})">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
                                                								<polyline points="3 6 5 6 21 6"></polyline>
                                                								<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                								<line x1="10" y1="11" x2="10" y2="17"></line>
																				<line x1="14" y1="11" x2="14" y2="17"></line></svg>
																		</a>
																	</c:if>
																	</div>
																</div>
															</c:if>
														</c:forEach>
													
<!-- 												</blockquote> -->
												</div>
													<!-- 댓글 작성 -->
													<div class="input-form" style="margin-top: 10px; margin-left: 100px; margin-bottom:20px;">
														<div contenteditable="true" class="skills form-control col-md-10 mx-auto" style="display: inline-block;" id="skills" onkeyup="getAutomaker(event)"></div>
														<div class="autoMaker" style="display:none"></div>
														<button id="add-skills" class="btn btn-outline-primary" type="button" style="display: inline-block;" onclick="fn_cmntInsert(this, ${vo.PST_NO})">등록</button>
													</div>
											</div>
										</div>
									</div>
								</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
			<div class="rightDiv">
			
			<div id="usingAmount" class="widget widget-table-two rightside" style="width : 300px; cursor: pointer; background-color:#fdfdfd;">
			<p class="spantitle">드라이브 사용량</p>
			<div id="chart_div">
			  <svg width="300px" height="100px" >
			      <rect
			        id="rectArea2" x="40" y="10"
			        width="210" height="30" stroke="#666978"
			        fill="#9191c9" stroke-width="0.5"/>
			      <rect
			        id="rectArea" x="40" y="10"
			        width="0" height="30" stroke="black"
			        fill="#0f0f66" stroke-width="0.5"/>
			      <text x="170" y="30" font-size="15" fill="white">${changeMb/200*100}%</text>
					<text x="70" y="75" fill="#0f0f66" font-weight="bold"  font-size="15">
						    ${changeMb}MB
						  </text>
					<text x="140" y="75" fill="#888ea8" font-weight="bold"  font-size="15">
						     / 200MB
						  </text>
			 		 </svg>
				</div>
			</div>
			
		<div class="widget widget-table-two rightside" id="pjtMbrList" style="width : 300px; background-color:#fdfdfd;">
		</div>
		</div>
		
	</div>
	
</div>


<!-- 피드 section 끝 -->

<!-- 글쓰기, 글 수정 모달창 -->
<form id="feedModal" name="feedModal" enctype="multipart/form-data" accept-charset="UTF-8" method="post" action="/feed/inserttest.do">
	<div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="compose-content" id="addTaskModalTitle">
						<h5 class="" style="text-align: center;">Feed</h5>
						<div class="compose-box">
							<div class="row">
								<div class="col-md-12"></div>
							</div>
							<div class="d-flex  mail-subject mb-4">
								<div class="w-100">
									<textarea id="pstCn2" name="pstCn2" rows="8" cols="51" style="font-size: 17px;" placeholder="내용 입력.." onchange="$('#pstCn').val($(this).val());"></textarea>
									<input type="hidden" id="pstCn" name="pstCn">
									<input type="hidden" id="ntcYn" name="ntcYn" value="N">
									<input type="hidden" id="pstNo" name="pstNo">
									<span class="validation-text"></span>
								</div>
							</div>
						</div>
					</div>
					<!-- 위치, 투표, 공지, 이미지 -->
					<div class="form-group col-md-12" style="margin-top: 7px; text-align: center;">
						<button type="button" id="mapC" class="btn btn-info btn-rounded mb-2" style="display: none;" onclick="fn_map(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map">
								<polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon>
								<line x1="8" y1="2" x2="8" y2="18"></line>
								<line x1="16" y1="6" x2="16" y2="22"></line></svg>
							위치
						</button>
						<button type="button" id="mapB" class="btn btn-outline-info btn-rounded mb-2" onclick="fn_map(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map">
								<polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon>
								<line x1="8" y1="2" x2="8" y2="18"></line>
								<line x1="16" y1="6" x2="16" y2="22"></line></svg>
							위치
						</button>
						<!-- 투표 버튼 시작 -->
<!-- 						<button type="button" id="voteC" class="btn btn-warning btn-rounded mb-2" style="display: none;" onclick="fn_vote(this)"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package"> -->
<!-- 									<line x1="16.5" y1="9.4" x2="7.5" y2="4.21"></line> -->
<!-- 									<path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path> -->
<!-- 									<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline> -->
<!-- 									<line x1="12" y1="22.08" x2="12" y2="12"></line></svg> -->
<!-- 							투표 -->
<!-- 						</button> -->
<!-- 						<button type="button" id="voteB" class="btn btn-outline-warning btn-rounded mb-2" onclick="fn_vote(this)"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package"> -->
<!-- 									<line x1="16.5" y1="9.4" x2="7.5" y2="4.21"></line> -->
<!-- 									<path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path> -->
<!-- 									<polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline> -->
<!-- 									<line x1="12" y1="22.08" x2="12" y2="12"></line></svg> -->
<!-- 							투표 -->
<!-- 						</button> -->
						<!-- 투표 버튼 끝 -->

						<!-- 공지 버튼 시작 -->
						<button type="button" id="notifyC" class="btn btn-success btn-rounded mb-2" style="display: none;" onclick="fn_notify(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
									<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
									<path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
							공지
						</button>
						<button type="button" id="notifyB" class="btn btn-outline-success btn-rounded mb-2" onclick="fn_notify(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
									<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
									<path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
							공지
						</button>
						<!-- 공지 버튼 끝 -->


						<button type="button" id="imageC" class="btn btn-danger btn-rounded mb-2" style="display: none;" onclick="fn_image(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
  								<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
  								<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" /></svg>
							이미지
						</button>
						<button type="button" id="imageB" class="btn btn-outline-danger btn-rounded mb-2" onclick="fn_image(this)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
  								<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
  								<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" /></svg>
							이미지
						</button>
					</div>
					<!-- 지도 버튼 클릭 시 보여질 div -->
					<div class="mapSection" style="display: none;">
						<div class="row border-top p-3" style="display:flex; padding-right:0px;">
							<div class="col-2">
								<h6>
									<strong>주소</strong>
								</h6>
							</div>
							<div class="col-auto">
								<input type="hidden" name="place">
								<input type="text" size="32" name="address" id="address" class="form-control">
								<input type="hidden" name="lat">
								<input type="hidden" name="lng">
							</div>
								<a type="button" id="serchPlace" class="btn btn-outline-primary" style="display: inline-block; float:right;" onclick="openHomeSearch()">검색</a>
						</div>
						<!-- 지도 들어갈 공간 -->
						<div id="map" style="width: 100%; height: 300px; display:none;"></div>
					</div>
					<!-- 투표 버튼 클릭 시 보여질 div -->
					<br>
					<div class="voteSection" style="display: none; width:auto;">
						<div class="row border-top p-3" style="width:auto%;  padding-left:20px;">
							<div class="category" style="height:20px; width:100%;">
								<h6>
								<strong style="margin-left:15px;">투표</strong>
								</h6>
							</div>
							<!-- 마감일 -->
							<div class="dateSection" style="margin-left :0px;">
								<div style="display:inline-block;">
									<p style="display: inline-block;">익명여부 :</p>
									<label
										class="switch s-icons s-outline s-outline-dark mb-4 mr-2"
										style="display: inline-block;">
										<input type="checkbox">
										<span class="slider round" style="margin-top: 35px;"></span>
									</label>
								</div>
								<div style="display:inline-block;">		
								<p style="display: inline-block;">마감일 :</p>
								<div class="form-group mb-0" style="display: inline-block;">
									<input id="basicFlatpickr"
										class="form-control flatpickr flatpickr-input" type="text"
										placeholder="투표 마감일을 선택해주세요" style="width:275px;" readonly="readonly">
								</div>
								</div>
							</div>
							<br>
							<div class="input-group mb-3" style="margin-top: 20px;">
							<p id="vtch" style="width:200px;">투표 항목 :</p>
								<input type="text" name="vtItm" class="form-control" placeholder=" 투표 내용을 입력해주세요" style="width:340px; height: 37px;">
								<div class="input-group-append">
									<button class="btn btn-outline-dark mb-1 votePlus" type="button" style="margin-right: 0px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-plus">
											<line x1="12" y1="5" x2="12" y2="19"></line>
											<line x1="5" y1="12" x2="19" y2="12"></line></svg>
									</button>
									<button class="btn btn-outline-dark mb-1 voteMinus" type="button">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-minus">
											<line x1="5" y1="12" x2="19" y2="12"></line></svg>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 이미지 버튼 클릭 시 나올 창 -->
					<div class="imageSection" style="display: none;">
						<div class="row border-top p-3">
							<div class="col-4">
								<h6>
									<strong>첨부파일</strong>
									<br><br>
								</h6>
									<input type="file" accept="image/*" id="input_img" name="uploadFile" multiple/>
							<div class="img_wrap"><br></div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
<!-- 						<button class="btn btn-outline-primary" id="cancle" data-dismiss="modal" onclick="fn_cancle()"> -->
						<button class="btn btn-outline-primary" id="cancle" data-dismiss="modal">
							<i class="flaticon-cancel-12"></i> 취소
						</button>
						<button class="btn btn-outline-primary" id="submit" type="button" onclick="fn_insert()">등록</button>
						<!-- 							<button class="btn add-tsk" id="submit" type="submit">등록</button> -->
						<button class="btn btn-outline-primary" id="modify" type="button" style="display: none;" onclick="fn_update(pstCn, pstNo, ntcYn)">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<sec:csrfInput />
</form>


<!-- END MAIN CONTAINER -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/js/app.js"></script>

<script>
        $(document).ready(function() {
            App.init();
        });
    </script>
<script src="/resources/assets/js/apps/jhm.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY STYLES -->
<script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>

<script src="/resources/assets/js/apps/todoList.js"></script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
<script src="/resources/plugins/highlight/highlight.pack.js"></script>

<script src="/resources/plugins/flatpickr/flatpickr.js"></script>
<script src="/resources/plugins/noUiSlider/nouislider.min.js"></script>
<script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>

<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/resources/assets/js/apps/contact.js"></script>

<script src="/resources/plugins/editors/quill/quill.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script type="text/javascript">
		//투표 마감일 선택창 띄우기
		var f1 = flatpickr(document.getElementById('basicFlatpickr'));
		
		//오늘 이전 날짜 선택 금지
		$(".flatpickr-input").flatpickr({
			minDate:"today",
			maxDate:new Date().fp_incr(30)
		});
    </script>