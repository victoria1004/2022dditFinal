<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<style>

</style>


<div class="layout-px-spacing">
<div class="leftDiv">
<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style=" margin-top:80px;">
	<div class="row">
		<div class="col-sm-12">
			<table class="multi-table table table-hover dataTable"
				style="width: 100%;" id="DataTables_Table_0" role="grid"
				aria-describedby="DataTables_Table_0_info">
				<thead>
					<tr role="row">
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
							style="width: 75px;">시작일</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Age: activate to sort column ascending"
							style="width: 120px;">종료일</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Salary: activate to sort column ascending"
							style="width: 100px;">종료 구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${endProjectList}" var="vo">
					<tr role="row">
						<td style="padding-left:50px;" class="sorting_1"><a href="/project/projectInfo.do?pjtNo=${vo.pjtNo}">${vo.pjtNm}</a></td>
						<td>${vo.pjtOl}</td>
						<td style="padding-left:50px;">${vo.pjtStrtYmd}</td>
						<td class="sorting_1">${vo.pjtEndYmd}</td>
						<td style="padding-left:60px;"><span id="status" class="badge badge-pills outline-badge-primary">종료</span></td>
					</tr>
					</c:forEach>
					<c:forEach items="${earlyEndProjectList}" var="vo">
					<tr role="row">
						<td style="padding-left:50px;" class="sorting_1"><a href="/project/projectInfo.do?pjtNo=${vo.pjtNo}">${vo.pjtNm}</a></td>
						<td>${vo.pjtOl}</td>
						<td style="padding-left:50px;">${vo.pjtStrtYmd}</td>
						<td class="sorting_1">${vo.pjtEndYmd}</td>
						<td style="padding-left:60px;"><span id="status" class="badge badge-pills outline-badge-primary">조기 종료</span></td>
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
                                
                                
                                