<%@page import="kr.or.ddit.project.vo.ProjectVO"%>
<%@page import="kr.or.ddit.user.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/elements/custom-pagination.css" rel="stylesheet" type="text/css">

<style>
td {
/* text-align: center; */
margin-left : 10px;
}
.todobtn {
	border: 1px solid #56748a !important;
    color: #56748a;
    box-shadow: none;
}
.todobtn:hover {
    background-color: #56748a;
    color : #f1f2f3;
}
.table > tbody > tr > td { 
   width: 30px; 
   height: 65px; 
} 
.dataTables_wrapper .dataTables_length select.form-control {
    padding: 8px 30px 8px 14px;
}    
.layout-top-spacing{
	width:100%;
	margin-top : 0px;
}
   
.outline-badge-primary, .outline-badge-success, .outline-badge-danger {
    width: auto;
    height: 30px;
    font-size: 1.12em;
    text-align: center;
}

</style>


<div class="layout-px-spacing" >
		<div class="widget-content widget-content-area" style="width:83%; height : 880px; padding:20px; margin-top:50px;">
		<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style=" margin-top:10px;">
		
<!-- 		<div class="row layout-top-spacing" > -->
<!-- 			<div id="timelineProfile" class="col-lg-12 layout-spacing"> -->
<!-- 				<div class="statbox widget box box-shadow"> -->
<!-- 					<div class="widget-header" > -->
							<div class="col-lg-12 layout-top-spacing">
								<button class="btn btn-outline-primary" style="float: right; margin-top:5px; margin-right: 20px;" onclick="location.href='/project/reportInsert.do?pjtNo=${project.pjtNo}'">???????????? ??????</button>
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_length" id="DataTables_Table_0_length" style="margin-left: 20px;">
											<label>
											<select id="keyword" name="keyword" aria-controls="DataTables_Table_0" class="form-control">
												<c:choose>	
													<c:when test="${param.keyWord eq 'W' }">
														<option value="" >??????</option>
														<option value="D">??????</option>
														<option value="W" selected="selected">??????
														<option value="F">??????</option>
													</c:when>
													<c:when test="${param.keyWord eq 'D' }">
														<option value="" >??????</option>
														<option value="D" selected="selected">??????</option>
														<option value="W">??????</option>
													<option value="F">??????</option>
													</c:when>
													<c:when test="${param.keyWord eq 'F' }">
															<option value="" >??????</option>
														<option value="D">??????
														<option value="W">??????</option>
														<option value="F" selected="selected">??????</option>
													</c:when>
													<c:otherwise>
														<option value="" selected="selected">??????</option>
														<option value="D">??????</option>
														<option value="W" >??????</option>
														<option value="F">??????</option>
													</c:otherwise>
												</c:choose>	
												</select>
											</label>	
										</div>
									</div>
								</div>

								<table class="multi-table table table-hover dataTable"
									style="width: 100%;" id="DataTables_Table_0" role="grid"
									aria-describedby="DataTables_Table_0_info">
									<thead>
										<tr role="row">
											<th tabindex="0"
												style="width: 140px;">?????????</th>
											<th tabindex="0"
												style="width: 140px;">??????</th>
											<th tabindex="0"
												style="width: 350px;">??????</th>
											<th tabindex="0"
												style="width: 140px;">?????????</th>
											<th tabindex="0"
												style="width: 140px;">??????</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="rep" items="${list.content}" >
											<tr role="row">
												<td style="padding-left: 20px; text-align:center;">${rep.RPT_DT}</td>
												<td style="text-align:center;">
													<c:if test="${rep.RPT_CTGR_NM eq 'D'}">??????</c:if>
													<c:if test="${rep.RPT_CTGR_NM eq 'W'}">??????</c:if>
													<c:if test="${rep.RPT_CTGR_NM eq 'F'}">??????</c:if>
												</td>
												<td style="text-align:center;"class="sorting_1" ><a href="/project/reportDetail.do?pjtNo=${rep.PJT_NO}&rptNo=${rep.RPT_NO}">${rep.RPT_TTL}</a></td>
												<%-- 						<td><a href="/project/todoDetail.do?pjtNo=${map.PJT_NO}&tdNo=${map.TD_NO}">${map.TD_TTL}</a></td> --%>
												<td style="text-align:center;">${rep.MBR_NM}</td>
												<td style="text-align:center;">
														<c:if test="${rep.RPT_STTS eq null}">
															<span class="badge badge-pills outline-badge-success">????????????</span>
														</c:if>
														<c:if test="${rep.RPT_STTS eq 'C'}">
															<span class="badge badge-pills outline-badge-primary">??????</span>
														</c:if>
														<c:if test="${rep.RPT_STTS eq 'R'}">
															<span class="badge badge-pills outline-badge-danger">??????</span>
														</c:if>
												</td>
											</tr>
											
										</c:forEach>
									</tbody>
								</table>
								<div class="row" style="position: absolute; bottom:-60px; width: 100%;">
									<div class="col-sm-12 col-md-5">
<%-- 						            <div class="dataTables_info" id="style-2_info" role="status" aria-live="polite">Showing page ${list.currentPage } of ${list.endPage}</div></div> --%>
						            <div class="dataTables_info" id="style-2_info" role="status" aria-live="polite" style="display:none;"></div></div>
						            <div class="col-sm-12 col-md-7"><div class="paginating-container pagination-default">
									    <ul class="pagination">
									    	    <li class="prev"><a href="javascript:void(0);">Prev</a></li>
									        	<c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
									        	<li class="<c:if test='${list.currentPage eq pNo}'>active</c:if>"><a href="/project/report.do?currentPage=${pNo}&keyWord=${param.keyWord}&pjtNo=${project.pjtNo}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a></li>
<%-- 									        	<li class="<c:if test='${list.currentPage eq pNo}'>active</c:if>">${pNo}</li> --%>
									        	</c:forEach>
									        	<li class="next"><a href="javascript:void(0);">Next</a></li>
									    </ul>
								</div></div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
<script src="/resources/assets/js/jsa/todo.js"></script>
<script src="/resources/plugins/table/datatable/datatables.js"></script> 

<script>
var pjtNo = "<c:out value='${project.pjtNo}' />";
console.log("pjtNo ?????????", pjtNo);
var mbrId = "<c:out value='${member.mbrId}' />";
console.log("mbrId ?????????", mbrId);

 $(document).ready(function() {
    	
        $('table.multi-table').DataTable({
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "Search",
               "sLengthMenu": "Results :  _MENU_",
            },
            "stripeClasses": [],
            "lengthMenu": [10, 20, 50],
            "pageLength": 10,
            drawCallback: function () {
                $('.t-dot').tooltip({ template: '<div class="tooltip status" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>' })
                $('.dataTables_wrapper table').removeClass('table-striped');
            }
        });
     
        
        
    });
 		//?????? ????????? ????????????
        $('#keyword').change(function() {
        	$('#keyword option:selected').each(function(){
 				var res = $(this).val();
 				console.log(res);
 				location.href="/project/report.do?currentPage=1"+"&pjtNo="+"${project.pjtNo}"+"&keyWord="+res;
        	})
		});
        
</script>                                
                                
                                
                                