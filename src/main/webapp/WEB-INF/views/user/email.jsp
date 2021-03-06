<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	//줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Email</title>
    <link rel="shortcut icon" type="image/png" href="resources/assets/img/favicon.ico" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
<!--     <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet"> -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="/resources/assets/css/apps/mailbox.css" rel="stylesheet" type="text/css" />

    <script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
    <link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
</head>
<body class="sidebar-noneoverflow application">
<script type="text/javascript">
var mbrId = "<c:out value='${member.mbrId}' />";
//var mrkrNo = "<c:out value='${mkList.get(mrkrNo)}' />";
var mbrEml = "<c:out value='${member.mbrEml}' />";

console.log("세션 아이디 : " +mbrId);
console.log("세션 메일: " +mbrEml);
//console.log("마커 : " +mrkrNo);

	
$(function(){
	$('.file-pdf').on('click', function(){
		console.log("첨부파일 눌렀따 ");
		console.log($(this).find('p').text());
		
	    var fileName = $(this).find('p').text();
	                
	})
	
	$('#emailN').on('click', function(){
		console.log("dfsdfs");
		console.log($(this));
		$(this).attr('id','emailY');
		
		
		
		
	})
})
                        

</script>
<!--  BEGIN MAIN CONTAINER  -->
	<!--  BEGIN CONTENT AREA  -->
    <div class="layout-px-spacing">
        <div class="page-header">
        </div>
            <div class="row layout-top-spacing">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-xl-12  col-md-12">
                            <div class="mail-box-container">
                                <div class="mail-overlay"></div>
                                    <div class="tab-title">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-12 text-center mail-btn-container">
                                                <a id="btn-compose-mail" class="btn btn-block" href="javascript:void(0);">
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
		                                                <line x1="12" y1="5" x2="12" y2="19"></line>
		                                                <line x1="5" y1="12" x2="19" y2="12"></line>
	                                                </svg>
                                                </a>
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-12 mail-categories-container">
                                                <div class="mail-sidebar-scroll">
                                                    <ul class="nav nav-pills d-block" id="pills-tab" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link list-actions active" id="mailInbox">
	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-inbox">
		                                                            <polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
		                                                            <path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
	                                                            </svg> 
	                                                            <span class="nav-names">받은메일함</span> 
	                                                            <span class="mail-badge badge"></span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link list-actions" id="important">
	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star">
	                                                            	<polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
	                                                            </svg> 
	                                                            <span class="nav-names">중요메일함</span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link list-actions" id="draft">
	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">
		                                                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
		                                                            <polyline points="22,6 12,13 2,6"/>
	                                                            </svg> 
	                                                            <span class="nav-names">임시보관함</span> 
	                                                            <span class="mail-badge badge"></span>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link list-actions" id="sentmail">
	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send">
		                                                            <line x1="22" y1="2" x2="11" y2="13"></line>
		                                                            <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
	                                                            </svg> 
	                                                            <span class="nav-names">보낸메일함</span>
                                                            </a>
                                                        </li>
<!--                                                         <li class="nav-item"> -->
<!--                                                             <a class="nav-link list-actions" id="spam"> -->
<!-- 	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle"> -->
<%-- 		                                                            <circle cx="12" cy="12" r="10"></circle> --%>
<!-- 		                                                            <line x1="12" y1="8" x2="12" y2="12"></line> -->
<!-- 		                                                            <line x1="12" y1="16" x2="12" y2="16"></line> -->
<!-- 	                                                            </svg>  -->
<!-- 	                                                            <span class="nav-names">Spam</span> -->
<!--                                                             </a> -->
<!--                                                         </li> -->
                                                        <li class="nav-item">
                                                            <a class="nav-link list-actions" id="trashed">
	                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash">
		                                                            <polyline points="3 6 5 6 21 6"></polyline>
		                                                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
	                                                            </svg> 
	                                                            <span class="nav-names">휴지통</span>
                                                            </a>
                                                        </li>
                                                    </ul>

                                                   

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="mailbox-inbox" class="accordion mailbox-inbox">

                                        <div class="search">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu mail-menu d-lg-none">
	                                            <line x1="3" y1="12" x2="21" y2="12"></line>
	                                            <line x1="3" y1="6" x2="21" y2="6"></line>
	                                            <line x1="3" y1="18" x2="21" y2="18"></line>
                                            </svg>
                                            <input type="text" class="form-control input-search" placeholder="검색어를 입력하세요...">
                                        </div>

                                        <div class="action-center">
                                            <div class="">
                                                <div class="n-chk">
                                                    <label class="new-control new-checkbox checkbox-primary">
                                                      <input type="checkbox" class="new-control-input" id="inboxAll">
                                                      <span class="new-control-indicator"></span>
                                                      <span>전체 선택</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="">
                                                
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" data-toggle="tooltip" data-placement="top" data-original-title="중요메일함" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star action-important"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" data-toggle="tooltip" data-placement="top" data-original-title="복구하기" stroke-linejoin="round" class="feather feather-activity revive-mail"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-toggle="tooltip" data-placement="top" data-original-title="완전삭제" class="feather feather-trash permanent-delete"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                                <div class="dropdown d-inline-block more-actions">
                                                    <a class="nav-link dropdown-toggle" id="more-actions-btns-dropdown" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="more-actions-btns-dropdown">
                                                        <a class="dropdown-item action-mark_as_read" href="javascript:void(0);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg> 읽은 메일
                                                        </a>
                                                        <a class="dropdown-item action-mark_as_unRead" href="javascript:void(0);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg> 안읽은 메일
                                                        </a>
                                                        <a class="dropdown-item action-delete" href="javascript:void(0);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-toggle="tooltip" data-placement="top" data-original-title="Delete" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> 휴지통
                                                        </a>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                
                                        <div class="message-box">
                                            
                                            <div class="message-box-scroll" id="ct">
                                            
                                            
                                            	<!-- 임시보관함 -->
                                            	<c:forEach var="draftList" items="${draftList}">
	                                            	<div class="mail-item draft">
		                                            	<div class="animated animatedFadeInUp fadeInUp" id="sfdsf">
			                                            	<div class="mb-0">
				                                            	<div class="mail-item-heading collapsed" data-toggle="collapse" role="navigation" data-target="#7FPyelgZjY" aria-expanded="false">
					                                            	<div class="mail-item-inner">
						                                            	<div class="d-flex">
							                                            	<div class="n-chk text-center">
								                                            	<label class="new-control new-checkbox checkbox-primary">
									                                            	<input type="checkbox" class="new-control-input inbox-chkbox">
									                                            	<span class="new-control-indicator"></span>
								                                            	</label>
							                                            	</div>
							                                            	<div class="f-body" data-mailfrom="${draftList.sndrEmlAddr}" data-mailto="${draftList.rcvrEmlAddr}">
								                                            	<div class="meta-mail-time">
								                                            		<p class="user-email" data-mailto="${draftList.rcvrEmlAddr}">${draftList.rcvrEmlAddr}</p>
								                                            	</div>
								                                            	<div class="meta-title-tag">
									                                            	<p class="mail-content-excerpt" data-maildescription="{&quot;ops&quot;:[{&quot;insert&quot;:&quot;${draftList.emlTtl}\n&quot;}]}">
									                                            	<span class="mail-title" data-mailtitle="${draftList.emlTtl}">임시저장 : ${draftList.emlTtl} - </span>${draftList.emlCtnt}
																					</p>
																				</div>
																				<div class="meta-mail-time">
	                                                                            	<p>${draftList.emlSndngDt}</p>
	                                                                            </div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
                                            	</c:forEach>
                                            
                                            
                                            	<!-- 보낸메일함 -->
                                            	<c:forEach var="sentMail" items="${sentList}">
													<div class="mail-item sentmail" style="display: none;">
														<div class="animated animatedFadeInUp fadeInUp" id="sfdsf">
															<div class="mb-0">
																<div class="mail-item-heading collapsed" data-toggle="collapse" role="navigation" data-target="#Sz7DVkxDac" aria-expanded="false">
																	<div class="mail-item-inner">
																		<div class="d-flex">
																			<div class="n-chk text-center">
																				<label class="new-control new-checkbox checkbox-primary" >
																					<input type="checkbox" class="new-control-input inbox-chkbox">
																					<span class="new-control-indicator"></span>
																				</label>
																			</div>
																			<div class="f-body" data-mailfrom="${sentMail.sndrEmlAddr}" data-mailto="${sentMail.rcvrEmlAddr}">
																				<div class="meta-mail-time">
																					<p class="user-email" data-mailto="${sentMail.rcvrEmlAddr}">${sentMail.rcvrEmlAddr}</p>
																				</div>
																				<div class="meta-title-tag">
																					<p class="mail-content-excerpt" data-maildescription="어 려 워 죽 겠 는 데 요 ㅠ ㅠ ">
																					<span class="mail-title" data-mailtitle="${sentMail.emlTtl}">${sentMail.emlTtl} - </span>${sentMail.emlCtnt}</p>
																				</div>
																				<div class="meta-mail-time">
	                                                                            	<p>${sentMail.emlSndngDt}</p>
	                                                                            </div>
																				
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
												
												<!-- 메일 목록 조회 시작 -->
												
												<!-- 휴지통 -->
                                                <c:forEach var="trash" items="${trashList}">
                                                	<div id="mailN" class="mail-item trashed" style="">
	                                                    <div class="animated animatedFadeInUp fadeInUp" id="mailHeading${trash.emlNo}">
	                                                        <div class="mb-0">
	                                                            <div class="mail-item-heading social collapsed" data-toggle="collapse" role="navigation" data-target="#mailCollapse${trash.emlNo}" aria-expanded="false">
	                                                                <div class="mail-item-inner">
	
	                                                                    <div class="d-flex">
	                                                                        <div class="n-chk text-center">
	                                                                            <label class="new-control new-checkbox checkbox-primary">
	                                                                              <input type="checkbox" class="new-control-input inbox-chkbox" value="${trash.emlNo}">
	                                                                              <span class="new-control-indicator"></span>
	                                                                            </label>
	                                                                        </div>
	                                                                        <div class="f-head">
																				<c:forEach var="memImg" items="${memImg}">
																					<c:if test="${trash.emlSndr eq memImg.mbrId}">
		                                                                            	<img src="/resources/profileImage/<c:if test='${memImg.mbrImg == null}'>profileimage.png</c:if><c:if test='${memImg.mbrImg != null}'>${memImg.mbrImg}</c:if>" alt="${memImg.mbrNm}">
	                 																</c:if>
                 																</c:forEach>
	                                                                        </div>
	                                                                        <div class="f-body">
	                                                                            <div class="meta-mail-time">
	                                                                                <p class="user-email" data-mailto="${trash.sndrEmlAddr}">${trash.sndrEmlAddr}</p>
	                                                                            </div>
	                                                                            <div class="meta-title-tag">
	                                                                                <p class="mail-content-excerpt" data-maildescription="{&quot;ops&quot;:[{&quot;insert&quot;:&quot;<p>${trash.emlTtl}</p><p>${trash.emlTtl}</p><p>${trash.emlTtl}</p><p><br></p>&quot;}]}">
<!-- 		                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip attachment-indicator"> -->
<!-- 		                                                                                	<path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path> -->
<!-- 		                                                                                </svg> -->
		                                                                                <span class="mail-title" data-mailtitle="${trash.emlTtl}">${trash.emlTtl}  </span> 
	                                                                                </p>
	                                                                            </div>
                                                                            	<div class="meta-mail-time">
			                                                                    	<p>${trash.emlSndngDt}</p>
			                                                                    </div>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
																	<div class="attachments">
								  	                                	<c:forEach var="trsmList" items="${trsmList}" >
								  	                                    	<c:if test="${emailVO.emlNo eq trash.emlNo}">
									  	                                    	<span class="">${trsmList.trsmFileNm}</span>
								  	                                    	</c:if>
								  	                                	</c:forEach>
	                                                                </div>
																
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </c:forEach><!-- 휴지통 끝 -->
												
												<!-- 중요메일함 시작 -->
												<c:forEach var="importantList" items="${importantList}">
													<div id="mailN" class="mail-item mailInbox important" style="">
		                                                    <div class="animated animatedFadeInUp fadeInUp" id="mailHeading${importantList.emlNo}">
		                                                        <div class="mb-0">
		                                                            <div class="mail-item-heading social collapsed" data-toggle="collapse" role="navigation" data-target="#mailCollapse${importantList.emlNo}" aria-expanded="false">
		                                                                <div class="mail-item-inner">
		
		                                                                    <div class="d-flex">
		                                                                        <div class="n-chk text-center">
		                                                                            <label class="new-control new-checkbox checkbox-primary">
		                                                                              <input type="checkbox" class="new-control-input inbox-chkbox" value="${importantList.emlNo}">
		                                                                              <span class="new-control-indicator"></span>
		                                                                            </label>
		                                                                        </div>
		                                                                        <div class="f-head">
		                                                                           <c:forEach var="memImg" items="${memImg}">
																					<c:if test="${importantList.emlSndr eq memImg.mbrId}">
		                                                                            	<img src="/resources/profileImage/<c:if test='${memImg.mbrImg == null}'>profileimage.png</c:if><c:if test='${memImg.mbrImg != null}'>${memImg.mbrImg}</c:if>" alt="${memImg.mbrNm}">
	                 																</c:if>
                 																</c:forEach>
		                                                                        </div>
		                                                                        <div class="f-body">
		                                                                            <div class="meta-mail-time">
		                                                                                <p class="user-email" data-mailto="${importantList.sndrEmlAddr}">${importantList.sndrEmlAddr}</p>
		                                                                            </div>
		                                                                            <div class="meta-title-tag">
		                                                                                <p class="mail-content-excerpt" data-maildescription="{&quot;ops&quot;:[{&quot;insert&quot;:&quot;<p>${importantList.emlTtl}</p><p>${importantList.emlTtl}</p><p>${importantList.emlTtl}</p><p><br></p>&quot;}]}">
	<!-- 		                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip attachment-indicator"> -->
	<!-- 		                                                                                	<path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path> -->
	<!-- 		                                                                                </svg> -->
			                                                                                <span class="mail-title" data-mailtitle="${importantList.emlTtl}">${importantList.emlTtl}  </span> 
		                                                                                </p>
	<!-- 	                                                                                <div class="tags"> -->
	<!-- 	                                                                                    <span class="g-dot-primary"></span> -->
	<!-- 	                                                                                    <span class="g-dot-warning"></span> -->
	<!-- 	                                                                                    <span class="g-dot-success"></span> -->
	<!-- 	                                                                                    <span class="g-dot-danger"></span> -->
	<!-- 	                                                                                </div> -->
		                                                                            </div>
		                                                                            <div class="meta-mail-time">
	                                                                            		<p>${importantList.emlSndngDt}</p>
	                                                                            	</div>
		                                                                            
		                                                                        </div>
		                                                                    </div>
		                                                                </div>
																		<div class="attachments">
								  	                                    	<c:forEach var="trsmList" items="${trsmList}" >
								  	                                    		<c:if test="${emailVO.emlNo eq importantList.emlNo}">
									  	                                    		<span class="">${trsmList.trsmFileNm}</span>
								  	                                    		</c:if>
								  	                                    	</c:forEach>
	                                                                	</div>
		                                                            </div>
		                                                        </div>
		                                                    </div>
		                                                </div>
	                                                </c:forEach>
													<!-- 중요메일함 끝 -->
												
												
												
												
												
												<!-- 받은메일함(메인) -->
												<c:forEach var="emailVO" items="${mailList}">
	                                                <div id="email${emailVO.emlYn}" class="mail-item mailInbox" name="${emailVO.emlNo}">
	                                                    <div class="animated animatedFadeInUp fadeInUp" id="mailHeading${emailVO.emlNo}">
	                                                        <div class="mb-0">
	                                                            <div class="mail-item-heading social collapsed"  data-toggle="collapse" role="navigation" data-target="#mailCollapse${emailVO.emlNo}" aria-expanded="false">
	                                                                <div class="mail-item-inner">
	
	                                                                    <div class="d-flex">
	                                                                        <div class="n-chk text-center">
	                                                                            <label class="new-control new-checkbox checkbox-primary">
	                                                                              <input type="checkbox" class="new-control-input inbox-chkbox" value="${emailVO.emlNo}">
	                                                                              <span class="new-control-indicator"></span>
	                                                                            </label>
	                                                                        </div>
	                                                                        <div class="f-head">
	                                                                            <c:forEach var="memImg" items="${memImg}">
																					<c:if test="${emailVO.emlSndr eq memImg.mbrId}">
		                                                                            	<img src="/resources/profileImage/<c:if test='${memImg.mbrImg == null}'>profileimage.png</c:if><c:if test='${memImg.mbrImg != null}'>${memImg.mbrImg}</c:if>" alt="${memImg.mbrNm}">
	                 																</c:if>
                 																</c:forEach>
	                                                                        </div>
	                                                                        <div class="f-body">
	                                                                            <div class="meta-mail-time">
	                                                                                <p class="user-email" data-mailTo="${emailVO.sndrEmlAddr}">${emailVO.sndrEmlAddr}</p>
	                                                                            </div>
	                                                                            <div class="meta-title-tag">
	                                                                                <p class="mail-content-excerpt" data-mailDescription='{"ops":[{"insert":"${emailVO.emlCtnt}"}]}'>
<!-- 		                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip attachment-indicator"> -->
<!-- 		                                                                                	<path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path> -->
<!-- 		                                                                                </svg> -->
		                                                                                <span class="mail-title" data-mailTitle="${emailVO.emlTtl}">${emailVO.emlTtl}  </span> 
	                                                                                </p>
<!-- 	                                                                                <div class="tags"> -->
<!-- 	                                                                                    <span class="g-dot-primary"></span> -->
<!-- 	                                                                                    <span class="g-dot-warning"></span> -->
<!-- 	                                                                                    <span class="g-dot-success"></span> -->
<!-- 	                                                                                    <span class="g-dot-danger"></span> -->
<!-- 	                                                                                </div> -->
	                                                                            </div>
	                                                                            <div class="meta-mail-time">
	                                                                            	<p>${emailVO.emlSndngDt}</p>
	                                                                            </div>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
							  	                                    <div class="attachments">
								  	                                    <c:forEach var="trsmList" items="${trsmList}" >
								  	                                    	<c:if test="${emailVO.emlNo eq trsmList.emlNo}">
									  	                                    		<span class="">${trsmList.trsmFileNm}</span>
								  	                                    	</c:if>
								  	                                    </c:forEach>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                                </c:forEach>
												<!-- 받은메일함(메인)끝 -->
                                                
                                                

                                            </div>
                                        </div>

                                        <div class="content-box">
	                                            <div class="d-flex msg-close">
	                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left close-message"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
	                                                
	                                            </div>
	
	
                                        	<!-- 메일 상세 조회 1개 -->
                                        	<c:forEach var="emailVO" items="${mailList}">
	                                            <div id="mailCollapse${emailVO.emlNo}" class="collapse" aria-labelledby="mailHeading${emailVO.emlNo}" data-parent="#mailbox-inbox">
	                                                <div class="mail-content-container mailInbox" data-mailfrom="info@mail.com" data-mailto="linda@mail.com" data-mailcc="">
	
	                                                    <div class="d-flex justify-content-between" style="border-bottom: 1px solid #e0e6ed;">
															<h3 style="padding-top: 20px;">제 목 - ${emailVO.emlTtl}</h3>
	                                                        <div class="d-flex user-info">
	                                                            
	                                                        </div>
	
	                                                        <div class="action-btns">
	                                                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Reply">
	                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-left reply">
		                                                                <polyline points="9 14 4 9 9 4"></polyline>
		                                                                <path d="M20 20v-7a4 4 0 0 0-4-4H4"></path>
	                                                                </svg>
	                                                            </a>
	                                                            <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Forward">
	                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-right forward">
		                                                                <polyline points="15 14 20 9 15 4"></polyline>
		                                                                <path d="M4 20v-7a4 4 0 0 1 4-4h12"></path>
	                                                                </svg>
	                                                            </a>
	                                                        </div>
	                                                    </div>
	
														<div class="meta-mail-time" style="display: flex;justify-content: space-between;">
                                                       		<p class="user-email" data-mailto="${emailVO.sndrEmlAddr}" >${emailVO.sndrEmlAddr}</p> <p class="meta-time align-self-center" style="padding-right: 100px;">${emailVO.emlSndngDt}</p>
                                                        </div>
	                                                    
	                                                    <p class="mail-content" data-mailTitle="${emailVO.emlTtl}" data-maildescription='{"ops":[{"insert":"${emailVO.emlCtnt}"}]}' style="padding-top: 40px;padding-bottom: 40px;border-bottom: 1px solid #e0e6ed;"> ${emailVO.emlCtnt}</p>
	                                                    
	                                                    <div class="attachments">
	                                                    
	                                                    
	                                                    	<c:forEach var="trsmList" items="${trsmList}" begin="0" end="0" >
	                                                    		<c:if test="${emailVO.emlNo eq trsmList.emlNo}">
	                                                        		<h6 class="attachments-section-title">첨부파일</h6>
	                                                        	</c:if>
	                                                        </c:forEach>
	                                                        
	                                                        
	                                                        <c:forEach var="trsmList" items="${trsmList}" >
					  	                                    	<c:if test="${emailVO.emlNo eq trsmList.emlNo}">
	                                                        		<a href="/user/email/download?fileNo=${trsmList.fileNo}">
		                                                        		<div class="attachment file-pdf">
		                                                            		<div class="media"style="padding-bottom: 10px;">
		                                                                		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
		                                                                			<div class="media-body">
		                                                                    			<p class="file-name">${trsmList.trsmFileNm}</p>
		                                                                			</div>
		                                                            		</div>
		                                                        		</div>
	                                                            	</a>
	  															</c:if>
					  	                                    </c:forEach>
					  	                                    
	                                                    </div>
	                                                    
	                                                    
	                                                    
	                                                    
	
	                                                </div>
	                                            </div>
                                            </c:forEach>
											<!-- 메일 상세 조회 끝  -->
                                            
                                        </div>

                                    </div>
                                    
                                </div>

                                <!--메일 작성 Modal -->
                                <div class="modal fade" id="composeMailModal" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body" style="padding: 25px 14px;"> 
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="modal">
	                                                <line x1="18" y1="6" x2="6" y2="18"></line>
	                                                <line x1="6" y1="6" x2="18" y2="18"></line>
                                                </svg>
                                                <div class="compose-box">
                                                    <div class="compose-content">
                                                        <form action="/user/email/insertFile" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="d-flex mb-4 mail-to"> 
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
	                                                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
	                                                                        <circle cx="12" cy="7" r="4"></circle>
                                                                        </svg>
                                                                        <div style="padding-bottom: 15px;">
                                                                        	<input type="hidden" id="m-sendid" value="${member.mbrId}">
                                                                            <input type="email" id="m-from" placeholder="From" class="form-control" value="${member.mbrEml}" disabled="disabled" style="width: 237%!important;">
                                                                            <span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="d-flex mb-4 mail-to" style="padding-bottom: 15px;"> <!-- 받는사람 이메일 -->
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
	                                                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
	                                                                        <circle cx="12" cy="7" r="4"></circle>
                                                                        </svg>
                                                                        
                                                                        <div class="">
                                                                            <input type="email" id="m-to" placeholder="To" class="form-control"  style="width: 237%!important;"> 
                                                                    	<span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex mb-4 mail-subject"> <!-- 메일 제목 -->
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">
	                                                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
	                                                                <polyline points="22,6 12,13 2,6"></polyline>
                                                                </svg>
                                                                <div class="w-100" style="padding-bottom: 20px;">
                                                                    <input type="text" id="m-subject" placeholder="Subject" class="form-control" maxlength="50" >
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="d-flex"><!-- 첨부파일 -->
                                                                <input type="file" class="form-control-file" name="uploadFile" id="mail_File_attachment" multiple="multiple" />
                                                            </div>
                                                            
                                                            <div id="editor-container"><!-- 메일 내용 -->

                                                            </div>
                                                            <sec:csrfInput />
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="btn-save" class="btn float-left"> 임시저장</button>
                                                <button id="btn-reply-save" class="btn float-left"> 임시저장</button>
                                                <button id="btn-fwd-save" class="btn float-left"> 임시저장</button>

                                                <button class="btn" data-dismiss="modal"> 
                                                	<i class="flaticon-delete-1"></i> 취소하기
                                                </button>

                                                <button id="btn-reply" class="btn"> 답장하기</button>
                                                <button id="btn-fwd" class="btn"> 전달하기</button>
                                                <button id="btn-send" class="btn"> 보내기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 메일 작성 모달 끝 -->

                            </div>


                        </div>

                    </div>
                </div>

                </div>
        <!--  END CONTENT AREA  -->
    <!-- END MAIN CONTAINER -->
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    
   
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <script src="/resources/plugins/notification/snackbar/snackbar.min.js"></script>
    <script src="/resources/assets/js/apps/custom-mailbox.js"></script>
</body>
</html>