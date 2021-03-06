<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<style>
.tabletr{
	text-align:center;
}
</style>


<div class="adminDiv">
<div class="widget-content widget-content-area" style="width:100%; height: auto; position:relative; top:-55px; left:-45px; padding: 40px;">
<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
	<div class="row" style="width:100%;">
	<div class="col-lg-8 col-md-6 col-sm-9 filtered-list-search" style="margin-bottom: 20px; margin-left: 50%;">
                 <form class="form-inline my-2 my-lg-0 justify-content-center" action="/gds/gdsList.do">
                     <div class="w-50">
                         <input type="text" name="keyWord" class="w-100 form-control product-search br-30" id="input-search" placeholder="검색...">
                     </div> 
                 </form>
             </div>
		<div class="col-sm-12">
			<table class="multi-table table table-hover dataTable"
				style="width: 100%; text-align:center;" id="DataTables_Table_0" role="grid"
				aria-describedby="DataTables_Table_0_info">
				<thead>
					<tr role="row" class="tabletr">
						<th class="sorting_asc" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-sort="ascending"
							aria-label="Name: activate to sort column descending"
							style="width: 200px;">프로젝트 명</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Position: activate to sort column ascending"
							style="width: 220px;">개요</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Office: activate to sort column ascending"
							style="width: 130px;">현재 팀원 수</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Age: activate to sort column ascending"
							style="width: 120px;">시작일</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Salary: activate to sort column ascending"
							style="width: 100px;">종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${projectList}" var="vo">
					<tr role="row" class="tabletr">
						<td class="sorting_1"><a href="/project/recruitmentDetail.do?pjtNo=${vo.PJT_NO}">${vo.PJT_NM}</a></td>
						<td><a href="/project/recruitmentDetail.do?pjtNo=${vo.PJT_NO}">${vo.PJT_OL}</a></td>
						<td>${vo.COUNTING}</td>
						<td class="sorting_1">${vo.PJT_STRT_YMD}</td>
						<td>${vo.PJT_END_YMD}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
</div>



<script src="/resources/assets/js/jsa/todo.js"></script>
<script src="/resources/plugins/table/datatable/datatables.js"></script>                                
<script>

    $(document).ready(function() {
    	
        $('table.multi-table').DataTable({
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "프로젝트를 검색하세요",
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
    } );
</script>                                
                                
                                
                                