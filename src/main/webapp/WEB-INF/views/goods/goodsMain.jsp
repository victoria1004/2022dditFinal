<%@page import="kr.or.ddit.user.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/assets/css/elements/custom-pagination.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css">

<link href="/resources/assets/css/elements/search.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/noUiSlider/nouislider.min.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/noUiSlider/custom-nouiSlider.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<style>
.modalLabel{
	width: 50%;
}
.per{
	width: 49%;
	display: inline-block;
}
.votePlus{
	width: 45px;
	padding: 7px 10px;
}
.voteMinus{
	width: 45px;
	padding: 7px 10px;
}
.Voteform-control{
	width: 30%;
}

.table > thead > tr > th{
	font-size: 1.2em;
}

.table > tbody > tr > td{
	font-size: 1.2em;
}
.disabled{
	pointer-events: none;
}
</style>

<script>
$(function(){
	var gdsNo = 0;
	$(".bootstrap-touchspin-up").on("click", function(){
		var num = parseInt($("#demo_vertical").val()) + 1;
		$("#demo_vertical").val(num);
	})
	$(".bootstrap-touchspin-down").on("click", function(){
		if(parseInt($("#demo_vertical").val()) == 1){
			return;
		}
		var num = parseInt($("#demo_vertical").val()) - 1;
		$("#demo_vertical").val(num);
	})
	
	$(".modalClick").on("click", function(e){
		gdsCnt = $(this).parents("tr").find("input[name=gdsCnt]").val();
		$("input[name=gdsNoModal]").val($(this).parents("tr").find("input[name=gdsNo]").val())
		$("input[name=gdsName]").val($(this).parents("tr").find("td:eq(1)").text())
	})
	
	$("#rentBtn").on("click", function(){
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})
		if(parseInt($('#demo_vertical').val()) <= parseInt(gdsCnt)){
			swalWithBootstrapButtons({
				title : '????????? ?????????????????????????', 
				text : "",
				type : 'warning',
				showCancelButton : true,
				confirmButtonText : 'OK',
				cancelButtonText : 'Cancel',
				reverseButtons : true,
				padding : '2em'
			}).then(function(result) {
				if (result.value) {
					swalWithBootstrapButtons('?????????????????????.', '', 'success').then(function(result){
						$('form[name=rentGoods]').submit();
					})
	
				} else if (
				// Read more about handling dismissals
				result.dismiss === swal.DismissReason.cancel) {
					swalWithBootstrapButtons('????????? ?????????????????????', '', 'error')
				}
			})
		} else {
			swalWithBootstrapButtons('????????? ???????????????.', '', 'error').then(function(result){
				location.href="/gds/gdsList.do"; 
			})
		}
	})
	
})
</script>
<div class="adminDiv">  
          <div class="widget-content widget-content-area" style="width:100%; height: auto; position:relative; top:-55px; left:-45px; padding: 40px;">
		    <div class="col-lg-8 col-md-6 col-sm-9 filtered-list-search" style="margin-bottom: 20px; margin-left: 50%;">
                 <form class="form-inline my-2 my-lg-0 justify-content-center" action="/gds/gdsList.do">
                     <div class="w-50">
                         <input type="text" name="keyWord" class="w-100 form-control product-search br-30" id="input-search" placeholder="??????...">
                     </div> 
                 </form>
             </div>
		        <div class="table-responsive">
		            <table class="table table-bordered table-hover mb-4">
		                <thead>
		                    <tr>
		                        <th style="width: 100px;">??????</th>
		                        <th>?????????</th>
		                        <th style="width: 150px;">?????? ??????</th>
		                        <th class="text-center" style="width: 180px;">????????????</th>
		                        <th style="width: 180px;">????????????</th>
		                    </tr>
		                </thead>
		                <tbody>
			                <c:forEach var="GdsMngVO" items="${list.content}">
			                    <tr>
			                        <td class="text-center"><input type="hidden" name="gdsNo" value="${GdsMngVO.gdsNo }">${GdsMngVO.rnum }</td>
			                        <td class="text-center">${GdsMngVO.gdsNm }</td>
			                        <td class="text-center"><input type="hidden" name="gdsCnt" value="${GdsMngVO.gdsStock - GdsMngVO.rntCnt}">${GdsMngVO.gdsStock - GdsMngVO.rntCnt} / ${GdsMngVO.gdsStock }</td>
			                        <td class="text-center">
		                        		<c:choose>
		                        		<c:when test="${GdsMngVO.gdsStock - GdsMngVO.rntCnt == 0}">
				                        	<span class="text-danger">
				                        		?????? ??????
				                        	</span>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<span style="color: #29347a;">
				                        		?????? ??????
				                        	</span>
		                        		</c:otherwise>
		                        		</c:choose>
			                        </td>
			                        <c:choose>
			                        	<c:when test="${GdsMngVO.gdsStock - GdsMngVO.rntCnt == 0}">
				                        	<td class="text-center" style="padding: 7px;"><button class="btn btn-outline-primary modalClick" data-toggle="modal" data-target="#rentModalCenter" disabled>????????????</button></td>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<td class="text-center" style="padding: 7px;"><button class="btn btn-outline-primary modalClick" data-toggle="modal" data-target="#rentModalCenter">??????</button></td>
		                        		</c:otherwise>
			                        </c:choose>
			                    </tr>
			                </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    <div class="row" style="position: absolute; bottom: 10px; width: 100%;"><div class="col-sm-12 col-md-5">
	            </div>
	            <div class="col-sm-12 col-md-7"><div class="paginating-container pagination-default">
				    <ul class="pagination">
				        <li class="prev <c:if test='${list.startPage<6}'>disabled</c:if>"><a href="/gds/gdsList.do?currentPage=${list.startPage-5}&keyWord=${param.keyWord}">&lt;</a></li>
				        <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
				        	<li class="<c:if test='${list.currentPage eq pNo}'>active</c:if>"><a href="/gds/gdsList.do?currentPage=${pNo}&keyWord=${param.keyWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a></li>
				        </c:forEach>
				        <li class="next <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if>"><a href="/gds/gdsList.do?currentPage=${list.startPage+5}&keyWord=${param.keyWord}">&gt;</a></li>
				    </ul>
			</div></div></div>
		    </div></div>

<!-- ?????? ?????? -->
<div class="modal fade" id="rentModalCenter" tabindex="-1" role="dialog" aria-labelledby="rentModalCenterTitle" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rentModalCenterTitle">????????????</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
            	<form name="rentGoods" action="/gds/rentGoods" method="post">
	            	<input type="hidden" name="gdsNoModal">
	            	<label class="modalLabel">?????????</label><input class="form-control" name="gdsName" type="text" value="" disabled/>
	            	<label class="modalLabel">?????? ??????</label><label class="modalLabel">????????????</label>
	            	<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected per" style="margin-right: 5px;"><input id="demo_vertical" value="1" type="text" value="" name="demo_vertical" class="form-control" style="width: 86%;"><span class="input-group-btn-vertical" style="position: static;"><button class="btn btn-classic btn-outline-info bootstrap-touchspin-up " type="button">+</button><button class="btn btn-classic btn-outline-danger bootstrap-touchspin-down " type="button">-</button></span></div>
	            	<input class="form-control per" type="text" name="mbrId" value="<%=((MemberVO)session.getAttribute("member")).getMbrNm()%>" disabled />
	            	<label class="modalLabel">????????????</label><input id="basicFlatpickr" name="rtnPrnmntDt" class="form-control flatpickr flatpickr-input" type="text" placeholder="Select Date.." readonly="readonly" />
            	</form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> ??????</button>
                <button type="button" class="btn btn-primary" id="rentBtn">??????</button>
            </div>
        </div>
    </div>
</div>
<!-- ?????? ??? -->
<script src="/resources/plugins/bootstrap-touchspin/custom-bootstrap-touchspin.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/flatpickr/flatpickr.js"></script>
<script src="/resources/plugins/noUiSlider/nouislider.min.js"></script>
<script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
<script>
	var f1 = flatpickr(document.getElementById('basicFlatpickr'));
	//?????? ?????? ?????? ?????? ??????
    $(".flatpickr-input").flatpickr({
       minDate:"today",
       maxDate:new Date().fp_incr(30)
    });
</script>


