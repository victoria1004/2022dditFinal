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

.disabled{
	pointer-events: none;
}
</style>

<script>
$(function(){
	
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
	
	$(".modalClick").on("click", function(){
		$("input[name=gdsNoModal]").val($(this).parents("tr").find("input[name=gdsNo]").val())
		$.ajax({
			url: "/gds/rentUserTb",
			data: {"gdsNo" : $("input[name=gdsNoModal]").val()},
			type: "post",
			success: function(res){
				str = "";
				$.each(res, function(i, v){
					str += "<tr><td class='text-center'>" + v.rntNo + "</td>";
					str += "<td class='text-center'>" + v.mbrNm + "(" + v.mbrId + ")</td>";
					str += "<td class='text-center'>" + v.rntCnt + "</td>";
					str += "<td class='text-center'>" + v.rntDt + "</td>";
					str += "<td class='text-center'><button class='btn btn-secondary rtn'>??????</button></td></tr>";
				})
				$("#rentUserTb tbody").html(str);
			}
		})
	})
	
	$(document).on("click", ".rtn", function(e){
		
		
// 		var rntNo = $(this).closest("tr").children().first().val();
		var rntNo = e.target.parentElement.parentElement.firstChild.innerHTML;
		console.log(">>>>>>" + rntNo)
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})

		swalWithBootstrapButtons({
			title : '????????? ???????????? ???????????????????',
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
					if(result.value){
						$.ajax({
							url: "/gds/rtnUser",
							data: {"rntNo": rntNo},
							type : "post",
							success: function(){
								$(this).parents("tr").children().eq(4).html("<span class='text-success'>?????? ??????</span>")
								window.location.href="/gds/goodsAdmin.do";
							}
						})
						
					}
				});

			} else if (
			// Read more about handling dismissals
			result.dismiss === swal.DismissReason.cancel) {
				swalWithBootstrapButtons('????????? ?????????????????????', '', 'error')
			}
		})
	})
	
	
	$("#rentBtn").on("click", function(){
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})

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
					$('form[name=regForm]').submit();
				})

			} else if (
			// Read more about handling dismissals
			result.dismiss === swal.DismissReason.cancel) {
				swalWithBootstrapButtons('????????? ?????????????????????', '', 'error')
			}
		})
	})
	
	$(document).on("click", ".deleteGoods", function(e){
		var gdsNo = $(this).parents("tr").find("input[name=gdsNo]").val();
		const swalWithBootstrapButtons = swal.mixin({
			confirmButtonClass : 'btn btn-success btn-rounded',
			cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
			buttonsStyling : false,
		})

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
					$.ajax({
						url: "/gds/goodsDelete",
						data: {"gdsNo": gdsNo},
						type : "post",
						success: function(){
							location.href="/gds/goodsAdmin.do";
						}
					})
				})

			} else if (
			// Read more about handling dismissals
			result.dismiss === swal.DismissReason.cancel) {
				swalWithBootstrapButtons('????????? ?????????????????????', '', 'error')
			}
		})
	})
	
	
})
</script>
<div class="adminDiv">  
          <div class="widget-content widget-content-area" style="width:100%; height: auto; position:relative; top:-55px; left:-45px; padding: 40px;">
		    <div class="col-md-6 col-sm-9 filtered-list-search" style="margin-bottom: 20px; max-width: 100%;">
			    <button type="button" class="btn btn-outline-primary btn-rounded mb-2" data-toggle="modal" data-target="#addTaskModal">
	          	<font><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></font>
	          	</button>
                 <form class="form-inline my-2 my-lg-0 justify-content-center" action="/gds/goodsAdmin.do" style="display: inline-block; float: right; width: 300px">
                     <div class="w-100">
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
		                        <th style="width: 150px;">????????????</th>
		                        <th style="width: 180px;">????????? ??????</th>
		                        <th style="width: 120px;">?????? ??????</th>
		                    </tr>
		                </thead>
		                <tbody>
			                <c:forEach var="GdsMngVO" items="${list.content}">
			                    <tr>
			                        <td class="text-center" ><input type="hidden" name="gdsNo" value="${GdsMngVO.gdsNo }">${GdsMngVO.rnum }</td>
			                        <td class="text-center">${GdsMngVO.gdsNm }</td>
			                        <td class="text-center">${GdsMngVO.gdsStock - GdsMngVO.rntCnt} / ${GdsMngVO.gdsStock }</td>
                        			<td class="text-center" style="padding: 7px;"><button class="btn btn-outline-primary modalClick" data-toggle="modal" data-target="#rentModalCenter">??????</button></td>
                        			<td class="text-center" style="padding: 0">
	                        			<div class="deleteGoods">
	                                   	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2" ><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
	                                    </div>
                                    </td>
			                    </tr>
			                </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    <div class="row" style="position: absolute; bottom: 10px; width: 100%;"><div class="col-sm-12 col-md-5">
	                    </div>
	                    <div class="col-sm-12 col-md-7"><div class="paginating-container pagination-default">
					    <ul class="pagination">
					        <li class="prev <c:if test='${list.startPage<6}'>disabled</c:if>"><a href="/gds/goodsAdmin.do?currentPage=${list.startPage-5}&keyWord=${param.keyWord}">&lt;</a></li>
					        <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
					        	<li class="<c:if test='${list.currentPage eq pNo}'>active</c:if>"><a href="/gds/goodsAdmin.do?currentPage=${pNo}&keyWord=${param.keyWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0">${pNo}</a></li>
					        </c:forEach>
					        <li class="next <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if>"><a href="/gds/goodsAdmin.do?currentPage=${list.startPage+5}&keyWord=${param.keyWord}">&gt;</a></li>
					    </ul>
			</div></div></div>
		    </div>
		</div>

<!-- ?????? ??????1 -->
<div class="modal fade" id="rentModalCenter" tabindex="-1" role="dialog" aria-labelledby="rentModalCenterTitle" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 600px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rentModalCenterTitle">????????? ??????</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
            <input type="hidden" name="gdsNoModal" value="" />
            	<table id="rentUserTb" class="table table-bordered table-hover mb-4">
            		<thead>
            		<tr>
            			<th>No</th>
            			<th>??????(?????????)</th>
            			<th>????????????</th>
            			<th>?????? ??????</th>
            			<th>??????</th>
            		</tr>
            		</thead>
            		<tbody>
            		</tbody>
            	</table>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> ??????</button>
            </div>
        </div>
    </div>
</div>
<!-- ?????? ???1 -->
<!-- ?????? ??????2 -->
<div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalTitle" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 400px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTaskModalTitle">?????? ??????</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <form name="regForm" action="/gds/gdsRegister" method="post">
            <div class="row no-gutters mb-3" style="margin: 5px 10px;" > 
				<div class="col-lg-12">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 80px;">?????????</span>
						</div>
						<input type="text" class="form-control text-center" name="goodsNm" >
					</div>
				</div>
			</div>
			<div class="row no-gutters mb-3" style="margin: 5px 10px;" >
				<div class="col-lg-12">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 80px;">??????</span>
						</div>
						<input type="text" class="form-control text-center" name="goodsStock" >
					</div>
				</div>
			</div>
			</form>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> ??????</button>
                <button type="button" class="btn btn-primary" id="rentBtn">??????</button>
            </div>
        </div>
    </div>
</div>
<!-- ?????? ???2 -->
<script src="/resources/plugins/bootstrap-touchspin/custom-bootstrap-touchspin.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/flatpickr/flatpickr.js"></script>
<script src="/resources/plugins/noUiSlider/nouislider.min.js"></script>
<script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
<script>
	var f1 = flatpickr(document.getElementById('basicFlatpickr'))
</script>


