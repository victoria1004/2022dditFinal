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
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="/resources/assets/js/syt.js"></script>
    <link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css">
	<link href="/resources/plugins/flatpickr/flatpickr.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL PLUGINS -->
    
    <!--  END CUSTOM STYLE FILE  -->
	<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" class="structure">
	<link href="/resources/plugins/flatpickr/custom-flatpickr.css" rel="stylesheet" type="text/css">
	<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
	<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"> 
	<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">


<style>
.searchable-items {
       overflow: auto;
      height : 250px; 
   }
    .searchable-items::-webkit-scrollbar{ 
      display:none;
   }
.outline-badge-primary{
	width:auto;
	height:30px;
	font-size:1.12em;
	text-align:center;
}
	#thirdTd{
		padding:10px;
	}
	.table > tbody > tr > td{
		height:10px;
		font-size:1.25em;
		text-align:center;
		padding:2px;
	}
	.table > tbody > tr > th{
		height:10px;
		font-size:1.25em;
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
		font-weight:bold;
		color:black;
		cursor:pointer;
		font-size:1.2em;
		padding-right:10px;
		padding-left:10px;
		padding-top:3px;
	}
	
	.motion,#motion{
		animation: motion 0.2s linear 0s infinite alternate; margin-top: 0;
	}	        
	@keyframes motion {
		0% {margin-top: 0px;}
		100% {margin-top: 10px;}
	}
	
	.feather-minus-circle{
		position:relative;
		bottom:20px;
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
</style>
	


<script>
var pjtNo=${projectVO.pjtNo}
	function f_show(e){
		if(e.checked){//????????? ?????????
			$('.issue').css('display', 'block');
		}else{
			$('.issue').css('display', 'none');
		}
		
	}
	
	$(function(){
		$.ajax({
			url:"/project/getModule.do",
			type:"post",
			async:false,
			data:{
				pjtNo: pjtNo
			},
			success:function(res){
				var layouts = document.querySelectorAll('#lytNo');
				for(var i=0;i<res.length;i++){
					for(var j=0;j<layouts.length;j++){
						if(res[i]==layouts[j].value){
							console.log(res[i],layouts[j].value);
							layouts[j].checked=true;
						}
					}
				}
				
				if(layouts[4].checked){
					$('.issue').css('display','block');
				}
			}
		})
	
	
		$.ajax({
			url:"/project/getMarker.do",
			type:"post",
			async:false,
			data:{
				pjtNo:pjtNo
			},
			success:function(res){
				console.log(res[0]);
				var markerZone=document.getElementById('markerZone');
				marker="";
				for(var i=0;i<res.length;i++){
					marker+="<div id='marker' onclick='addMotion(this)' align='center' style='width:auto; height: 30px; border-radius: 2em; background:"+res[i].mrkrClr+"';>"+res[i].mrkrNm+"<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='red' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-minus-circle' display='none' onclick='fn_remove(this)'><circle cx='12' cy='12' r='10'></circle><line x1='8' y1='12' x2='16' y2='12'></line></svg><svg onclick='iconInsert(this)' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-frown'><circle cx='12' cy='12' r='10'></circle><path d='M16 16s-1.5-2-4-2-4 2-4 2'></path><line x1='9' y1='9' x2='9.01' y2='9'></line><line x1='15' y1='9' x2='15.01' y2='9'></line></svg>"+res[i].mrkrIcn+"</div>";
				}
				markerZone.innerHTML+=marker;
			}
		})
		
		
		$.ajax({
			url:"/project/getKeyword.do",
			type:"post",
			async:false,
			data:{
				pjtNo:pjtNo
			},
			success:function(res){
				str="";
				for(var i=0;i<res.length;i++){
					str+='<span class="badge badge-pills outline-badge-primary" style="margin-left:10px;">'+res[i].kwdNm+'</span>'
				}
				$('#keywordZone').append(str);
			}
		})
		
		
		$.ajax({
			url:"/project/getMem.do",
			type:"post",
			async:false,
			data:{
				pjtNo:pjtNo
			},
			success:function(res){
				console.log("team",res);
				var team=[];
				
				for(var i=0;i<res.length;i++){
					team.push(res[i].mbrId);
				}
				
				 $.ajax({
					url:"/project/getTeamInfo.do",
					type:"post",
					data:{
						team:JSON.stringify(team),
						pjtNo:JSON.stringify(pjtNo)
					},
					dataType:'json',
					success:function(result){
						str="";
						console.log("member", result);
							for(var i=0;i<result.length;i++){
								str+="<tr>";
		        				str+="<td id='td_name'>"+result[i].mbrNm+"<input type='hidden' name='mbrId' value='"+res[i].mbrId+"'></td>";
		        				str+="<td>"+result[i].mbrDept+"</td>";   
		        				str+="<td id='thirdTd'><div id='roleContent'><span class='badge badge-pills outline-badge-primary'>"+res[i].pjtPrtpntRl+"</span><div class='icon-container' id='reRole'><svg onclick='reSelect(this)' xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-edit-2'><path d='M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z'></path></svg></div></div></td>";   
		        				str+="<td><svg onclick='memDel(this)' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trash-2 icon'><polyline points='3 6 5 6 21 6'></polyline><path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path><line x1='10' y1='11' x2='10' y2='17'></line><line x1='14' y1='11' x2='14' y2='17'></line></svg></td>";   
		        				str+="</tr>";
						}
							
						$("#tb_body").append(str);
					}
				}) 
				
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
	          <form id="making" name="making" action="/project/getAll.do" method="post">
	              <div class="widget-content-area br-4">
	              
	              <br><br>
	                  <div class="widget-one">
	                  	<label class="p_lab" id="nameLabel">???????????????</label>  &nbsp;&nbsp;
					       <input type="text" class="form-control" id="pjtName" name="pjtNm" value="${projectVO.pjtNm}">
	                  </div><br>
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="layoutLabel" for="pjtLayout">??????</label>  &nbsp;&nbsp;
					       <input type="text" class="form-control" id="pjtLayout" name="pjtOl" value="${projectVO.pjtOl}">
	                  </div><br>
	                  
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="explainLabel" for="pjtExplain">????????????</label>  &nbsp;&nbsp;
					       <textarea class="form-control" id="pjtExplain" rows="5" name="pjtExpl">${projectVO.pjtExpl}</textarea>
	                  </div><br><br>
	                  
	                   <div class="widget-one">
	                  	<label class="p_lab" id="explainLabel" for="pjtExplain">???????????? ?????? ??????</label>  &nbsp;&nbsp;
	                  
	                  		<div class="form-group mb-0">
                                <input name="pjtStrtYmd" value="hello${projectVO.pjtStrtYmd}${projectVO.pjtEndYmd}" id="rangeCalendarFlatpickr" class="form-control flatpickr flatpickr-input" type="text" placeholder="???????????? ????????? ???????????????" readonly="readonly">
                            </div>
	                  	
	                  </div><br><br>
	            
	            
		               <div class="widget-one">
		            		<label class="p_lab" id="moduleLabel">?????? ?????? ??????</label>  &nbsp;&nbsp;
		            		
							 <div class="n-chk">
							    <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
							      <input type="checkbox" class="new-control-input" id="lytNo" value="L01"  disabled="disabled">
							      <span class="new-control-indicator"></span><span class="new-chk-content">????????????</span>
							    </label>
							</div>
							
							<div class="n-chk">
							    <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
							      <input type="checkbox" class="new-control-input" id="lytNo" value="L02"  disabled="disabled">
							      <span class="new-control-indicator"></span><span class="new-chk-content">??????</span>
							    </label>
							</div>
							
							<div class="n-chk">
							    <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
							      <input type="checkbox" class="new-control-input" id="lytNo" value="L03"  disabled="disabled">
							      <span class="new-control-indicator"></span><span class="new-chk-content">??????</span>
							    </label>
							</div>
							
							<div class="n-chk">
							    <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
							      <input type="checkbox" class="new-control-input" id="lytNo" value="L04"  disabled="disabled">
							      <span class="new-control-indicator"></span><span class="new-chk-content">??????</span>
							    </label>
							</div>
							
							<div class="n-chk">
							    <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
							      <input type="checkbox" class="new-control-input" id="lytNo" value="L05" onclick="f_show(this)"  disabled="disabled">
							      <span class="new-control-indicator"></span><span class="new-chk-content">??????</span>
							    </label>
							</div>
	            	  </div><br>
	            	  
	            	  <div class="issue" style="display:none;">
		            	  <p id="select">?????? ???????????? ????????? ????????? ??????????????????! </p>
		            	  <div class="issueMarker">
			            	  <div class="widget-one">
			                  	<label class="p_lab" id="makerLabel">?????? ??????</label>  &nbsp;&nbsp;
			                  	<div data-toggle="modal" data-target="#tabsModal">
			                  		<svg class="iconPlus" id="plus" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>	
			                  	</div>
			                  </div>
			                   <div id="markerZone">
		            	  	
	            	     	   </div>
		            	  </div>
		            </div>  
	            	    	 <div class="modal fade" id="tabsModal" tabindex="-1" role="dialog" aria-labelledby="tabsModalLabel" style="display: none;" aria-hidden="true">
                                      <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="tabsModalLabel">?????? ?????? ??????</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                              <span aria-hidden="true">??</span>
                                            </button>
                                          </div>
                                          <div class="modal-body">
                                                <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">?????????</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="aaa-tab" data-toggle="tab" href="#aaa" role="tab" aria-controls="aaa" aria-selected="false">??????</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="true">?????????</a>
                                                    </li>
                                                </ul>
                                              <div class="tab-content" id="myTabContent">
                                                  
                                                  <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                                                        	<label class="nameLabel" id="nameLabel">?????? ??????</label>
                                                        	<form id="fm_name">
					     								    	<input type="text" maxlength="5" class="form-control placement-bottom" id="markerName" onchange="fn_naming(this)">
					     								    </form>
					     						  </div>
                                                  <div class="tab-pane fade" id="aaa" role="tabpanel" aria-labelledby="profile-tab">
                                                         <div id="box" class="box">
														      <div id="palletBox" class="pallet">
														      <div id="#FF0000" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 0, 0);"></div>
														      <div id="#FF5E00" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 94, 0);"></div>
														      <div id="#FFBB00" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 187, 0);"></div>
														      <div id="#FFE400" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 228, 0);"></div>
														      <div id="#ABF200" class="colorBox" onclick="colorSet(this)" style="background: rgb(171, 242, 0);"></div>
														      <div id="#1DDB16" class="colorBox" onclick="colorSet(this)" style="background: rgb(29, 219, 22);"></div>
														      <div id="#00D8FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 216, 255);"></div>
														      <div id="#0054FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 84, 255);"></div>
														      <div id="#0100FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(1, 0, 255);"></div>
														      <div id="#5F00FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(95, 0, 255);"></div>
														      <div id="#FF00DD" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 0, 221);"></div>
														      <div id="#FF007F" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 0, 127);"></div>
														      <div id="#000000" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 0, 0);"></div>
														      <div id="#FFFFFF" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 255, 255);"></div>
														      <div id="#FFD8D8" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 216, 216);"></div>
														      <div id="#FAE0D4" class="colorBox" onclick="colorSet(this)" style="background: rgb(250, 224, 212);"></div>
														      <div id="#FAECC5" class="colorBox" onclick="colorSet(this)" style="background: rgb(250, 236, 197);"></div>
														      <div id="#FAF4C0" class="colorBox" onclick="colorSet(this)" style="background: rgb(250, 244, 192);"></div>
														      <div id="#E4F7BA" class="colorBox" onclick="colorSet(this)" style="background: rgb(228, 247, 186);"></div>
														      <div id="#CEFBC9" class="colorBox" onclick="colorSet(this)" style="background: rgb(206, 251, 201);"></div>
														      <div id="#D4F4FA" class="colorBox" onclick="colorSet(this)" style="background: rgb(212, 244, 250);"></div>
														      <div id="#D9E5FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(217, 229, 255);"></div>
														      <div id="#DAD9FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(218, 217, 255);"></div>
														      <div id="#E8D9FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(232, 217, 255);"></div>
														      <div id="#FFD9FA" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 217, 250);"></div>
														      <div id="#FFD9EC" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 217, 236);"></div>
														      <div id="#F6F6F6" class="colorBox" onclick="colorSet(this)" style="background: rgb(246, 246, 246);"></div>
														      <div id="#EAEAEA" class="colorBox" onclick="colorSet(this)" style="background: rgb(234, 234, 234);"></div>
														      <div id="#FFA7A7" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 167, 167);"></div>
														      <div id="#FFC19E" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 193, 158);"></div>
														      <div id="#FFE08C" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 224, 140);"></div>
														      <div id="#FAED7D" class="colorBox" onclick="colorSet(this)" style="background: rgb(250, 237, 125);"></div>
														      <div id="#CEF279" class="colorBox" onclick="colorSet(this)" style="background: rgb(206, 242, 121);"></div>
														      <div id="#B7F0B1" class="colorBox" onclick="colorSet(this)" style="background: rgb(183, 240, 177);"></div>
														      <div id="#B2EBF4" class="colorBox" onclick="colorSet(this)" style="background: rgb(178, 235, 244);"></div>
														      <div id="#B2CCFF" class="colorBox" onclick="colorSet(this)" style="background: rgb(178, 204, 255);"></div>
														      <div id="#B5B2FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(181, 178, 255);"></div>
														      <div id="#D1B2FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(209, 178, 255);"></div>
														      <div id="#FFB2F5" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 178, 245);"></div>
														      <div id="#FFB2D9" class="colorBox" onclick="colorSet(this)" style="background: rgb(255, 178, 217);"></div>
														      <div id="#D5D5D5" class="colorBox" onclick="colorSet(this)" style="background: rgb(213, 213, 213);"></div>
														      <div id="#BDBDBD" class="colorBox" onclick="colorSet(this)" style="background: rgb(189, 189, 189);"></div>
														      <div id="#F15F5F" class="colorBox" onclick="colorSet(this)" style="background: rgb(241, 95, 95);"></div>
														      <div id="#F29661" class="colorBox" onclick="colorSet(this)" style="background: rgb(242, 150, 97);"></div>
														      <div id="#F2CB61" class="colorBox" onclick="colorSet(this)" style="background: rgb(242, 203, 97);"></div>
														      <div id="#E5D85C" class="colorBox" onclick="colorSet(this)" style="background: rgb(229, 216, 92);"></div>
														      <div id="#BCE55C" class="colorBox" onclick="colorSet(this)" style="background: rgb(188, 229, 92);"></div>
														      <div id="#86E57F" class="colorBox" onclick="colorSet(this)" style="background: rgb(134, 229, 127);"></div>
														      <div id="#5CD1E5" class="colorBox" onclick="colorSet(this)" style="background: rgb(92, 209, 229);"></div>
														      <div id="#6799FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(103, 153, 255);"></div>
														      <div id="#6B66FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(107, 102, 255);"></div>
														      <div id="#A566FF" class="colorBox" onclick="colorSet(this)" style="background: rgb(165, 102, 255);"></div>
														      <div id="#F361DC" class="colorBox" onclick="colorSet(this)" style="background: rgb(243, 97, 220);"></div>
														      <div id="#F361A6" class="colorBox" onclick="colorSet(this)" style="background: rgb(243, 97, 166);"></div>
														      <div id="#A6A6A6" class="colorBox" onclick="colorSet(this)" style="background: rgb(166, 166, 166);"></div>
														      <div id="#8C8C8C" class="colorBox" onclick="colorSet(this)" style="background: rgb(140, 140, 140);"></div>
														      <div id="#CC3D3D" class="colorBox" onclick="colorSet(this)" style="background: rgb(204, 61, 61);"></div>
														      <div id="#CC723D" class="colorBox" onclick="colorSet(this)" style="background: rgb(204, 114, 61);"></div>
														      <div id="#CCA63D" class="colorBox" onclick="colorSet(this)" style="background: rgb(204, 166, 61);"></div>
														      <div id="#C4B73B" class="colorBox" onclick="colorSet(this)" style="background: rgb(196, 183, 59);"></div>
														      <div id="#9FC93C" class="colorBox" onclick="colorSet(this)" style="background: rgb(159, 201, 60);"></div>
														      <div id="#47C83E" class="colorBox" onclick="colorSet(this)" style="background: rgb(71, 200, 62);"></div>
														      <div id="#3DB7CC" class="colorBox" onclick="colorSet(this)" style="background: rgb(61, 183, 204);"></div>
														      <div id="#4374D9" class="colorBox" onclick="colorSet(this)" style="background: rgb(67, 116, 217);"></div>
														      <div id="#4641D9" class="colorBox" onclick="colorSet(this)" style="background: rgb(70, 65, 217);"></div>
														      <div id="#8041D9" class="colorBox" onclick="colorSet(this)" style="background: rgb(128, 65, 217);"></div>
														      <div id="#D941C5" class="colorBox" onclick="colorSet(this)" style="background: rgb(217, 65, 197);"></div>
														      <div id="#D9418C" class="colorBox" onclick="colorSet(this)" style="background: rgb(217, 65, 140);"></div>
														      <div id="#747474" class="colorBox" onclick="colorSet(this)" style="background: rgb(116, 116, 116);"></div>
														      <div id="#5D5D5D" class="colorBox" onclick="colorSet(this)" style="background: rgb(93, 93, 93);"></div>
														      <div id="#980000" class="colorBox" onclick="colorSet(this)" style="background: rgb(152, 0, 0);"></div>
														      <div id="#993800" class="colorBox" onclick="colorSet(this)" style="background: rgb(153, 56, 0);"></div>
														      <div id="#997000" class="colorBox" onclick="colorSet(this)" style="background: rgb(153, 112, 0);"></div>
														      <div id="#998A00" class="colorBox" onclick="colorSet(this)" style="background: rgb(153, 138, 0);"></div>
														      <div id="#6B9900" class="colorBox" onclick="colorSet(this)" style="background: rgb(107, 153, 0);"></div>
														      <div id="#2F9D27" class="colorBox" onclick="colorSet(this)" style="background: rgb(47, 157, 39);"></div>
														      <div id="#008299" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 130, 153);"></div>
														      <div id="#003399" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 51, 153);"></div>
														      <div id="#050099" class="colorBox" onclick="colorSet(this)" style="background: rgb(5, 0, 153);"></div>
														      <div id="#3F0099" class="colorBox" onclick="colorSet(this)" style="background: rgb(63, 0, 153);"></div>
														      <div id="#990085" class="colorBox" onclick="colorSet(this)" style="background: rgb(153, 0, 133);"></div>
														      <div id="#99004C" class="colorBox" onclick="colorSet(this)" style="background: rgb(153, 0, 76);"></div>
														      <div id="#4C4C4C" class="colorBox" onclick="colorSet(this)" style="background: rgb(76, 76, 76);"></div>
														      <div id="#353535" class="colorBox" onclick="colorSet(this)" style="background: rgb(53, 53, 53);"></div>
														      <div id="#670000" class="colorBox" onclick="colorSet(this)" style="background: rgb(103, 0, 0);"></div>
														      <div id="#662500" class="colorBox" onclick="colorSet(this)" style="background: rgb(102, 37, 0);"></div>
														      <div id="#664B00" class="colorBox" onclick="colorSet(this)" style="background: rgb(102, 75, 0);"></div>
														      <div id="#665C00" class="colorBox" onclick="colorSet(this)" style="background: rgb(102, 92, 0);"></div>
														      <div id="#476600" class="colorBox" onclick="colorSet(this)" style="background: rgb(71, 102, 0);"></div>
														      <div id="#22741C" class="colorBox" onclick="colorSet(this)" style="background: rgb(34, 116, 28);"></div>
														      <div id="#005766" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 87, 102);"></div>
														      <div id="#002266" class="colorBox" onclick="colorSet(this)" style="background: rgb(0, 34, 102);"></div>
														      <div id="#030066" class="colorBox" onclick="colorSet(this)" style="background: rgb(3, 0, 102);"></div>
														      <div id="#2A0066" class="colorBox" onclick="colorSet(this)" style="background: rgb(42, 0, 102);"></div>
														      <div id="#660058" class="colorBox" onclick="colorSet(this)" style="background: rgb(102, 0, 88);"></div>
														      <div id="#660033" class="colorBox" onclick="colorSet(this)" style="background: rgb(102, 0, 51);"></div>
														      <div id="#212121" class="colorBox" onclick="colorSet(this)" style="background: rgb(33, 33, 33);"></div>
														      <div id="#191919" class="colorBox" onclick="colorSet(this)" style="background: rgb(25, 25, 25);"></div>
														   </div>
														 </div>
															 <div id="cvText"><label>?????? ?????? ????????????</label></div>
															 <div id="colorView" class="firstView" align="center" style="width:100px; height: 30px; border-radius: 2em;"></div>
												  </div>
												  
                                                  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                                  	<div id="firstRow">
	                                                  		<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-help-circle"><circle cx="12" cy="12" r="10"></circle><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-frown"><circle cx="12" cy="12" r="10"></circle><path d="M16 16s-1.5-2-4-2-4 2-4 2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
	                                                        </div>
	                                                        
	                                                        <div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-save"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path><polyline points="17 21 17 13 7 13 7 21"></polyline><polyline points="7 3 7 8 15 8"></polyline></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
	                                                        </div>
	                                                        
	                                                        <div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
	                                                        </div>
                                                    </div>
                                                    
                                                    <div id="secondRow">
	                                                    	<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-database"><ellipse cx="12" cy="5" rx="9" ry="3"></ellipse><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"></path><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"></path></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trello"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><rect x="7" y="7" width="3" height="9"></rect><rect x="14" y="7" width="3" height="5"></rect></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
	                                                        </div>
	                                                        
	                                                        <div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload-cloud"><polyline points="16 16 12 12 8 16"></polyline><line x1="12" y1="12" x2="12" y2="21"></line><path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path><polyline points="16 16 12 12 8 16"></polyline></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download-cloud"><polyline points="8 17 12 21 16 17"></polyline><line x1="12" y1="12" x2="12" y2="21"></line><path d="M20.88 18.09A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.29"></path></svg>
	                                                        </div>
	                                                        
	                                                        <div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2"><circle cx="18" cy="5" r="3"></circle><circle cx="6" cy="12" r="3"></circle><circle cx="18" cy="19" r="3"></circle><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
	                                                        </div>
                                                    </div>
                                                    
                                                    <div id="thirdRow">
	                                                    	<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-repeat"><polyline points="17 1 21 5 17 9"></polyline><path d="M3 11V9a4 4 0 0 1 4-4h14"></path><polyline points="7 23 3 19 7 15"></polyline><path d="M21 13v2a4 4 0 0 1-4 4H3"></path></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye-off"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-flag"><path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1z"></path><line x1="4" y1="22" x2="4" y2="15"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minimize"><path d="M8 3v3a2 2 0 0 1-2 2H3m18 0h-3a2 2 0 0 1-2-2V3m0 18v-3a2 2 0 0 1 2-2h3M3 16h3a2 2 0 0 1 2 2v3"></path></svg>
	                                                        </div>
	                                                        
	                                                        <div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-loader"><line x1="12" y1="2" x2="12" y2="6"></line><line x1="12" y1="18" x2="12" y2="22"></line><line x1="4.93" y1="4.93" x2="7.76" y2="7.76"></line><line x1="16.24" y1="16.24" x2="19.07" y2="19.07"></line><line x1="2" y1="12" x2="6" y2="12"></line><line x1="18" y1="12" x2="22" y2="12"></line><line x1="4.93" y1="19.07" x2="7.76" y2="16.24"></line><line x1="16.24" y1="7.76" x2="19.07" y2="4.93"></line></svg>
	                                                        </div>
	
															<div class="icon-container">
	                                                            <svg onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
	                                                        </div>
	                                                    	
	                                                    	<div class="icon-container">
	                                                            <svg id="hello" onclick="iconInsert(this)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-link"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
	                                                        </div>
                                                    </div>
                                                    
                                                    <div id="cvText2"><label>?????? ?????? ????????????</label></div>
												    <div id="colorView" class="lastView" align="center" style="width:100px; height: 30px; border-radius: 2em;"></div>
                                                    
                                                 </div>
                                               </div>
                                            </div>
                                          <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> ??????</button>&nbsp;&nbsp;
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="fn_mkFin()">??????</button>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
	            	 
	               <!-- issue marker ??? -->
	              
	               <p id="select">???????????? ????????? ?????? 10????????????</p>
	               <div class="widget-one">
	                  	<label class="p_lab" id="nameLabel">???????????? ??????</label>  &nbsp;&nbsp;
	                  	<div id="membering">
	                  	  <div data-toggle="modal" data-target="#exampleModalCenter">
	                  		<svg id="plusMember" class="iconPlus" xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
						  </div>
						    <label class="new-control new-checkbox new-checkbox-text checkbox-primary" id="recruitment">
						    <c:if test="${projectVO.pjtRcrtStts=='Y'}">
						      <input type="checkbox" class="new-control-input" id="pjtRcrtStts" value="Y" onchange="keywordShow(this)"  disabled="disabled" checked>
						    </c:if>
						    <c:if test="${projectVO.pjtRcrtStts=='N'}">
						      <input type="checkbox" class="new-control-input" id="pjtRcrtStts" value="Y" onchange="keywordShow(this)" disabled="disabled">
						    </c:if>
						      <span class="new-control-indicator"></span><span class="new-chk-content">????????????</span>
							</label>
						</div>
	               </div>
	               <div id="memberZone">
	               	<div class="table-responsive" id="memberTable">
                          <table class="table table-bordered table-hover mb-4">
                              <thead>
                                  <tr>
                                      <th id="nameArea">??????</th>
                                      <th>??????</th>
                                      <th class="text-center" id="roleArea">??????</th>
                                      <th></th>
                                  </tr>
                              </thead>
                              <tbody id="tb_body">
                              
                              </tbody>
                          </table>
                    </div>
	              </div>
	               
	                <div class="modal fade show" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none; padding-right: 17px;" aria-modal="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width: 380px;">
    	
    	<div class="modal-content">
        	<div class="modal-header">
            	<h5 class="modal-title" id="exampleModalCenterTitle">???????????? ?????? ??????</h5>
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body" >
				<div class="widget-content searchable-container list" style="height : 430px; margin-top : 20px;">
					<div class="row" >
 						<div class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
    						<div class="action-btn">
								<div style="padding-bottom: 10px;">
   									<input type="text" class="form-control product-search" id="input-search" placeholder="????????? ???????????????" style="width:330px;">
								</div>
		 					</div>
						</div>
					</div>
					<div class="searchable-items list" ></div>
					<form name="frm" action="#" method="post">
				      	<div class="mbrCollect">
							<div id="imgDiv">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
							</div>
				      	</div>
				      	<div style="height : 50px; width : 330px; text-align : right; display: none;" id="nextBtn">
							<button onclick="addUser()" type="button" class="btn btn-outline-primary mb-2">Next</button>
						</div>
				      	<div style="height :50px; width : 330px; text-align : right;" id="finishBtn">
							<button onclick="fn_membering()" type="button" class="btn btn-outline-primary mb-2">??????</button>
						</div>
			    	</form>		
				</div>
			</div>
		</div>
	</div>
  </div>
                                            
                                 <br>
                                 <div id='bottomZone' style="display:flex;">                      
		                                 <div class="lang">
			                                 <p id="select" style="display:inline-block;">????????? ?????? ????????? ??????????????????</p>
			                                 <div class="widget-one" style="height:50px;">
							                  	<label class="p_lab">?????? ??????</label>  &nbsp;&nbsp;
							                  	
							                  	  <div data-toggle="modal" data-target="#logoModal">
							                  		<svg class="iconPlus" id='plusMember' xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
												  </div>
												
										 	</div>
										 	 <div id="langZone">
								              </div>
										  </div>
											
											<c:if test="${projectVO.pjtRcrtStts=='Y'}">
												<div class="key" margin-left:30px; text-align:center;">
											</c:if>
											<c:if test="${projectVO.pjtRcrtStts=='N'}">
												<div class="key" style="display:none; margin-left:30px; text-align:center;">
											</c:if>
												<p id="select" style="display:inline-block; margin-left:170px;">???????????? ?????? ???????????? ???????????????</p>
													<div class="widget-one" style="height:50px;">
													  <label class="p_lab" style="margin-left:151px;">?????????</label>  &nbsp;&nbsp;
								                  	  <div data-toggle="modal" data-target="#keywordModal">
								                  		<svg class="iconPlus" id='plusKeyWord' xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
													  </div>
												    </div>
												    <div id="keywordZone" style="padding-left:150px;">
								                    </div>
											</div>
								</div>
										 
										  <div style="height:50px;">
										  	<div style="float:right; margin-right:20px; margin-top:20px;" >
				                           		<button type="button" class="btn btn-outline-primary mb-2">??????</button>
				                           		<button type="button" onclick="allFin()" class="btn btn-outline-primary mb-2">??????</button>
				                           	</div>	
			                              </div>
						    <br><br>
                              </div>
						 </form> 
						 
						              <div class="modal fade bd-example-modal-sm" id="keywordModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog modal-sm" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="mySmallModalLabel">?????????</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                      <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                               		 <label class="keywordLabel" id="keywordLabel">????????????</label>
                                                        	<form id="fm_name">
					     								    	<input type="text" maxlength="5" class="form-control placement-bottom" id="keywordName">
					     								    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button class="btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i>??????</button>
                                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="keyword_making()">??????</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
				               
				               
				               <div class="modal fade show" id="logoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none; padding-right: 17px;" aria-modal="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="logoModalTitle">???????????? ??????</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                      <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                    </button>
                                                </div>
                                                <div class="modal-body" style="height:atuo;">
                                                
			                                                
												<ul class="list-group list-group-media" id="logoList">
			                                        
			                                    </ul> <br>
												      <div style="height : 50px; margin-left:120px; width : 330px; text-align : right;">
												      <button onclick="fn_logoFin()" type="button" data-dismiss="modal" class="btn btn-outline-primary mb-2">??????</button>
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
    
    var selectColor;
    var markerName;
    var marker="";
    var icon="";
    var idArr = [];
	var langArr = [];
	var keywordArr = [];
	var mkNameArr = [];
	var mkColorArr = [];
	var mkIconArr = [];
	var roleArr=[];
	var logoArr = [];

    </script>
    
  	
  	<script src="/resources/project/projectUpdate.js"></script>
    <script src="/resources/plugins/flatpickr/flatpickr.js"></script>
    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
    <!-- END THEME GLOBAL STYLE -->    
    <script src="/resources/plugins/flatpickr/custom-flatpickr.js"></script>
    <script src="/resources/assets/js/ie11fix/fn.fix-padStart.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>
    <script src="/resources/plugins/bootstrap-maxlength/bootstrap-maxlength.js"></script>
    <script src="/resources/plugins/bootstrap-maxlength/custom-bs-maxlength.js"></script>
	<script src="/resources/plugins/tagInput/tags-input.js"></script>
	<script>
        $(document).ready(function() {
            App.init();
        });
</script>
	<script type="text/javascript">
	var f3 = flatpickr(document.getElementById('rangeCalendarFlatpickr'), {
	    mode: "range"
	});
	
	$(function(){
		 list()
		})
	</script>
	
</body>
</html>