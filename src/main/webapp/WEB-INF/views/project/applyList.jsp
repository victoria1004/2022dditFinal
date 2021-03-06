<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<style>
#status{
	cursor:pointer;
}
</style>
<div class="layout-px-spacing" style="margin-top:50px; padding:10px;">    
<div class="widget-content widget-content-area" style="width:1200px;">
<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style="margin-top:30px; text-align:center;">
	<div class="row" style="padding:50px 50px;">
		<div class="col-sm-12">
			<h5>내가 신청한 프로젝트</h5><br>
			<table class="multi-table table table-hover dataTable"
				style="width: 80%; text-align:center;" id="DataTables_Table_0" role="grid"
				aria-describedby="DataTables_Table_0_info">
				<thead>
					<tr role="row">
						<th class="sorting_asc" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-sort="ascending"
							aria-label="Name: activate to sort column descending"
							style="width: 80px; padding-left:33px;">프로젝트 명</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Position: activate to sort column ascending"
							style="width: 25px; padding-left:33px;">담당자</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Office: activate to sort column ascending"
							style="width: 40px; padding-left:33px;">신청일자</th>
						<th class="sorting" tabindex="0"
							aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
							aria-label="Age: activate to sort column ascending"
							style="width: 40px; padding-left:33px;">상태</th>
					</tr>
				</thead>
				
					<c:forEach items="${applyList}" var="vo">
					<tr role="row">
						<td style="with:80px;" class="sorting_1"><a href="/project/recruitmentDetail.do?pjtNo=${vo.PJT_NO}">${vo.PJT_NM}</a></td>
						<td>${vo.MBR_NM}</td>
						<td class="sorting_1">${vo.PJT_APPLY_DT}</td>
						<td><span id="status" class="badge badge-pills outline-badge-primary">
							<c:if test='${vo.APPLY_APRV_YN eq "N"}'>
 								<a onMouseOver='this.innerHTML="사유"' onMouseOut='this.innerHTML="거절"' onclick="reason('${vo.PJCT_RSN}')">거절</a>
							</c:if>
							<c:if test='${vo.APPLY_APRV_YN eq "Y"}'>
								승인
							</c:if>
							<c:if test='${vo.APPLY_APRV_YN eq null}'>
								<a onMouseOver='this.innerHTML="취소하기"' onMouseOut='this.innerHTML="취소 가능"' onclick="applyCancel(${vo.PJT_APPLY_NO})">취소 가능</a>
							</c:if>
						 </span></td>
					</tr>
					</c:forEach>
				
			</table>
		</div>
	</div>
</div>
</div>
</div>

 <div class="modal fade bd-example-modal-sm" id="reasonModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-sm" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h5 class="modal-title" id="mySmallModalLabel">지원 거절 사유</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                              </button>
                          </div>
                          <div class="modal-body">
							<textarea class="form-control" id="reasonCon">
	                         </textarea>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="keyword_making()">확인</button>
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
    
    //삭제 버튼 클릭
  function applyCancel(applyNo){
     	
  const swalWithBootstrapButtons = swal.mixin({
    confirmButtonClass: 'btn btn-success btn-rounded',
    cancelButtonClass: 'btn btn-danger btn-rounded mr-3',
    buttonsStyling: false,
  })
  
  swalWithBootstrapButtons({
    title: '지원을 취소하시겠습니까?',
    text: "확인을 누르면 지원이 취소됩니다",
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: '지원 취소',
    cancelButtonText: '뒤로',
    reverseButtons: true,
    padding: '2em'
  }).then(function(result) {
    if (result.value) {
    
      swalWithBootstrapButtons(
        '취소 완료',
        '지원이 취소되었습니다',
        'success'
      ).then(function(result){
	  		if(result){
	  			location.href="/project/applyList.do";		
	  		}
  		})
      
 		
  		$.ajax({
    		url : "/project/applyListDelete.do",
    		type : 'post',
    		async: false,
    		data : {
    			applyNo:applyNo,
    		},
    		success : function(data) {
    	     },
    		error : function() {
    		
    		}
    	});
     		
    } else if (
      // Read more about handling dismissals
      result.dismiss === swal.DismissReason.cancel
    ) {
      swalWithBootstrapButtons(
        '돌아가기',
        '지원을 취소하지 않았습니다',
        'error'
      )
    }
  })
    }
    
function reason(reason){
	$('#reasonModal').modal('show');
	document.querySelector('#reasonCon').innerText=reason;
}
  

</script>                                
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>                                
                                
                                