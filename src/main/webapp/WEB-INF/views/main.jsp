<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/assets/css/elements/search.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/elements/tooltip.css" rel="stylesheet"
	type="text/css">
	
	
	
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
		var mbrCtgrCd = "<c:out value='${member.mbrCtgrCd}' />";
		
			$.ajax({
				url : "/progressList",
				type : "post",
				success : function(res) {
					var today = new Date();
					var list = res.list;
					var progressList = res.progressList;
					str = "";
					str += '<table>'
					for (i = 0; i < list.length; i++) {
						var day = list[i].PJT_END_YMD
						var dday = new Date(day.substr(0, 4), day.substr(5,
								2) - 1, day.substr(8, 2));
						var gap = dday.getTime() - today.getTime();
						var result = Math.ceil(gap / (1000 * 60 * 60 * 24));
						var aaa = ""
						if(result == 0){
							aaa = 'D - day'
		                } else if(result < 0){
		                	aaa = 'D + ' + (result * -1)
		                } else {
		                	aaa = 'D - ' + result
		                }
						if(i % 2 == 0){
							str += '<tr>'
						}
						str += '<td style="padding: 5px;">'
						str += '<div style="background-color: #fdfdfd; width: 100%; display: inline-block;">'
						str += '<div class="widget-content widget-content-area" style="padding: 20px 20px 10px; ">'
						str += '<div style="display: flex; ">'
						str += '<span style="margin-right: 30px; display: inline-block; width: 30%; height: 30px; font-size: 1.4em"> 프로젝트명 </span>' 
						str += '<div class="sorting_1" style="display: inline-block; "><a onclick="menuClass(\''+list[i].PJT_NO+'\', \'/project/main.do\')"  href="#"><h4>'
						str +=	list[i].PJT_NM + '</h4></a></div></div>'
						str += '<br>'
						str += '<div style="display: flex; ">'
						str += '<span style="margin-right: 15px; display: inline-block; width: 110px; height: 30px; font-size: 1.4em"> 진행률 </span>'
						str += '<div class="sorting_1" style="width: 80%; display: inline-block;">'
						str += '<div class="progress" style="height: 30px; border-radius: 6px">'
						str += '<div class="progress-bar bg-primary bg-gradient-danger" role="progressbar" style="width: '
						str += progressList[i].progress
						str += '%; font-size: 1.2em; border-radius: 6px; background-image: linear-gradient(to right, #d4d9fd 0%, #29347a 100%);" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">'
						if (progressList[i].progress > 0) {
							str += progressList[i].progress + '%'
						}
						str += '</div></div></div></div>' 
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
						if(i % 2 == 0){
							str += '</td>'
						} else {
							str += '</td></tr>'
						}
						
					}
					if(list.length % 2 == 1){
						str += '</tr>'
					}
					str += '</table>'
					$('#progress').html(str);
				}
			})
			
	})
</script>
<style>
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
	
}
</style>
<div class="bodyDiv">
	<div id="leftDiv" style="margin-left : 10px; width : 1100px;">
		<br> <br> <br>
		<div id="progress" class="statbox widget box box-shadow"
			style="background-color: #fdfdfd; width : 90%; padding: 5px;"></div>
		<div class="statbox widget box box-shadow"
			style="background-color: #fdfdfd; display: inline-block; width : 90%; padding:10px; margin-top: 20px; margin-bottom: 20px;">
			<div class="widget-header" style="margin-top: 10px;">
				<div class="row">
					<div style="display: flex; justify-content: space-between"
						class="col-xl-12 col-md-12 col-sm-12 col-12">
						<h4>참여 모집 중인 프로젝트</h4>
						<span title="더보기" class="bs-tooltip"
								data-placement="top" data-original-title="Tooltip on top">
						<a href="/project/recruitment.do"><svg style="margin-top: 3px;"
								xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-chevrons-right">
								<polyline points="13 17 18 12 13 7"></polyline>
								<polyline points="6 17 11 12 6 7"></polyline></svg></a></span>
					</div>
				</div>
			</div>
			<div class="searchable-container" style="background-color: transparent;">
				<div class="col-sm-12">
					<table id="zero-config" class="table table-hover dataTable"
						style="width: 100%; padding : 10px;" role="grid"
						aria-describedby="zero-config_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="zero-config"
									rowspan="1" colspan="1" aria-sort="ascending"
									aria-label="Name: activate to sort column descending"
									style="width: 230px;">프로젝트명</th>
								<th class="sorting" tabindex="0" aria-controls="zero-config"
									rowspan="1" colspan="1"
									aria-label="Position: activate to sort column ascending">참여 중인 인원</th>
								<th class="sorting" tabindex="0" aria-controls="zero-config"
									rowspan="1" colspan="1"
									aria-label="Office: activate to sort column ascending">시작일</th>
								<th class="sorting" tabindex="0" aria-controls="zero-config"
									rowspan="1" colspan="1"
									aria-label="Age: activate to sort column ascending">종료일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${recruit}" var="vo">
								<tr role="row">
									<td style="text-align:center;"><a href="/project/recruitmentDetail.do?pjtNo=${vo.PJT_NO}">${vo.PJT_NM}</a></td>
									<td style="text-align:center;">${vo.COUNTING}</td>
									<td style="text-align:center;">${vo.PJT_STRT_YMD}</td>
									<td style="text-align:center;">${vo.PJT_END_YMD}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
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
<script src="/resources/assets/js/elements/tooltip.js"></script>