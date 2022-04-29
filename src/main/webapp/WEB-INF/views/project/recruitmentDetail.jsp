<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>CORK Admin Template - Modals UI Kit</title>
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&amp;display=swap" rel="stylesheet">
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css">
     <link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    
    <!--  END CUSTOM STYLE FILE  -->
	<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" class="structure">
	<link href="/resources/assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
	<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"> 
	<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">

<style>
	.badge{
		padding-bottom:3px;
	}
	.outline-badge-primary{
	width:auto;
	height:30px;
	font-size:1.12em;
	text-align:center;
}
	#thirdTd{
		padding-top:13px;
		padding-bottom:13px;
	}
	.table > tbody > tr > td{
		height:10px;
		font-size:1.0em;
		text-align:center;
		padding:2px;
	}
	.table > tbody > tr > th{
		height:10px;
		font-size:1.5em;
		text-align:center;
		padding:7px;
	}
	.new-control-input{
		margin-top:3px;
	}
	.iconPlus{
		margin-top:11px;
	}
	.form-control{
		width:600px;
	}
	.form-control::-webkit-scrollbar{ 
	display:none;

}
	 .widget-one{
		display:flex;
	} 
	.p_lab{
		font-weight:bold;
		font-size:1.40em;
		width:150px;
		padding:8px;
		text-align:center;
		color:#6c757d;
		margin-left:60px;
	}
	.n-chk{
		padding:8px;
	}
	.new-chk-content{
		margin-left:10px;
		font-size:1.25em;
	}
	#select{
		margin-left:76px;
		font-size:1em;
		margin-bottom:1px;
		color:darkgray;
	}
	
	#tabsModal{
		position:absolute; 
		top:300px;
		left:-200px;
	}
	#keywordModal{
		position:absolute;
		top:450px;
		left:-280px;
	}
	#markerName,#keywordName{
		width:230px;
	}
	#home{
		margin-left:20px;
		height:85px;	
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
	#colorView{
		display:inline-block;
		text-align:center;
		padding-top:5px;
		color:#4d4747;
		font-weight:bold;
	}
	#cvText{
		text-align:center;
		display:inline-block;
		position:absolute;
		left:343px;
		top:100px;
	}
	#cvText2{
		text-align:center;
		display:inline-block;
		position:absolute;
		left:343px;
		top:83px;
	}
	#markerZone{
		height:70px;
		display:flex;
		margin-left:70px;
	}
	
	#marker{
		margin-left:35px;
		padding-top:8px;
		font-weight:bold;
		color:black;
		cursor:pointer;
		font-size:1.2em;
	}
	
	.motion,#motion{
		animation: motion 0.2s linear 0s infinite alternate; margin-top: 0;
		margin-left:35px;
		padding-top:8px;
		font-weight:bold;
		color:black;
		cursor:pointer;
		font-size:1.2em;
		width:auto;
	    padding-left:10px;
	    padding-right:10px;
	    height: 45px; 
		
	}	        
	@keyframes motion {
		0% {margin-top: 0px;}
		100% {margin-top: 10px;}
	}
	
	.feather-minus-circle{
		position:relative;
		bottom:30px;
		left:40px;
	}
	#firstRow,#secondRow,#thirdRow{
		display:flex;
		margin-top:15px;
		margin-left:10px;
	}
	.icon-container{
		margin-left:10px;
	}
	.firstView{
		position:absolute;
		left:355px;
		top:140px;
	}
	.lastView{
		position:absolute;
		left:355px;
		top:120px;
	}
	
	#membering{
		display:flex;
	}
	#mbrCollect{
    width : 330px;
 	height :80px;
 	margin-top : 10px;
 	display: flex;
 	vertical-align: middle;
 	padding-top : 5px;
    background: #ffffff;
    margin-bottom: 8px;
    border-radius: 6px;
    box-shadow: 0px 2px 4px rgb(126 142 177 / 12%);
 }
 	#logoCollect{
 	width :469px;
 	height :80px;
 	margin-top : 10px;
 	display: flex;
 	vertical-align: middle;
 	padding-top : 5px;
    background: #ffffff;
    margin-bottom: 8px;
    border-radius: 6px;
    box-shadow: 0px 2px 4px rgb(126 142 177 / 12%);
 	}
 #imgDiv {
 	padding-top : 20px;
 	margin-right : 5px;
 	padding-left : 5px;
 	
 
 }
 input[disabled], select[disabled], textarea[disabled], input[readonly], select[readonly], textarea[readonly] {
    cursor: not-allowed;
    background-color: #f1f2f3 !important;
    color:black;
}
 .memList {
 	color : black;
 	background-color: #ffffff;
 	box-shadow: 4px 2px 2px #e6e6e6;
	border-radius: 50px;
 	width : 65px;
 	height : 28px;
 	margin-right : 5px;
 	text-align: center;
  	padding-top : 3px; 
  	padding-left : 3px;
 }
 .membered{
 	cursor:pointer;
 	border-radius:2em;
 	width:260px;
 	height:60px;
 	border:2px solid #bfc9d4;
 	margin-left:20px;
 	padding-top:7px;
 	padding-left:20px;
 	display:flex;
 }
 #plusMember,#plusKeyWord{
 	width:100px;
 }
 
 #recruitment{
 	margin-top:8px;
 	margin-left:265px;
 }
 
 #input-search,#logoSearch{
 	width:200px;
 }
 
 #memberZone,#langZone{
 	display:flex;
 	padding-left:10px;
 	margin-left:70px;
 }

 #delIcon{
 	margin-left:15px;
 	margin-bottom:26px;
 	margin-left:80px;
 }
 
 #roleBox{
 	margin-left:45px;
 	width:15px;
 }
 

 #memberTable{
 	width:60%;
 	font-weight:bold;
 	text-align:center;
 	margin-left:85px;
 }
 #roleContent{
 	padding-left:25px;
 	text-align:center;
 }
#reRole{
	display:inline-block;
}
#exampleModalCenter{
	width:375px;
	position:absolute;
	top:80px;
	left:300px;
	height:auto;
}

.mr-3{
	width:180px;
	vertical-align:middle;
}
.media-body{
	padding-top:15px;
	width:100px;
	height:50px;
}
#logoBtn{
	margin-top:15px;
}
#bottom{
	margin-right:20px;
}
</style>
	

<script>
var pjtNo =${pjtNo};

	function f_show(e){
		if(e.checked){//체크를 누르면
			$('.issue').css('display', 'block');
		}else{
			$('.issue').css('display', 'none');
		}
		
	}
	
	
	$(function(){
		$.ajax({
			url:"/project/rcrtMem.do",
			type:"post",
			async:false,
			data:{
				pjtNo:pjtNo
			},
			dataType:"json",
			success:function(res){
				console.log("team",res);
				var team=[];
				var datas = {};
				
				for(var i=0;i<res.length;i++){
					team.push(res[i].mbrId);
				}
				datas.team = team;
				
				 $.ajax({
					url:"/project/rcrtTeamInfo.do",
					type:"post",
					contentType: 'application/json; charset=utf-8',
					data:JSON.stringify(datas),
					dataType:"json",
					success:function(result){
						str="";
						console.log("member", result);
							for(var i=0;i<result.length;i++){
								str+="<tr>";
		        				str+="<td id='td_name'>"+result[i].mbrNm+"<input type='hidden' name='mbrId' value='"+res[i].mbrId+"'></td>";
		        				str+="<td>"+result[i].mbrDept+"</td>";   
		        				str+="<td id='thirdTd'><div id='roleContent'><span class='badge badge-pills outline-badge-primary'>"+res[i].pjtPrtpntRl+"</span></div></td>";   
		        				str+="</tr>";
						}
							
						$("#tb_body").append(str);
					}
				}) 
				
			}
		
		})
	
	
		$.ajax({
			url:"/project/rcrtKeyword.do",
			type:"post",
			async:false,
			data:{
				pjtNo:pjtNo
			},
			dataType:"json",
			success:function(res){
				str="";
				console.log(document.querySelector('#keywordZone'));
				console.log('length',res.length);
				for(var i=0;i<res.length;i++){
					str+='<span class="badge badge-pills outline-badge-primary" style="margin-left:10px;">'+res[i].kwdNm+'</span>'
				}
	    		$('#keywordZone').append(str);
	    			
			}
		})
	
		$.ajax({
	    url: "/project/rcrtLang.do",
	    type: "post",
	    async: false,
	    data:{
			pjtNo:pjtNo
		},
	    dataType: "json",
	    success: function (result) {
	    	  str="";
	    	  for(var i=0; i<result.length;i++){
	   		   str+='<span onclick="badgeMotion(this)" id="" class="badge badge-pills outline-badge-primary" style="margin-left:10px; cursor:pointer;">'+result[i]+'<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="red" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle" display="none" onclick="fn_remove(this)"><circle cx="12" cy="12" r="10"></circle><line x1="8" y1="12" x2="16" y2="12"></line></svg></span>'
	   	   }
	   	   $('#langZone').html(str);
	    
	    	}
		})
	
	
	//이미 신청한 프로젝트인지, 이미 구성원인지 확인
	$.ajax({
	    url: "/project/checkApply.do",
	    type: "post",
	    async: false,
	    data:{
			pjtNo:pjtNo
		},
		dataType:"text",
	    success: function (result) {
	    	str='';
	    	console.log('answer',result);
	    	
	    	 if(result=='yes'){
	    		 str+='<div style="float:right">';
            	 str+='<a href="/project/recruitment.do"><button type="button" class="btn btn-outline-primary mb-2">뒤로</button></a>&nbsp;';
               	 str+='<a id="checkApply"></a>';
               	 str+='<button type="button" data-toggle="modal" data-target="#apply" class="btn btn-outline-primary mb-2">신청</button>';	
                 str+='</div>'; 		
	    	 }else{
	    		 str+='<div style="margin-top:20px; float:right; margin-right:30px; font-size:1.12em;">이미 신청한 프로젝트이거나 이미 구성원 상태 입니다</div>';
	    	 }
	    		 $('#bottom').html(str);
	    	},
	    	error:function(){
	    	}
		})
	})
</script>
</head>
	<div class="layout-px-spacing">
		<div class="leftDiv">
	      <!-- CONTENT AREA -->
			
	      <div class="row layout-top-spacing">
	          <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
	              <div class="widget-content-area br-4">
	              	<br><br>
	                  <div class="widget-one">
	                  	<label class="p_lab" id="nameLabel">프로젝트명</label>  &nbsp;&nbsp;
					       <input type="text" class="form-control" id="pjtName" name="pjtNm" value="${projectVO.pjtNm}" disabled>
	                  </div><br>
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="layoutLabel" for="pjtLayout">개요</label>  &nbsp;&nbsp;
					       <input type="text" class="form-control" id="pjtLayout" name="pjtOl" value="${projectVO.pjtOl}" disabled>
	                  </div><br>
	                  
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="explainLabel" for="pjtExplain">상세설명</label>  &nbsp;&nbsp;
					       <textarea class="form-control" id="pjtExplain" rows="5" name="pjtExpl" disabled>${projectVO.pjtExpl}</textarea>
	                  </div><br><br>
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="explainLabel" for="pjtExplain">프로젝트 기간</label>  &nbsp;&nbsp;
	                  
	                  		<div class="form-group mb-0">
                               <input type="text" name="pjtStrtYmd" class="form-control" id="pjtStrtYmd" value="${projectVO.pjtStrtYmd}~${projectVO.pjtEndYmd}" disabled>
                            </div>
	                  	
	                  	
	                  </div><br><br>
	            
	               <div class="widget-one">
	                  	<label class="p_lab" id="nameLabel">프로젝트 멤버</label>  &nbsp;&nbsp;
	               </div>
	               <div id="memberZone">
	               	<div class="table-responsive" id="memberTable">
                          <table class="table table-bordered table-hover mb-4">
                              <thead>
                                  <tr>
                                      <th id="nameArea">이름</th>
                                      <th>소속</th>
                                      <th class="text-center" id="roleArea">역할</th>
                                  </tr>
                              </thead>
                              <tbody id="tb_body">
                              
                              </tbody>
                          </table>
                    </div>
	              </div>
                                 <br>
                                 <div id='bottomZone' style="display:flex;">                      
		                                 <div class="lang">
			                                 <div class="widget-one" style="height:50px;">
							                  	<label class="p_lab">개발 언어</label>  &nbsp;&nbsp;
										 	</div>
										 	 
										  </div>
											
													<div class="widget-one" style="height:50px;">
													  <label class="p_lab" style="margin-left:200px;">키워드</label>  &nbsp;&nbsp;
												    </div>
												    
								</div>
										
										<div id="langZone" style="display:inline-block;">
										</div>
										<div id="keywordZone" style="padding-left:200px; display:inline-block; width:auto;">
								        </div>
								        <br><br>
								        <div id="bottom" style="height:50px;">
				                           	
			                            </div>
			                            <br><br>
												<div class="modal fade show" id="apply" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none; padding-right: 17px;" aria-modal="true">
			                                        <div class="modal-dialog modal-dialog-centered" role="document">
			                                            <div class="modal-content">
			                                                <div class="modal-header">
			                                                    <h5 class="modal-title" onclick="setting()">${projectVO.pjtNm} 신청서</h5>
			                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                                      <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
			                                                    </button>
			                                                </div>
			                                                <div class="modal-body" style="height:atuo;">
			                                                	 <textarea class="form-control" rows="4" id="applyCon" style="width:420px; margin:auto;" placeholder="이 프로젝트에 왜 참여하고 싶으신가요?"></textarea><br>
															      <div style="height : 50px; margin-left:120px; width : 330px; text-align : right;">
															      <button type="button" onclick="fn_apply()" data-dismiss="modal" class="btn btn-outline-primary mb-2">완료</button>
															      </div>
													                
														    </div>
											             </div>
			                                         </div>
                                              </div>
                                              
								</div>
										 
                              </div>
				      </div>
		</div>
       </div>                        
	      <!-- CONTENT AREA -->
	
    <script>
    function setting(){
    	$('#applyCon').val('차는 뭐니뭐니해도 티코 아닙니까!');
    }
    
    
    
    function fn_apply(){
    	//console.log($('#applyCon').val());
    	var content=$('#applyCon').val();
    	$('#apply').modal('hide');
    	
    	$.ajax({
    		url:"/project/applyInsert.do",
    		data:{
				pjtNo:pjtNo,
				content:content
			},
    		type:"post",
    		success:function(){
    			swal({
    			      title: '신청 완료!',
    			      text: "지원해 주셔서 감사합니다",
    			      type: 'success',
    			      padding: '2em'
    			    }).then(function(result){
    				  	if(result){
    					  	location.href="/project/recruitment.do"; 
    				  	}
	    	})
	    } 
    })
   }
    </script>
    
  	
  	<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="/resources/bootstrap/js/popper.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="/resources/assets/js/app.js"></script>
    <script src="/resources/plugins/flatpickr/flatpickr.js"></script>
    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="/resources/plugins/highlight/highlight.pack.js"></script>
    <script src="/resources/assets/js/custom.js"></script>
    <!-- END THEME GLOBAL STYLE -->    
    <script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
    <script src="/resources/plugins/bootstrap-maxlength/bootstrap-maxlength.js"></script>
    <script src="/resources/plugins/bootstrap-maxlength/custom-bs-maxlength.js"></script>
    <script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="/resources/assets/js/scrollspyNav.js"></script>
	<script src="/resources/plugins/tagInput/tags-input.js"></script>
	<script>
        $(document).ready(function() {
            App.init();
        });
</script>
	<script src="/resources/assets/js/apps/contact.js"></script>
	<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
	
</body>
</html>