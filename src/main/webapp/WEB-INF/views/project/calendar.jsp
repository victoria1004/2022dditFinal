<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>CALENDAR</title>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<title>CORK Admin Template - Calendar Application</title>


<!-- BEGIN PAGE LEVEL STYLE -->
<link href="/resources/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet" type="text/css">
<link
	href="/resources/plugins/fullcalendar/custom-fullcalendar.advance.css"
	rel="stylesheet" type="text/css">
<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet"
	type="text/css">
<link href="/resources/plugins/flatpickr/custom-flatpickr.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/css/forms/theme-checkbox-radio.css"
	rel="stylesheet" type="text/css">

<link href="/resources/plugins/sweetalerts/sweetalert2.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css"
	rel="stylesheet" type="text/css" />

<!-- END PAGE LEVEL STYLE -->


<script>
   
    var pjtNo  = ${pjtNo};
    $(document).on("change","input[name=filter]",function(){
	    v_filter = $("input:checkbox[name=filter]:checked").val();
		//console.log('v_filter:',v_filter);
	   location.href="/project/calendar.do?filter=" +v_filter ;
	})
    
       function checkOnly(e){
    	   
    	   /* console.log(e);   	   
    	   console.log(document.querySelectorAll('input[type=checkbox]')); */
		
    	   
    	   if(e.checked){
    		 document.querySelectorAll('input[type=checkbox]').forEach(f => f.checked=false);    
    		 e.checked=true;
    	   }
       }
    </script>


<style>
.widget-content-area {
	border-radius: 6px;
	margin-bottom: 10px;
}

.daterangepicker.dropdown-menu {
	z-index: 1059;
}

#trash {
	position: absolute;
	top: 90px;
	right: 60px;
}
</style>

</head>

<body>
	<div class="layout-px-spacing">
		<div class="page-header"></div>
		<div class="row layout-top-spacing" id="cancel-row">
			<div class="col-xl-12 col-lg-12 col-md-12">
				<div class="statbox widget box box-shadow">

					<div class="widget-content widget-content-area">
						<div id="trash">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-trash-2">
								<polyline points="3 6 5 6 21 6"></polyline>
								<path
									d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
								<line x1="10" y1="11" x2="10" y2="17"></line>
								<line x1="14" y1="11" x2="14" y2="17"></line></svg>
						</div>
						<div class="calendar-upper-section">
							<div class="row">

								<div class="col-md-8 col-12">
									<div class="labels">
										<label id="personal"><input type="checkbox"
											id="filter_p" name="filter" value="C01"
											onclick="checkOnly(this)"> ??????</label> <label id="conference"><input
											type="checkbox" id="filter_c" name="filter" value="C02"
											onclick="checkOnly(this)"> ??????</label> <label id="important"><input
											type="checkbox" id="filter_i" name="filter" value="C03"
											onclick="checkOnly(this)"> ??????</label>
									</div>
								</div>

								<div class="col-md-4 col-12">
									<form action="javascript:void(0);"
										class="form-horizontal mt-md-0 mt-3 text-md-right text-center">
										<button style="margin-right:20px;"id="myBtn" class="btn btn-primary">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-calendar mr-2">
												<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
												<line x1="16" y1="2" x2="16" y2="6"></line>
                                         <line x1="8" y1="2" x2="8"
													y2="6">
                                         </line>
												<line x1="3" y1="10" x2="21" y2="10"></line>
                                         </svg>
											?????? ??????
										</button>
									</form>
								</div>
							</div>
						</div>
						<div id="calendar" class="fc fc-unthemed fc-ltr">
							<div class="fc-toolbar fc-header-toolbar">
								<div class="fc-left">
									<div class="fc-button-group">
										<button type="button"
											class="fc-prev-button fc-button fc-state-default fc-corner-left">
											<span class="fc-icon fc-icon-left-single-arrow"></span>
										</button>
										<button type="button"
											class="fc-next-button fc-button fc-state-default fc-corner-right">
											<span class="fc-icon fc-icon-right-single-arrow"></span>
										</button>
									</div>
									<button type="button"
										class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
										disabled="">today</button>
								</div>
								<div class="fc-right">
									<div class="fc-button-group">
									</div>
								</div>
								<div class="fc-center">
									<h2>April 2022</h2>
								</div>
								<div class="fc-clear"></div>
							</div>
							<div class="fc-view-container" style="">
								<div class="fc-view fc-month-view fc-basic-view" style="">
									<table>
										<thead class="fc-head">
											<tr>
												<td class="fc-head-container fc-widget-header"><div
														class="fc-row fc-widget-header"
														style="border-right-width: 1px; margin-right: 16px;">
														<table>
															<thead>
																<tr>
																	<th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
																	<th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
																	<th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
																	<th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
																	<th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
																	<th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
																	<th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
																</tr>
															</thead>
														</table>
													</div></td>
											</tr>
										</thead>
										<tbody class="fc-body">
											<tr>
												<td class="fc-widget-content"><div
														class="fc-scroller fc-day-grid-container ps ps--active-y"
														style="overflow: hidden scroll; height: 700px;">
														<div class="fc-day-grid fc-unselectable">
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 116px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td
																					class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																					data-date="2022-03-27"></td>
																				<td
																					class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																					data-date="2022-03-28"></td>
																				<td
																					class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																					data-date="2022-03-29"></td>
																				<td
																					class="fc-day fc-widget-content fc-wed fc-other-month fc-past"
																					data-date="2022-03-30"></td>
																				<td
																					class="fc-day fc-widget-content fc-thu fc-other-month fc-past"
																					data-date="2022-03-31"></td>
																				<td class="fc-day fc-widget-content fc-fri fc-past"
																					data-date="2022-04-01"></td>
																				<td class="fc-day fc-widget-content fc-sat fc-past"
																					data-date="2022-04-02"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td class="fc-day-top fc-sun fc-other-month fc-past"
																					data-date="2022-03-27"><span
																					class="fc-day-number">27</span></td>
																				<td class="fc-day-top fc-mon fc-other-month fc-past"
																					data-date="2022-03-28"><span
																					class="fc-day-number">28</span></td>
																				<td class="fc-day-top fc-tue fc-other-month fc-past"
																					data-date="2022-03-29"><span
																					class="fc-day-number">29</span></td>
																				<td class="fc-day-top fc-wed fc-other-month fc-past"
																					data-date="2022-03-30"><span
																					class="fc-day-number">30</span></td>
																				<td class="fc-day-top fc-thu fc-other-month fc-past"
																					data-date="2022-03-31"><span
																					class="fc-day-number">31</span></td>
																				<td class="fc-day-top fc-fri fc-past"
																					data-date="2022-04-01"><span
																					class="fc-day-number">1</span></td>
																				<td class="fc-day-top fc-sat fc-past"
																					data-date="2022-04-02"><span
																					class="fc-day-number">2</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td class="fc-event-container" colspan="2"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-danger fc-draggable" id="event-1" data-original-title="" title=""><div class="fc-content"><span class="fc-time">2:30p</span> <span class="fc-title">???????????? ?????? ?????? ??????</span></div></a></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 116px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td class="fc-day fc-widget-content fc-sun fc-past"
																					data-date="2022-04-03"></td>
																				<td class="fc-day fc-widget-content fc-mon fc-past"
																					data-date="2022-04-04"></td>
																				<td class="fc-day fc-widget-content fc-tue fc-past"
																					data-date="2022-04-05"></td>
																				<td class="fc-day fc-widget-content fc-wed fc-past"
																					data-date="2022-04-06"></td>
																				<td class="fc-day fc-widget-content fc-thu fc-past"
																					data-date="2022-04-07"></td>
																				<td class="fc-day fc-widget-content fc-fri fc-past"
																					data-date="2022-04-08"></td>
																				<td class="fc-day fc-widget-content fc-sat fc-past"
																					data-date="2022-04-09"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td class="fc-day-top fc-sun fc-past"
																					data-date="2022-04-03"><span
																					class="fc-day-number">3</span></td>
																				<td class="fc-day-top fc-mon fc-past"
																					data-date="2022-04-04"><span
																					class="fc-day-number">4</span></td>
																				<td class="fc-day-top fc-tue fc-past"
																					data-date="2022-04-05"><span
																					class="fc-day-number">5</span></td>
																				<td class="fc-day-top fc-wed fc-past"
																					data-date="2022-04-06"><span
																					class="fc-day-number">6</span></td>
																				<td class="fc-day-top fc-thu fc-past"
																					data-date="2022-04-07"><span
																					class="fc-day-number">7</span></td>
																				<td class="fc-day-top fc-fri fc-past"
																					data-date="2022-04-08"><span
																					class="fc-day-number">8</span></td>
																				<td class="fc-day-top fc-sat fc-past"
																					data-date="2022-04-09"><span
																					class="fc-day-number">9</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td></td>
																				<td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-danger fc-draggable" id="event-10" data-original-title="" title=""><div class="fc-content"><span class="fc-time">8:12a</span> <span class="fc-title">????????? ?????? ?????????</span></div></a></td>
																				<td></td>
																				<td></td>
																				<td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable" id="event-7" data-original-title="" title=""><div class="fc-content"><span class="fc-time">5:30a</span> <span class="fc-title">???????????? ??????</span></div></a></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 116px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td class="fc-day fc-widget-content fc-sun fc-past"
																					data-date="2022-04-10"></td>
																				<td class="fc-day fc-widget-content fc-mon fc-past"
																					data-date="2022-04-11"></td>
																				<td class="fc-day fc-widget-content fc-tue fc-past"
																					data-date="2022-04-12"></td>
																				<td class="fc-day fc-widget-content fc-wed fc-past"
																					data-date="2022-04-13"></td>
																				<td class="fc-day fc-widget-content fc-thu fc-past"
																					data-date="2022-04-14"></td>
																				<td class="fc-day fc-widget-content fc-fri fc-past"
																					data-date="2022-04-15"></td>
																				<td class="fc-day fc-widget-content fc-sat fc-past"
																					data-date="2022-04-16"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td class="fc-day-top fc-sun fc-past"
																					data-date="2022-04-10"><span
																					class="fc-day-number">10</span></td>
																				<td class="fc-day-top fc-mon fc-past"
																					data-date="2022-04-11"><span
																					class="fc-day-number">11</span></td>
																				<td class="fc-day-top fc-tue fc-past"
																					data-date="2022-04-12"><span
																					class="fc-day-number">12</span></td>
																				<td class="fc-day-top fc-wed fc-past"
																					data-date="2022-04-13"><span
																					class="fc-day-number">13</span></td>
																				<td class="fc-day-top fc-thu fc-past"
																					data-date="2022-04-14"><span
																					class="fc-day-number">14</span></td>
																				<td class="fc-day-top fc-fri fc-past"
																					data-date="2022-04-15"><span
																					class="fc-day-number">15</span></td>
																				<td class="fc-day-top fc-sat fc-past"
																					data-date="2022-04-16"><span
																					class="fc-day-number">16</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td rowspan="5"></td>
																				<td rowspan="5"></td>
																				<td class="fc-event-container"></td>
																				<td class="fc-event-container" colspan="3"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-primary fc-draggable" id="event-2" data-original-title="" title=""><div class="fc-content"><span class="fc-time">7:30p</span> <span class="fc-title">???????????? ?????? ??????</span></div></a></td>
																				<td rowspan="5"></td>
																				<td rowspan="5"></td>
																				<td rowspan="5"></td>
																			</tr>
																			<tr>
																				<td class="fc-event-container fc-limited"
																					colspan="2"></td>
																				<td class="fc-more-cell" rowspan="1"><div>
																						
																					</div></td>
																				<td class="fc-more-cell" rowspan="1"><div>
																						
																					</div></td>
																			</tr>
																			<tr class="fc-limited">
																				<td class="fc-event-container" colspan="2"></td>
																			</tr>
																			<tr class="fc-limited">
																				<td class="fc-event-container" colspan="2"></td>
																			</tr>
																			<tr class="fc-limited">
																				<td class="fc-event-container" colspan="2"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 116px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td class="fc-day fc-widget-content fc-sun fc-past"
																					data-date="2022-04-17"></td>
																				<td class="fc-day fc-widget-content fc-mon fc-past"
																					data-date="2022-04-18"></td>
																				<td class="fc-day fc-widget-content fc-tue fc-past"
																					data-date="2022-04-19"></td>
																				<td
																					class="fc-day fc-widget-content fc-wed fc-today fc-state-highlight"
																					data-date="2022-04-20"></td>
																				<td
																					class="fc-day fc-widget-content fc-thu fc-future"
																					data-date="2022-04-21"></td>
																				<td
																					class="fc-day fc-widget-content fc-fri fc-future"
																					data-date="2022-04-22"></td>
																				<td
																					class="fc-day fc-widget-content fc-sat fc-future"
																					data-date="2022-04-23"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td class="fc-day-top fc-sun fc-past"
																					data-date="2022-04-17"><span
																					class="fc-day-number">17</span></td>
																				<td class="fc-day-top fc-mon fc-past"
																					data-date="2022-04-18"><span
																					class="fc-day-number">18</span></td>
																				<td class="fc-day-top fc-tue fc-past"
																					data-date="2022-04-19"><span
																					class="fc-day-number">19</span></td>
																				<td
																					class="fc-day-top fc-wed fc-today fc-state-highlight"
																					data-date="2022-04-20"><span
																					class="fc-day-number" style="padding: 3px 4px;">20</span></td>
																				<td class="fc-day-top fc-thu fc-future"
																					data-date="2022-04-21"><span
																					class="fc-day-number">21</span></td>
																				<td class="fc-day-top fc-fri fc-future"
																					data-date="2022-04-22"><span
																					class="fc-day-number">22</span></td>
																				<td class="fc-day-top fc-sat fc-future"
																					data-date="2022-04-23"><span
																					class="fc-day-number">23</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td class="fc-event-container" colspan="2"></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 116px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td
																					class="fc-day fc-widget-content fc-sun fc-future"
																					data-date="2022-04-24"></td>
																				<td
																					class="fc-day fc-widget-content fc-mon fc-future"
																					data-date="2022-04-25"></td>
																				<td
																					class="fc-day fc-widget-content fc-tue fc-future"
																					data-date="2022-04-26"></td>
																				<td
																					class="fc-day fc-widget-content fc-wed fc-future"
																					data-date="2022-04-27"></td>
																				<td
																					class="fc-day fc-widget-content fc-thu fc-future"
																					data-date="2022-04-28"></td>
																				<td
																					class="fc-day fc-widget-content fc-fri fc-future"
																					data-date="2022-04-29"></td>
																				<td
																					class="fc-day fc-widget-content fc-sat fc-future"
																					data-date="2022-04-30"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td class="fc-day-top fc-sun fc-future"
																					data-date="2022-04-24"><span
																					class="fc-day-number">24</span></td>
																				<td class="fc-day-top fc-mon fc-future"
																					data-date="2022-04-25"><span
																					class="fc-day-number">25</span></td>
																				<td class="fc-day-top fc-tue fc-future"
																					data-date="2022-04-26"><span
																					class="fc-day-number">26</span></td>
																				<td class="fc-day-top fc-wed fc-future"
																					data-date="2022-04-27"><span
																					class="fc-day-number">27</span></td>
																				<td class="fc-day-top fc-thu fc-future"
																					data-date="2022-04-28"><span
																					class="fc-day-number">28</span></td>
																				<td class="fc-day-top fc-fri fc-future"
																					data-date="2022-04-29"><span
																					class="fc-day-number">29</span></td>
																				<td class="fc-day-top fc-sat fc-future"
																					data-date="2022-04-30"><span
																					class="fc-day-number">30</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td class="fc-event-container" colspan="4"></td>
																				<td></td>
																				<td rowspan="2"></td>
																				<td rowspan="2"></td>
																			</tr>
																			<tr>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td class="fc-event-container" colspan="2"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div class="fc-row fc-week fc-widget-content fc-rigid"
																style="height: 120px;">
																<div class="fc-bg">
																	<table>
																		<tbody>
																			<tr>
																				<td
																					class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																					data-date="2022-05-01"></td>
																				<td
																					class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																					data-date="2022-05-02"></td>
																				<td
																					class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																					data-date="2022-05-03"></td>
																				<td
																					class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																					data-date="2022-05-04"></td>
																				<td
																					class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																					data-date="2022-05-05"></td>
																				<td
																					class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																					data-date="2022-05-06"></td>
																				<td
																					class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																					data-date="2022-05-07"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="fc-content-skeleton">
																	<table>
																		<thead>
																			<tr>
																				<td
																					class="fc-day-top fc-sun fc-other-month fc-future"
																					data-date="2022-05-01"><span
																					class="fc-day-number">1</span></td>
																				<td
																					class="fc-day-top fc-mon fc-other-month fc-future"
																					data-date="2022-05-02"><span
																					class="fc-day-number">2</span></td>
																				<td
																					class="fc-day-top fc-tue fc-other-month fc-future"
																					data-date="2022-05-03"><span
																					class="fc-day-number">3</span></td>
																				<td
																					class="fc-day-top fc-wed fc-other-month fc-future"
																					data-date="2022-05-04"><span
																					class="fc-day-number">4</span></td>
																				<td
																					class="fc-day-top fc-thu fc-other-month fc-future"
																					data-date="2022-05-05"><span
																					class="fc-day-number">5</span></td>
																				<td
																					class="fc-day-top fc-fri fc-other-month fc-future"
																					data-date="2022-05-06"><span
																					class="fc-day-number">6</span></td>
																				<td
																					class="fc-day-top fc-sat fc-other-month fc-future"
																					data-date="2022-05-07"><span
																					class="fc-day-number">7</span></td>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																				<td></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
															<div class="ps__thumb-x" tabindex="0"
																style="left: 0px; width: 0px;"></div>
														</div>
														<div class="ps__rail-y"
															style="top: 0px; height: 299px; right: 0px;">
															<div class="ps__thumb-y" tabindex="0"
																style="top: 0px; height: 127px;"></div>
														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- The Modal -->
			<div id="addEventsModal" class="modal animated fadeIn">

				<div class="modal-dialog modal-dialog-centered">

					<!-- Modal content -->
					<div class="modal-content">

						<div class="modal-body">

							<span class="close">??</span>

							<div class="add-edit-event-box">
								<div class="add-edit-event-content">
									<h5 class="add-event-title modal-title">?????? ??????</h5>
									<h5 class="edit-event-title modal-title">?????? ??????</h5>

									<form name="cal" action="/project/calendar.do" method="post">

										<div class="row">

											<div class="col-md-12">
												<label for="start-date" class="">?????? ??????</label>
												<div class="d-flex event-title">
													<input id="write-e" type="text" class="form-control"
														name="schdlTtl">
												</div>
											</div>

											<div class="col-md-6 col-sm-6 col-12">
												<div class="form-group start-date">
													<label for="start-date" class="">?????????</label>
													<div class="d-flex">
														<input id="start-date" class="form-control" type="text"
															name="schdlSrtDt">
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-6 col-12">
												<div class="form-group end-date">
													<label for="end-date" class="">?????????</label>
													<div class="d-flex">
														<input id="end-date" type="text" class="form-control"
															name="schdlNdDt">
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<label for="start-date" class="">?????? ?????? ??????</label>
												<div class="d-flex event-description">
													<textarea id="taskdescription" rows="3"
														class="form-control" name="schdlCn"></textarea>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="event-badge">
													<p class="">?????? ??????</p>

													<div class="d-sm-flex d-block">
														<div class="n-chk">
															<label class="new-control new-radio radio-primary">
																<input type="radio" id="marker"
																class="new-control-input" name="schdlCtgrCd"
																value="bg-primary"> <span
																class="new-control-indicator"></span>??????
															</label>
														</div>

														<div class="n-chk">
															<label class="new-control new-radio radio-warning">
																<input type="radio" id="marker"
																class="new-control-input" name="schdlCtgrCd"
																value="bg-warning"> <span
																class="new-control-indicator"></span>??????
															</label>
														</div>

														<div class="n-chk">
															<label class="new-control new-radio radio-danger">
																<input type="radio" id="marker"
																class="new-control-input" name="schdlCtgrCd"
																value="bg-danger"> <span
																class="new-control-indicator"></span>??????
															</label>
														</div>

													</div>

												</div>
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary mb-2"
												id="delBtn">??????</button>
											<button id="discard" class="btn btn-outline-primary mb-2"
												data-dismiss="modal">??????</button>

											<button
												style="background: white; border: 1px solid #29347a; color: #29347a"
												type="button" id="add-e" class="btn">??????</button>
											<button id="edit-event" class="btn btn-outline-primary mb-2">??????</button>
										</div>
										<sec:csrfInput />
									</form>
								</div>
							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>
	<div class="flatpickr-calendar hasTime animate" tabindex="-1">
		<div class="flatpickr-months">
			<span class="flatpickr-prev-month flatpickr-disabled"><svg
					version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path
						d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z"></path></svg></span>
			<div class="flatpickr-month">
				<div class="flatpickr-current-month">
					<select class="flatpickr-monthDropdown-months" tabindex="-1"><option
							class="flatpickr-monthDropdown-month" value="2" tabindex="-1">March</option>
						<option class="flatpickr-monthDropdown-month" value="3"
							tabindex="-1">April</option>
						<option class="flatpickr-monthDropdown-month" value="4"
							tabindex="-1">May</option>
						<option class="flatpickr-monthDropdown-month" value="5"
							tabindex="-1">June</option>
						<option class="flatpickr-monthDropdown-month" value="6"
							tabindex="-1">July</option>
						<option class="flatpickr-monthDropdown-month" value="7"
							tabindex="-1">August</option>
						<option class="flatpickr-monthDropdown-month" value="8"
							tabindex="-1">September</option>
						<option class="flatpickr-monthDropdown-month" value="9"
							tabindex="-1">October</option>
						<option class="flatpickr-monthDropdown-month" value="10"
							tabindex="-1">November</option>
						<option class="flatpickr-monthDropdown-month" value="11"
							tabindex="-1">December</option></select>
					<div class="numInputWrapper">
						<input class="numInput cur-year" type="number" tabindex="-1"
							aria-label="Year" min="2022"><span class="arrowUp"></span><span
							class="arrowDown"></span>
					</div>
				</div>
			</div>
			<span class="flatpickr-next-month"><svg version="1.1"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path
						d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z"></path></svg></span>
		</div>
		<div class="flatpickr-innerContainer">
			<div class="flatpickr-rContainer">
				<div class="flatpickr-weekdays">
					<div class="flatpickr-weekdaycontainer">
						<span class="flatpickr-weekday"> Sun</span><span
							class="flatpickr-weekday">Mon</span><span
							class="flatpickr-weekday">Tue</span><span
							class="flatpickr-weekday">Wed</span><span
							class="flatpickr-weekday">Thu</span><span
							class="flatpickr-weekday">Fri</span><span
							class="flatpickr-weekday">Sat </span>
					</div>
				</div>
				<div class="flatpickr-days" tabindex="-1">
					<div class="dayContainer">
						<span class="flatpickr-day prevMonthDay flatpickr-disabled"
							aria-label="February 27, 2022">27</span><span
							class="flatpickr-day prevMonthDay flatpickr-disabled"
							aria-label="February 28, 2022">28</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 1, 2022">1</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 2, 2022">2</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 3, 2022">3</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 4, 2022">4</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 5, 2022">5</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 6, 2022">6</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 7, 2022">7</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 8, 2022">8</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 9, 2022">9</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 10, 2022">10</span><span
							class="flatpickr-day today" aria-label="March 11, 2022"
							aria-current="date" tabindex="-1">11</span><span
							class="flatpickr-day " aria-label="March 12, 2022" tabindex="-1">12</span><span
							class="flatpickr-day " aria-label="March 13, 2022" tabindex="-1">13</span><span
							class="flatpickr-day " aria-label="March 14, 2022" tabindex="-1">14</span><span
							class="flatpickr-day " aria-label="March 15, 2022" tabindex="-1">15</span><span
							class="flatpickr-day " aria-label="March 16, 2022" tabindex="-1">16</span><span
							class="flatpickr-day " aria-label="March 17, 2022" tabindex="-1">17</span><span
							class="flatpickr-day " aria-label="March 18, 2022" tabindex="-1">18</span><span
							class="flatpickr-day " aria-label="March 19, 2022" tabindex="-1">19</span><span
							class="flatpickr-day " aria-label="March 20, 2022" tabindex="-1">20</span><span
							class="flatpickr-day " aria-label="March 21, 2022" tabindex="-1">21</span><span
							class="flatpickr-day " aria-label="March 22, 2022" tabindex="-1">22</span><span
							class="flatpickr-day " aria-label="March 23, 2022" tabindex="-1">23</span><span
							class="flatpickr-day " aria-label="March 24, 2022" tabindex="-1">24</span><span
							class="flatpickr-day " aria-label="March 25, 2022" tabindex="-1">25</span><span
							class="flatpickr-day " aria-label="March 26, 2022" tabindex="-1">26</span><span
							class="flatpickr-day " aria-label="March 27, 2022" tabindex="-1">27</span><span
							class="flatpickr-day " aria-label="March 28, 2022" tabindex="-1">28</span><span
							class="flatpickr-day " aria-label="March 29, 2022" tabindex="-1">29</span><span
							class="flatpickr-day " aria-label="March 30, 2022" tabindex="-1">30</span><span
							class="flatpickr-day " aria-label="March 31, 2022" tabindex="-1">31</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 1, 2022"
							tabindex="-1">1</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 2, 2022" tabindex="-1">2</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 3, 2022"
							tabindex="-1">3</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 4, 2022" tabindex="-1">4</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 5, 2022"
							tabindex="-1">5</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 6, 2022" tabindex="-1">6</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 7, 2022"
							tabindex="-1">7</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 8, 2022" tabindex="-1">8</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 9, 2022"
							tabindex="-1">9</span>
					</div>
				</div>
			</div>
		</div>
		<div class="flatpickr-time" tabindex="-1">
			<div class="numInputWrapper">
				<input class="numInput flatpickr-hour" type="number"
					aria-label="Hour" tabindex="-1" step="1" min="1" max="12"><span
					class="arrowUp"></span><span class="arrowDown"></span>
			</div>
			<span class="flatpickr-time-separator">:</span>
			<div class="numInputWrapper">
				<input class="numInput flatpickr-minute" type="number"
					aria-label="Minute" tabindex="-1" step="5" min="0" max="59"><span
					class="arrowUp"></span><span class="arrowDown"></span>
			</div>
			<span class="flatpickr-am-pm" title="Click to toggle" tabindex="-1">PM</span>
		</div>
	</div>
	<div class="flatpickr-calendar hasTime animate" tabindex="-1">
		<div class="flatpickr-months">
			<span class="flatpickr-prev-month flatpickr-disabled"><svg
					version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path
						d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z"></path></svg></span>
			<div class="flatpickr-month">
				<div class="flatpickr-current-month">
					<select class="flatpickr-monthDropdown-months" tabindex="-1"><option
							class="flatpickr-monthDropdown-month" value="2" tabindex="-1">March</option>
						<option class="flatpickr-monthDropdown-month" value="3"
							tabindex="-1">April</option>
						<option class="flatpickr-monthDropdown-month" value="4"
							tabindex="-1">May</option>
						<option class="flatpickr-monthDropdown-month" value="5"
							tabindex="-1">June</option>
						<option class="flatpickr-monthDropdown-month" value="6"
							tabindex="-1">July</option>
						<option class="flatpickr-monthDropdown-month" value="7"
							tabindex="-1">August</option>
						<option class="flatpickr-monthDropdown-month" value="8"
							tabindex="-1">September</option>
						<option class="flatpickr-monthDropdown-month" value="9"
							tabindex="-1">October</option>
						<option class="flatpickr-monthDropdown-month" value="10"
							tabindex="-1">November</option>
						<option class="flatpickr-monthDropdown-month" value="11"
							tabindex="-1">December</option></select>
					<div class="numInputWrapper">
						<input class="numInput cur-year" type="number" tabindex="-1"
							aria-label="Year" min="2022"><span class="arrowUp"></span><span
							class="arrowDown"></span>
					</div>
				</div>
			</div>
			<span class="flatpickr-next-month"><svg version="1.1"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path
						d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z"></path></svg></span>
		</div>
		<div class="flatpickr-innerContainer">
			<div class="flatpickr-rContainer">
				<div class="flatpickr-weekdays">
					<div class="flatpickr-weekdaycontainer">
						<span class="flatpickr-weekday"> Sun</span><span
							class="flatpickr-weekday">Mon</span><span
							class="flatpickr-weekday">Tue</span><span
							class="flatpickr-weekday">Wed</span><span
							class="flatpickr-weekday">Thu</span><span
							class="flatpickr-weekday">Fri</span><span
							class="flatpickr-weekday">Sat </span>
					</div>
				</div>
				<div class="flatpickr-days" tabindex="-1">
					<div class="dayContainer">
						<span class="flatpickr-day prevMonthDay flatpickr-disabled"
							aria-label="February 27, 2022">27</span><span
							class="flatpickr-day prevMonthDay flatpickr-disabled"
							aria-label="February 28, 2022">28</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 1, 2022">1</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 2, 2022">2</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 3, 2022">3</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 4, 2022">4</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 5, 2022">5</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 6, 2022">6</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 7, 2022">7</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 8, 2022">8</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 9, 2022">9</span><span
							class="flatpickr-day flatpickr-disabled"
							aria-label="March 10, 2022">10</span><span
							class="flatpickr-day today" aria-label="March 11, 2022"
							aria-current="date" tabindex="-1">11</span><span
							class="flatpickr-day " aria-label="March 12, 2022" tabindex="-1">12</span><span
							class="flatpickr-day " aria-label="March 13, 2022" tabindex="-1">13</span><span
							class="flatpickr-day " aria-label="March 14, 2022" tabindex="-1">14</span><span
							class="flatpickr-day " aria-label="March 15, 2022" tabindex="-1">15</span><span
							class="flatpickr-day " aria-label="March 16, 2022" tabindex="-1">16</span><span
							class="flatpickr-day " aria-label="March 17, 2022" tabindex="-1">17</span><span
							class="flatpickr-day " aria-label="March 18, 2022" tabindex="-1">18</span><span
							class="flatpickr-day " aria-label="March 19, 2022" tabindex="-1">19</span><span
							class="flatpickr-day " aria-label="March 20, 2022" tabindex="-1">20</span><span
							class="flatpickr-day " aria-label="March 21, 2022" tabindex="-1">21</span><span
							class="flatpickr-day " aria-label="March 22, 2022" tabindex="-1">22</span><span
							class="flatpickr-day " aria-label="March 23, 2022" tabindex="-1">23</span><span
							class="flatpickr-day " aria-label="March 24, 2022" tabindex="-1">24</span><span
							class="flatpickr-day " aria-label="March 25, 2022" tabindex="-1">25</span><span
							class="flatpickr-day " aria-label="March 26, 2022" tabindex="-1">26</span><span
							class="flatpickr-day " aria-label="March 27, 2022" tabindex="-1">27</span><span
							class="flatpickr-day " aria-label="March 28, 2022" tabindex="-1">28</span><span
							class="flatpickr-day " aria-label="March 29, 2022" tabindex="-1">29</span><span
							class="flatpickr-day " aria-label="March 30, 2022" tabindex="-1">30</span><span
							class="flatpickr-day " aria-label="March 31, 2022" tabindex="-1">31</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 1, 2022"
							tabindex="-1">1</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 2, 2022" tabindex="-1">2</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 3, 2022"
							tabindex="-1">3</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 4, 2022" tabindex="-1">4</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 5, 2022"
							tabindex="-1">5</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 6, 2022" tabindex="-1">6</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 7, 2022"
							tabindex="-1">7</span><span class="flatpickr-day nextMonthDay"
							aria-label="April 8, 2022" tabindex="-1">8</span><span
							class="flatpickr-day nextMonthDay" aria-label="April 9, 2022"
							tabindex="-1">9</span>
					</div>
				</div>
			</div>
		</div>
		<div class="flatpickr-time" tabindex="-1">
			<div class="numInputWrapper">
				<input class="numInput flatpickr-hour" type="number"
					aria-label="Hour" tabindex="-1" step="1" min="1" max="12"><span
					class="arrowUp"></span><span class="arrowDown"></span>
			</div>
			<span class="flatpickr-time-separator">:</span>
			<div class="numInputWrapper">
				<input class="numInput flatpickr-minute" type="number"
					aria-label="Minute" tabindex="-1" step="5" min="0" max="59"><span
					class="arrowUp"></span><span class="arrowDown"></span>
			</div>
			<span class="flatpickr-am-pm" title="Click to toggle" tabindex="-1">PM</span>
		</div>
	</div>


	<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="/resources/plugins/fullcalendar/moment.min.js"></script>
	<script src="/resources/plugins/flatpickr/flatpickr.js"></script>
	<script src="/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
	<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
	<script>
	 // Get the modal
    var modal = document.getElementById("addEventsModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the Add Event button
    var addEvent = document.getElementById("add-e");
    // Get the Edit Event button
    var editEvent = document.getElementById("edit-event");
    // Get the Discard Modal button
    var discardModal = document.querySelectorAll("[data-dismiss='modal']")[0];
    
    var delBtn = document.getElementById("delBtn");
    
    // Get the Add Event button
    var addEventTitle = document.getElementsByClassName("add-event-title")[0];
    // Get the Edit Event button
    var editEventTitle = document.getElementsByClassName("edit-event-title")[0];

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // Get the all <input> elements insdie the modal
    var input = document.querySelectorAll('input[type="text"]');
    var radioInput = document.querySelectorAll('input[type="radio"]');

    // Get the all <textarea> elements insdie the modal
    var textarea = document.getElementsByTagName('textarea');

    // Create BackDrop ( Overlay ) Element
    function createBackdropElement () {
        var btn = document.createElement("div");
        btn.setAttribute('class', 'modal-backdrop fade show')
        document.body.appendChild(btn);
    }

    // Reset radio buttons

    function clearRadioGroup(GroupName) {
      var ele = document.getElementsByName(GroupName);
        for(var i=0;i<ele.length;i++)
        ele[i].checked = false;
    }

    // Reset Modal Data on when modal gets closed
    function modalResetData() {
    	alert("??????");
        modal.style.display = "none";
        for (i = 0; i < input.length; i++) {
            input[i].value = '';
        }
        for (j = 0; j < textarea.length; j++) {
            textarea[j].value = '';
          i
        }
        clearRadioGroup("marker");
        // Get Modal Backdrop
        var getModalBackdrop = document.getElementsByClassName('modal-backdrop')[0];
        document.body.removeChild(getModalBackdrop)
    }

    
    
    function nonFilter(){
    	v_data=[];
		    $.ajax({
			        url:'/project/calendarAll.do',	        		
			        type:'get',
			        async: false,  // ?????? ?????????
					data:{
						pjtNo:pjtNo
					},
			        success : function(data) {				        				        		
			            	console.log(data);
							for(var i=0; i<data.length; i++){
							   var v_each = {};
							   v_each.id = data[i].schdlNo;		
			            	   v_each.title = data[i].schdlTtl;		
			            	   v_each.start = data[i].schdlSrtDt.split(" ")[0] + "T"+data[i].schdlSrtDt.split(" ")[1];		
			            	   v_each.end =  data[i].schdlNdDt.split(" ")[0] + "T"+data[i].schdlNdDt.split(" ")[1];		
			            	   v_each.className = '';
			            	   
			            	   console.log(v_each.start);
			            	   
			            	   //console.log(data[i].schdlCtgrCd);
			            	   
			            	   var v_check = data[i].schdlCtgrCd;
			            	   
			            	   if( v_check == 'C01'){
			            	   		//console.log('hello');
			            	   		v_each.className ='bg-primary';
			            	   }else if(v_check == 'C02'){ 
			            	    	v_each.className ='bg-warning';
			            	   }else if(v_check == 'C03'){ 
			            	   		v_each.className ='bg-danger';
			            	   }
			            	   
			            	   console.log('after: ',v_each.className);
			            	   v_each.description = data[i].schdlCn;
			            	  
			            	   v_data.push(v_each);   
							}
			         },
			        error : function() {
			        	
			        }
			});
	}
	
	function onFilter(val){
		v_data=[];
	 $.ajax({
			        url:'/project/calendarFiltering.do',	        		
			        type:'post',
			        async: false,  // ?????? ?????????
			        data : {
						pjtNo:pjtNo,
            			schdlCtgrCd:val           		
            		},
			        success : function(data) {	
			        	console.log("filtering data : ", data);	
			        	console.log("lenlen : ",data.length);		        				        					            	
							for(var i=0; i<data.length; i++){
								console.log("hello");
							   var v_each = {};
							   v_each.id = data[i].schdlNo;		
			            	   v_each.title = data[i].schdlTtl;		
			            	   v_each.start = data[i].schdlSrtDt.split(" ")[0] + "T"+data[i].schdlSrtDt.split(" ")[1];		
			            	   v_each.end =  data[i].schdlNdDt.split(" ")[0] + "T"+data[i].schdlNdDt.split(" ")[1];		
			            	   v_each.className = '';
			            	   
			            	  // console.log(v_each.start);
			            	   
			            	   //console.log(data[i].schdlCtgrCd);
			            	   //console.log("an",data[i].schdlCtgrCd.trim(),"an");
			            	   
			            	   var v_check = data[i].schdlCtgrCd;
			            	   //console.log("ck:",v_check);
			            	   if( v_check == 'C01'){
			            	   		//console.log('hello');
			            	   		v_each.className ='bg-primary';
			            	   }else if(v_check == 'C02'){ 
			            	    	v_each.className ='bg-warning';
			            	   }else if(v_check == 'C03'){ 
			            	   		v_each.className ='bg-danger';
			            	   }else if(v_check =='null'){
			            	   		v_each.className=undefined;
			            	   }
			            	   
			            	   v_each.description = data[i].schdlCn;
			            	  
			            	   v_data.push(v_each);  
			            	   	
							}
			         },
			        error : function() {
			        	
			        }
			});
			
	}

    newDate = new Date()
    monthArray = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ]

    function getDynamicMonth( monthOrder ) {
        var getNumericMonth = parseInt(monthArray[newDate.getMonth()]);
        var getNumericMonthInc = parseInt(monthArray[newDate.getMonth()]) + 1;
        var getNumericMonthDec = parseInt(monthArray[newDate.getMonth()]) - 1;

        if (monthOrder === 'default') {

            if (getNumericMonth < 10 ) {
                return '0' + getNumericMonth;
            } else if (getNumericMonth >= 10) {
                return getNumericMonth;
            }

        } else if (monthOrder === 'inc') {

            if (getNumericMonthInc < 10 ) {
                return '0' + getNumericMonthInc;
            } else if (getNumericMonthInc >= 10) {
                return getNumericMonthInc;
            }

        } else if (monthOrder === 'dec') {

            if (getNumericMonthDec < 10 ) {
                return '0' + getNumericMonthDec;
            } else if (getNumericMonthDec >= 10) {
                return getNumericMonthDec;
            }
        }
    }
	console.log("hihi");
    function randomString(length, chars) {
        var result = '';
        for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
        return result;
    }
    
    
    
    
    
    
	$(document).ready(function() {
		
		var addBtn = document.querySelector("#add-e");	
		addBtn.addEventListener("click",insertCal);
		
		

  	    var filterKey=window.location.search;
    	console.log("filterKey: " ,filterKey.split("=")[1]);
    	filterKey = filterKey.split("=")[1];
    	
    	var checkArr=[];
    	checkArr=document.querySelectorAll('input[type=checkbox]');
    	//console.log(checkArr); 
    	for(var i=0; i<checkArr.length;i++){
    		if(checkArr[i].defaultValue==filterKey){
    			console.log(checkArr[i]);
    			checkArr[i].checked = true;    			
    		}
    		
    	}

	v_len = $("input:checkbox[name=filter]:checked").length;
	console.log("len",v_len);
	
	var v_data=[];
	v_filter = $("input:checkbox[name=filter]:checked").val();
	//console.log('v_filter : ',v_filter);
	
	//????????? ?????? ???
	if(v_len==0) nonFilter();
	
	//?????? ????????? ?????? ???
	if(v_len>0) {
  		v_filter = $("input:checkbox[name=filter]:checked").val();
		onFilter(v_filter);
	
    }

   
   

    // When the user clicks on the button, open the modal
    btn.onclick = function() {
    	delBtn.style.display ="none";
        modal.style.display = "block";
        addEvent.style.display = 'block';
        editEvent.style.display = 'none';
        addEventTitle.style.display = 'block';
        editEventTitle.style.display = 'none';
        document.getElementsByTagName('body')[0].style.overflow = 'hidden';
        createBackdropElement();
        enableDatePicker();
    }

    // Clear Data and close the modal when the user clicks on Discard button
    discardModal.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }

    // Clear Data and close the modal when the user clicks on <span> (x).
    span.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }

    // Clear Data and close the modal when the user clicks anywhere outside of the modal.
    window.onclick = function(event) {
        if (event.target == modal) {
            modalResetData();
            document.getElementsByTagName('body')[0].removeAttribute('style');
        }
    }

	
	
	
    var calendar = $('#calendar').fullCalendar({
  
        header: {
            left: 'prev,next',
            center: 'title',
            right:''
           
        },
        events:v_data,
        editable: true,
        eventLimit: true,
        eventMouseover: function(event, jsEvent, view) {
            $(this).attr('id', event.id);

            $('#'+event.id).popover({
                template: '<div class="popover popover-primary" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>',
                title: event.title,
                content: event.description,
                placement: 'top',
            });

            $('#'+event.id).popover('show');
        },
        eventMouseout: function(event, jsEvent, view) {
            $('#'+event.id).popover('hide');
        },
        eventClick: function(info) {

            addEvent.style.display = 'none';
            editEvent.style.display = 'block';

			delBtn.style.display='block';
            addEventTitle.style.display = 'none';
            editEventTitle.style.display = 'block';
            modal.style.display = "block";
            document.getElementsByTagName('body')[0].style.overflow = 'hidden';
            createBackdropElement();

            // Calendar Event Featch
            var eventTitle = info.title;
            var eventDescription = info.description;

            // Task Modal Input
            var taskTitle = $('#write-e');
            var taskTitleValue = taskTitle.val(eventTitle);

            var taskDescription = $('#taskdescription');
            var taskDescriptionValue = taskDescription.val(eventDescription);

            var taskInputStarttDate = $("#start-date");
            var taskInputStarttDateValue = taskInputStarttDate.val(info.start.format("YYYY-MM-DD HH:mm:ss"));

            var taskInputEndDate = $("#end-date");
            var taskInputEndtDateValue = taskInputEndDate.val(info.end.format("YYYY-MM-DD HH:mm:ss"));
        
            var startDate = flatpickr(document.getElementById('start-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                defaultDate: info.start.format("YYYY-MM-DD HH:mm:ss"),
            });

            var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {
            	console.log("dddd");
                var endtDate = flatpickr(document.getElementById('end-date'), {
                    enableTime: true,
                    dateFormat: "Y-m-d H:i",
                    minDate: dateStr
                });
            })

            var endtDate = flatpickr(document.getElementById('end-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                defaultDate: info.end.format("YYYY-MM-DD HH:mm:ss"),
                minDate: info.start.format("YYYY-MM-DD HH:mm:ss")
            });
            
         
         //?????? ?????? ??????
            $('#delBtn').off('click').on('click', function(event) {
             	console.log(info.id);
             	
		  const swalWithBootstrapButtons = swal.mixin({
		    confirmButtonClass: 'btn btn-success btn-rounded',
		    cancelButtonClass: 'btn btn-danger btn-rounded mr-3',
		    buttonsStyling: false,
		  })
		  
		  
		  swalWithBootstrapButtons({
		    title: '????????? ?????????????????????????',
		    text: "????????? ????????? ????????? ??? ????????????",
		    type: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '??????',
		    cancelButtonText: '?????? ??????',
		    reverseButtons: true,
		    padding: '2em'
		  }).then(function(result) {
		    if (result.value) {
		    
		      swalWithBootstrapButtons(
		        '?????? ??????',
		        '????????? ?????????????????????',
		        'success'
		      )
		      
          		//console.log (info.id);
         		
          		$.ajax({
            		url : "/project/calendarDelete.do",
            		type : 'post',
            		async: false,
            		data : {
            			schdlNo:info.id,
            		},
            		success : function(data) {
            			location.href="/project/calendar.do";		
            	     },
            		error : function() {
            		
            		}
            	});
		      
             		
		    } else if (
		      // Read more about handling dismissals
		      result.dismiss === swal.DismissReason.cancel
		    ) {
		      swalWithBootstrapButtons(
		        '?????? ??????',
		        '?????? ????????? ?????????????????????',
		        'error'
		      )
		    }
		  })	
		  
             });
             
        

            $('#edit-event').off('click').on('click', function(event) {
                event.preventDefault();
                /* Act on the event */
                var radioValue = $("input[name='schdlCtgrCd']:checked").val();

                var taskStartTimeValue = document.getElementById("start-date").value;
                var taskEndTimeValue = document.getElementById("end-date").value;
				
                info.title = taskTitle.val();
                info.description = taskDescription.val();
                info.start = taskStartTimeValue;
                info.end = taskEndTimeValue;
                info.className = radioValue;
                
                if(info.className==undefined){
                	info.className="null";
                }
                            
				console.log("?????? : ",info);
				
				 //db update ajax
               $.ajax({
            		url : "/project/calendarUpdate.do",
            		type : 'post',
            		async: false,
            		data : {
            			schdlNo:info.id,
            			schdlTtl:info.title, 
            			schdlSrtDt:info.start,
            			schdlNdDt:info.end,
            			schdlCn:info.description,
            			color:info.className            		
            		},
            		success : function(data) {
            	     },
            		error : function() {
            		}
            	});

                $('#calendar').fullCalendar('updateEvent', info);
                modal.style.display = "none";
                modalResetData();
                document.getElementsByTagName('body')[0].removeAttribute('style');
                
                
            });
        }
    })
    

    function enableDatePicker() {
        var startDate = flatpickr(document.getElementById('start-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });

        var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {

            var endtDate = flatpickr(document.getElementById('end-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                minDate: dateStr
            });
        })

        var endtDate = flatpickr(document.getElementById('end-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });
    }


    $("#add-e").off('click').on('click', function(event) {
        var radioValue = $("input[id='marker']:checked").val();
        var randomAlphaNumeric = randomString(10, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
        var inputValue = $("#write-e").val();
        var inputStarttDate = document.getElementById("start-date").value;
        var inputEndDate = document.getElementById("end-date").value;

        var arrayStartDate = inputStarttDate.split(' ');

        var arrayEndDate = inputEndDate.split(' ');

        var startDate = arrayStartDate[0];
        var startTime = arrayStartDate[1];

        var endDate = arrayEndDate[0];
        var endTime = arrayEndDate[1];

        var concatenateStartDateTime = startDate+'T'+startTime+':00';
        var concatenateEndDateTime = endDate+'T'+endTime+':00';

        var inputDescription = document.getElementById("taskdescription").value;
        var myCalendar = $('#calendar');
        myCalendar.fullCalendar();
        var myEvent = {
          timeZone: 'UTC',
          allDay : false,
          id: randomAlphaNumeric,
          title:inputValue,
          start: concatenateStartDateTime,
          end: concatenateEndDateTime,
          className: radioValue,
          description: inputDescription
        };
        myCalendar.fullCalendar( 'renderEvent', myEvent, true );
        modal.style.display = "none";
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
       
       c_start = concatenateStartDateTime.split("T")[0]+" "+concatenateStartDateTime.split("T")[1];
       console.log(c_start);
       
        //db insert ajax
               $.ajax({
            		url : "/project/calendarInsert.do",
            		type : 'post',
            		data : {
            			schdlTtl:inputValue, 
            			schdlSrtDt:inputStarttDate,
            			schdlNdDt:inputEndDate,
            			schdlCn:inputDescription,
						pjtNo:pjtNo,
            			color:$('input[name="schdlCtgrCd"]:checked').val()
            		},
            		success : function(data) {
            	     },
            		error : function() {
            		}
            	}); 
        
        
        
    });


    // Setting dynamic style ( padding ) of the highlited ( current ) date

    function setCurrentDateHighlightStyle() {
        getCurrentDate = $('.fc-content-skeleton .fc-today').attr('data-date');
        if (getCurrentDate === undefined) {
            return;
        }
        splitDate = getCurrentDate.split('-');
        if (splitDate[2] < 10) {
            $('.fc-content-skeleton .fc-today .fc-day-number').css('padding', '3px 8px');
        } else if (splitDate[2] >= 10) {
            $('.fc-content-skeleton .fc-today .fc-day-number').css('padding', '3px 4px');
        }
    }
    setCurrentDateHighlightStyle();

    const mailScroll = new PerfectScrollbar('.fc-scroller', {
        suppressScrollX : true
    });
    
    var fcButtons = document.getElementsByClassName('fc-button');
    for(var i = 0; i < fcButtons.length; i++) {
        fcButtons[i].addEventListener('click', function() {
            const mailScroll = new PerfectScrollbar('.fc-scroller', {
                suppressScrollX : true
            });        
            $('.fc-scroller').animate({ scrollTop: 0 }, 100);
            setCurrentDateHighlightStyle();
        })
    }
});
	
	
	function insertCal(){
		alert("???????????????????????????????????????");
		 var radioValue = $("input[id='marker']:checked").val();
	        //var randomAlphaNumeric = randomString(10, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
	        var inputValue = $("#write-e").val();
	        var inputStarttDate = document.getElementById("start-date").value;
	        var inputEndDate = document.getElementById("end-date").value;

	       var arrayStartDate = inputStarttDate.split(' ');
	       var arrayEndDate = inputEndDate.split(' ');

	       var startDate = arrayStartDate[0];
	       var startTime = arrayStartDate[1];

	       var endDate = arrayEndDate[0];
	       var endTime = arrayEndDate[1];

	       var concatenateStartDateTime = startDate+'T'+startTime+':00';
	       var concatenateEndDateTime = endDate+'T'+endTime+':00';

	        var inputDescription = document.getElementById("taskdescription").value;
	      //  var myCalendar = $('#calendar');
	      //  myCalendar.fullCalendar();
	        var myEvent = {
	          timeZone: 'UTC',
	          allDay : false,
	          //id: randomAlphaNumeric,
	          title:inputValue,
	          start: concatenateStartDateTime,
	          end: concatenateEndDateTime,
	          className: radioValue,
	          description: inputDescription
	        };
	       // myCalendar.fullCalendar( 'renderEvent', myEvent, true );
	       $("#addEventsModal").modal("hide");
	       // modal.style.display = "none";
	        modalResetData();
	        document.getElementsByTagName('body')[0].removeAttribute('style');
	       
	       c_start = concatenateStartDateTime.split("T")[0]+" "+concatenateStartDateTime.split("T")[1];
	       console.log(c_start);
	       
	        //db insert ajax
	               $.ajax({
	            		url : "/project/calendarInsert.do",
	            		type : 'post',
	            		data : {
	            			schdlTtl:inputValue, 
	            			schdlSrtDt:inputStarttDate,
	            			schdlNdDt:inputEndDate,
	            			schdlCn:inputDescription,
							pjtNo:pjtNo,
	            			color:$('input[name="schdlCtgrCd"]:checked').val()
	            		},
	            		success : function(data) {
	            			console.log(data);
	            	     },
	            		error : function() {
	            			alert("??????");
	            		}
	            	}); 
		
	}
	
	
	
	
	</script>

</body>
</html>