<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/datatables.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/dt-global_style.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/table/datatable/custom_dt_multiple_tables.css">
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/elements/custom-pagination.css" rel="stylesheet" type="text/css">

<style>
/* td { */
/* margin-left : 10px; */
/* } */
.center {
	cursor : pointer;
}
#addTd {
	position: relative;
	right: -660px;
	
}
</style>
<div class="layout-px-spacing" style="margin-top:50px;">
<div class="widget-content widget-content-area" style="width:83%; padding:20px;">
<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style=" margin-top:10px;">
	<div class="n-chk">
        <label class="new-control new-checkbox checkbox-primary">
          <input type="checkbox" id="myTodo" class="new-control-input" onclick="myTodo(this)">
          <span class="new-control-indicator"></span>내 일감보기</label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="new-control new-checkbox checkbox-primary">
          <input type="checkbox" id="getFinish" class="new-control-input" onclick="getFinish(this)">
          <span class="new-control-indicator"></span>완료 일감보기</label>
    	<button id="addTd" class="btn btn-outline-primary" onclick="location.href='/project/mkTodo.do?pjtNo=${project.pjtNo}';">일감 추가</button>
    </div>
	<div class="row">
	<br />
	<div class="col-sm-12 col-md-6">
	<label>
		<select id="stts" name="stts" aria-controls="DataTables_Table_0" class="form-control">
				<option value="reset" selected="selected">진행상태</option>
				<option value="TT01">요청</option>
				<option value="TT02">진행</option>
				<option value="TT03">피드백</option>
				<option value="TT04">완료</option>
				<option value="TT05">보류</option>
		</select>
	</label>
	<label>
		<select id="impr" name="impr" aria-controls="DataTables_Table_0" class="form-control">
				<option value="reset" selected="selected">중요도</option>
				<option value="TS01">긴급</option>
				<option value="TS02">중요</option>
				<option value="TS03">보통</option>
				<option value="TS04">낮음</option>
		</select>
	</label>
</div>
	<div class="col-sm-12 col-md-6">
	<div id="DataTables_Table_0_filter" class="dataTables_filter">
	<label><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
	<input type="text" id="keyWord" name="keyWord" class="form-control" placeholder="일감을 검색하세요" aria-controls="DataTables_Table_0">
	<input type="hidden" name="pjtNo" value="${project.pjtNo}" >
	</label>
	</div></div></div>
	<div class="row">
		<div class="col-sm-12" style="height: 750px;">
			<table class="multi-table table table-hover dataTable"
				id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
				<thead>
					<tr role="row">
						<th tabindex="0">유형</th>
						<th tabindex="0">일감</th>
						<th tabindex="0">진행상태</th>
						<th tabindex="0">진척도</th>
						<th tabindex="0">중요도</th>
						<th class="text-center" tabindex="0">담당자</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
		
	</div>
			<div class="row" style="position: absolute; bottom: 3%; width: 100%;">
				<div class="col-sm-12 col-md-4">
<!-- 					<div class="dataTables_info" id="style-2_info" role="status" -->
<!-- 						aria-live="polite"></div> -->
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="paginating-container pagination-default">
						<ul class="pagination">
							<li class="prev"><a href="javascript:void(0);">Prev</a></li>
							
							<!-- 
							<c:forEach var="pNo" begin="${list.startPage}"
 								end="${list.endPage}" step="1"> --%> --%>
								<li
 									class="<c:if test='${list.currentPage eq pNo}'>active</c:if>"><a 
									href="/project/todo.do?currentPage=${pNo}&keyWord=${param.keyWord}&pjtNo=${project.pjtNo}"
									aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a></li>
							</c:forEach>
							 -->
							
							
							<li class="next"><a href="javascript:void(0);">Next</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script src="/resources/assets/js/jsa/todo.js"></script>
<script src="/resources/plugins/table/datatable/datatables.js"></script>                                
<script>
var pjtNo = "<c:out value='${project.pjtNo}' />";
var keyword = "<c:out value='${param.keyword}' />";

    $(document).ready(function() {
    	flag = 1;	
    	getAllTds(flag, pjtNo); //모든 일감 가져오기
    	
    	//진행상태 드롭다운 선택시
    	$("#stts").change(function() {
    	     $("#stts option:selected").each(function() {
   	              var stts = $("#stts").val();
   	              if(stts == 'reset'){
   	            	  flag = 1;
   	            	  getAllTds(flag,pjtNo);
   	              }
   	              if(stts == 'TT04'){ //완료 선택 시 완료일감보기와 같다
   	            	flag = 5;
   	    			var finish = true;
   	    			getAllTds(flag, pjtNo, mbrId, 1, keyword, finish);
   	              }
    	          console.log("상태선택:", stts);
    	          flag = 6;
    	          getAllTds(flag, pjtNo, mbrId, 1, keyword, null, stts);
    	     });
    	});
    	
    	//중요도 드롭다운 선택시
    	$("#impr").change(function() {
    	     $("#impr option:selected").each(function() {
   	              var impr = $("#impr").val();
   	              if(impr == 'reset'){
   	            	  flag = 1;
   	            	  getAllTds(flag,pjtNo);
   	              }
   	              console.log("중요도선택:",impr)
    	          flag = 7;
    	          getAllTds(flag, pjtNo, mbrId, 1, keyword, null, stts, impr);
    	     });
    	});
    	
    	//검색기능
   	   $(document).on("keyup", "#keyWord", function() {
   		      var keyword = $(this).val();
   		      
   		   if (window.event.keyCode == 13) {
   		      console.log(keyword);
   		      flag = 4;
   		      currentPage = 1;
   		      getAllTds(flag, pjtNo, mbrId, currentPage, keyword);
          }
	   })
 

        $('table.multi-table').DataTable({
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "일감을 검색하세요",
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
        

    	//내 일감보기 체크버튼
        function myTodo(e){
        	if(e.checked){
        		var mbrId = "<c:out value='${member.mbrId}' />";
        		flag = 2;
        		getAllTds(flag, pjtNo, mbrId); //내 아이디도 추가로 파람 넘겨주기
        	}else{
        		flag = 1;
        		getAllTds(flag, pjtNo);
        	}
        }
		//완료일감 보기
    	function getFinish(e){
    		if(e.checked){
    			flag = 5;
    			var finish = true;
    			getAllTds(flag, pjtNo, mbrId, 1, keyword, finish);
    		}else{
        		flag = 1;
        		getAllTds(flag, pjtNo);
        	}
    	}
    	

    	
</script>                                
                                
                                
                                