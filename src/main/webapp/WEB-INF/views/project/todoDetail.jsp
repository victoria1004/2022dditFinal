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

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
    
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
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />
<link href="/resources/assets/css/components/timeline/custom-timeline.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/components/custom-media_object.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/elements/tooltip.css" rel="stylesheet" type="text/css">



<style>
.br-4 {
	display: flex;
	flex-direction: row;

}
	.form-control{
		background-color: #ebedf2;
		font-size:16px;
		color : #455460;
		width: 80%;
		vertical-align: middle;
		border : 0px;
		
	}
	 .widget-one{
		display:flex;
	} 
	.p_lab{
		font-weight: 550;
    	font-size: 16px;
		width:150px;
		padding:8px;
		text-align:center;
		color:#6c757d;
		position: relative;
    	top: -2px;
	}
	.n-chk{
		padding:8px;
	}
	.new-chk-content{
		margin-left:10px;
	}
	.box{
	  width: 300px;
	  height: 160px;
	  display:inline-block;
	}
	.pallet{
	  width: 295px;
	  height: 250px;
	}
	.colorBox{
		width: 20px;
	    height: 20px;
	    float: left;
	    margin: 1px 1px 0px 0px;
	    cursor: pointer;
	}


.mr-3{
	width:180px;
	vertical-align:middle;
}
.media-body{
/* 	padding-top:15px; */
	width:100px;
	height:50px;
}
.rounded {
	width : 55px;
	height :55px;
    border-radius: 10px;
    box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);

}


.mainDiv {
/* border : 1px solid blue; */
display: flex;
flex-direction: row;
justify-content: space-between;
flex-wrap: wrap;

}
.sm-div {
	padding : 10px;
	width : 49%;
	height : 700px;

}

td {
vertical-align : middle;
height : 40px;
font-size: 17px;


}
.widget-content {
/* border-top : 1px dashed #878787;  */
width:460px;
}
.leafCont {
    width: 460px;
    height: 100px;
    padding: 10px;
    border-radius: 6px;
	background-color: #ebedf2;
	position: relative;
	right: -11px;

}
.profileDiv {
	display: flex; 
	flex-direction: column; 
	position: relative; 
	top: -15px; 
	right: -11px;
}
.userNm {
	margin-top:3px; 
	margin-left:3px; 
	font-size:15px; 
	color: #6c757d;

}
#allCont {
margin-top: 50px; 
width: 100%; 
height: 800px;
display: flex;
flex-direction: column;

}
.btns {
 padding-top:10px;
 width: 1000px; 
 text-align: right;
}
#sepeCont {
display: flex;
flex-direction: row;
position: relative;
    top: -45px;

}
.history {
	font-size: 16px;
    color: #455460;

}
.ps__thumb-y {
	padding: 10px;
    border-radius: 6px;
    background-color: #ebedf2;
    height: 450px;
    overflow: auto;
    position: relative;
    right:-10px;
    top:-37px;

}
.ps__thumb-y::-webkit-scrollbar{ 
	display:none;

}
#todoCont-div {
	overflow: auto;
}
#todoCont-div::-webkit-scrollbar{ 
	display:none;

}

#todoList {
	width: 816px;
	overflow: auto;
	height: 500px;
}
#todoList::-webkit-scrollbar{ 
	display:none;

}
.textZone{
	color : #29347a;
	font-weight: 600;


}



</style>
<script>
var pjtNo = '<c:out value="${project.pjtNo}" />';
var mbrNm = '<c:out value="${member.mbrNm}" />';
//?????? ?????? ????????? 
function leafAdd(){
	var leaf = "";
	$('input:radio').each(function(){
		
		if($(this).prop("checked")){
			leaf = $(this).val();
		}
	})
	
	$(".bd-example-modal-lg").modal("hide");
	
	$('input:radio').each(function(){
		$(this).prop("checked", false); //????????? ???????????? ????????? ????????? ??????
	})
	getLeaf(leaf, pjtNo);
	
}







$(function(){
	
	
	//???????????? ?????????
	$(document).on("click",".n-chk", function(){
		console.log(event.target);
		var findCk = $(event.target).find("input:radio");
		//console.log(findCk);
		if(findCk.prop("checked")){
			findCk.prop("checked", false);
		} else{
			findCk.prop("checked", true);
		}
	})
	
	
	
	
})
</script>

<%
   //?????????
   pageContext.setAttribute("br", "<br/>");
   pageContext.setAttribute("cn", "\n");
%>

	<div class="layout-px-spacing">
	      <!-- CONTENT AREA -->
	<div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing" style="width:83%;">
	<div class="">
		<div id="allCont" class="widget-content-area br-4">
 			<div class="btns" style="z-index:1; position: relative; top: 710px;">
				<button class="btn btn-outline-primary mb-2" onclick="location.href='/project/mkTodo.do?pjtNo=${map.PJT_NO}&tdNo=${map.TD_NO}'">??????</button>
				<c:if test="${map.TD_WRTR_ID eq mbrNm}">
					<button class="btn btn-outline-primary mb-2" onclick="deleteTodo('${map.TD_NO}')">??????</button>
				</c:if>
			</div>
			<div id="sepeCont">
			<div class="todoContent"
				style="width: 49%; padding: 10px; margin-top: 22px;">
				<div class="widget-one">
					<label class="p_lab" for="tdCtgrCd">??????</label> &nbsp;&nbsp; 
					<div class="form-control" id="tdCtgrCd" style=" width:425px;">
						${map.TD_CTGR_CD} #${map.TD_NO}
					</div> 
				</div>
				<br>
				<div class="widget-one">
					<label class="p_lab" for="tdTtl">?????? ??????</label>
					<div class="form-control" style=" width:425px;">
					${map.TD_TTL}
					</div>
				</div>
				<br>
				<div class="widget-one">
					<label class="p_lab" for="tdCn">?????? ??????</label>
					&nbsp;&nbsp;
					<div id="todoCont-div" class="form-control" style=" width:425px; height:250px;">
					${fn:replace(map.TD_CN, cn, br)}
					</div>
				</div>
				<br>
				<br>
				<div class="widget-one">
					<label class="p_lab" for="tdDate">?????? ??????</label> &nbsp;&nbsp;
					<div class="form-group mb-0">
					<div class="form-control" style="position: relative; width:340px;">
					${map.TD_STRT_DT} ~ ${map.TD_END_DT}</div>
					</div>
				</div>
				<br>
				<div class="widget-one"style="position: relative; left: -18px; width: 580px;">
					<label class="p_lab" for="tdWrtrId">?????????</label> &nbsp;&nbsp;
					 <div class="form-control" style="width: 20%; position: relative; left:-12px;" >${map.TD_WRTR_ID}</div>
					<label class="p_lab" for="tdPicId" style="position: relative; left: -40px;" >?????????</label> &nbsp;&nbsp;
					 <div class="form-control" style="width: 20%; position: relative; left: -65px;" >${map.TD_PIC_ID}</div>
				</div>
				<br>
				<div class="widget-one"
					style="position: relative; left: -18px; width: 580px;">
					<label class="p_lab" for="tdImprCd">?????????</label> &nbsp;&nbsp; 
					<div class="form-control" style="width: 20%; position: relative; left:-12px;">
					${map.TD_IMPR_CD}
					</div>	
					<label class="p_lab" style="position: relative; left: -40px;" for="tdStts">????????????</label>
					&nbsp;&nbsp; 
					<div class="form-control" style="width: 20%; position: relative; left: -65px;">
					${map.TD_STTS}
					</div>
				</div>
				<br>
				<div class="widget-one">
					<label class="p_lab" for="prgrs">?????????</label> &nbsp;&nbsp;
					<div class="sorting_1" style="width:425px;">
						<div class="progress" style="height: 30px; border-radius: 6px">
							<div class="progress-bar bg-primary bg-gradient-danger"
								role="progressbar" style="width: ${map.PRGRS}%; border-radius: 6px"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${map.PRGRS}%</div>
						</div>
					</div>
				</div>
				<br>
			</div>
			 <div class="todoContent" style="width: 48%; padding: 10px; margin-top: 10px; position: relative; right: -30px;">
				<div class="widget-one">
				<label class="p_lab" id="leaf" style="position: relative; top: 7px; right: 20px;">?????? ??????</label> &nbsp;&nbsp; 
				 <button class="btn btn-outline-primary mb-2" data-toggle="modal" data-target=".bd-example-modal-lg" style="position: relative; height: 35px; top: 5px; right: -243px;">
				 <c:if test="${leaf != null}">??????</c:if>
				 <c:if test="${leaf eq null}">??????</c:if></button>
				</div>
					<div class="widget-content">
					<ul class="list-unstyled">
				<c:if test="${leaf != null}">
					<div class="leafCont">
					<li class="media" style="margin-top:15px;">
					<div class="profileDiv">
					<img class="rounded" src="/resources/profileImage/<c:if test="${leaf.MBR_IMG eq null}">profileimage.png</c:if><c:if test="${leaf.MBR_IMG != null}">${leaf.MBR_IMG}</c:if>" title="${leaf.TD_PIC_ID}">
					<span class="userNm">${leaf.TD_PIC_ID}</span>
					</div>
					<div class="media-body" style="position: relative; top:-26px; right: 51px;">
					<h5 class="media-heading"><a href="/project/todoDetail.do?pjtNo=${leaf.PJT_NO}&tdNo=${leaf.TD_NO}">#${leaf.TD_NO}</a></h5>
					<h6 style="width:500px;"><a href="/project/todoDetail.do?pjtNo=${leaf.PJT_NO}&tdNo=${leaf.TD_NO}">${leaf.TD_TTL}</a></h6>
					</div></li>
					</div>
					</c:if>
			          </ul>
				</div>
				<br />
				<div class="widget-one">
				<label class="p_lab" id="leaf" style="position: relative; right: 38px; top: -30px;">??????</label> &nbsp;&nbsp; 
				</div>
				<div class="widget-content ps__thumb-y" style="width: 460px;">
					<c:forEach items="${histories}" var="his">
						<div class="" style="position: relative; right: 15px;">
						<ul class="historyList">
							<c:choose>
								<c:when test="${his.COLUMN_NM eq '??????' || his.COLUMN_NM eq '?????????'||his.COLUMN_NM eq '????????????'}">
									<li class="history" style="font-size:15px;">${his.PRTPNT_ID}??????
									 <span class="bs-tooltip" title="${fn:substring(his.CHG_DT,0,19)}">
									 ${fn:substring(his.CHG_DT,5,7)}???  ${fn:substring(his.CHG_DT,8,10)}??????</span> ${his.COLUMN_NM}???(???) <br>
									  <span class="textZone">'${his.BEFORE_NM}'</span>?????? <span class="textZone">'${his.AFTER_NM}'</span>(???)??? ?????????????????????.</li>						
								</c:when>
								<c:when test="${his.COLUMN_NM eq '?????????'}">
									<li class="history" style="font-size:15px;">${his.PRTPNT_ID}?????? 
									 <span class="bs-tooltip" title="${fn:substring(his.CHG_DT,0,19)}">
									 ${fn:substring(his.CHG_DT,5,7)}???  ${fn:substring(his.CHG_DT,8,10)}??????</span> ${his.COLUMN_NM}???(???) <br>
									 <span class="textZone">'${his.BEFORE_MEM}'</span>?????? <span class="textZone">'${his.AFTER_MEM}'</span>(???)??? ?????????????????????.</li>						
								</c:when>
								<c:otherwise>
									<li class="history" style="font-size:15px;">${his.PRTPNT_ID}??????
									 <span class="bs-tooltip" title="${fn:substring(his.CHG_DT,0,19)}">
									 ${fn:substring(his.CHG_DT,5,7)}???  ${fn:substring(his.CHG_DT,8,10)}??????</span> ${his.COLUMN_NM}???(???) <br>
									  <span class="textZone">'${his.BEFORE_CN}'</span>?????? <span class="textZone">'${his.AFTER_CN}'</span>(???)??? ?????????????????????.</li>						
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
					</c:forEach>
				</div>
			 </div>
			 </div>

		</div>
		</div>
	</div>
		</div>
             

             
             
             
	      <!-- CONTENT AREA -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="myExtraLargeModalLabel">?????? ??????</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
            </button>
        </div>
        <div class="modal-body">
        <div>
            <div id="todoList" class="widget-content">
                <div class="table-responsive" style="width:95%;">
                    <table class="table" style="width:100%;">
                        <thead>
                            <tr>
                                <th><div class="th-content"></div></th>
                                <th><div class="th-content">????????????</div></th>
                                <th style="width:400px;"><div class="th-content">??????</div></th>
                                <th><div class="th-content">?????????</div></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${list}" var="map">
                            <tr>
                                <td>
                                	<div class="n-chk">
		                                 <label class="new-control new-radio new-radio-text radio-dark">
		                                   <input type="radio" class="new-control-input" name="custom-radio-5" value="${map.TD_NO}">
		                                   <span class="new-control-indicator"></span>
		                                 </label>
                                  </div>
                                </td>
                                <td style="font-size: 15px;"><div class="td-content">${map.TD_NO}</div></td>
                                <td style="font-size: 15px;"><div class="td-content" style="width:400px;">${fn:substring(map.TD_TTL, 0, 30)}</div></td>
                                <td style="font-size: 15px;"><div class="td-content">${map.TD_PIC_ID}</div></td>
                                <td></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i>??????</button>
            <button type="button" class="btn btn-primary" onclick="leafAdd()">??????</button>
        </div>
    </div>
  </div>
</div>



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

	$(function(){
		
		var f3 = flatpickr(document.getElementById('rangeCalendarFlatpickr'), {
		    mode: "range"
		});
		
		
		
		
		
	})
	</script>
	<script src="/resources/assets/js/apps/contact.js"></script>
<!-- 	<script src="/resources/assets/js/scrollspyNav.js"></script> -->
	<script src="/resources/plugins/select2/select2.min.js"></script>
	<script src="/resources/plugins/select2/custom-select2.js"></script>
<!-- 	<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script> -->
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
	<script src="/resources/assets/js/elements/tooltip.js"></script>