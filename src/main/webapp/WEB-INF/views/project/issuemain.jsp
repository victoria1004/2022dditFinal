<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Issue</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure" />
    <!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN THEME GLOBAL STYLES -->
    <link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/plugins/bootstrap-select/bootstrap-select.min.css">
    <script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
    <link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="/resources/assets/css/apps/todolist.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
    <script type="text/javascript">
    </script>
    
</head>
<style>


.modal-content .modal-body p {
    color: #515365;
    letter-spacing: 1px;
    font-size: 16px;
    line-height: 22px;
}

#issueCn{
    border: 1px solid #bfc9d4;
    color: #3b3f5c;
    font-size: 15px;
    letter-spacing: 1px;
    padding: 0.75rem 1.25rem;
    border-radius: 6px;
}

.bootstrap-select {
  width: 220px \0; }
  .bootstrap-select.btn-group > .dropdown-toggle {
    height: auto;
    border: 1px solid #bfc9d4;
    color: #3b3f5c !important;
    font-size: 15px;
    letter-spacing: 1px;
    background-color: #fff;
    height: auto;
    border-radius: 6px;
    box-shadow: none; 
    padding: 5px 0px;
    padding-left: 18px;}
  .bootstrap-select > .dropdown-toggle {
    width: 100%;
    padding-right: 25px;
    z-index: 1; }
    .bootstrap-select > .dropdown-toggle.bs-placeholder {
      color: #888ea8; }
      .bootstrap-select > .dropdown-toggle.bs-placeholder:hover, .bootstrap-select > .dropdown-toggle.bs-placeholder:focus, .bootstrap-select > .dropdown-toggle.bs-placeholder:active {
        color: #888ea8; }
  .bootstrap-select > select {
    position: absolute !important;
    bottom: 0;
    left: 50%;
    display: block !important;
    width: 0.5px !important;
    height: 100% !important;
    padding: 0 !important;
    opacity: 0 !important;
    border: 0; }
    .bootstrap-select > select.mobile-device {
      top: 0;
      left: 0;
      display: block !important;
      width: 100% !important;
      z-index: 2; }

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
  width: 150px; 
  padding-bottom: 10px;
  }
  
.todo-content, .writer, .issueDate {
	width : 100%;
	font-family: 'SpoqaHanSansNeo-Regular';
}
.writer, .issueDate {
    padding-top: 15px;
}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 435px;
}
.dropdown-menu.select-dropdown.open.show {
    margin-left: -47px;
}

    </style>
<body>
<script type="text/javascript">
var pjtNo = "<c:out value='${project.pjtNo}' />";
var mbrId = "<c:out value='${member.mbrId}' />";
//var mrkrNo = "<c:out value='${mkList.get(mrkrNo)}' />";
	
console.log("프젝번호받앗냐 : " +pjtNo);
console.log("세션 아이디 : " +mbrId);
//console.log("마커 : " +mrkrNo);

$(function(){
	$('.marker-select').on('click', function(){
		console.log($(this));
		console.log("마커클릭했냐");
		//선택한 마커 번호
		var mrkrNo = $(this).attr('data-original-index');
		console.log("선택 마커 번호 - " + mrkrNo);

  		var h = $(this).find('.dropdown-item-inner').html();
  		
  		var m = $('#marker').html(h);
  		
  		var hdn = document.getElementById('mrkrNo');

  		hdn.setAttribute("value",mrkrNo);
  		console.log(hdn);
  		
  		
  })
  
	$('.todo-select').on('click', function(){
		//선택한 일감번호
		var tdNo = $(this).attr('data-original-index');
		console.log("선택 일감 번호 - " + tdNo);
	
			var h = $(this).find('.todo-inner').html();
			console.log(h);
			
			var m = $('#tdget').html(h);
			
			var hid = document.getElementById('tdNo');

			hid.setAttribute("value", tdNo);
			console.log(hid);
	})

	const taskViewScroll = new PerfectScrollbar('.task-text', {
    wheelSpeed:.5,
    swipeEasing:!0,
    minScrollbarLength:40,
    maxScrollbarLength:300,
    suppressScrollX : true
	});
	

	const ps = new PerfectScrollbar('.todo-box-scroll', {
	    suppressScrollX : true
	  });

	const todoListScroll = new PerfectScrollbar('.todoList-sidebar-scroll', {
	    suppressScrollX : true
	  });

	
	//클릭하면 이슈 모달 나온다 
	  $('.todo-item .todo-item-inner .todo-content').on('click', function(event) {
	  
	  	console.log($(this));
	  	
	    var $_taskTitle = $(this).find('.todo-heading').attr('data-todoHeading');
	    var todoNoTitle = $(this).find('.todoTitle').children().text();
	    var todoNoTitle2 = $(this).find('.todoTitle').children().attr('class');
	    
	    console.log(todoNoTitle);
	    console.log(todoNoTitle2);
	    console.log(pjtNo);
	    
	    var letgoTodo = '<a href="/project/todoDetail.do?pjtNo='+pjtNo+'&amp;tdNo='+todoNoTitle2+'">'+todoNoTitle+'</a>';
	    
	    var $todoHtml = $(this).find('.todo-text').attr('data-todoHtml');

	    $('.task-heading').text($_taskTitle);
	    $('.task-todoTitle').html(letgoTodo); 
	    $('.task-text').html($todoHtml);
	    $('.task-text').children().first().attr('style','padding-bottom:20px;');
	    
	    $('#todoShowListItem').modal('show');
	  })

	//왼쪽 마커 필터 
	var $btns = $('.list-actions').click(function() {
		
		var mknoo = $(this).attr('id');
		
	  if (this.id == 'all-list') {
	  
	    var $el = $('.alllist').fadeIn();
	    $('#ct > div').not($el).hide();
	    
	  } else if (this.id == mknoo) {
	    var $el = $('.' + this.id).fadeIn();
	    $('#ct > div').not($el).hide();
	    
	  }
	  $btns.removeClass('active');
	  $(this).addClass('active');  
	  
	 
	})
	
	$('#addTask').on('click', function(event) {
	  event.preventDefault();
	  
	  $('.add-tsk').show();
	  $('.edit-tsk').hide();
	  $('#addTaskModal').modal('show');
	  const ps = new PerfectScrollbar('.todo-box-scroll', {
	    suppressScrollX : true
	  });
	});
	
	
	$(".add-tsk").click(function(){
		console.log("눌 럿 니 ");
		  var today = new Date();
		  var dd = String(today.getDate()).padStart(2, '0');
		  var mm = String(today.getMonth()); //January is 0!
		  var yyyy = today.getFullYear();
		  var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];
	
		  today = monthNames[mm] + ', ' + dd + ' ' + yyyy;
		  var $_task = document.getElementById('task').value;
	
		  var $_taskDescriptionText = quill.getText();
		  var $_taskDescriptionInnerHTML = quill.root.innerHTML;
	
		  var delta = quill.getContents();
		  var $_textDelta = JSON.stringify(delta);
	
	
		    $('#addTaskModal').modal('hide');
		    checkCheckbox();
		    deletePermanentlyDropdown();
		    reviveMailDropdown();
		    priorityDropdown();
		    importantDropdown();
		    new dynamicBadgeNotification('allList');
		    $(".list-actions#all-list").trigger('click');
		});
	
	

	//이슈 목록의 ...의 수정하기
	  $('.action-dropdown .dropdown-menu .edit.dropdown-item').click(function() {
		var $_outerThis = $(this);    
		
		var todochk = $_outerThis.parents('.todo-item').children().find('.todo-content').children().find('h6').text();
		console.log("todochk - ", todochk);
		
		var markerchk = $_outerThis.parents('.todo-item').children().find('.warning').html();
		var $_taskNo = $_outerThis.parents('.todo-item').children().find('.todo-content').children('.issueNo').val();
		var $_taskTitle = $_outerThis.parents('.todo-item').children().find('.todo-heading').text();
	    var $_taskText = $_outerThis.parents('.todo-item').children().find('.text-todo').text();
		
		
		console.log("_outerThis - ",$(this));
		console.log("_taskNo - ",$_taskNo);
		console.log("_taskTitle - ",$_taskTitle);
		console.log("_taskText - ",$_taskText);
		console.log("--------------");
		
		$('#issueTtl').val($_taskTitle);
		$('#issueCn').val($_taskText);
		$('#marker').html(markerchk);
		$('#tdget').html('<span class="text">'+todochk+'</span>');
		
		$('.add-tsk').hide();
	    $('.edit-tsk').show();
	    
	    $('#addTaskModal').modal('show');
	    
	  })


	  





	
	
})



</script>


<div class="layout-px-spacing">

    <div class="page-header">

    </div>

    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-md-12">

            <div class="mail-box-container">
                <div class="mail-overlay"></div>

                <div class="tab-title" >
                    <div class="row" style="width: 210px;">
                        <div class="col-md-12 col-sm-12 col-12 text-center">
							<svg viewBox="0 0 24 24" width="64" height="64" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>                           
                            <h5 class="app-title">Issue</h5>
                        </div>

                        <div class="todoList-sidebar-scroll ps">
                            <div class="col-md-12 col-sm-12 col-12 mt-4 pl-0">
                                <ul class="nav nav-pills d-block" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link list-actions alllist" id="all-list" data-toggle="pill" href="#pills-inbox" role="tab" aria-selected="true">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
		                                        <line x1="8" y1="6" x2="21" y2="6"></line>
		                                        <line x1="8" y1="12" x2="21" y2="12"></line>
		                                        <line x1="8" y1="18" x2="21" y2="18"></line>
		                                        <line x1="3" y1="6" x2="3" y2="6"></line>
		                                        <line x1="3" y1="12" x2="3" y2="12"></line>
		                                        <line x1="3" y1="18" x2="3" y2="18"></line>
	                                        </svg> 전체보기 
	                                	</a>
                                    </li>
                                    
                                    <c:forEach var="mkList" items="${mkList}">
	                                    <li class="nav-item">
                                        	<a class="nav-link list-actions"  id="${mkList.mrkrNo}" data-toggle="pill" href="#pills-${mkList.mrkrNo}" role="tab" aria-selected="false">
		                                    	<div align='center' style='width:100px; height: 30px; border-radius: 2em; background:${mkList.mrkrClr};padding-top: 4px;padding-left: 7px;'>${mkList.mrkrNm}
			                                    	<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-frown'>
				                                    	${mkList.mrkrIcn}
			                                    	</svg>${mkList.mrkrIcn}
			                                    </div>
<!--                                         	<span class="todo-badge badge">2</span> -->
                                        	</a>
	                                    </li>
	                              	</c:forEach>
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link list-actions" id="todo-task-important" data-toggle="pill" href="#pills-important" role="tab" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg> Important <span class="todo-badge badge">3</span></a> -->
<!--                                     </li> -->
<!--                                     <li class="nav-item"> -->
<!--                                         <a class="nav-link list-actions" id="todo-task-trash" data-toggle="pill" href="#pills-trash" role="tab" aria-selected="false"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> Trash</a> -->
<!--                                     </li> -->
                                </ul>
                            </div>
                        <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>

                        <a class="btn btn-outline-primary" id="addTask" href="#" style="margin-left: 35px; width: 140px;"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> </a>
                    </div>
                </div>

                <div id="todo-inbox" class="accordion todo-inbox">
                    <div class="search">
                        <input type="text" class="form-control input-search" placeholder="검색어를 입력하세요...">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu mail-menu d-lg-none"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                    </div>
                    
            
                    <div class="todo-box">
                        
                        <div id="ct" class="todo-box-scroll ps ps--active-y">
                        
                        	<!-- 이슈 목록(메인) 시작 -->
                        	<c:forEach var="issueVO" items="${list}">
	                            <div class="todo-item alllist ${issueVO.mrkrNo}">
	                                <div class="todo-item-inner">
	                                    <div class="n-chk text-center">
	                                        
	                                    </div>
	                                    <div class="priority-dropdown custom-dropdown-icon mk-select">
	                                        <div class="dropdown p-dropdown">
	                                            <a class="dropdown-toggle warning" name="${issueVO.mrkrNo}" href="#" role="button" id="dropdownMenuLink-1" aria-haspopup="true" aria-expanded="true">
	                                                <c:forEach var="mkList" items="${mkList}">
					                                    <c:if test="${issueVO.mrkrNo eq mkList.mrkrNo}">
					                                    	<div class="ismk"align='center' style='width:100px; height: 30px; border-radius: 2em; background:${mkList.mrkrClr};font-weight: 600;'>${mkList.mrkrNm}
						                                    	<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-frown' style="margin-bottom: 4px;margin-left: -3px;">
							                                    	${mkList.mrkrIcn}
						                                    	</svg>${mkList.mrkrIcn}
						                                    </div>
						                                </c:if>
			                                		</c:forEach>
	                                            </a>
	
	                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink-1">
	                                            
	                                                <a class="dropdown-item danger" href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12" y2="16"></line></svg> High</a>
	                                                <a class="dropdown-item warning" href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12" y2="16"></line></svg> Middle</a>
	                                                <a class="dropdown-item primary" href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-octagon"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12" y2="16"></line></svg> Low</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    
	                                    
	                                    
	                                    <div class="todo-content">
	                                    	<div class="todoTitle">
		                                    	<c:forEach var="mainTodo" items="${mainTodo}">
													<c:if test="${mainTodo.tdNo eq issueVO.tdNo}">
														<h6 class="${mainTodo.tdNo}">${mainTodo.tdTtl}</h6>
													</c:if>
												</c:forEach>
											</div>
	                                    	<input type="hidden" class="issueNo" id="issueNo" name="${issueVO.issueNo}" value="${issueVO.issueNo}">
	                                        <h5 class="todo-heading" id="${issueVO.issueNo}t" data-todoheading="${issueVO.issueTtl}">${issueVO.issueTtl}</h5>
	                                        <p class="text-todo" style="display:none;" >${issueVO.issueCn}</p>
	                                        <p class="todo-text" id="${issueVO.issueNo}c" data-todohtml="<p>${issueVO.issueYmd}</p><p>${fn:replace(issueVO.issueCn, cn, br)} </p>" data-todotext="{&quot;ops&quot;:[{&quot;insert&quot;:&quot;${issueVO.issueCn} \n&quot;}]}"></p>
	                                    </div>
	                                    
										<div class="memberImg" style="padding-top: 4px;">
											<c:forEach var="memName" items="${memName}">
												<c:if test="${memName.mbrId eq issueVO.mbrId}">
													<img src="/resources/profileImage/<c:if test='${memName.mbrImg == null}'>profileimage.png</c:if><c:if test='${memName.mbrImg != null}'>${memName.mbrImg}</c:if>" style="width: 40px;border-radius: 50%;padding-right: 5px;" alt="${memName.mbrNm}">
												</c:if>
											</c:forEach>
										</div>
										
										
										<div class="writer">
											<c:forEach var="memName" items="${memName}">
												<c:if test="${memName.mbrId eq issueVO.mbrId}">
													 <h6>${memName.mbrNm}</h6>
												</c:if>
											</c:forEach>
										</div>
										
										<div class="issueDate">
											<p class="meta-date">${issueVO.issueYmd}</p>
										</div>
										
	                                    <div class="action-dropdown custom-dropdown-icon">
	                                        <div class="dropdown">
	                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
	                                            </a>
	
	                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink-2">
	                                                <a class="edit dropdown-item" href="javascript:editIssue(${issueVO.issueNo});">수정하기</a>
	                                                
	                                                
	                                                <a class="dropdown-item delete" href="javascript:deleteAlert(${issueVO.issueNo});">삭제하기</a>
	                                                
	                                                <a class="dropdown-item permanent-delete" href="javascript:void(0);">Permanent Delete</a>
	                                                <a class="dropdown-item revive" href="javascript:void(0);">Revive Task</a>
	                                            </div>
	                                        </div>
	                                    </div>
	
	                                </div>
	                            </div>
                            </c:forEach>
                            <!-- 1개 조회  끝  -->

                            
	                        <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
	                        	<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
	                        </div>
	                        <div class="ps__rail-y" style="top: 0px; height: 679px; right: 0px;">
	                        	<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 494px;"></div>
	                        </div>
                        </div>


						
						<c:forEach var="issueVO" items="${list}">
                        <div class="modal fade" id="todoShowListItem" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 600px; ">
                            
                            	<!-- 1개 상세보기 -->
                                <div class="modal-content">
                                    <div class="modal-body">
                                        
                                        <div class="compose-box">
                                            <div class="compose-content">
                                            	<h5 class="task-todoTitle" > </h5>
                                                <h4 class="task-heading" style="padding: 10px 20px 10px 20px; "></h4>
                                                <p class="task-text ps">
	                                                <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
	                                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;">
	                                                </div>
	                                                </div>
	                                                <div class="ps__rail-y" style="top: 0px; right: 0px;">
	                                                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"> </div>
	                                                </div>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="modal-footer">
                                        <button class="btn" data-dismiss="modal"> 닫기 </button>
                                    </div>
                                </div>
                                <!-- 1개 상세보기 끝 -->
                                
                                
                            </div>
                        </div>
                        </c:forEach>
                        <!-- 1개 상세보기 끝 -->
                    </div>

                </div>                                    
            </div>

            <!-- 새 이슈 작성 Modal -->
            <div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    
                    <div class="modal-content">
                    
						<form method="post" id="isfrm">
						
	                        <div class="modal-body">
	                            <div class="compose-box">
	                                <div class="compose-content" id="addTaskModalTitle">
	                                    <h5 class="">작성하기</h5>
	                                </div>
	                             		
                             		<div class="row">
                                    	<div class="col-md-12">
                                        	<div class="d-flex mail-to mb-4">
                                            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers" style="margin-right: 10px;"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                                               	<div class="w-100">
                                                   
                                    				<div class="btn-group bootstrap-select show-tick">
                                    					<input type="hidden" id="tdNo" name="tdNo"/>
	                                    				<button type="button" class="dropdown-toggle btn mb-2 bs-placeholder" data-toggle="dropdown" role="button" aria-expanded="false">
		                                    				<span id="tdget" class="filter-option float-left">일감선택하기</span>&nbsp;
		                                    				<span class="bs-caret">
		                                    					<span class="caret"></span>
		                                    				</span>
	                                    				</button>
	                                    				<div class="dropdown-menu select-dropdown open" role="combobox" style="max-height: 454.625px; overflow: hidden; min-height: 0px; will-change: transform;">
		                                    				<div class="dropdown-menu inner" role="listbox" aria-expanded="false" style="max-height: 454.625px; overflow-y: auto; min-height: 0px;">
			                                    				
			                                    				<c:forEach var="todoList" items="${todoList}">
				                                    				<a tabindex="0" class="dropdown-item todo-select" name="tdNo" data-original-index="${todoList.tdNo}">
					                                    				<span class="dropdown-item-inner todo-inner" data-tokens="null" role="option" tabindex="0" aria-disabled="false" aria-selected="false">
						                                    				<span class="text">${todoList.tdTtl}</span>
						                                    				<span class="  check-mark"></span>
					                                    				</span>
				                                    				</a>
			                                    				</c:forEach>
			                                    				
		                                    				</div>
	                                    				</div>
	                                    				<select class="selectpicker" tabindex="-98">
	                                    					<c:forEach var="todoList" items="${todoList}">
					                                        	<option>${todoList.tdTtl}</option>
					                                        </c:forEach>
					                                    </select>
				                                    </div>
                                                   
                                           		</div>
                                        	</div>
                                    	</div>
                                    </div>
                             		<div class="row">
                                    	<div class="col-md-12">
                                        	<div class="d-flex mail-to mb-4">
                                            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check" style="margin-right: 10px;"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                               	<div class="w-100">
                                                   
                                                    <div class="btn-group bootstrap-select">
                                                    	<input type="hidden" id="mrkrNo" name="mrkrNo"/>
	                                    				<button id="mkNum" type="button" class="dropdown-toggle btn mb-2" data-toggle="dropdown" role="button">
		                                    				<span id="marker" class="filter-option float-left">
		                                    					마커선택하기
		                                    				</span>&nbsp;
		                                    				<span class="bs-caret">
		                                    					<span class="caret"></span>
		                                    				</span>
	                                    				</button>
	                                    				
	                                    				<div class="dropdown-menu select-dropdown open" role="combobox">
		                                    				<div class="dropdown-menu inner" role="listbox" aria-expanded="false">
							                                    <c:forEach var="mkList" items="${mkList}">
								                                    <a tabindex="0" class="dropdown-item marker-select" data-original-index="${mkList.mrkrNo}">
									                                    <span class="dropdown-item-inner " data-tokens="null" role="option" tabindex="0" aria-disabled="false" >
										                                    <div align='center' style='width:100px; height: 30px; border-radius: 2em; background:${mkList.mrkrClr};'>${mkList.mrkrNm}
										                                    	<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-frown'>
											                                    	${mkList.mrkrIcn}
										                                    	</svg>${mkList.mrkrIcn}
										                                    </div>
										                                    <span class="  check-mark"></span>
									                                    </span>
								                                    </a>
							                                    </c:forEach>
			                                    				
		                                    				</div>
	                                    				</div>
					                                    <select class="selectpicker" tabindex="-98">
					                                    	<c:forEach var="mkList" items="${mkList}">
					                                        	<option data-content="<div align='center' style='width:100px; height: 30px; border-radius: 2em; background:${mkList.mrkrClr};'>${mkList.mrkrNm}<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-frown'>${mkList.mrkrIcn}</svg>${mkList.mrkrIcn}</div>">${mkList.mrkrNm}</option>
				                                    		</c:forEach>
				                                    	</select>
                                    				</div>
                                    				
                                           		</div>
                                        	</div>
                                    	</div>
                                    </div>
                             		
	                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="d-flex mail-to mb-4">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3 flaticon-notes" style="margin-right: 10px;"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                                <div class="w-100" style="padding-bottom: 20px;">
                                                	<!-- 이슈 제목 -->
                                                    <input id="issueTtl" name="issueTtl" type="text" placeholder="제목 입력.." class="form-control" maxlength="25" style="width: 435px;padding: 0.75rem 1.25rem;">
                                                    
                                                    <span class="validation-text"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
	
                                    <div class="d-flex mail-subject mb-4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text flaticon-menu-list" style="margin-right: 10px;"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                        <div class="w-100">
                                        <!-- 이슈내용작성 -->
                                            <textarea rows="5" cols="51" id="issueCn" name="issueCn" placeholder="내용 입력.." style="width: 435px;"></textarea>
                                            <span class="validation-text"></span>
                                        </div>
                                    </div>
                                    <input type="hidden" value="issueNo">
                                    <input type="hidden" value="pjtNo">
                                    <input type="hidden" value="mbrId">
                                    <input type="hidden" value="issueYmd">
						 			<sec:csrfInput/>
			                        <div class="modal-footer">
			                            <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> 취소하기</button>
			                            <button class="btn add-tsk" >작성하기</button>
			                            <input type="button" class="btn edit-tsk" id="update" value="수정하기" style="display: none;"/>
			                        </div>
	                     
			                    </div>
			                  </div>
			                  <sec:csrfInput />
		               </form>
		               
		          </div>
                </div>
            </div>
            <!-- 작성 modal 끝 -->
            
        </div>
    </div>
</div>
            <!-- 새 이슈 작성 Modal 끝 -->

    <!-- END MAIN CONTAINER -->
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="/resources/plugins/highlight/highlight.pack.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<!--     <script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script> -->
    <!-- END THEME GLOBAL STYLE -->    
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
    <script src="/resources/assets/js/apps/LHJ.js"></script>
<!--     <script src="/resources/plugins/bootstrap-select/bootstrap-select.min.js"></script> -->

</body>
</html>