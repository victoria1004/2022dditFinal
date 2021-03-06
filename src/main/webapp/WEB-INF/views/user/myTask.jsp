<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/assets/css/elements/search.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/components/tabs-accordian/custom-tabs.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link href="/resources/assets/css/elements/tooltip.css" rel="stylesheet" type="text/css">
	
	
	
<script src="/resources/assets/js/jsa/projectMain.js"></script>
<script type="text/javascript">
	$(function() {
		
		$.removeCookie('pjtNo', {path: '/'});
		
		$('#chat').on(
				'click',
				function() {
					window.open('/chat/chatMain.do', 'chatting',
							'width=700, height=483'); 
				})

		$.ajax({
					url : "/progressList",
					type : "post",
					success : function(res) {
						var today = new Date();
						var list = res.list;
						var progressList = res.progressList;
						str = "";
						for (i = 0; i < list.length; i++) {
							var day = list[i].PJT_END_YMD
							var dday = new Date(day.substr(0, 4), day.substr(5,
									2) - 1, day.substr(8, 2));
							var gap = dday.getTime() - today.getTime();
							var result = Math.ceil(gap / (1000 * 60 * 60 * 24));
							var aaa = 'D - ' + result
							str += '<div class="statbox widget box box-shadow" style="background-color: #fdfdfd; height: 210px; margin-bottom: 10px; width: 48%; display: inline-block; margin: 10px;">'
							str += '<div class="widget-content widget-content-area" style="padding: 20px 20px 10px;">'
							str += '<span style="margin-right: 30px; display: inline-block; width: 110px; height: 30px; font-size: 1.4em"> 프로젝트명 </span>'
							str += '<div class="sorting_1" style="width: 70%; display: inline-block; margin-bottom: 15px;"><h4 style="margin-top: 10px; margin-bottom: 0px;">'
									+ list[i].PJT_NM + '</h4></div>'
							str += '<br>'
							str += '<span style="margin-right: 15px; display: inline-block; width: 110px; height: 30px; font-size: 1.4em"> 진행률 </span>'
							str += '<div class="sorting_1" style="width: 80%; display: inline-block;">'
							str += '<div class="progress" style="height: 30px; border-radius: 6px">'
							str += '<div class="progress-bar bg-primary bg-gradient-danger" role="progressbar" style="width: '
									+ progressList[i]
									+ '%; border-radius: 6px" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">'
							if (progressList[i] > 0) {
								str += progressList[i] + '%'
							}
							str += '</div></div></div>'
							str += '<div style="display: inline-block; width: 60%">'
							str += '<table style="width: 100%; margin: 20px 25px; font-size: 1.1em; color: black;">'
							str += '<tr>'
							str += '<td>착수일 : ' + list[i].PJT_STRT_YMD
									+ '</td>'
							str += '<td>마감일 : ' + list[i].PJT_END_YMD + '</td>'
							str += '</tr>'
							str += '</table>'
							str += '</div>'
							str += '<div style="display: inline-block; float: right; margin: 20px 25px;">'
							str += '<h4 id="dDay">' + aaa + '</h4>'
							str += '</div>'
							str += '</div></div>'
						}
						$('#progress').html(str);
					},
					error : function(res) {
						alert("error : " + res.status)
					}
				})
	})
</script>
<style>
#status{
	cursor:pointer;
}
#myTodoBox{
	background-color: #fdfdfd; 
	width : 90%; 
	height: 470px; 
	margin-top: -7px;
}
#myTodoContent{
	margin-top: -40px;
	
}
#mainProfile {
	border-radius: 50%;
	width: 130px;
	height: 130px;
}

#myProfile {
    position: relative;
    background-color: #fdfdfd;
    left: -90px;
    top: 64px;
    width: 300px;
}
td {
	/* text-align: center; */
	margin-left: 10px;
}

.todobtn {
	border: 1px solid #56748a !important;
	color: #56748a;
	box-shadow: none;
}

.todobtn:hover {
	background-color: #56748a;
	color: #f1f2f3;
}

#submenu {
	display: none;
}

/* #mainProfile {
	border-radius: 50%;
	width: 90px;
	height: 90px;
} */

.test1{
	position: absolute;
    bottom: 3%;
    width: 100%;
    margin-left: auto;
}
#todoTitle th{
	vertical-align: middle;
}
#animated-underline-todo{
	padding:0px;
}
#animateLine li a{
	font-size: 16px;
}
#animateLineContent-4{
	margin-top: -3%;
	overflow: auto;
}
#todoTr td, #mtrTr td, #goodsTr td{
	text-align: center;
}
.dataTables_wrapper{
	margin-top: -25px;
    margin-left: 19px;
    overflow-y: auto;
    width: 900px;
    height: 300px;
}
.dataTables_wrapper::-webkit-scrollbar {
    display: none;
}
/* .nav-link.active, .nav-link.active::before {
	color: #293279 !important;
} */
</style>
<div class="bodyDiv">
	<!-- 내용 시작 -->
	<div class="leftDiv animated-underline-content" style="margin-left : 10px; width : 1100px;" >
		<div class="statbox widget box box-shadow" id="myTodoBox">
			<div class="widget-header" style="margin-top: 10px;">
				<div class="row" style="margin-top:30px; margin-left: 13px;">
                	<div style="display:flex; justify-content: space-between" class="col-xl-12 col-md-12 col-sm-12 col-12">
                         <h4 style="font-weight: 600; color : #515365; font-size:22px;">나의 업무</h4>
                    </div>
                </div>
				
			</div>
			<br> <br>
		<div class="widget-body" id="myTodoContent">
			<ul class="nav nav-tabs  mb-3" id="animateLine" role="tablist">
				<li class="nav-item"><a class="nav-link  active"
					id="animated-underline-todo-tab" data-toggle="tab"
					href="#animated-underline-todo" role="tab"
					aria-controls="animated-underline-todo" aria-selected="false">일감</a></li>
							
							<li class="nav-item"><a class="nav-link"
					id="animated-underline-mtr-tab" data-toggle="tab"
					href="#animated-underline-mtr" role="tab"
					aria-controls="animated-underline-mtr" aria-selected="false"> 회의실 예약 현황</a></li>
				<li class="nav-item"><a class="nav-link"
					id="animated-underline-goods-tab" data-toggle="tab"
					href="#animated-underline-goods" role="tab"
					aria-controls="animated-underline-goods" aria-selected="false"> 비품 대여 현황</a></li>
					
					<li class="nav-item"><a class="nav-link"
					id="animated-underline-ending-tab" data-toggle="tab"
					href="#animated-underline-ending" role="tab"
					aria-controls="animated-underline-ending" aria-selected="false"> 종료된 프로젝트 </a></li>
							
			</ul>

			<div class="tab-content" id="animateLineContent-4">
			<div class="tab-pane fade active show" id="animated-underline-todo"
				role="tabpanel" aria-labelledby="animated-underline-todo-tab">
				<div class="layout-px-spacing"
						style="margin-left: 0px; margin-top: 20px;">
						<div class="leftDiv" style="padding-top: 0px;">
							<div id="DataTables_Table_0_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
									<table class="multi-table table table-hover dataTable"
											style="width: 100%;" id="DataTables_Table_0" role="grid"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row" id="todoTitle">
													<th>프로젝트명</th>
													<th>일감번호</th>
													<th>제목</th>
													<th>진척도</th>
													<th>시작일</th>
													<th>종료일</th>
												</tr>
											</thead>
											<tbody id="todoTb">
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
			</div>

			<div class="tab-pane fade" id="animated-underline-mtr"
				role="tabpanel" aria-labelledby="animated-underline-mtr-tab">
				<div class="layout-px-spacing"
						style="margin-left: 0px; margin-top: 20px;">
						<div class="leftDiv" style="padding-top: 0px;">
							<div id="DataTables_Table_1_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
									<table class="multi-table table table-hover dataTable"
											style="width: 100%;" id="DataTables_Table_0" role="grid"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>예약번호</th>
													<th>회의실번호</th>
													<th>예약일자</th>
													<th>예약시간</th>
												</tr>
											</thead>
											<tbody id="mtrTb">
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
			</div>

			<div class="tab-pane fade" id="animated-underline-goods"
				role="tabpanel" aria-labelledby="animated-underline-goods-tab">
				<div class="layout-px-spacing"
						style="margin-left: 0px; margin-top: 20px;">
						<div class="leftDiv" style="padding-top: 0px;">
							<div id="DataTables_Table_2_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4" >
								<div class="row">
									<div class="col-sm-12">
									<table class="multi-table table table-hover dataTable"
											style="width: 100%;" id="DataTables_Table_0" role="grid"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>대여번호</th>
													<th>비품번호</th>
													<th>비품명</th>
													<th>대여일</th>
													<th>반납예정일</th>
												</tr>
											</thead>
											<tbody id="goodsTb">
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
			</div>
			
			
			<div class="tab-pane fade" id="animated-underline-ending"
				role="tabpanel" aria-labelledby="animated-underline-ending-tab">
				<div class="layout-px-spacing"
						style="margin-left: 0px; margin-top: 20px;">
						<div class="leftDiv" style="padding-top: 0px;">
							<div id="DataTables_Table_3_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4" >
								<div class="row">
									<div class="col-sm-12">
									<table class="multi-table table table-hover dataTable"
											style="width: 100%; text-align:center;" id="DataTables_Table_0" role="grid"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 200px;">프로젝트 명</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 220px;">개요</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 75px;">시작일</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Age: activate to sort column ascending"
													style="width: 120px;">종료일</th>
												<th class="sorting" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 100px;">종료 구분</th>
											</tr>
									</thead>
											<tbody>
												<c:forEach items="${endProjectList}" var="vo">
													<tr role="row">
														<td class="sorting_1"><a href="/project/projectInfo.do?pjtNo=${vo.pjtNo}">${vo.pjtNm}</a></td>
														<td>${vo.pjtOl}</td>
														<td>${vo.pjtStrtYmd}</td>
														<td class="sorting_1">${vo.pjtEndYmd}</td>
														<td><span id="status" class="badge badge-pills outline-badge-primary">종료</span></td>
													</tr>
													</c:forEach>
													<c:forEach items="${earlyEndProjectList}" var="vo">
													<tr role="row">
														<td class="sorting_1"><a href="/project/projectInfo.do?pjtNo=${vo.pjtNo}">${vo.pjtNm}</a></td>
														<td>${vo.pjtOl}</td>
														<td>${vo.pjtStrtYmd}</td>
														<td class="sorting_1">${vo.pjtEndYmd}</td>
														<td><span id="status" class="badge badge-pills outline-badge-primary">조기 종료</span></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
			</div>
			
			<div class="tab-pane fade" id="animated-underline-goods"
				role="tabpanel" aria-labelledby="animated-underline-goods-tab">
				<div class="layout-px-spacing"
						style="margin-left: 0px; margin-top: 20px;">
						<div class="leftDiv" style="padding-top: 0px;">
							<div id="DataTables_Table_2_wrapper"
								class="dataTables_wrapper container-fluid dt-bootstrap4" >
								<div class="row">
									<div class="col-sm-12">
									<table class="multi-table table table-hover dataTable"
											style="width: 100%;" id="DataTables_Table_0" role="grid"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>대여번호</th>
													<th>비품번호</th>
													<th>비품명</th>
													<th>대여일</th>
													<th>반납예정일</th>
												</tr>
											</thead>
											<tbody id="goodsTb">
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
			</div>
			

		</div>
	</div>
</div>
<!-- 내용 끝 -->
</div>
		

	<div id="rightDiv">
		<div class="user-profile layout-spacing" id="myProfile">
			<div class="widget-content widget-content-area" style="height: 467px; padding : 10px;">
				<div class="text-center user-info" >
					<img id="mainProfile"
						src="/resources/profileImage/<c:if test='${member.mbrImg == null}'>profileimage.png</c:if><c:if test='${member.mbrImg != null}'>${member.mbrImg}</c:if>"
						alt="${member.mbrNm}">
					<p class="">${member.mbrNm}</p>
				</div>
				<div class="user-info-list" style="height: 200px;">
					<div class="">
						<ul class="contacts-block list-unstyled">
							<li class="contacts-block__item"><svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-map-pin">
									<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
									<circle cx="12" cy="10" r="3"></circle></svg>${member.mbrDept}</li>
							<li class="contacts-block__item"><a
								href="mailto:example@mail.com"><svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-mail">
										<path
											d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
										<polyline points="22,6 12,13 2,6"></polyline></svg>${member.mbrEml}</a>
							</li>
							<li class="contacts-block__item"><svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-phone">
									<path
										d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>${member.mbrTelno}
							</li>
							<li class="chatmail"
								style="float: left; margin-left: 55px; margin-right: 10px;">
								<ul class="list-inline" style="margin: 0;">
									<li class="list-inline-item" style="cursor: pointer;">
										<div class="social-icon" id="chat">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-message-circle">
	                                     <path
													d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
										</div>
									</li>
								</ul>
							</li>
							<li class="chatmail" style="float: left;">
								<ul class="list-inline" style="margin: 0;">
									<li class="list-inline-item" style="cursor: pointer;">
									<a href='/user/email.do?mbrId=${member.mbrId}'>
											<div class="social-icon">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-mail"
													data-darkreader-inline-stroke=""
													style="-darkreader-inline-stroke: currentColor;">
			                                     <path
														d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
			                                     <polyline
														points="22,6 12,13 2,6"></polyline>
		                                     </svg>
											</div>
									</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>


</div>
<script type="text/javascript">
	var mbrId = '<c:out value="${member.mbrId}" />';
	
	$(document).ready(function () {
		
		todoSelect();
		
	});
	
	//개인 일감 조회
	function todoSelect(){
		
		$.ajax({
			type : 'post',
			data : {"mbrId" : mbrId},
			dataType:'json',
			url : '/mbr/myTodo.do',
			success : function(res){
				//swal("","todo조회요청");
				console.log("res : ",res);
				if(res.length>0){
					for(var i=0; i<res.length; i++){
						var trStr = "";
						trStr += '<tr role="row" id="todoTr">';
						trStr += '<td>' + res[i].PJT_NM + '</td>';
						trStr += '<td>'+res[i].TD_NO+'</td>';
						trStr += '<td style="text-align: left;"><a style="color:#515365;" href="/project/todoDetail.do?pjtNo=' + res[i].PJT_NO + '&tdNo=' +res[i].TD_NO +'">'+ res[i].TD_TTL + '</a></td>';
						trStr += '<td>'+res[i].PRGRS+'&nbsp;%</td>';
						trStr += '<td>'+res[i].TD_STRT_DT+'</td>';
						trStr += '<td>'+res[i].TD_END_DT+'</td>';
						trStr += '</tr>';
						$("#todoTb").append(trStr);
						}
					}else{
						var trStr = "";
						trStr += '<tr role="row" id="todoTr">';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td >일감이 없습니다.</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '</tr>';
						$("#todoTb").html(trStr);
					}
				
			},error : function(xhr2){
				swal("","전송 오류가 발생했습니다.");
					console.log(xhr.status);
					//alert("상태:"+xhr.status);//404,500,200
			}
		});
	
	};

	$(function() {
		$('#chat').on('click', function() {
			window.open('/chat/chatMain.do', 'chatting',
					'width=900, height=601');
		})
		
		//개인 회의실 예약현황 조회
		$("#animated-underline-mtr-tab").on("click",function() {
			
			$.ajax({
				type : 'post',
				data : {"mbrId" : mbrId},
				dataType:'json',
				url : '/mbr/myMtrRes.do',
				success : function(res){
					console.log("res : ",res);
					if(res.length>0){
						for(var i=0; i<res.length; i++){
							var trStr = "";
							trStr += '<tr role="row" id="mtrTr">';
							trStr += '<td>'+res[i].RSVT_NO+'</td>';
							trStr += '<td>'+res[i].MTR_NO+'</td>';
							trStr += '<td>'+res[i].RSVT_YMD+'</td>';
							trStr += '<td>'+res[i].RSVT_STRT_HR+'&nbsp;시</td>';
							trStr += '</tr>';
							$("#mtrTb").append(trStr);
						}
					}else{
						var trStr = "";
						trStr += '<tr role="row" id="mtrTr">';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td >회의실 이용예약이 없습니다.</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '</tr>';
						$("#mtrTb").html(trStr);
					}
				},error : function(xhr2){
					swal("","전송 오류가 발생했습니다.");
					console.log(xhr.status);
					//alert("상태:"+xhr.status);//404,500,200
				}
			});
		
		});
		
		//개인 비품대여 현황 조회
		$("#animated-underline-goods-tab").on("click",function() {
			
			$.ajax({
				type : 'post',
				data : {"mbrId" : mbrId},
				dataType:'json',
				url : '/mbr/myGoods.do',
				success : function(res){
					console.log("res : ",res);
					if(res.length>0){
						for(var i=0; i<res.length; i++){
							var trStr = "";
							trStr += '<tr role="row" id="goodsTr">';
							trStr += '<td>'+res[i].RNT_NO+'</td>';
							trStr += '<td>'+res[i].GDS_NO+'</td>';
							trStr += '<td>'+res[i].GDS_NM+'</td>';
							trStr += '<td>'+res[i].RNT_DT+'</td>';
							trStr += '<td>'+res[i].RTN_PRNMNT_DT+'</td>';
							trStr += '</tr>';
							$("#goodsTb").append(trStr);
						}
					}else{
						var trStr = "";
						trStr += '<tr role="row" id="goodsTr">';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td >대여한 비품이 없습니다.</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '<td>&nbsp;</td>';
						trStr += '</tr>';
						$("#goodsTb").html(trStr);
					}
				},error : function(xhr2){
					swal("","전송 오류가 발생했습니다.");
					console.log(xhr.status);
					//alert("상태:"+xhr.status);//404,500,200
				}
			});
		
		});
		
		
		
		
	});

		
</script>
