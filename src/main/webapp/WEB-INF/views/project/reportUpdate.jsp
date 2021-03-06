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
var pjtNo = "<c:out value='${project.pjtNo}' />";
console.log("pjtNo 나와라", pjtNo);
var mbrId = "<c:out value='${member.mbrId}' />";
console.log("mbrId 나와라", mbrId);
</script>


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
<!-- 							<h4>업무보고 수정</h4> -->
<!-- 						</div> -->
					</div>
				</div>
				<div class="todoContent" style=" margin-top: 90px; margin-left:30px;">
<!-- 				<div class ="widget-content widget-content-area" style="padding-left:140px;"> -->
					<c:forEach var="vo" items="${list }">
						<form id="reportVO" name="reportVO" action="/project/rptUpdatePost.do" method="post">
							<div class="widget-one0" style="display: inline-block;">	
								<label class="p_lab" for="rptCtgrNm" style="display: inline-block;">구분&nbsp;</label>
									<div class="categoty" style="display: inline-block;s">
											<select name="rptCtgrNm" aria-controls="DataTables_Table_0" class="form-control" style="width:90px; display: inline-block;">
												<c:if test="${vo.RPT_CTGR_NM eq 'D'}">
														<option value="D" selected="selected">일간</option>
														<option value="W">주간</option>
														<option value="F">완료</option>
												</c:if>
												<c:if test="${vo.RPT_CTGR_NM eq 'W'}">		
														<option value="W" selected="selected">주간</option>
														<option value="D">일간</option>
														<option value="F">완료</option>
												</c:if>	
												<c:if test="${vo.RPT_CTGR_NM eq 'F'}">		
														<option value="F" selected="selected">완료</option>
														<option value="D">일간</option>
														<option value="W">주간</option>
												</c:if>	
											</select>
									</div>				
									</div>
									<div class="widget-one1" style="display: inline-block;">
									<label class="p_lab" for="rptTtl" style="display: inline-block;">제목&nbsp;</label>
										<div class="titleSection" style="display: inline-block;">
											<input type="text" maxlength="25" name="rptTtl" class="form-control" id="rptTtl" 
												placeholder="제목을 입력해주세요" style="width:470px; margin-bottom: 25px;" value="${vo.RPT_TTL }">
										</div>
									</div>
									
									<div class="widget-one">			
									<label class="p_lab" for="rptCn" style="display: inline-block;">내용&nbsp;</label>		
										<textarea style="width:72%; display: inline-block; height:300px; overflow-y: auto;" class="form-control" id="rptCn"
										 placeholder="내용을 입력해주세요" rows="5" name="rptCn">${vo.RPT_CN }</textarea>
										 <input type="hidden" class="pjtNo" name="pjtNo" value="${project.pjtNo}">
										 <input type="hidden" class="rptNo" name="rptNo" value="${vo.RPT_NO}">
										 <input type="hidden" class="rptWrtrId" name="rptWrtrId" value="${member.mbrId}">
									</div>
									<div class="widget-one">
									<label class="p_lab" for="trsmfile" style="display: inline-block; margin-top: 10px;">첨부파일&nbsp;</label>
									<div class="fileSection" style="margin-top: 20px; display: inline-block; margin-left:10px;" >
									<c:forEach var="file" items="${trsm}">
											<c:if test="${vo.RPT_NO eq file.rptNo}">
												<div class="form-control file" style="width:auto; display: inline-block;">
													<a href="/project/reportDownload.do?fileNo=${file.fileNo}">${file.trsmFileNm}</a>
												</div></c:if>
											<c:if test="${empty file}">
												<div class="form-control" style="width:auto; display: inline-block;">
												<p>첨부파일이 없습니다</p></div>
											</c:if>
									</c:forEach>
									</div>
								</div>
									<br>
									<div>
									<br>
									<label class="p_lab" for="trsmfile" style="display: inline-block; margin-top: 10px;">첨부파일 추가&nbsp;</label>
										<input type="file" name="uploadFile" multiple />
									</div>	
								<div class="btnSection" style="height: 50px; margin-top: 15px;">
									<div style="text-align: center;">
										<button type="button" class="btn btn-outline-primary"
											onclick="window.history.back()" style="margin-right: 10px;">취소</button>
										<button type="submit" class="btn btn-outline-primary">완료</button>
									</div>
								</div>
								<sec:csrfInput />
							</form>
						</c:forEach>
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
