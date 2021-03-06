<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">    
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/components/timeline/custom-timeline.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/drag-and-drop/dragula/dragula.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/drag-and-drop/dragula/example.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/jsa/approvedUser.css" rel="stylesheet" type="text/css" class="structure">
<!-- <link href="/resources/assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<script src="/resources/assets/js/jsa/pjtApplicant.js"></script>
<style>
#memberList {
    position: relative;
	right: -555px;
/*     top: -84px; */
    overflow: auto;

}
.applyDiv {
	position : relative;
	top: -3px;
	background-color: #fff;
    border-radius: 16px;
    border: 1px solid #e0e6ed;
	height : 200px;
	margin-bottom: 10px;
	padding : 10px;
}
.labelDiv {
	position : relative;
	top: -18px;
	background-color: #fff;
    border-radius: 16px;
    border: 1px solid #e0e6ed;
	width: 430px;
    height: 105px;
	margin-bottom: 10px;
	padding : 10px;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-between;	
	
}
.label1 {
	 text-align: left; 
	 width:200px; 
	 height: 90%; 
	 position: relative; 
	 right: -16px;"
}
.label2 {
	text-align: left; 
	width:200px; 
	height: 90%; 
	position: relative; 
	right: -12px;	
}

.cnDiv {
	font-size: 16px;
    color: #515365;
    font-weight: 400;
    padding-left: 65px;

}
.nameSpan {
	position : relative;
    top: -54px;
    right: -65px;
    font-size: 21px;
    font-weight: 600;
    color : #515365;

}

.selfImg {
	box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);
	border-radius: 50%;
	width : 55px;
	height : 55px;
	
	
}
.buttonsDiv {
	position : relative;
	top: -3px;
	text-align: right;
	}

.aplList {
	font-size: 15px;
    font-weight: 600;
    color: #515365;
    text-align: center;
}
.aplPjt {
	font-size: 15px;
    font-weight: 600;
    color: #515365;
	padding-left : 50px;
}

</style>
<script>

var mbrId = "<c:out value='${member.mbrId}' />";
$(function(){
	//console.log("?????????:", mbrId);
	getAllApplicant(mbrId); //?????? ????????? ??????????????? ????????? ????????? ??????
	
	
})
</script>
	<div class="layout-px-spacing" style="margin-top:50px; padding:10px;">    
<div class="">
    <div class="widget-header">
        <div class="row">
            <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                <h4></h4>
            </div>           
        </div>
    </div>
    <div class="widget-content widget-content-area" style="width :1200px;">
		<div class="full-search search-form-overlay input-focused">
             <div class="form-inline form-inline search mt-lg-0">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             </div>
         </div>
        <div class="parent ex-1">
            <div class="row" style="width:95%; position: relative; left:40px;">
                <div class="col-sm-6">
                <h5>?????? ????????????</h5>
					<table class="table">
                      <thead>
	                          <tr>
	                              <th style="padding-left:56px;"><div class="th-content">??????</div></th>
	                              <th style="padding-left:2px;"><div class="th-content">??????</div></th>
	                              <th><div class="th-content th-heading">???????????????</div></th>
	                              <th><div class="th-content" style="position: relative; right: 19px;">?????????</div></th>
	                          </tr>
	                      </thead>
	                  </table>
                    <div id="left-datas" class="dragula" style="padding-left:0px;">
                    </div>
                </div>
                <div class="col-sm-6">
                <h5>?????? ??????</h5>
                <table class="table">
                      <thead>
	                          <tr><th><div class="th-content" style="position: relative; right: 102px;">???????????? ??????</div></th>
	                              <th><div class="th-content"></div></th>
	                              <th><div class="th-content"></div></th>
	                              <th><div class="th-content"></div></th>
	                              <th><div class="th-content"></div></th>
	                          </tr>
                      </thead>
	             </table>
	             <div class="applyInfo">
<!-- 		             <div class="applyDiv"> -->
<!-- 		             </div> -->
<!-- 	             	 <div class="buttonsDiv"> -->
<!-- 	                  <button class="btn btn-outline-danger mb-2">??????</button>&nbsp;&nbsp; -->
<!-- 	                  <button class="btn btn-outline-success mb-2">??????</button> -->
<!-- 	                </div> -->
	             </div>
                </div>
                <div id="memberList" class="col-sm-6 member">
                <h5 id="pjtHeader">???????????? ?????????</h5>
                <table class="table">
                      <thead>
	                          <tr>
	                              <th><div class="th-content" style="padding-left:59px;position: relative; right: 18px;">??????</div></th>
	                              <th><div class="th-content" style="position: relative; right: 60px;">??????</div></th>
	                              <th><div class="th-content th-heading" style="position: relative; right: 79px;">????????????</div></th>
	                              <th><div class="th-content" style="position: relative; right: 71px;">??????</div></th>
	                          </tr>
	                      </thead>
	             </table>
                    <div style="margin-left:0px;" id="right-defaults" class="dragula">
                    </div>
                  
                </div>
            </div>
        </div>

    </div>
</div>
</div>



<!-- ?????? ?????? ?????? ?????? -->
<div class="modal fade show" id="deny" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle"
	style="display: none; padding-right: 17px;" aria-modal="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">?????? ??????</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
						width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round" class="feather feather-x">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</button>
			</div>
			<div class="modal-body" style="height: atuo;">
				<textarea class="form-control" rows="4" id="denyContent"
					style="width: 420px; margin: auto;" placeholder="??????????????? ???????????????"></textarea>
				<br>
				<div
					style="height: 50px; margin-left: 120px; width: 330px; text-align: right;">
					<button type="button" onclick="deny()" data-dismiss="modal"
						class="btn btn-outline-primary mb-2">??????</button>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- ?????? ?????? ?????? ??? -->

<!-- ?????? ?????? ?????? -->
<div class="modal fade show" id="accept" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle"
	style="display: none; padding-right: 17px;" aria-modal="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">?????? ??????</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
						width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round" class="feather feather-x">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</button>
			</div>
			<div class="modal-body" style="height: auto; text-align: center;">
				<p style="font-size: 16px; color: #3b3f5c;" >??????????????? ????????? ??????????????????.</p>
				<br /><br />
				<div class="btn-group mb-4 mr-2">
				<div class="labelDiv">
				<div class="label1">
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Unified Archtecture">
                  <span class="new-control-indicator"></span><span class="new-radio-content">UI Archtecture</span>
                </label>
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Application Architect">
                  <span class="new-control-indicator"></span><span class="new-radio-content">Application Architect</span>
                </label>
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Technical Architect">
                  <span class="new-control-indicator"></span><span class="new-radio-content">Technical Architect</span>
                </label>
                </div>
                <div class="label2">
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Data Architect">
                  <span class="new-control-indicator"></span><span class="new-radio-content">Data Architect</span>
                </label>
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Business Architect">
                  <span class="new-control-indicator"></span><span class="new-radio-content">Business Architect</span>
                </label>
				<label class="new-control new-radio new-radio-text radio-dark">
                  <input type="radio" class="new-control-input" name="custom-radio-5" value="Quality Assurance">
                  <span class="new-control-indicator"></span><span class="new-radio-content">Quality Assurance</span>
                </label>
                </div>
				</div>
				</div>
				<br>
				<div
					style="height: 50px; margin-left: 120px; width: 330px; text-align: right;">
					<button type="button" onclick="becomePrtpnt()" data-dismiss="modal"
						class="btn btn-outline-primary mb-2">??????</button>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- ?????? ?????? ??? -->






<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/resources/plugins/drag-and-drop/dragula/dragula.min.js"></script>
<script src="/resources/plugins/drag-and-drop/dragula/custom-dragula2-apply.js"></script>
