<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Todo kanban</title>
    <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css">
    <link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css">
    <link href="/resources/plugins/noUiSlider/nouislider.min.css" rel="stylesheet" type="text/css">
    <!-- END THEME GLOBAL STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <script src="/resources/plugins/sweetalerts/promise-polyfill.js"></script>
    <link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/noUiSlider/custom-nouiSlider.css" rel="stylesheet" type="text/css">
    <link href="/resources/plugins/bootstrap-range-Slider/bootstrap-slider.css" rel="stylesheet" type="text/css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="/resources/assets/css/apps/scrumboard.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/forms/theme-checkbox-radio.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL STYLES -->
        
    
    
<style>
.mb-5, .my-5 {
    margin-bottom: 1rem!important;
}
.layout-px-spacing {
    padding: 20px 20px 0 20px !important;
    min-height: calc(100vh - 140px) !important;
    margin-left: 100px;
}
.flatpickr-input[readonly]{
	cursor:pointer;
	background-color: transparent!important;
	width: 370px;
}

</style>

</head>
<body>

<script type="text/javascript">
var pjtNo = "<c:out value='${project.pjtNo}' />";
var mbrId = "<c:out value='${member.mbrId}' />";

console.log("????????????????????? : " +pjtNo);
console.log("?????? ????????? : " +mbrId);

$(function(){
	$(".add-task-title").on('click', function(event){
		
		$('#s-task').val('PPT ????????????');
		$('#s-text').val('PPT ?????? ???????????????');
	})
	
	//?????? ????????? ????????? ???????????? ?????? ?????? 
	$(".add-list").off('click').on('click', function(event) {
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	    var yyyy = today.getFullYear();
	
	    today = mm + '.' + dd + '.' + yyyy;
	
	    var $_listTitle = document.getElementById('s-list-name').value;
	    fdata = $_listTitle;
	    
	    console.log("pjtNo : : " + pjtNo);
	    console.log("mbrId : : " + mbrId);
	    
	    
	    //?????? insert 
	    $.ajax({
			url : "/project/kanban/insert",
			data : {'kbNm': fdata,
					'pjtNo': pjtNo},
			type : 'get',
			success : function(res){
				//alert("?????? ????????? ??????");
			},
			error : function(xhr){
				//alert("?????? : " + xhr.status);
			},
			dataType : 'text'
		})
	
	    var $_listTitleLower = $_listTitle.toLowerCase();
	    var $_listTitleRemoveWhiteSpaces = $_listTitleLower.split(' ').join('_') ;
	    var $_listSectionDataAttr = $_listTitleRemoveWhiteSpaces;
	
		//?????? ??????
	    $html = '<div data-section="s-'+$_listSectionDataAttr+'" class="task-list-container  mb-4 " data-connect="sorting">'+
	                '<div class="connect-sorting">'+
	                    '<div class="task-container-header">'+
	                        '<h6 class="s-heading" data-listTitle="'+$_listTitle+'">'+$_listTitle+'</h6>'+
	                        '<div class="dropdown">'+
	                            '<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">'+
	                                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>'+
	                            '</a>'+
	                            '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink-4">'+
	                                '<a class="dropdown-item list-edit" href="javascript:void(0);">????????????</a>'+
	                                '<a class="dropdown-item list-delete" href="javascript:void(0);">????????????</a>'+
	                                '<a class="dropdown-item list-clear-all" href="javascript:void(0);">????????????</a>'+
	                            '</div>'+
	                        '</div>'+
	                    '</div>'+
	
	                    '<div class="connect-sorting-content" data-sortable="true">'+
	                        
	                        
	                    '</div>'+
	
	                    '<div class="add-s-task">'+
	                        '<a class="addTask"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg></a>'+
	                    '</div>'+
	
	                '</div>'+
	            '</div>';
	
	    $(".task-list-section").append($html); 
	    $('#addListModal').modal('hide');
	    $('#s-list-name').val('');
	    $_taskSortable();
	    $_editList()
	    //$_deleteList();
	    $_clearList();
	    addTask();
	    $_taskEdit();
	    $_taskDelete();
	})	
	
})	

//?????? ?????? 
function deleteList(kbno) {
    $('.list-delete').off('click').on('click', function(event) {
    	console.log("????????????: " +kbno);
    	
    	console.log("????????????????????? : " +pjtNo);
    	console.log("?????? ????????? : " +mbrId);
        //event.preventDefault();
        
        const swalWithBootstrapButtons = swal.mixin({
	    confirmButtonClass: 'btn btn-success',
	    cancelButtonClass: 'btn btn-danger mr-3',
	    buttonsStyling: false,
	  })

	  	swalWithBootstrapButtons({
	    title: '?????????????????????????',
	    //text: "You won't be able to revert this!",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonText: '????????????',
	    cancelButtonText: '????????????',
	    reverseButtons: true,
	    padding: '2em'
	  }).then(function(result) {
	    if (result.value) {
	      swalWithBootstrapButtons(
	        '?????????????????????.',
	        //'Your file has been deleted.',
	        ''
	      ).then(function(result){
			  	if(result){
				  	location.href="/project/kanban.do?pjtNo="+pjtNo; 
			  	}
			  	
	    	  $.ajax({
					url : '/project/kanban/delete',
					type : 'post',
					data : {'kbNo' : kbno},
					success : function(res){
						//alert(kbno+" ????????????");
					},
					error : function(xhr){
						//alert("?????? : " + xhr.status);
					}
				});
	    	  
	  		})
	  		
			    
	    } else if (
	      // Read more about handling dismissals
	      result.dismiss === swal.DismissReason.cancel
	      
	    ) {
	      swalWithBootstrapButtons(
	        '?????????????????????.',
	        //'Your imaginary file is safe :)',
	        ''
	      ).then(function(result){
		  	if(result){
		  		location.href="/project/kanban.do?pjtNo="+pjtNo;
		  	}
	  		})
	    }
	    
	  })
        
    })
    
}//deleteList
	




</script>

<%
String memberNm = (String)session.getAttribute("memberNm");
String mbrId = (String)session.getAttribute("mbrId");
String plId = (String)session.getAttribute("plId");
%>

<div class="layout-px-spacing">

    <div class="page-header">
    </div>

    <div class="action-btn layout-top-spacing mb-5">
        
        <c:forEach var="plId" items="${plId}">
        	<c:if test="${mbrId eq plId}">
	        	<button id="add-list" class="btn btn-outline-primary" style="margin-left: 20px;">?????? ??????</button> 
	        </c:if>
        </c:forEach>
    </div>
    
    <!-- ?????? ?????? modal -->
<div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalTitle" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        	<input type="hidden">
            <div class="modal-body">
                <div class="compose-box">
                    <div class="compose-content" id="addTaskModalTitle">
                        <h5 class="add-task-title">?????? ????????????</h5>
                        <h5 class="edit-task-title" style="display: none;">?????? ????????????</h5>
                      <div class="card-body">
                          <form action="javascript:void(0);">
                          
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="task-title mb-4">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3">
                                           <path d="M12 20h9"></path>
                                           <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                          </svg>
                                          <input id="s-task" type="text" placeholder="?????? ??????" class="form-control" name="task">
                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="task-badge mb-4">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star">
                                          	<polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                          </svg>
                                          <textarea id="s-text" placeholder="?????? ??????" class="form-control" name="taskText"></textarea>
                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="task-badge mb-4">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-activity">
                                          	<polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                                          </svg>

                                          <div class="" style="width: 100%">
                                              <input type="range" min="0" max="100" class="custom-range" value="0" id="progress-range-counter">

                                              <div class="range-count">
                                              <span class="range-count-number" data-rangecountnumber="0">0</span> 
                                                                           <span class="range-count-unit">%</span></div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                             
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="task-badge mb-4">  
	                                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
		                                      <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
		                                      <line x1="16" y1="2" x2="16" y2="6"></line>
		                                      <line x1="8" y1="2" x2="8" y2="6"></line>
		                                      <line x1="3" y1="10" x2="21" y2="10"></line>
	                                      </svg>    
	                                      <div class="form-group mb-0">
                                        		<input id="rangeCalendarFlatpickr" class="form-control flatpickr flatpickr-input sded" type="text" placeholder="?????? ??????" readonly="readonly">
                                    	  </div>
              						 </div>
                                  </div>
                               </div>
                                    
                               <sec:csrfInput />
                          </form>
                      </div>
                  </div>
            		</div>
        		</div>
	            <div class="modal-footer">
	                <button class="btn" data-dismiss="modal">
	                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
		                <line x1="18" y1="6" x2="6" y2="18"></line>
		                <line x1="6" y1="6" x2="18" y2="18"></line>
	                </svg> ????????????</button>
	                <button data-btnfn="addTask" class="btn add-tsk">?????? ????????????</button>
	                <button data-btnfn="editTask" class="btn edit-tsk" style="display: none;">????????????</button>
	            </div>
        </div>
    </div>
</div>

<!-- ?????? ?????? ??????  -->
<div class="modal fade" id="addListModal" tabindex="-1" role="dialog" aria-labelledby="addListModalTitle" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="compose-box">
                    <div class="compose-content" id="addListModalTitle">
                        <h5 class="add-list-title">List ??????</h5>
                        <h5 class="edit-list-title" style="display: none;">List ??????</h5>
                        <form action="javascript:void(0);">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="list-title">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
	                                        <line x1="8" y1="6" x2="21" y2="6"></line>
	                                        <line x1="8" y1="12" x2="21" y2="12"></line>
	                                        <line x1="8" y1="18" x2="21" y2="18"></line>
	                                        <line x1="3" y1="6" x2="3" y2="6"></line>
	                                        <line x1="3" y1="12" x2="3" y2="12"></line>
	                                        <line x1="3" y1="18" x2="3" y2="18"></line>
                                        </svg>
                                        <input id="s-list-name" type="text" placeholder="" class="form-control" name="task">
                                    </div>
                                </div>
                            </div>
                         </form>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
	                <line x1="18" y1="6" x2="6" y2="18"></line>
	                <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg> ??????</button>
                <button class="btn add-list">??????</button>
                <button class="btn edit-list" id="update" style="display: none;">Save</button>
                        
            </div>
        </div>
    </div>
</div>



<div class="row scrumboard" id="cancel-row">
    <div class="col-lg-12 layout-spacing">

        <div class="task-list-section">
        
        	<c:forEach var="kanbanVO" items="${list}">
				<div data-section="s-${kanbanVO.kbNo}" class="task-list-container  mb-4 " data-connect="sorting">
        		<input type="hidden" id="kanbanNo" value="${kanbanVO.kbNo}">
					<div class="connect-sorting">
						<div class="task-container-header">
							<h6 class="s-heading" data-listtitle="${kanbanVO.kbNm}">${kanbanVO.kbNm}</h6>
							
							<c:if test="${mbrId eq plId}">
								<div class="dropdown">
									<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal">
											<circle cx="12" cy="12" r="1"></circle>
											<circle cx="19" cy="12" r="1"></circle>
											<circle cx="5" cy="12" r="1"></circle>
										</svg>
									</a>
									<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink-4">
										<input type="hidden" id="kanbanNo" value="${kanbanVO.kbNo}">
										<a class="dropdown-item list-edit" href="javascript:$_editList(${kanbanVO.kbNo});">????????????</a>
										<a class="dropdown-item list-delete" href="javascript:deleteList(${kanbanVO.kbNo});">????????????</a>
										<a class="dropdown-item list-clear-all" href="javascript:void(0);">????????????</a>
									</div>
								</div>
							</c:if>
							
						</div>
						<div class="connect-sorting-content ui-sortable" data-sortable="true" id="cardT${kanbanVO.kbNo}" value="${kanbanVO.kbNo}">
						
							<c:forEach var="kbCard" items="${kbCardlist}">
							
								<c:if test="${kanbanVO.kbNo eq kbCard.kbNo}">	
									<div data-draggable="true" class="card task-text-progress" style="" name="${kanbanVO.kbNo}" value="${kbCard.kbCardNo}">
										<div class="card-body">
										<input type="hidden" class="${kanbanVO.kbNo}">
											<div class="task-header">
												<div class="">
													<h4 class="" data-tasktitle="${kbCard.kbCardTtl}">${kbCard.kbCardTtl}</h4>
												</div>
												<div>
													<c:forEach var="memImg" items="${memImg}">
													<c:if test="${kbCard.kbCardWrtrNm eq memImg.mbrNm}">
                                                    	<img src="/resources/profileImage/<c:if test='${memImg.mbrImg == null}'>profileimage.png</c:if><c:if test='${memImg.mbrImg != null}'>${memImg.mbrImg}</c:if>" alt="${memImg.mbrNm}">
													</c:if>
													</c:forEach>
													<div style="font-size: 16px;">${kbCard.kbCardWrtrNm}</div>
												</div>
												<c:if test="${kbCard.kbCardWrtrNm eq memberNm}">
													<div class="">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 s-task-edit">
															<path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
														</svg>
													</div>
												</c:if>
												
											</div>
											<div class="task-body">
												<div class="task-content">
													<p class="" data-tasktext="${kbCard.kbCardCn}" style="font-size: 19px;">${kbCard.kbCardCn}</p>
													<div class="">
														<div class="progress br-30">
															<div class="progress-bar bg-success" role="progressbar" data-progressstate="${kbCard.kbPrgrs}" style="width: ${kbCard.kbPrgrs}%" aria-valuenow="${kbCard.kbPrgrs}" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
														<p class="progress-count">${kbCard.kbPrgrs}%</p>
													</div>
												</div>
												<div class="task-bottom">
													<div class="tb-section-1">
														<c:if test="${kbCard.kbCardEndDt!='0'}">
														<span data-taskdate="${kbCard.kbCardStrtDt} ~ ${kbCard.kbCardEndDt}">
														</c:if>
														<c:if test="${kbCard.kbCardEndDt=='0'}">
														<span data-taskdate="${kbCard.kbCardStrtDt}">
														</c:if>
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
																<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
																<line x1="16" y1="2" x2="16" y2="6"></line>
																<line x1="8" y1="2" x2="8" y2="6"></line>
																<line x1="3" y1="10" x2="21" y2="10"></line>
															<c:if test="${kbCard.kbCardEndDt!='0'}">
															</svg> ${kbCard.kbCardStrtDt} ~ ${kbCard.kbCardEndDt}
															</c:if>
															<c:if test="${kbCard.kbCardEndDt=='0'}">
															</svg> ${kbCard.kbCardStrtDt}
															</c:if>
														</span>
														
													</div>
													<c:if test="${kbCard.kbCardWrtrNm eq memberNm}">
														<div class="tb-section-2">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 s-task-delete">
																<polyline points="3 6 5 6 21 6"></polyline>
																<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
																<line x1="10" y1="11" x2="10" y2="17"></line>
																<line x1="14" y1="11" x2="14" y2="17"></line>
															</svg>
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								
							</c:forEach>
							
						
						</div>
						<div class="add-s-task">
							<a class="addTask" kbcd="${kanbanVO.kbNo}" >
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
									<circle cx="12" cy="12" r="10"></circle>
									<line x1="12" y1="8" x2="12" y2="16"></line>
									<line x1="8" y1="12" x2="16" y2="12"></line>
								</svg>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
            

        </div>
    </div>
</div>

</div>
 
<!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
    
    
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <script src="/resources/plugins/flatpickr/flatpickr.js"></script>
    <script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/assets/js/apps/LHJ.js"></script>
    <script src="/resources/assets/js/apps/scrumboard.js"></script>

    <!-- END PAGE LEVEL SCRIPTS -->
    <script type="text/javascript">
	var f3 = flatpickr(document.getElementById('rangeCalendarFlatpickr'), {
	    mode: "range"
	});
	</script>
    
    
    
    
</body>
</html>