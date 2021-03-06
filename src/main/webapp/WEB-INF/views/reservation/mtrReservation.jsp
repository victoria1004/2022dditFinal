<%@page import="kr.or.ddit.user.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<title>회의실 예약</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!--     <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet"> -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME GLOBAL STYLES -->
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"
	integrity="sha512-u7ppO4TLg4v6EY8yQ6T6d66inT0daGyTodAi6ycbw9+/AU8KMLAF7Z7YGKPMRA96v7t+c7O1s6YCTGkok6p9ZA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">

<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet"
	type="text/css">




</head>
<style>
.res-modal-text { color: #515365!important;}
.modal-body::-webkit-scrollbar {
	display: none;
}

.reserv-table select {
	border-radius: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #eee;
	color: #fff;
}

.reserv-table select option {
	color: #fff;
}

.reserv-table {
	table-layout: fixed;
	margin-top: 5%;
}

.reserv-table th, .reserv-table td {
	text-align: center;
	vertical-align: middle !important;
}

.reserv-table thead th {
	padding-top: 1rem;
	padding-bottom: 1rem;
	background-color: #eee;
	color: #000;
}

.reserv-table tbody th, .reserv-table tbody td {
	padding: 0.5rem;
	text-align: center;
}

.reserv-table tbody th {
	background-color: #eee;
}

.reserv-table tbody td .reserv-text {
	overflow: hidden;
	display: inline-block;
	width: 100%;
	cursor: zoom-in;
}

.reserv-table tbody td .reserv-text-admin {
	width: calc(100% - 1.8rem);
}

.reserv-table tbody td.disable {
	background-color: #eee;
	color: #fff;
	cursor: default;
}

.reserv-table tbody td.reservated {
	background-color: #f08503;
	color: #fff;
	cursor: default;
}

.reserv-table tbody td.reservated a {
	cursor: zoom-in;
	color: #fff;
}

.reserv-table tbody td.reservated input[type="checkbox"]:checked {
	background-color: #f08503;
}

.reserv-table tbody td.reservated input[type="checkbox"]+label {
	display: inline-block;
	width: 1.2rem;
	height: 1.2rem;
	border: 1px solid #eee;
	cursor: pointer;
	margin-bottom: -1px;
	background-color: #fff;
}

.reserv-table tbody td.reservated input[type="checkbox"]:checked+label {
	background-color: #00c50f;
}

.reserv-table tbody td:not(.reservated):not(.disable):hover {
	background-color: #E0F2F7;
}

#equipBtn, #equipEndBtn {
	display: none;
	float: right;
}

.equi-icon {
	color: #ccc;
}

.equi-icon.active {
	color: #f08503;
}

.equi-icon-small {
	color: #ccc;
	font-size: 1.1rem;
}

.equi-icon-small.active {
	color: #333;
	display: inline-block;
}

@media ( max-width : 768px) {
	.reserv-table thead td img {
		max-width: 100%;
	}
	.reserv-table tbody td a {
		font-size: 1.1rem;
	}
	#reservation_form_modal .input-group {
		display: flex;
	}
	#reservation_form_modal .pl-1 {
		padding-left: 0px !important;
	}
	#reservation_form_modal .pr-1 {
		padding-right: 0px !important;
	}
}

.tui-datepicker-input.tui-has-focus {
	min-width: 35%;
	border: none;
}

#datepicker-input {
	background: none;
	font-size: 2.0em;
	font-weight: 900;
	margin-left: 23%;
}

.tui-datepicker {
	margin-left: 28%;
	margin-top: 10px;
}

.tui-calendar-body-header tr th {
	font-size: 1.2em;
	font-weight: 600;
}

.tui-calendar-header-info p {
	color: #515365 !important;
}

.tui-calendar-body-header tr th:first-child {
	color: #DF0101;
}

.tui-calendar-body-header tr th:last-child {
	color: #0101DF;
}

#rno td {
	padding: 0px;
	color: #4b96e6;
	font-size: 1.8rem;
	font-weight: bold;
}

#widarea {
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}

.backslash {
	background:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="white" stroke-width="2" /></svg>');
}

#tab1 th {
	border-bottom: 1px solid white;
}

#tab1 tbody td {
	cursor: pointer;
	font-size: 1.1em;
}

.test1 label, .test1 label i {
	color: #333;
}
#mbrCollect {
	width : 350px;
	display: flex;
	
}

#selectMem {
	flex-wrap: wrap; 
	width: auto;
	position : relative;
	top : -2px;
	height: 100px;
	margin-top: 10px;
	display: flex;
	vertical-align: middle;
	padding-top: 5px;
	background: #ffffff;
	margin-bottom: 8px;
	border-radius: 6px;
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

.searchable-items {
	text-align: center; overflow : auto;
	height: 200px;
	overflow: auto;
}

.searchable-items::-webkit-scrollbar {
	display: none;
}
#mbrCollect svg{
	margin: 15px 5px 0px 23px;
}
</style>
<body>
<div class="adminDiv">
	<div id="tableHover" class="col-lg-12 col-12 layout-spacing">
		<div class="widget-content widget-content-area" id="widarea" style="width:100%; height: auto; position:relative; top:-55px; left:-45px; padding: 40px;">
			<div class="widget-header">
				<div class="row">
					<div class="col-xl-12 col-md-12 col-sm-12 col-12">
						<h4>회의실 예약</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-md-12 col-sm-12 col-12">
						<button type="button" id="equipBtn" onclick="equipment()" class="btn btn-primary mb-2">시설물 관리</button>
						<button type="button" id="equipEndBtn" onclick="equipmentEnd()" class="btn btn-outline-primary mb-2">관리 완료</button>
					</div>
				</div>
			</div>
			    
		        <div class="table-responsive" id="tabDiv">
						<table class="table table-sm table-bordered reserv-table"
							id="tab1">
							<thead>
								<tr>
									<th style="width: 5rem;"></th>
									<th colspan="5">
										<div class="row no-gutters justify-content-center mb-3">
											<div class="col-lg-12 text-center">
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus">
													<input type="text" id="datepicker-input"
														aria-label="Date-Time"> <span style="display: none"
														class="tui-ico-date"></span>
												</div>
												<div id="wrapper" style="margin-top: -1px;"></div>
											</div>
										</div>
									</th>
								</tr>
								<tr id="rno">
									<th>구분</th>
									<td>101</td>
									<td>102</td>
									<td>103</td>
									<td>104</td>
									<td>105</td>
								</tr>
								<tr>
									<th class="backslash" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;시설물<br>
									<br>&nbsp;시간
									</th>
									<td class="pb-3" data-toggle="modal" data-target="#icon_info_modal">
										<span title="의자" id="101_chair" class="mtr-101 equi-icon-chair equi-icon-small ">
											<i class="fas fa-chair"></i>
										</span> 
										<span title="책상" id="101_desk"class="mtr-101 equi-icon-desk equi-icon-small ">
											<i class="fas fa-inbox"></i>
										</span>
										<span title="프로젝터" id="101_projector" class="mtr-101 equi-icon-projector equi-icon-small ">
											<i class="fas fa-video"></i>
										</span><br>
										<span title="화이트보드" id="101_whiteboard" class="mtr-101 equi-icon-whiteboard equi-icon-small ">
											<i class="fas fa-chalkboard"></i>
										</span>
										<span title="스크린" id="101_screen" class="mtr-101 equi-icon-screen equi-icon-small ">
											<i class="fas fa-chalkboard-teacher"></i>
										</span>
										<span title="소화기" id="101_extinguisher" class="mtr-101 equi-icon-extinguisher equi-icon-small ">
											<i class="fas fa-fire-extinguisher"></i>
										</span>
									</td>
									<td class="pb-3" data-toggle="modal" data-target="#icon_info_modal">
										<span title="의자" id="102_chair" class="mtr-102 equi-icon-chair equi-icon-small ">
											<i class="fas fa-chair"></i>
										</span>
										<span title="책상" id="102_desk"class="mtr-102 equi-icon-desk equi-icon-small ">
											<i class="fas fa-inbox"></i>
										</span>
										<span title="프로젝터" id="102_projector" class="mtr-102 equi-icon-projector equi-icon-small ">
											<i class="fas fa-video"></i>
										</span>
										<br>
										<span title="화이트보드" id="102_whiteboard" class="mtr-102 equi-icon-whiteboard equi-icon-small ">
											<i class="fas fa-chalkboard"></i>
										</span>
										<span title="스크린" id="102_screen" class="mtr-102 equi-icon-screen equi-icon-small ">
											<i class="fas fa-chalkboard-teacher"></i>
										</span>
										<span title="소화기" id="102_extinguisher" class="mtr-102 equi-icon-extinguisher equi-icon-small ">
											<i class="fas fa-fire-extinguisher"></i>
										</span>
									</td>
									<td class="pb-3" data-toggle="modal" data-target="#icon_info_modal">
										<span title="의자" id="103_chair" class="mtr-103 equi-icon-chair equi-icon-small ">
											<i class="fas fa-chair"></i>
										</span> 
										<span title="책상" id="103_desk" class="mtr-103 equi-icon-desk equi-icon-small ">
											<i class="fas fa-inbox"></i>
										</span> 
										<span title="프로젝터" id="103_projector" class="mtr-103 equi-icon-projector equi-icon-small ">
											<i class="fas fa-video"></i>
										</span> 
										<br>
										<span title="화이트보드" id="103_whiteboard" class="mtr-103 equi-icon-whiteboard equi-icon-small ">
											<i class="fas fa-chalkboard"></i>
										</span> 
										<span title="스크린" id="103_screen" class="mtr-103 equi-icon-screen equi-icon-small ">
											<i class="fas fa-chalkboard-teacher"></i>
										</span> 
										<span title="소화기" id="103_extinguisher" class="mtr-103 equi-icon-extinguisher equi-icon-small ">
											<i class="fas fa-fire-extinguisher"></i>
										</span>
									</td>
									<td class="pb-3" data-toggle="modal" data-target="#icon_info_modal">
										<span title="의자" id="104_chair"class="mtr-104 equi-icon-chair equi-icon-small ">
											<i class="fas fa-chair"></i>
										</span> 
										<span title="책상" id="104_desk"class="mtr-104 equi-icon-desk equi-icon-small ">
											<i class="fas fa-inbox"></i>
										</span> 
										<span title="프로젝터" id="104_projector" class="mtr-104 equi-icon-projector equi-icon-small ">
											<i class="fas fa-video"></i>
										</span> 
										<br>
										<span title="화이트보드" id="104_whiteboard" class="mtr-104 equi-icon-whiteboard equi-icon-small ">
											<i class="fas fa-chalkboard"></i>
										</span> 
										<span title="스크린" id="104_screen" class="mtr-104 equi-icon-screen equi-icon-small ">
											<i class="fas fa-chalkboard-teacher"></i>
										</span> 
										<span title="소화기" id="104_extinguisher" class="mtr-104 equi-icon-extinguisher equi-icon-small ">
											<i class="fas fa-fire-extinguisher"></i>
										</span>
									</td>
									<td class="pb-3" data-toggle="modal" data-target="#icon_info_modal">
										<span title="의자" id="105_chair" class="mtr-105 equi-icon-chair equi-icon-small ">
											<i class="fas fa-chair"></i>
										</span> 
										<span title="책상" id="105_desk" class="mtr-105 equi-icon-desk equi-icon-small ">
											<i class="fas fa-inbox"></i>
										</span> 
										<span title="프로젝터" id="105_projector" class="mtr-105 equi-icon-projector equi-icon-small ">
											<i class="fas fa-video"></i>
										</span> 
										<br>
										<span title="화이트보드" id="105_whiteboard" class="mtr-105 equi-icon-whiteboard equi-icon-small ">
											<i class="fas fa-chalkboard"></i>
										</span> 
										<span title="스크린" id="105_screen" class="mtr-105 equi-icon-screen equi-icon-small ">
											<i class="fas fa-chalkboard-teacher"></i>
										</span> 
										<span title="소화기" id="105_extinguisher" class="mtr-105 equi-icon-extinguisher equi-icon-small ">
											<i class="fas fa-fire-extinguisher"></i>
										</span>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>9</th>
									<td class=" 21" id="room_101_9" data-drr_num="101"
										data-drr_type="01" data-drt_time="9" data-drr_idx="1"
										data-drt_idx="1" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 31px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_9" data-drr_num="102"
										data-drr_type="01" data-drt_time="9" data-drr_idx="2"
										data-drt_idx="1" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 31px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_9" data-drr_num="103"
										data-drr_type="01" data-drt_time="9" data-drr_idx="3"
										data-drt_idx="1" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_9" data-drr_num="104"
										data-drr_type="01" data-drt_time="9" data-drr_idx="4"
										data-drt_idx="1" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_9" data-drr_num="105"
										data-drr_type="02" data-drt_time="9" data-drr_idx="10"
										data-drt_idx="1" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>10</th>
									<td class=" 21" id="room_101_10" data-drr_num="101"
										data-drr_type="01" data-drt_time="10" data-drr_idx="1"
										data-drt_idx="2" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_10" data-drr_num="102"
										data-drr_type="01" data-drt_time="10" data-drr_idx="2"
										data-drt_idx="2" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_10" data-drr_num="103"
										data-drr_type="01" data-drt_time="10" data-drr_idx="3"
										data-drt_idx="2" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_10" data-drr_num="104"
										data-drr_type="01" data-drt_time="10" data-drr_idx="4"
										data-drt_idx="2" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_10" data-drr_num="105"
										data-drr_type="02" data-drt_time="10" data-drr_idx="10"
										data-drt_idx="2" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>11</th>
									<td class=" 21" id="room_101_11" data-drr_num="101"
										data-drr_type="01" data-drt_time="11" data-drr_idx="1"
										data-drt_idx="3" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_11" data-drr_num="102"
										data-drr_type="01" data-drt_time="11" data-drr_idx="2"
										data-drt_idx="3" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_11" data-drr_num="103"
										data-drr_type="01" data-drt_time="11" data-drr_idx="3"
										data-drt_idx="3" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_11" data-drr_num="104"
										data-drr_type="01" data-drt_time="11" data-drr_idx="4"
										data-drt_idx="3" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_11" data-drr_num="105"
										data-drr_type="02" data-drt_time="11" data-drr_idx="10"
										data-drt_idx="3" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>12</th>
									<td class=" 21" id="room_101_12" data-drr_num="101"
										data-drr_type="01" data-drt_time="12" data-drr_idx="1"
										data-drt_idx="4" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_12" data-drr_num="102"
										data-drr_type="01" data-drt_time="12" data-drr_idx="2"
										data-drt_idx="4" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_12" data-drr_num="103"
										data-drr_type="01" data-drt_time="12" data-drr_idx="3"
										data-drt_idx="4" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_12" data-drr_num="104"
										data-drr_type="01" data-drt_time="12" data-drr_idx="4"
										data-drt_idx="4" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_12" data-drr_num="105"
										data-drr_type="02" data-drt_time="12" data-drr_idx="10"
										data-drt_idx="4" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>13</th>
									<td class=" 21" id="room_101_13" data-drr_num="101"
										data-drr_type="01" data-drt_time="13" data-drr_idx="1"
										data-drt_idx="5" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_13" data-drr_num="102"
										data-drr_type="01" data-drt_time="13" data-drr_idx="2"
										data-drt_idx="5" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_13" data-drr_num="103"
										data-drr_type="01" data-drt_time="13" data-drr_idx="3"
										data-drt_idx="5" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_13" data-drr_num="104"
										data-drr_type="01" data-drt_time="13" data-drr_idx="4"
										data-drt_idx="5" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_13" data-drr_num="105"
										data-drr_type="02" data-drt_time="13" data-drr_idx="10"
										data-drt_idx="5" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>14</th>
									<td class=" 21" id="room_101_14" data-drr_num="101"
										data-drr_type="01" data-drt_time="14" data-drr_idx="1"
										data-drt_idx="6" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_14" data-drr_num="102"
										data-drr_type="01" data-drt_time="14" data-drr_idx="2"
										data-drt_idx="6" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_14" data-drr_num="103"
										data-drr_type="01" data-drt_time="14" data-drr_idx="3"
										data-drt_idx="6" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_14" data-drr_num="104"
										data-drr_type="01" data-drt_time="14" data-drr_idx="4"
										data-drt_idx="6" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_14" data-drr_num="105"
										data-drr_type="02" data-drt_time="14" data-drr_idx="10"
										data-drt_idx="6" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>15</th>
									<td class=" 21" id="room_101_15" data-drr_num="101"
										data-drr_type="01" data-drt_time="15" data-drr_idx="1"
										data-drt_idx="7" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_15" data-drr_num="102"
										data-drr_type="01" data-drt_time="15" data-drr_idx="2"
										data-drt_idx="7" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_15" data-drr_num="103"
										data-drr_type="01" data-drt_time="15" data-drr_idx="3"
										data-drt_idx="7" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_15" data-drr_num="104"
										data-drr_type="01" data-drt_time="15" data-drr_idx="4"
										data-drt_idx="7" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_15" data-drr_num="105"
										data-drr_type="02" data-drt_time="15" data-drr_idx="10"
										data-drt_idx="7" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>16</th>
									<td class=" 21" id="room_101_16" data-drr_num="101"
										data-drr_type="01" data-drt_time="16" data-drr_idx="1"
										data-drt_idx="8" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_16" data-drr_num="102"
										data-drr_type="01" data-drt_time="16" data-drr_idx="2"
										data-drt_idx="8" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_16" data-drr_num="103"
										data-drr_type="01" data-drt_time="16" data-drr_idx="3"
										data-drt_idx="8" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_16" data-drr_num="104"
										data-drr_type="01" data-drt_time="16" data-drr_idx="4"
										data-drt_idx="8" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_16" data-drr_num="105"
										data-drr_type="02" data-drt_time="16" data-drr_idx="10"
										data-drt_idx="8" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
								</tr>
								<tr>
									<th>17</th>
									<td class=" 21" id="room_101_17" data-drr_num="101"
										data-drr_type="01" data-drt_time="17" data-drr_idx="1"
										data-drt_idx="9" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_102_17" data-drr_num="102"
										data-drr_type="01" data-drt_time="17" data-drr_idx="2"
										data-drt_idx="9" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_103_17" data-drr_num="103"
										data-drr_type="01" data-drt_time="17" data-drr_idx="3"
										data-drt_idx="9" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_104_17" data-drr_num="104"
										data-drr_type="01" data-drt_time="17" data-drr_idx="4"
										data-drt_idx="9" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"></a>
										</div>
									</td>
									<td class=" 21" id="room_105_17" data-drr_num="105"
										data-drr_type="02" data-drt_time="17" data-drr_idx="10"
										data-drt_idx="9">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
								</tr>
								<tr>
									<th>18</th>
									<td class=" 21" id="room_101_18" data-drr_num="101"
										data-drr_type="01" data-drt_time="18" data-drr_idx="1"
										data-drt_idx="10" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_102_18" data-drr_num="102"
										data-drr_type="01" data-drt_time="18" data-drr_idx="2"
										data-drt_idx="10" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_103_18" data-drr_num="103"
										data-drr_type="01" data-drt_time="18" data-drr_idx="3"
										data-drt_idx="10" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_104_18" data-drr_num="104"
										data-drr_type="01" data-drt_time="18" data-drr_idx="4"
										data-drt_idx="10" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_105_18" data-drr_num="105"
										data-drr_type="02" data-drt_time="18" data-drr_idx="10"
										data-drt_idx="10">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
								</tr>
								<tr>
									<th>19</th>
									<td class=" 21" id="room_101_19" data-drr_num="101"
										data-drr_type="01" data-drt_time="19" data-drr_idx="1"
										data-drt_idx="11" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_102_19" data-drr_num="102"
										data-drr_type="01" data-drt_time="19" data-drr_idx="2"
										data-drt_idx="11" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_103_19" data-drr_num="103"
										data-drr_type="01" data-drt_time="19" data-drr_idx="3"
										data-drt_idx="11" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_104_19" data-drr_num="104"
										data-drr_type="01" data-drt_time="19" data-drr_idx="4"
										data-drt_idx="11" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class="21" id="room_105_19" data-drr_num="105"
										data-drr_type="02" data-drt_time="19" data-drr_idx="10"
										data-drt_idx="11">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
								</tr>
								<tr>
									<th>20</th>
									<td class=" 21" id="room_101_20" data-drr_num="101"
										data-drr_type="01" data-drt_time="20" data-drr_idx="1"
										data-drt_idx="12" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_102_20" data-drr_num="102"
										data-drr_type="01" data-drt_time="20" data-drr_idx="2"
										data-drt_idx="12" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_103_20" data-drr_num="103"
										data-drr_type="01" data-drt_time="20" data-drr_idx="3"
										data-drt_idx="12" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_104_20" data-drr_num="104"
										data-drr_type="01" data-drt_time="20" data-drr_idx="4"
										data-drt_idx="12" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class="21" id="room_105_20" data-drr_num="105"
										data-drr_type="02" data-drt_time="20" data-drr_idx="10"
										data-drt_idx="12">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
								</tr>
								<tr>
									<th>21</th>
									<td class=" 21" id="room_101_21" data-drr_num="101"
										data-drr_type="01" data-drt_time="21" data-drr_idx="1"
										data-drt_idx="13" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_102_21" data-drr_num="102"
										data-drr_type="01" data-drt_time="21" data-drr_idx="2"
										data-drt_idx="13" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_103_21" data-drr_num="103"
										data-drr_type="01" data-drt_time="21" data-drr_idx="3"
										data-drt_idx="13" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class=" 21" id="room_104_21" data-drr_num="104"
										data-drr_type="01" data-drt_time="21" data-drr_idx="4"
										data-drt_idx="13" onclick="modal_setval($(this));"
										data-toggle="modal" data-target="#reservation_form_modal">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											data-toggle="modal" data-target="#reservation_form_modal"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
									<td class="21" id="room_105_21" data-drr_num="105"
										data-drr_type="02" data-drt_time="21" data-drr_idx="10"
										data-drt_idx="13">
										<div class="reserv-text"
											onclick="modal_setval($(this).closest('td'));"
											style="text-indent: 32px; overflow: hidden; white-space: nowrap;">
											<a href="javascript:void(0);"> </a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

				</div>
		    </div>
		</div>
		<!-- 콘텐츠 시작  -->
				
			</div>
		<!-- 콘텐츠 끝 -->
			<!-- 비품설명 모달 시작 -->
			<div class="modal fade" id="icon_info_modal" tabindex="-1"
				aria-labelledby="icon_info_label" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="icon_info_label">시설물 안내</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row no-gutters">
								<div class="col-12 test1">
									<label class="mx-3 mb-3"><i class="fas fa-chair"></i>
										의자</label> <label class="mx-3 mb-3"><i class="fas fa-inbox"></i>
										책상</label> <label class="mx-3 mb-3"><i class="fas fa-video"></i>
										프로젝터</label> <label class="mx-3 mb-3"><i
										class="fas fa-chalkboard"></i> 화이트보드</label> <label class="mx-3 mb-3"><i
										class="fas fa-chalkboard-teacher"></i> 스크린</label> <label
										class="mx-3 mb-3"><i class="fas fa-fire-extinguisher"></i>
										소화기</label>
								</div>
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
			<!-- 비품설명 모달 끝 -->
	
			<!-- 예약 모달 시작-->
			<div class="modal fade" id="reservation_form_modal" tabindex="-1"
				aria-labelledby="reservation_form_label" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reservation_form_label">회의실 예약</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" class="" id="drr_idx" readonly="readonly">
							<input type="hidden" class="" id="drt_idx" readonly="readonly">
							<div class="row no-gutters mb-3">
								<div class="col-lg-6 pr-1">
									<div class="input-group" style="width: 180px;">
										<div class="input-group-prepend">
											<span class="input-group-text">예약 호실</span>
										</div>
										<input type="text" class="form-control text-center res-modal-text"
											id="drr_num" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-6 pl-1">
									<div class="input-group" style="width: 260px; margin-left:-32px" >
										<div class="input-group-prepend">
											<span class="input-group-text">예약 시간</span>
										</div>
										<input type="text" class="form-control text-center res-modal-text"
											id="drt_time" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row no-gutters mb-3">
								<div class="col-lg-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">예약자정보</span>
										</div>
										<input type="text" class="form-control text-center res-modal-text"
											id="drl_user"
											value="<%=((MemberVO) session.getAttribute("member")).getMbrNm()%>"
											readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row no-gutters mb-3">
								<div class="col-lg-12">
									<div class="input-group">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"	id="customCheck1"> 
											<label class="custom-control-label" for="customCheck1">회의 알람 발송</label>
										</div>
									</div>
								</div>
							</div>
							<div id="mbrCollect1"></div>

						</div>
						<div class="modal-footer"></div>
					</div>
					
				</div>
			</div>
			<!-- 예약모달 끝 -->
			<!-- 회의 참여자 추가 모달 시작 -->
			<div class="modal fade show" id="meetMbrModal" tabindex="-1"
				role="dialog" aria-labelledby="meetMbrModalTitle"
				style="display: none;" aria-modal="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content" style="width: 370px; height:500px;">
						<div class="modal-header">
							<h5 class="modal-title" id="meetMbrModalTitle"></h5>
							
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body" style="overflow: auto;">
							<div class="widget-content searchable-container list"
								style="height: 300px; margin-top: 20px;">
								<div class="row">
									<div
										class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
										<div class="action-btn">
											<div style="width: 330px;">
												<input type="text" class="form-control product-search"
													id="input-search" placeholder="멤버를 검색하세요">

											</div>
										</div>
									</div>

									<div class="searchable-items list"></div>
									<div id="mbrCollect">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
										<div id="selectMem">
											
										
										</div>
									</div>
									<div class="modal-footer" style="position: absolute; top: 378px;">
										<div style="height: 50px; width: 330px; text-align: right;">
											<button type="button" onclick="addUser()"
												data-dismiss="modal" class="btn btn-outline-primary mb-2">완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 회의 참여자 추가 모달 끝 -->
 	

	<script>
		var mbrId = '<c:out value="${member.mbrId}" />';
		var mbrCtgrCd = '<c:out value="${member.mbrCtgrCd}" />';

		$(document).ready(function() {
			
			//상단 달력 표시
			var datepicker = new tui.DatePicker('#wrapper', {
				language : 'ko',
				date : new Date(),
				input : {
					element : '#datepicker-input',
					format : 'yyyy-MM-dd'
				}
			});
			datepicker.on('change', function() {
				clean();
				loading();
				timePass();
			});
			loading();
			timePass();
			
		});
		//예약정보 표시영역 초기화
		function clean() {
			$(".21").each(function() {
				$(this).attr("style", "background: white;");
				$(this).empty();
				if ($(this).hasClass('reservated')) {
					$(this).removeClass('reservated');
				}
			});
		}
		//예약정보 표시
		function loading(){
			var drl_date = $('#datepicker-input').val();
		    //swal("",drl_date); //2022-03-31
		    $.ajax({
		    	type: 'post',
		    	dataType: 'json',
		    	url: '/mtr/resSelect.do',
		    	data: { rsvt_ymd : drl_date },
		    	success: function(data){
		    		//swal("","성공");	
		    		console.log(data);
		    		if(data.length==0){
		    			//swal("","해당일 예약 정보가 없습니다.")	
		    		}else{
		    			$(data).each(function(){
		    				var resId = "room_" + this.MTR_NM + "_" + this.RSVT_STRT_HR;
		    				var resUser = this.MBR_DEPT + "_" + this.MBR_NM;
		    				console.log(resId);
		    				$('table.reserv-table tr td[id="' + resId + '"]').addClass("reservated");
		    				$('table.reserv-table tr td[id="' + resId + '"]').attr("style", "background: #4B96E6; color: white;");
		    				$('table.reserv-table tr td[id="' + resId + '"]').html(resUser);
		    			});
		    		}
		    	},
				error: function(jqXHR, textStatus, errorThrown) {
					swal("","예약 정보를 읽어오지 못했습니다.");
					console.log(textStatus);
					console.log(errorThrown);
				}
		    });  
		    
		    equipLoding();
		    //로그인유저 아이디가 관리자 것이면
		    if(mbrCtgrCd=='M01'){
		    	$('#equipBtn').attr("style","display: inline-block;");
		    	$('#tabDiv').attr("style","margin-top: -45px;");
		    }
		    
		};
		//비품편집 버튼 누른 경우
		$('#equipBtn').on('click', function(){
			$('#equipBtn').attr("style","display: none;");
			$('#equipEndBtn').attr("style","display: inline-block;");
		});
		
		//페이지 로딩 시 전체 비품정보 표시
		function equipLoding(){
			$.ajax({
		    	type: 'post',
		    	dataType: 'json',
		    	url: '/mtr/mtrStts.do',
		    	success: function(data){
		    		//swal("","성공");	
		    		console.log(data);
		    		if(data.length==0){
		    			//swal("","구비된 비품이 없습니다.")	
		    		}else{
		    			//swal("","구비된 비품 정보는 console확인.")	
		    			$(data).each(function(){
		    				var mtrData = this.MTR_NM+ "_" + this.MTR_GDS_NM;	
		    				console.log(mtrData);
		    				$("#"+mtrData).addClass("active");
		    			});
		    		}
		    	},
				error: function(jqXHR, textStatus, errorThrown) {
					swal("","비품 정보를 읽어오지 못했습니다.");
					console.log(textStatus);
					console.log(errorThrown);
				}
			});	
		}
		
		//지난 시간 예약방지
		function timePass(){
			var nowTime = "<%=nowTime %>";  //Tue Apr 19 18:13:37 KST 2022
			var curTime = nowTime.slice(11, 13);
			//alert(curTime);
		}
		
		//비품정보 설정(관리자)
		function equipment(){
			//swal("","비품설정");
			$('.pb-3').attr("data-target",""); //비품정보 모달 끄기
			var equipIcon = $('.equi-icon-small');
			equipIcon.attr("onclick","statusChange(this)");
		}
		
		//비품정보 설정 종료
		function equipmentEnd(){
			//swal("","비품설정 종료");
			$('#equipEndBtn').attr("style","display: none;");
			$('#equipBtn').attr("style","display: inline-block;");
			$('.pb-3').attr("data-target","#icon_info_modal"); //비품정보 모달 켜기
			var equipIcon = $('.equi-icon-small');
			equipIcon.attr("onclick","").unbind("click");
		}
		
		//비품유무 변환
		function statusChange(icon){
//	 		alert(icon);
			var status = $(icon).hasClass("active");
			var tagId = $(icon).attr('id'); //방이름_비품이름
			//alert(tagId);
			var mtrNm = tagId.substr(0, 3);
			//alert(mtrNm)
			var mtrGdsNm = tagId.substr(4);
			//alert(mtrGdsNm)
			if(mtrNm=="101"){
				var mtrNo = 1;
			}else if(mtrNm=="102"){
				var mtrNo = 2;
			}else if(mtrNm=="103"){
				var mtrNo = 3;
			}else if(mtrNm=="104"){
				var mtrNo = 4;
			}else{
				var mtrNo = 5;
			}
			
			if(mtrGdsNm=="chair"){
				var mtrGdsNo = 1;
			}else if(mtrGdsNm=="desk"){
				var mtrGdsNo = 2;
			}else if(mtrGdsNm=="projector"){
				var mtrGdsNo = 3;
			}else if(mtrGdsNm=="whiteboard"){
				var mtrGdsNo = 4;
			}else if(mtrGdsNm=="screen"){
				var mtrGdsNo = 5;
			}else{
				var mtrGdsNo = 6;
			}
			
			if(status==true){
				$(icon).removeClass("active");	
				$.ajax({
					type: 'post',
			    	dataType: 'json',
			    	url: '/mtr/mtrSttsDelete.do',
			    	data: { 'mtrNo' : mtrNo, 'mtrGdsNo' : mtrGdsNo },
			    	success: function(data){
			    		console.log(data);
			    		if(data.sta=="fail"){
			    			//swal("","삭제 실패")	
			    			
			    		}else{
			    			//swal("","삭제 성공")
			    		}
			    	},
					error: function(jqXHR, textStatus, errorThrown) {
						swal("","정보를 읽어오지 못했습니다.");
						console.log(textStatus);
						console.log(errorThrown);
					}
				});
				
			}else{
				$(icon).addClass("active");
				$.ajax({
					type: 'post',
			    	dataType: 'json',
			    	url: '/mtr/mtrSttsInsert.do',
			    	data: { 'mtrNo' : mtrNo, 'mtrGdsNo' : mtrGdsNo },
			    	success: function(data){
			    		console.log(data);
			    		if(data.sta=="fail"){
			    			//swal("","추가 실패")	
			    			
			    		}else{
			    			//swal("","추가 성공")
			    		}
			    	},
					error: function(jqXHR, textStatus, errorThrown) {
						swal("","정보를 읽어오지 못했습니다.");
						console.log(textStatus);
						console.log(errorThrown);
					}
				});
			}
			//document.location.reload();
		}
		//회의실 예약
		function insert_reservation(drt_time, drr_num) {

			var input = []; //id값 저장할 배열
			var frm = document.frm;
			var selectedList = document.querySelectorAll("#mbrCollect1");
			selectedList = $(selectedList).find(".memList").children(
					"input[type=hidden]");

			for (var i = 0; i < selectedList.length; i++) {
				var selectedId = selectedList[i].value;
				input.push(selectedId);
			}

			if (drr_num == "101") {
				var mtrNo = "1";
			} else if (drr_num == "102") {
				var mtrNo = "2";
			} else if (drr_num == "103") {
				var mtrNo = "3";
			} else if (drr_num == "104") {
				var mtrNo = "4";
			} else {
				var mtrNo = "5";
			}
			var rsvtStrtHr = drt_time;
			var rsvtYmd = $('#datepicker-input').val();

			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '/mtr/resInsert.do',
				data : {
					data : JSON.stringify(input),
					mtrNo : mtrNo,
					mbrId : mbrId,
					rsvtStrtHr : drt_time,
					rsvtYmd : rsvtYmd
				},
				async : false,
				success : function(data) {
					if (data.sta == "fail") {
						swal({
							title : "",
							html : "회의실 예약에 실패했습니다.<br>다시 예약해주세요."
						}).then(function() {
							document.location.reload();
						});
					} else {
						for(var i = 0; i < data.list.length; i++){
							sock.send(data.list[i]);
						}

						swal({
							title : "",
							text : "회의실 예약에 성공했습니다.",
						}).then(function() {
							document.location.reload();
						});
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					swal({
						title : "",
						html : "데이터 전송에 실패했습니다.<br>다시 예약해주세요."
					});
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		};

		//예약 취소
		function delete_reservation(drt_time, drr_num) {

			/* var drr_idx = $('#drr_idx').val();
			var drt_idx = $('#drt_idx').val();
			var drl_user_pw = $('#drl_user_pw').val(); */
			if (drr_num == "101") {
				var mtrNo = "1";
			} else if (drr_num == "102") {
				var mtrNo = "2";
			} else if (drr_num == "103") {
				var mtrNo = "3";
			} else if (drr_num == "104") {
				var mtrNo = "4";
			} else {
				var mtrNo = "5";
			}

			var rsvtStrtHr = drt_time;
			var rsvtYmd = $('#datepicker-input').val();
			//alert("mtrNo : "+mtrNo);

			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '/mtr/resDelete.do',
				data : {
					mtrNo : mtrNo,
					mbrId : mbrId,
					rsvtStrtHr : drt_time,
					rsvtYmd : rsvtYmd
				},
				async : false,
				success : function(data) {
					console.log(data);
					if (data.sta == "noResData") {
						swal({
							title : "",
							html : "예약 정보가 일치하지 않습니다.<br>예약을 취소할 수 없습니다."
						}).then(function() {
							document.location.reload();
						});
					} else if (data.sta == "success") {
						swal({
							title : "",
							text : "예약 취소가 완료되었습니다.",
						}).then(function() {
							document.location.reload();
						});
					} else {
						swal({
							title : "",
							html : "예약 취소에 실패했습니다.<br>다시 시도해주세요."
						}).then(function() {
							document.location.reload();
						});

					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					swal({
						title : "",
						html : "데이터 전송에 실패했습니다.<br>다시 시도해주세요."
					});
					console.log(textStatus);
					console.log(errorThrown);
				}
			});

		}

		//예약 모달 값 설정
		function modal_setval(el) {
			$('#drr_idx').val(el.data('drr_idx'));
			$('#drt_idx').val(el.data('drt_idx'));
			var drr_type = el.data('drr_type');

			$('#drr_num').val(el.data('drr_num') + '호');
			$('#drt_time').val(
					el.data('drt_time') + '시 부터 '
							+ ((el.data('drt_time') * 1) + 1) + '시 까지');
			$('#drl_user_pw').val('');

			$('#customCheck1').change(function() {
				if ($('#customCheck1').is(':checked')) {
					//alert("체크");
					$('#meetMbrModal').modal('show');
					$('#reservation_form_modal').modal('hide');

				}
			});

			$('#meetMbrModal').on('hide.bs.modal', function(e) {
				$('#reservation_form_modal').modal('show');
			});

			var html = '';
			if (el.hasClass('disable')) {
				swal("", "현재 사용 불가능한 회의실입니다.");
				this.modal('hide');//$('#reservation_form_modal').modal('hide');
			} else {
				if (el.hasClass('reservated')) {
					//$('#drl_user').attr('readonly', true);
					//$('#drl_user').val(el.find('a').text().trim()); 
					html += '<button type="button" class="btn btn-danger" onclick="delete_reservation(\''
							+ el.data('drt_time')
							+ '\',\''
							+ el.data('drr_num') + '\');">예약 취소</button>'; //('drt_time')
				} else {
					//$('#drl_user').attr('readonly', false);
					//$('#drl_user').val();
					html += '<button type="button" class="btn btn-info" onclick="insert_reservation(\''
							+ el.data('drt_time')
							+ '\',\''
							+ el.data('drr_num') + '\');">예약하기</button>';//('drt_time','drr_num')
				}
				$('#reservation_form_modal .modal-footer').html(html);
			}
		}

		//예약모달 닫을 때 내용 초기화
		$('#reservation_form_modal').on('hide.bs.modal', function(e) {
			$("input:checkbox[id='customCheck1']").prop("checked", false);
			$("#mbrCollect1").empty();
		});

		function modal_setval_icon(el) {
			var drr_num = el.data('drr_num');
			var drr_idx = el.data('drr_idx');
			$.ajax({
						type : 'post',
						dataType : 'json',
						url : '/ddit/function/reservation_func.php?divide=get_room_info',
						data : {
							drr_idx : el.data('drr_idx'),
						},
						async : false,
						success : function(data) {
							console.log(data);
							var obj = {};
							obj['chair'] = [ '의자',
									'<i class="fas fa-chair"></i>' ];
							obj['desk'] = [ '책상',
									'<i class="fas fa-inbox"></i>' ];
							obj['projector'] = [ '프로젝터',
									'<i class="fas fa-video"></i>' ];
							obj['whiteboard'] = [ '화이트보드',
									'<i class="fas fa-chalkboard"></i>' ];
							obj['screen'] = [ '스크린',
									'<i class="fas fa-chalkboard-teacher"></i>' ];
							obj['extinguisher'] = [ '소화기',
									'<i class="fas fa-fire-extinguisher"></i>' ];
							var html = '';
							html += '<div class="row no-gutters">';
							html += '<div class="col-12 text-center" style="font-size: 2rem;">';
							$.each(obj,	function(i, v) {
								html += '<input type="checkbox" class="d-none drr-'
										+ drr_num
										+ ' equi-checkbox" data-drr_idx="'
										+ drr_idx
										+ '" data-drr_num="'
										+ drr_num
										+ '" data-icon_target="'
										+ i
										+ '" id="drr_equi_'
										+ i
										+ '" '
										+ (data.info['drr_equi_'+ i] == 'Y' ? 'checked="checked"' : '');
								html += '  onchange="icon_toggle($(this), \'' + (data.info['drr_equi_'+ i] == 'Y' ? 'N'	: 'Y')+ '\');"';
								html += '>';
								html += '<label class="mr-5 drr-'
										+ drr_num
										+ ' equi-icon equi-icon-'
										+ i
										+ ' '
										+ (data.info['drr_equi_'
												+ i] == 'Y' ? 'active'
												: '')
										+ '" for="drr_equi_'
										+ i
										+ '" title="'
										+ v[0]
										+ '">'
										+ v[1]
										+ '</label>';
							});
							html += '</div>';
							html += '</div>';
							$('#icon_form_modal .modal-body').html(html);
						}
					});
		}

		/*회의 참여자 모달 관련 스크립트*/
		$(function() {
			//모든 멤버 목록 가져오기
			$.ajax({
				url : "/user/getUser.do",
				type : "get",
				dataType : "json",
				success : function(res) {
					var str = "";
					$.each(res, function(i, v) {
						str += '<div class="items">';
						str += '<div class="item-content">';
						str += '<div class="user-profile">';
						str += '<img src="/resources/profileImage/';
						if (v.mbrImg == null) {
							str += 'profileimage.png"';
						} else {
							str += v.mbrImg + '"';
						}
						str += ' alt="' + v.mbrNm
								+ '" />';
						str += '<div class="user-meta-info">';
						str += '<p class="user-name" data-name="'+v.mbrNm+'">'
								+ v.mbrNm + '</p>';
						str += '<p class="user-work" data-occupation="'+v.mbrDept+'">'
								+ v.mbrDept
								+ '</p></div></div>';
						str += '<div class="action-btn" dataId="'+v.mbrId+'" dataNm="'+v.mbrNm+'">';
						str += '<a style="cursor:pointer;" data-toggle="true" onclick="changeIcon()">';
						str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>';
						str += '</a></div></div></div>';
					})
					$(".searchable-items").html(str);
				}
			})
		})

		//멤버 추가 버튼 클릭시 버튼 모양 바뀌기
		function changeIcon() {
			var chDiv = $(event.target).closest("a")[0];
			var selection = $(event.target).parents(".action-btn");
			var selectedNm = selection.attr("dataNm");
			var selectedId = selection.attr("dataId");
			var selectedIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>';
			var icon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>';
			var v_add = false; //추가안한다!!

			if (!$(chDiv).data("toggle")) {
				$(chDiv).html(icon);
				$(chDiv).data("toggle", "true"); // jQuery data메소드가 조금 특별 메모리상에서 처리   
			} else {
				$(chDiv).html(selectedIcon);
				$(chDiv).data("toggle", "");
				v_add = true; //추가할거다!!
			}
			selectMem(selectedNm, selectedId, v_add); // memList div로 생성할 function
		}

		//선택된 이름 추가
		function selectMem(selectedNm, selectedId, p_opt) {
			console.log(selectedNm, selectedId, p_opt);

			var findit = document.querySelectorAll(".memList");

			if (findit.length > 10) { //추가인원 제한 
				swal({
					title : "",
					html : "이용 가능한 최대 인원은 10명입니다."
				});
				return;
			}
			var list = document.createElement("div");
			list.setAttribute("class", "memList");

			var getId = document.createElement("input");
			getId.setAttribute("type", "hidden");
			getId.setAttribute("name", "mbrId");
			getId.setAttribute("id", "mbrId");
			getId.setAttribute("value", selectedId);

			if (p_opt) {
				list.innerText = selectedNm;
				list.appendChild(getId);
				$("#selectMem").append(list);

			} else {
				for (var i = 0; i < findit.length; i++) {
					if ($(findit[i]).text() == selectedNm) {
						$(findit[i]).remove();
					}
				}
			}

		}

		//사용자 추가 후 완료 버튼 클릭 시 
		function addUser() {

			console.log($('#selectMem').html());
			var cloneElements = $('#selectMem').clone();
			cloneElements.appendTo('#mbrCollect1');
		}

		//검색 시 이름 조회
		$(document).on("keyup", "#input-search", function() {
			var keyword = $(this).val();
			searchNm(keyword);
		})

		//검색 시 이름 조회
		function searchNm(keyword) {
			$.ajax({
				url : "/user/getUser",
				data : {
					keyword : keyword
				},
				type : "get",
				success : function(res) {
					console.log("success");
				}
			})
		}
	</script>

	<!-- END MAIN CONTAINER -->
	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<script src="/resources/bootstrap/js/popper.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="/resources/assets/js/app.js"></script>
	<script src="/resources/plugins/highlight/highlight.pack.js"></script>
	<script src="/resources/assets/js/custom.js"></script>
	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN THEME GLOBAL STYLE -->
	<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
	<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
	<!-- END THEME GLOBAL STYLE -->
	<script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
	<script src="/resources/plugins/editors/quill/quill.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
</body>
</html>