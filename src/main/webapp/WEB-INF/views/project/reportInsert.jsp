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

<script>
	var pjtNo = "<c:out value='${project.pjtNo}' />";
	console.log("pjtNo 나와라", pjtNo);
	var mbrId = "<c:out value='${member.mbrId}' />";
	console.log("mbrId 나와라", mbrId);
</script>
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
/* 	background-color: #ebedf2; */
	font-size:16px;
	color : #455460;
	width: 80%;
	vertical-align: middle;
/* 	border : 1px solid #29347a; */
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
 	padding:8px; 
	text-align:center;
	color:#6c757d;
	position: relative;
}
		
</style>
<script>
	var mbrId = "<c:out value='${member.mbrId}' />";
	
	function preSetting(){
		$("#rptTtl").val('04/21_정신애 업무보고');
		$("#rptCn").val('PPT 최종발표 완료');
	}
</script>

<!-- report 작성 시작 -->
<div class="layout-px-spacing">
<!-- 	<div class="feedcontainer"> -->
<div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing" style="width:83%;">
		<div id="allCont" class="widget-content-area br-4" style="margin-top: 50px;">
<!-- <div class="page-header"></div> -->
<!-- <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style=" margin-top:80px;"> -->
<!-- <div class="row layout-top-spacing"> -->
<!-- 	<div id="timelineProfile" class="col-lg-12 layout-spacing"> -->
<!-- 		<div class="statbox widget box box-shadow"> -->
				<div class="widget-header">
					<div class="row">
<!-- 						<div class="col-xl-12 col-md-12 col-sm-12 col-12"> -->
<!-- 							<h4>업무보고 작성</h4> -->
<!-- 						</div> -->
					</div>
				</div>
				<div class="todoContent" style=" margin-top: 90px; margin-left:60px;">
							<form id="report" name="report" action="/project/rptInsertPost.do" method="post" enctype="multipart/form-data">
<%-- 							<form method="post" enctype="multipart/form-data" id="repForm"> --%>
								<div class="widget-one0" style="display: inline-block;">
									
										<label class="p_lab" for="rptCtgrNm" style="display: inline-block;">구분&nbsp;</label>
											<select name="rptCtgrNm" aria-controls="DataTables_Table_0" class="form-control" style="width:90px; display: inline-block;">
													<c:forEach var="pjMem" items="${mbr}">	
														<c:if test="${member.mbrId eq pjMem.MBR_ID && pjMem.PJT_PRTPNT_RL != 'Project Leader'}">
															<option value="D">일간</option>
															<option value="W">주간</option>
														</c:if>
														<c:if test="${member.mbrId eq pjMem.MBR_ID && pjMem.PJT_PRTPNT_RL eq 'Project Leader'}">
															<option value="D">일간</option>
															<option value="W">주간</option>
															<option value="F">완료</option>
														</c:if>
														
												</c:forEach>		
											</select>
								</div>
								<div class="widget-one1" style="display: inline-block;">	
								<label onclick="preSetting()" class="p_lab" for="rptTtl" style="display: inline-block;">제목&nbsp;</label>
									<div class="titleSection" style="display: inline-block;">
											<input type="text" maxlength="25" name="rptTtl" class="form-control" id="rptTtl" 
												placeholder="제목을 입력해주세요" style="width:450px; margin-bottom: 25px;" value="${vo.RPT_TTL }">
									</div>
								</div>
								
								<div class="widget-one">		
									<label class="p_lab" for="rptCn" style="display: inline-block;">내용&nbsp;</label>		
										<textarea style="width:72%; display: inline-block; height:300px; overflow-y: auto;" class="form-control" id="rptCn"
										 placeholder="내용을 입력해주세요" rows="5" name="rptCn"></textarea>
									 <input type="hidden" class="pjtNo" name="pjtNo" value="${project.pjtNo}">
									 <input type="hidden" class="rptWrtrId" name="rptWrtrId" value="${member.mbrId}">
								</div>
								<div class="widget-one">
								<label class="p_lab" for="trsmfile" style="display: inline-block; margin-top: 10px;">첨부파일&nbsp;</label>
								<div class="fileSection" style="margin-top: 20px; display: inline-block; margin-left:10px;" >
									<input type="file" name="uploadFile" multiple />
								</div>
								</div>
								<div class="btnSection" style="height: 50px; margin-top: 15px;">
									<div style="text-align: center;">
										<button type="button" class="btn btn-outline-primary"
											onclick="window.history.back()" style="margin-right: 10px;">취소</button>
<!-- 										<button type="button" class="btn btn-outline-primary mb-2" id="btnSubmit" name="btnSubmit"> 완료</button> -->
										<button type="submit" class="btn btn-outline-primary"> 완료</button>
									</div>
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

<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/js/app.js"></script>
<script src="/resources/plugins/highlight/highlight.pack.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
