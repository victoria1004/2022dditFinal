<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/noUiSlider/nouislider.min.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/noUiSlider/custom-nouiSlider.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/bootstrap-range-Slider/bootstrap-slider.css" rel="stylesheet" type="text/css">	

<link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" type="text/css" />

<link href="/resources/assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"> 
<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/switches.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link rel="stylesheet" type="text/css" href="/resources/plugins/select2/select2.min.css">
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />


<style>
label {
    font-size: 17px;

}
.bindDiv {
/* width : 90%; */
display: flex;
flex-direction: row;
justify-content: space-around;
/* justify-content:  */
flex-wrap: wrap;
margin-left : 30px;
padding-top:30px;

}
.form-control {
font-size: 17px;

}

.divideDiv {
/* display: inline-block; */
width : 435px;
margin-bottom : 30px;
/* margin-right : 10px; */
/* margin-left : 10px; */


}
</style>
<%
  //줄바꿈
   pageContext.setAttribute("br", "<br/>");
   pageContext.setAttribute("cn", "\n");
%>

	<div class="layout-px-spacing">
	      <!-- CONTENT AREA -->
	      <div class="row layout-top-spacing" style="width:1100px;margin-top:50px;">
	          <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
	          <c:if test="${map != null}">
	         	 <form id="todoVO" name="todoVO" action="/project/updateTodo" method="post">
	          </c:if>
				<c:if test="${map eq null}">
	         	 <form id="todoVO" name="todoVO" action="/project/insertTodo" method="post">
				</c:if>
	              <div class="widget-content-area br-4">
	              			<div class="bindDiv">	  
					                  <div class="divideDiv">
					                  	<label class="p_lab" id="nameLabel" for="tdCtgrCd">유형<span style="color:red;">*</span></label>  &nbsp;&nbsp;
					                  	<select style="height:45px;"  id="tdCtgrCd" name="tdCtgrCd" class="form-control basic select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
					         			  </select>
					                  </div><br />
					                  <div class="divideDiv">
					                  	<label class="p_lab" id="nameLabel" for="tdImprCd">중요도<span style="color:red;">*</span></label>  &nbsp;&nbsp;
					          			 <select style="height:45px;"  id="tdImprCd" name="tdImprCd" class="form-control basic select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                   		 </select>
					                  </div><br>

			             		 </div>
	                  <div class="widget-one" style="margin-left: 10px;">
	                  	<label class="p_lab" id="nameLabel" style="margin-left:30px; margin-top:10px;" >일감 제목<span style="color:red;">*</span></label>  &nbsp;&nbsp;
					       <input style="width:90%; margin-left:33px;" type="text" class="form-control" id="tdTtl" name="tdTtl" maxlength="25" value="${map.TD_TTL}" required="required" >
	                  </div><br>
					       <input type="hidden" class="form-control" id="pjtNo" name="pjtNo" value="${project.pjtNo}" />
					       <input type="hidden" class="form-control" id="tdNo" name="tdNo" value="${map.TD_NO}" />
					       <input type="hidden" class="form-control" id="tdWrtrId" name="tdWrtrId" value="${member.mbrId}" />
	                   <div class="widget-one" style="margin-left: 10px;">
	                  	<label class="p_lab" id="explainLabel" style="margin-left:30px;"  for="pjtExplain">업무 내용</label>  &nbsp;&nbsp;
					       <textarea style="width:90%; margin-left:30px;"  class="form-control" id="tdCn" rows="5" name="tdCn">${fn:replace(map.TD_CN, br, cn)}</textarea>
	                  </div><br><br>
			 	 <div class="bindDiv">
	                   <div class="divideDiv">
	                  	<label class="p_lab" id="explainLabel" for="pjtExplain">업무 기간 설정<span style="color:red;">*</span></label>  &nbsp;&nbsp;
	                  		<div class="form-group mb-0">
	                  			<c:if test="${map eq null}">
                                <input style="height:45px;" name="tdDate" id="rangeCalendarFlatpickr" placeholder="업무 기간을 설정하세요" class="form-control flatpickr flatpickr-input" type="text" required="required" readonly="readonly">
	                  			</c:if>
	                  			<c:if test="${map != null}">
                                <input style="height:45px;" name="tdDate" id="rangeCalendarFlatpickr" value="${map.TD_STRT_DT} ~ ${map.TD_END_DT}" class="form-control flatpickr flatpickr-input" type="text" readonly="readonly">
								</c:if>
                            	<input type="hidden" class="form-control" id="tdStrtDt" name="tdStrtDt">
                           	    <input type="hidden" class="form-control" id="tdEndDt" name="tdEndDt">
                            </div>
	                  </div>
	                  	<br>
	                  	  <div class="divideDiv">
	                  	  <label class="p_lab" id="explainLabel" for="tdPicId">담당자 지정<span style="color:red;">*</span></label>  &nbsp;&nbsp;
							<select id="tdPicId" style="height:45px;" name="tdPicId" class="form-control basic select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true" required="required" >
					           </select>
								  </div><br>
							</div>
							<div class="bindDiv">	  
					                  <div class="divideDiv">
					                  	<label class="p_lab" id="nameLabel" for="tdImprCd">진행상태<span style="color:red;">*</span></label>  &nbsp;&nbsp;
					          			 <select style="font-size : 17px;" id="tdStts" name="tdStts" class="form-control basic select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                   		 </select>
					                  </div><br>
					                  <div class="divideDiv">
					                  	<label class="p_lab" id="nameLabel">진척도<span style="color:red;">*</span></label>  &nbsp;&nbsp;
									       <input style="height:45px;" type="number" min="0" max="100" step="5" class="form-control" id="prgrs" name="prgrs" value="${map.PRGRS}">
					                  </div><br>
			             		 </div>
								  <div style="height:50px;">
								  	<div style="position: relative; right:-860px;">
		                           		<button type="button" class="btn btn-outline-primary mb-2" onclick="window.history.back()">취소</button>
		                           		<button type="button" onclick="getTodo('${map.TD_NO}')" class="btn btn-outline-primary mb-2">등록</button>
		                           	</div>	
	                             </div>
		                          </div>
		                          </form>
						      </div>
						     </div>
						 </div>    
	      <!-- CONTENT AREA -->
    <script src="/resources/plugins/flatpickr/flatpickr.js"></script>
    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <!-- END THEME GLOBAL STYLE -->    
    <script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
<!--     <script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script> -->
	<script src="/resources/plugins/tagInput/tags-input.js"></script>
	<script src="/resources/assets/js/jsa/todo.js"></script>
	<script>
	var pjtNo = "<c:out value='${project.pjtNo}' />";
	var mbrId = "<c:out value='${member.mbrId}' />";
	var tdCtgrCd = "<c:out value='${map.TD_CTGR_CD}' />";
	var tdImprCd = "<c:out value='${map.TD_IMPR_CD}' />";
	var tdStts = "<c:out value='${map.TD_STTS}' />";
	var picId = "<c:out value='${map.TD_PIC_ID}' />";
	
	
	$(function(){
		
		var f3 = flatpickr(document.getElementById('rangeCalendarFlatpickr'), {
		    mode: "range"
		});
		
		getTodoCd(tdCtgrCd, tdImprCd, tdStts); //일감 유형, 중요도, 진행상태 목록
		getAllMbr(pjtNo, mbrId, picId); // 프로젝트 구성원
		
		//진척도 숫자 입력 시 
		$("#prgrs").on("keyup", function(){
			var prgrs = $(this).val();
			
			if(prgrs > 100){ //100보다 크면 경고alert 띄우기
				confirm(prgrs);
			}
			
		})
		
		
		
		
	})
	</script>
	<script src="/resources/assets/js/apps/contact.js"></script>
	<script src="/resources/plugins/select2/select2.min.js"></script>
	<script src="/resources/plugins/select2/custom-select2.js"></script>
	<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
	