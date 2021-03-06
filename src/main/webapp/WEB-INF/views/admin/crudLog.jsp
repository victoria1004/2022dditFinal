<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link href="/resources/assets/css/elements/custom-pagination.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />

<style>
.disabled{
	pointer-events: none;
}
</style>

<div class="adminDiv">
          <div class="widget-content widget-content-area" style="width:100%; height: auto; position:relative; top:-55px; left:-45px; padding: 40px;">
	                <div class="table-responsive mb-4" style="overflow:hidden">
	                    <form name="frm" id="frm" method="get" action="/admin/list.do">
	                    <div id="style-2_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="style-2_length"><label><select name="size" aria-controls="style-2" class="form-control"><option value="10">10</option><option value="20">20</option><option value="50">50</option><option value="100">100</option></select></label></div></div><div class="col-sm-12 col-md-6"><div id="style-2_filter" class="dataTables_filter"><label><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg><sec:csrfInput /><input type="search" name="keyWord" class="form-control" placeholder="검색..." aria-controls="style-2"></label></div></div></div><div class="row"><div class="col-sm-12"></div></div></div></form>
	                    
	                    <table id="style-2" class="table style-2 table-hover dataTable no-footer" role="grid" aria-describedby="style-2_info" style="width: 1000px; text-align: center;">
	                        <thead>
	                            <tr role="row">
									<th  tabindex="0" aria-controls="style-2" rowspan="1" colspan="1" aria-label="First Name: activate to sort column ascending" style="width: 100px;" aria-sort="descending">번호</th><th tabindex="0" aria-controls="style-2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 256px;">위치</th><th tabindex="0" aria-controls="style-2" rowspan="1" colspan="1" aria-label="Mobile No.: activate to sort column ascending" style="width: 196px;">요청 IP</th><th class="text-center" tabindex="0" aria-controls="style-2" rowspan="1" colspan="1" aria-label="Image: activate to sort column ascending" style="width: 121px;">발생일시</th><th class="text-center" tabindex="0" aria-controls="style-2" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 155px;">처리구분</th></tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${list.content }">
                            <c:if test="${row.logNm == '등록' || row.logNm == '수정' || row.logNm == '삭제'}">
	                            <tr role="row" class="odd">
                                    <td class="sorting_1"><input type="hidden" name="rnum" value="${row.rnum }" />${row.rnum }</td>
                                    <td class=""><input type="hidden" name="logAddr" value="${row.logAddr}" />${row.logAddr}</td>
                                    <td><input type="hidden" name="logIpAddr" value="${row.logIpAddr }" />${row.logIpAddr }</td>
                                    <td class="text-center"><input type="hidden" name="logDt" value="${row.logDt }" />${row.logDt }</td>
                                    <td class="text-center"><span class="shadow-none badge <c:if test='${row.logNm eq "등록"}'>badge-primary</c:if>
                                    														<c:if test='${row.logNm eq "수정"}'>badge-warning</c:if>
                                    														<c:if test='${row.logNm eq "삭제"}'>badge-danger</c:if>"><input type="hidden" name="logNm" value="${row.logNm }" />${row.logNm }</span></td>
                                </tr>
                            </c:if>
                            </c:forEach>
                            
                            </tbody>
	                    </table>
	                    </div>
	                    <div class="row" style="margin-bottom: 10px;"><div class="col-sm-12 col-md-5">
	                    <form action="/admin/list.do" method="post">
			                <button type="submit" class="btn btn-outline-primary">엑셀 다운로드</button>
                   		</form>
	                    </div>
	                    <div class="col-sm-12 col-md-7"><div class="paginating-container pagination-default">
					    <ul class="pagination">
					        <li class="prev <c:if test='${list.startPage<6}'>disabled</c:if>"><a href="/admin/list.do?currentPage=${list.startPage-5}&keyWord=${param.keyWord}">&lt;</a></li>
					        <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
					        	<li class="<c:if test='${list.currentPage eq pNo}'>active</c:if>"><a href="/admin/list.do?currentPage=${pNo}&keyWord=${param.keyWord}&size=${param.size}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a></li>
					        </c:forEach>
					        <li class="next <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if>"><a href="/admin/list.do?currentPage=${list.startPage+5}&keyWord=${param.keyWord}">&gt;</a></li>
					    </ul>
						</div></div></div>
	                    </div>
</div>

<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/js/app.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/plugins/table/datatable/datatables.js"></script>
