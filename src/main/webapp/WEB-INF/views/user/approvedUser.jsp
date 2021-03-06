<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="/resources/assets/js/jsa/approvedUser.js"></script>

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet"
	type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet"
	type="text/css" class="structure">
<link href="/resources/plugins/drag-and-drop/dragula/dragula.css"
	rel="stylesheet" type="text/css">
<link href="/resources/plugins/drag-and-drop/dragula/example.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/css/jsa/approvedUser.css" rel="stylesheet"
	type="text/css" class="structure">
<link href="/resources/assets/css/jsa/projectMain.css" rel="stylesheet"
	type="text/css" class="structure">
	
	
<link href="/resources/assets/css/elements/tooltip.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="/resources/sassets/css/forms/theme-checkbox-radio.css">

<script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
<link href="/resources/plugins/animate/animate.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css"
	rel="stylesheet" type="text/css" />



<style>
#right-defaults {
	overflow: auto;
	height: 600px;
}

#right-defaults::-webkit-scrollbar {
	display: none;
}

.chkAdmin {
	position: relative;
	top: 10px;
	left: -6px;
}
</style>

<script>
	var flag = true; //관리자 지정 체크박스 토글용
	$(function() {
		getM02Users(); //승인사용자
		getM03Users(); //미승인사용자

		$("#getName").on("keyup", function() { //검색
			console.log($(this).val());
			var keyword = $(this).val();
			getM02Users(keyword);
			getM03Users(keyword);
		})
		
		
		//관리자 지정 버튼 클릭 시
		$(document).on("click", "#setAdmin", function(){
			$(this).hide();
			$("#addAdmin").show();
			setAdmin(flag);
			flag = !flag;
			console.log("flag:"+flag);
		})

		//관리자 저장 시
		$(document).on("click","#addAdmin",function(){
			var list = [];
			
			if(!($("input:checkbox").is(":checked"))){
				$("#addAdmin").hide();
				$("#setAdmin").show();
				console.log("flag:", flag);
				setAdmin(flag);
				flag = !flag;				
			}
			
			$("input:checkbox:checked").each(function(){
				var admin = $(this).parents(".text-center").children(".media-body").find("h6").find(".badge");
				var mbrNm = $(this).parents(".text-center").children(".media-body").find("h6").text();
				mbrNm = mbrNm.substr(0, 3);

				if (admin.length > 0) {//관리자라면
					confirm(mbrNm, $(this).val());
				} else {
					list.push($(this).val());
					console.log(list);
					addAdmin(list);
				}
			})
		})

	})
</script>

<div class="adminDiv">
<!-- 	<div class="statbox widget box box-shadow"> -->
<!-- 		<div class="widget-header"> -->
<!-- 			<div class="row"> -->
<!-- <!-- 				<div class="col-xl-12 col-md-12 col-sm-12 col-12"> -->
<!-- <!-- 					<h4></h4> -->
<!-- <!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<div class="widget-content widget-content-area"
	style="width:100%; height: auto; position:relative; top:-55px; left:-45px;">
	<div class="full-search search-form-overlay input-focused">
		<div class="form-inline form-inline search mt-lg-0"
		 style="padding-top: 50px; padding-left: 100px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="search-bar">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
					class="feather feather-search" data-darkreader-inline-stroke=""
					style="-darkreader-inline-stroke: currentColor;">
					<circle cx="11" cy="11" r="8"></circle>
					<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
				<input type="text" style="width: 800px;" id="getName"
					class="form-control search-form-control  ml-lg-auto"
					placeholder="이름을 검색하세요">
			</div>
			<div style="margin-left: 50px; margin-top: 5px;">
				<form action="/user/excelDown" method="post">
					<button class="btn btn-outline-primary mb-2" type="submit">엑셀
						다운로드</button>
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
	<div class="parent ex-1" style="margin-top: 30px;">
		<div class="row" style="width:93%; position: relative; left: 50px;">
			<div class="col-sm-6" style="width:49%; padding :10px; position: relative; top: 3px;">
				<h5>미승인</h5>
				<table class="table">
					<thead>
						<tr>
							<th><div class="th-content"></div></th>
							<th><div class="th-content">이름</div></th>
							<th><div class="th-content">소속</div></th>
							<th><div class="th-content th-heading">전화번호</div></th>
							<th><div class="th-content">비고</div></th>
						</tr>
					</thead>
				</table>
				<div id="left-defaults" class="dragula"></div>
			</div>
			<div class="col-sm-6" style="width:49%; padding :10px;">
				<h5>
					승인 <span id="setAdmin" title="관리자 지정" class="bs-tooltip"
						data-placement="top" title=""
						data-original-title="Tooltip on top"
						style="position: relative; left: 481px; cursor: pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-lock">
							<rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
							<path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg></span> 
							
					<span id="addAdmin" title="저장" class="bs-tooltip"
						data-placement="top" title="" data-original-title="Tooltip on top"
						style="position: relative; left: 481px; cursor: pointer; display: none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-unlock">
							<rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
							<path d="M7 11V7a5 5 0 0 1 9.9-1"></path></svg>
					</span>
				</h5>
				<table class="table">
					<thead>
						<tr>
							<th><div class="th-content"></div></th>
							<th><div class="th-content">이름</div></th>
							<th><div class="th-content">소속</div></th>
							<th><div class="th-content th-heading">전화번호</div></th>
							<th><div class="th-content">비고</div></th>
						</tr>
					</thead>
				</table>
				<div id="right-defaults" class="dragula"></div>
			</div>
		</div>
	</div>

</div>
<!-- 	</div> -->
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/resources/plugins/drag-and-drop/dragula/dragula.min.js"></script>
<script src="/resources/plugins/drag-and-drop/dragula/custom-dragula.js"></script>
<script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
<script src="/resources/assets/js/elements/tooltip.js"></script>
