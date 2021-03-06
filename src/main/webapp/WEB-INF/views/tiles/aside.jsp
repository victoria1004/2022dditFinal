<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
<script src="/resources/assets/js/jsa/projectMain.js"></script>




<script>
	var mbrId = '<c:out value="${member.mbrId}" />';
	var mbrCtgrCd = '<c:out value="${member.mbrCtgrCd}" />'
	$(function() {
		if (mbrCtgrCd == 'M01') {
			str = '<li class="menu" id="9001">';
			str += '<a href="#" data-active="false" class="menu-toggle">';
			str += '<div class="base-menu"><div class="vase-icons">';
			str += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-server"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect><rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect><line x1="6" y1="6" x2="6.01" y2="6"></line><line x1="6" y1="18" x2="6.01" y2="18"></line></svg>';
			str += '</div><span>' + '프로젝트 관리' + '</span></div></a></li>';

			str += '<li class="menu" id="9002">'
			str += '<a href="/user/approvedUser.do" data-active="false" class="menu-toggle">';
			str += '<div class="base-menu"><div class="vase-icons">';
			str += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>';
			str += '</div><span>' + '사용자 조회' + '</span></div></a></li>';

			str += '<li class="menu" id="9003">'
			str += '<a href="/admin/list.do" data-active="false" class="menu-toggle">';
			str += '<div class="base-menu"><div class="vase-icons">';
			str += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>';
			str += '</div><span>' + '로그 관리' + '</span></div></a></li>';

			str += '<li class="menu" id="9004">'
			str += '<a href="/gds/goodsAdmin.do" data-active="false" class="menu-toggle">';
			str += '<div class="base-menu"><div class="vase-icons">';
			str += '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-archive"><polyline points="21 8 21 21 3 21 3 8"></polyline><rect x="1" y="3" width="22" height="5"></rect><line x1="10" y1="12" x2="14" y2="12"></line></svg>';
			str += '</div><span>' + '비품 관리' + '</span></div></a></li>';

			$(".menu-categories").append(str);
		} else {
			getMyPjtList(mbrId); //접속한 사용자가 참여 중인 프로젝트 목록
		}

		$(document).on('click', '.menu-toggle', function() {
			window.localStorage.removeItem('active');

			var prjNo = $(this).parent().attr("id")
			if (prjNo == '9001'||prjNo == '9002'||prjNo == '9003'||prjNo == '9004') {
				prjNo = 'null';
			}
			$.ajax({
				url : "/aside/selectPrj",
				data : {
					"prjNo" : prjNo
				},
				async: false,
				type : "post",
				success : function() {
					console.log('success')
				}

			})
		})
		
		
		//메뉴 클릭 했을때 배경 바꾸기
// 		$(document).on("click",".menu",function(){
// 			console.log("click", $(this));
// 			$(this).addClass("clickMenu");
// 		})
		
		
		

	})
</script>
<style>
.clickMenu{
	background-color:#e2e2e270;
	color : #29347a;
}




</style> 

<!--  BEGIN SIDEBAR  -->
<div class="sidebar-wrapper sidebar-theme">
	<nav id="compactSidebar">
		<ul class="menu-categories">
<!-- 			<li id="9002" class="menu"><a onclick="menuClass('null','/mtr/mtr.do','9002')" href="#" data-active="false" -->
<!-- 				class="menu-toggle"> -->
<!-- 					<div class="base-menu"> -->
<!-- 						<div class="base-icons"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
<!-- 								viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
<!-- 								stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 								class="feather feather-clock"> -->
<%-- 								<circle cx="12" cy="12" r="10"></circle> --%>
<!-- 								<polyline points="12 6 12 12 16 14"></polyline></svg> -->
<!-- 						</div> -->
<!-- 						<span class="">회의실 예약</span> -->
<!-- 					</div> -->
<!-- 			</a></li> -->
<!-- 			<li id="9001" class="menu"><a onclick="menuClass('null','/gds/gdsList.do','9001')" href="#" data-active="false" -->
<!-- 				class="menu-toggle"> -->
<!-- 					<div class="base-menu"> -->
<!-- 						<div class="base-icons"> -->
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
<!-- 						viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
<!-- 						stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 						class="feather feather-archive"> -->
<!-- 						<polyline points="21 8 21 21 3 21 3 8"></polyline> -->
<!-- 						<rect x="1" y="3" width="22" height="5"></rect> -->
<!-- 						<line x1="10" y1="12" x2="14" y2="12"></line></svg> -->
<!-- 						</div> -->
<!-- 						<span class="">비품 대여</span> -->
<!-- 					</div> -->
<!-- 			</a></li> -->
			<li id="9003" class="menu"><a onclick="menuClass('null','/project/projectMaking.do','9003')"  href="#"
				data-active="false" class="menu-toggle">
					<div class="base-menu">
						<div class="base-icons">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-plus-circle">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="12" y1="8" x2="12" y2="16"></line>
								<line x1="8" y1="12" x2="16" y2="12"></line></svg>
						</div>
						<span class="">프로젝트 생성</span>
					</div>
			</a> <!-- 			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
				<!-- 					viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
				<!-- 					stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
				<!-- 					class="feather feather-chevron-left"> --> <!-- 					<polyline points="15 18 9 12 15 6"></polyline></svg> -->
			</li>
			<li id="9005" class="menu"><a onclick="menuClass('null','/project/pjtApply.do','9005')"  href="#"
				data-active="false" class="menu-toggle">
					<div class="base-menu">
						<div class="base-icons">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-navigation"><polygon points="3 11 22 2 13 21 11 13 3 11"></polygon></svg>
						</div>
						<span class="">신청 관리</span>
					</div>
			</a> <!-- 			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
				<!-- 					viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
				<!-- 					stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
				<!-- 					class="feather feather-chevron-left"> --> <!-- 					<polyline points="15 18 9 12 15 6"></polyline></svg> -->
			</li>



			<!--              <li class="menu active"> -->
			<!--                  <a href="#dashboard" data-active="true" class="menu-toggle"> -->
			<!--                      <div class="base-menu"> -->
			<!--                          <div class="base-icons"> -->
			<!--                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon></svg>               -->
			<!--                          </div> -->
			<!--                          <span>project</span> -->
			<!--                      </div> -->
			<!--                  </a> -->
			<!--                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg> -->
			<!--              </li> -->

		</ul>
	</nav>
</div>
<!--  END SIDEBAR  -->
