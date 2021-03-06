<%@page import="kr.or.ddit.project.vo.ProjectVO"%>
<%@page import="kr.or.ddit.user.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />

<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
<%
	//줄바꿈 처리
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<style>
	#allCont {
/* 	margin-top: 70px;  */
/* 	width: 1350px;  */
	height: 850px;
	display: flex;
	flex-direction: column;
}
	.btns {
	margin-top : 30px;
	 width: 1290px; 
	 text-align: right;
}
	
	.form-control{
	background-color: #ebedf2;
	font-size:16px;
	color : #455460;
	width: 80%;
	vertical-align: middle;
	border : 0px;
}

	 .widget-one{
		display : flex;
		margin-top : 30px;
		margin-bottom : 30px;
	}

	.p_lab{
		font-weight: 550;
    	font-size: 18px;
		width:150px;
/* 		padding:8px; */
		text-align:center;
		color:#6c757d;
		position: relative;
/*     	top: -7px; */
	}	

</style>
<script>
	var pjtNo = "<c:out value='${project.pjtNo}' />";
	console.log("pjtNo 나와라", pjtNo);
	var mbrId = "<c:out value='${member.mbrId}' />";
	console.log("mbrId 나와라", mbrId);
	var admin = "<c:out value='${admin[0].PJT_WRTR_NM}' />";
	console.log("해당 프로젝트 관리자 호출 : ",admin);
	
	$(document).on("click", "#repDelete", function(){
		//업무보고 삭제 시
		var rno = $("#rptNo").val();
		console.log("삭제할 rptNo는"+rno);
		
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
			  		location.href="/project/report.do?currentPage=1&pjtNo="+${project.pjtNo}+"&keyword=";
			  	}
		  		})
		      
			    $.ajax({
				type : "post",
				url : "/project/reportDelete.do",
				data : {
					"rptNo" : rno,
					"pjtNo" : pjtNo
				},
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
			  		location.href="/project/reportDetail.do?rptNo="+rno; 
			  	}
		  		})
		  })
	
</script>

<!-- report 조회 시작 -->
<div class="layout-px-spacing">
	<div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing" style="width:83%;">
<!-- <div class="leftDiv"> -->
		<div id="allCont" class="widget-content-area br-4" style="margin-top: 50px;">
			<div class="btns">
<%-- 				<button class="btn btn-outline-success mb-2" onclick="location.href='/project/mkTodo.do?pjtNo=${map.PJT_NO}&tdNo=${map.TD_NO}'">편집</button> --%>
<%-- 				<button class="btn btn-outline-danger mb-2" onclick="deleteTodo('${map.TD_NO}')">삭제</button> --%>
			</div>
			
<!-- <div class="page-header"></div> -->
<!-- <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style=" margin-top:80px;"> -->
<!-- 	<div id="timelineProfile" class="col-lg-12 layout-spacing"> -->
<!-- 		<div class="statbox widget box box-shadow"> -->
				<div class="widget-header">
					<div class="row">
<!-- 						<div class="col-xl-12 col-md-12 col-sm-12 col-12"> -->
<!-- 							<h4>업무보고 조회</h4> -->
<!-- 						</div> -->
					</div>
				</div>
					<div class="todoContent" style="padding: 10px; margin-top: 50px; margin-left:10px;">
					<c:forEach var="list" items="${detail }">
							<div class="widget-one0" style="display: inline-block;">
								<label class="p_lab" for="rptCtgrNm" style="display: inline-block;">구분&nbsp;</label>
									<div class="form-control" style="display: inline-block; width:80px; text-align: center">
										<c:if test="${list.RPT_CTGR_NM eq 'D'}">
											<span >일간</span>
										</c:if>
										<c:if test="${list.RPT_CTGR_NM eq 'W'}">
											<span >주간</span>
										</c:if>
										<c:if test="${list.RPT_CTGR_NM eq 'F'}">
											<span >완료</span>
										</c:if>
									</div>
							</div>
							<div class="widget-one1" style="display: inline-block;">		
								<label class="p_lab" for="rptTtl" style="display: inline-block;">제목&nbsp;</label>
									<div class="form-control" style="width:300px; display:inline-block; margin-right: 10px; text-align: left">
										${list.RPT_TTL}</div>
							</div>			
							<div class="widget-one2" style="display: inline-block;">			
								<label class="p_lab" for="rptWrtrId" style="display: inline-block;">작성자&nbsp;</label>
										<div class="form-control" style="width:85px; display: inline-block; text-align: center">
											${list.MBR_NM}</div>
							</div>
							<div class="widget-one">
							<label class="p_lab" for="rptCn" style="display: inline-block;">내용&nbsp;</label>
									<div class="form-control" style="width:80%; display: inline-block; height:300px; overflow-y: auto;">
										${fn:replace(list.RPT_CN, cn, br)}</div>		
							</div>
							<div class="widget-one">
							<label class="p_lab" for="trsmfile" style="display: inline-block; margin-top: 10px;">첨부파일&nbsp;</label>
								<c:forEach var="fileList" items="${trsm}">
									<c:if test="${list.RPT_NO eq fileList.rptNo && fileList.trsmFileNm != null}">
										<div class="fileSection" style=" display: inline-block; text-align: center" >
											<div class="form-control" style="width:auto; display: inline-block;">
											<a href="/project/reportDownload.do?fileNo=${fileList.fileNo}">${fileList.trsmFileNm}</a></div>
										</div>
									</c:if>
									<c:if test="${list.RPT_NO eq fileList.rptNo && fileList.trsmFileNm eq null}">
										<div class="fileSection" style=" display: inline-block; text-align: center" >	
											<div class="form-control" style="width:auto; display: inline-block;">
											<span>첨부파일이 없습니다</span></div>
										</div>
										</c:if>	
								<input type="hidden" id="uploadFile" name="uploadFile" value="${fileList.trsmFileNm}" />
							</c:forEach>
								</div>
							</div>
							<!-- 로그인한 아이디가 PL인 경우 아래 보여주기 -->
									<div class="widget-one">
										<label class="p_lab" for="rptStts" style=" display: inline-block; margin-left:10px;"><font color="red">*</font>승인여부&nbsp;</label>
											<div style="display: inline-block;">
												<c:forEach var="pjMem" items="${pjtMem}">
														<!-- 로그인한 아이디가 관리자이거나 PL일때 -->
														<c:if test="${member.mbrId eq pjMem.MBR_ID && pjMem.PJT_PRTPNT_RL eq 'Project Leader'}">
															<form action="/project/rptConfirm.do" method="post">
																<input type="hidden" class="pjtNo" name="pjtNo" value="${project.pjtNo}">
																<input type="hidden" id="rptNo" name="rptNo" value="${list.RPT_NO }">
																	<select name="rptStts" aria-controls="DataTables_Table_0" class="form-control"
																			style="display: inline-block; margin-left:10px; width: 80px;">
																			<c:if test="${list.RPT_STTS eq null}">
																				<option value="C">승인</option>
																				<option value="R">반려</option>
																			</c:if>
																			<c:if test="${list.RPT_STTS eq 'C'}">
																				<option value="C" selected="selected">승인</option>
																				<option value="R">반려</option>
																			</c:if>
																			<c:if test="${list.RPT_STTS eq 'R'}">
																				<option value="R" selected="selected">반려</option>
																				<option value="C">승인</option>
																			</c:if>
																	</select>
																		<c:if test="${list.RPT_RJCT_CN eq null}">
																			<label class="p_lab" style=" margin-left:10px; display: inline-block;">반려 사유&nbsp;</label>
																				<input type="text" name="rptRjctCn" class="form-control" id="rptRjctCn" 
																				placeholder="반려 시 사유를 입력해주세요" style="display: inline-block; width:400px; margin-left:10px; value="">
																		</c:if>
																		<c:if test="${list.RPT_RJCT_CN != null}">
																			<div class="form-control" style="display: inline-block; width:600px;">
																				<span>${list.RPT_RJCT_CN}</span>
																			</div>
																		</c:if>
																	<button type="submit" id="confirmBtn" class="btn btn-outline-success mb-2" style="display: inline-block;">확인</button>		
																<sec:csrfInput />
															</form>
														</c:if>
														<c:if test="${member.mbrId eq pjMem.MBR_ID && pjMem.PJT_PRTPNT_RL != 'Project Leader'}">
															<div class="form-control" style="display: inline-block; width:auto; text-align:center;">
																<c:if test="${list.RPT_STTS eq 'C'}">
																	<span>승인</span>
																</c:if>
																<c:if test="${list.RPT_STTS eq 'R'}">
																	<span>반려</span>
																</c:if>
																<c:if test="${list.RPT_STTS eq null}">
																	<span>승인대기</span>
																</c:if>
															</div>
															<c:if test="${list.RPT_STTS eq 'R'}">
																<label class="p_lab" style=" margin-left:10px; display: inline-block; ">반려 사유&nbsp;</label>
																<div class="form-control" style="display: inline-block; width:auto;">
																<span>${list.RPT_RJCT_CN}</span>
																</div>
															</c:if>	
														</c:if>
												</c:forEach>
												</div>		
											</div>
							
							<div class="btnSection" style="height: 50px; margin-top: 15px;">
									<div style="text-align: center;">
										<c:if test="${member.mbrNm eq list.MBR_NM}">
											<button type="button" class="btn btn-outline-primary" style="margin-right: 10px;" onclick="location.href='/project/reportUpdate.do?pjtNo=${list.PJT_NO}&rptNo=${list.RPT_NO}'">수정</button>
<%-- 											<button type="button" onclick="repDetete(${list.RPT_NO})" class="btn btn-outline-primary mb-2">삭제</button> --%>
											<button type="button" id="repDelete" class="btn btn-outline-primary">삭제</button>
										</c:if>
										<c:if test="${member.mbrNm != list.MBR_NM}">
											<button type="button" class="btn btn-outline-primary"
											onclick="window.history.back()" style="margin-right: 10px;">돌아가기</button>
										</c:if>
									</div>
							</div>
							</c:forEach>
						</div>
					</div>	
					</div>
					</div>
<!-- 					</div> -->


<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/js/app.js"></script>
<script src="/resources/plugins/highlight/highlight.pack.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
