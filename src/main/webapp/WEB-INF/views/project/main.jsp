<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/assets/css/apps/todolist.css" />
<link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css" />
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/assets/css/structure.css" />
    <link rel="stylesheet" type="text/css" href="resources/plugins/editors/quill/quill.snow.css">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link href="/resources/assets/css/elements/avatar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/assets/css/widgets/modules-widgets.css" />
<link rel="stylesheet" href="/resources/plugins/animate/animate.css" />
<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/jsa/projectMain.css" />

<script src="/resources/assets/js/jsa/projectMain.js"></script>
<script src="https://d3js.org/d3.v4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 차트 css 시작 -->
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/apex/apexcharts.css" rel="stylesheet" type="text/css">
<!-- 차트 css 끝 -->

<!-- 이슈모양 -->
<link href="/resources/assets/css/elements/search.css" rel="stylesheet" type="text/css">
<style>
.badge badge-primary{
	font-size:1.12em;
}
.social-icon {
	cursor: pointer;
}
.searchable-items {
 	overflow: auto;
	height : 200px; 
	margin-bottom: 20px;
}
 .searchable-items::-webkit-scrollbar{ 
	display:none;
}
.title {
	font-size : 23px;
	font-weight: 600;
	color: #515365;

}

</style>  
<script>
var pjtNo = "<c:out value='${project.pjtNo}' />";
var total = "<c:out value='${changeMb}' />";

var webSocket = null;

      
$(function(){
	
	//console.log("프젝번호 받아라", pjtNo);
	getAllMbr(pjtNo); //프로젝트 메인페이지 접속 시 구성원 목록 보여주기

	triggerTransition(); //프로젝트 사용량 
	
	//클라우드 사용량 버튼 클릭 시 클라우드 화면으로 넘어간다.
	$("#usingAmount").on("click",function(){
		location.href="/cloud/main.do?pjtNo="+pjtNo;
	})
	
	
	$(document).on("click","table tbody tr td", function(e){
		//console.log("클릭!!", e.target);
		var findID = $(e.target).parents(".table").find("td:eq(0)").find(".mbrIdspan").text();
		getUserProfile(findID);
		
		
// 		console.log($(e.target).closest("table")[0].getBoundingClientRect());
// 		var location = $(e.target).closest("table")[0].getBoundingClientRect();
// 		var left = location.left - 620;
// 		var bottom = location.bottom - 20;
// 		console.log(location.bottom);
// 		console.log(location.left);
// 		//$(".modal-content").css("left", left+"px").css("top", bottom+"px");
// 		//$("#profileModal").modal("show");




	})
	
	$('#chat').on('click', function(){
			window.open('/chat/chatMain.do', 'chatting', 'width=900, height=601');
	})	
	
	//프로젝트 메인에서 우측 회원 명 클릭 시 나오는 메일 눌렀을 때 
	$('#pjemail').on('click', function() {
		//console.log("메일 클릭zz");
		var emlsearch = $(this).parent().parent().parent().prev().find('.pjMemEmail').val();
		//console.log("이메일찾기~!", emlsearch);
		
		$('#m-to').val(emlsearch);
		$('#m-from').val();
		$('#btn-send').show();
		$('#btn-reply').hide();
		
		$('#btn-fwd').hide();
		$('#composeMailModal').modal('show');
	
		// Save And Reply Save
		$('#btn-save').show();
		$('#btn-reply-save').hide();
		$('#btn-fwd-save').hide();
		
		
		/*
		====================
			Quill Editor
		====================
	*/

	var quill = new Quill('#editor-container', {
		  modules: {
		    toolbar: [
		      [{ header: [1, 2, false] }],
		      ['bold', 'italic', 'underline'],
		      ['image', 'code-block']
		    ]
		  },
		  placeholder: 'Compose an epic...',
		  theme: 'snow'  // or 'bubble'
		});
	
		// Validating input fields

		var $_getValidationField2 = document.getElementsByClassName('validation-text2');
		var $_getValidationField = document.getElementsByClassName('validation-text');
		var emailReg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		getEmailToInput2 = document.getElementById('m-from');
		getEmailToInput = document.getElementById('m-to');

	
		//from
		getEmailToInput2.addEventListener('input', function() {
	
		  	getEmailToInputValue2 = this.value;
	
		    if (getEmailToInputValue2 == "") {
		      $_getValidationField2[0].innerHTML = 'Email Required';
		      $_getValidationField2[0].style.display = 'block';
		    } else if((emailReg.test(getEmailToInputValue2) == false)) {
		      $_getValidationField2[0].innerHTML = 'Invalid Email';
		      $_getValidationField2[0].style.display = 'block';
		    } else {
		      $_getValidationField2[0].style.display = 'none';
		    }
		})
	
	
		//to
		getEmailToInput.addEventListener('input', function() {
	
		  	getEmailToInputValue = this.value;
	
		    if (getEmailToInputValue == "") {
		      $_getValidationField[1].innerHTML = 'Email Required';
		      $_getValidationField[1].style.display = 'block';
		    } else if((emailReg.test(getEmailToInputValue) == false)) {
		      $_getValidationField[1].innerHTML = 'Invalid Email';
		      $_getValidationField[1].style.display = 'block';
		    } else {
		      $_getValidationField[1].style.display = 'none';
		    }
		})


		getSubjectInput = document.getElementById('m-subject');

		getSubjectInput.addEventListener('input', function() {
	
		  getSubjectInput = this.value;
	
		  if (getSubjectInput == "") {
		    $_getValidationField[2].innerHTML = 'Subject Required';
		    $_getValidationField[2].style.display = 'block';
		  } else {
		    $_getValidationField[2].style.display = 'none';
		  }
	
		})

		$('#composeMailModal').on('hidden.bs.modal', function (e) {
		    
		  	$(this)
		    .find("input,textarea")
		       .val('')
		       .end();
	
		    quill.deleteText(0, 2000);
	
		    for (var i = 0; i < $_getValidationField.length; i++) {
		      e.preventDefault();
		      $_getValidationField[i].style.display = 'none';
		    }
		})
	})
	////메일에 필요한애들 여기까지 
	
 	//웹소켓 오픈!
	var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint';
	console.log("위치",url);
	webSocket = connection(url);
	var connectionType;

	webSocket.onopen = function(){ processOpen(); };
	webSocket.onmessage = function(message) { processMessage(message); };
	
	
	// 구성원 일감 차트
	$.ajax({
		url: "/project/totalTodoCount",
		data: {"pjtNo" : pjtNo},
		type: "post",
		success: function(res){
			var mbrlist = [];
			var tt01 = [];
			var tt02 = [];
			var tt04 = [];
			$.each(res, function(i, v){
	    		mbrlist.push(v.mbrNm) 
	    		$.each(v.oneList, function(a, b){
	    			if(b.CM_DVSN_CTGR_CD == 'TT01'){
	    				tt01.push(b.TD_STTS)
	    			} else if(b.CM_DVSN_CTGR_CD == 'TT02') {
	    				tt02.push(b.TD_STTS)
	    			} else if(b.CM_DVSN_CTGR_CD == 'TT04') {
	    				tt04.push(b.TD_STTS)
	    			}
	    		})
	    	})
			
			var sColStacked = {
					colors: ['#03a9f4', '#ffee47', '#fb6f92'],
				    chart: {
				        height: 350,
				        type: 'bar',
				        stacked: true,
				        toolbar: {
				          show: false,
				        }
				    },
				    responsive: [{
				        breakpoint: 480,
				        options: {
				            legend: {
				                position: 'bottom',
				                offsetX: -10,
				                offsetY: 0
				            }
				        }
				    }],
				    plotOptions: {
				        bar: {
				            horizontal: false,
				        },
				    },
				    series: [{
				        name: '요청',
				        data: tt01
				    },{
				        name: '진행',
				        data: tt02
				    },{
				        name: '완료',
				        data: tt04
				    }],
				    xaxis: {
				        categories: mbrlist,
				    },
				    legend: {
				        position: 'bottom',
				        offsetY: -10
				    },
				    fill: {
				        opacity: 1
				    },
				}

				var chart = new ApexCharts(
				    document.querySelector("#totalTodoChart"),
				    sColStacked
				);

				chart.render();
		}, 
		error: function(res){
			alert("error1")
		}
	})
	
		
	// 내 일감 차트
	$.ajax({
		url: "/project/myTodoCount",
		type: "post",
		data: {"pjtNo": pjtNo},
		success: function(res){
			var TT01Count = "";
			var TT02Count = "";
			var TT04Count = "";
			var TT01Nm = "";
			var TT02Nm = "";
			var TT04Nm = "";
			$.each(res, function(i, v){
				if(v.CM_DVSN_CTGR_CD == 'TT01'){
					TT01Count = v.TD_STTS;
					TT01Nm = v.CM_DVSN_CTGR_NM;
				} else if(v.CM_DVSN_CTGR_CD == 'TT02'){
					TT02Count = v.TD_STTS;
					TT02Nm = v.CM_DVSN_CTGR_NM;
				} else if(v.CM_DVSN_CTGR_CD == 'TT04'){
					TT04Count = v.TD_STTS;
					TT04Nm = v.CM_DVSN_CTGR_NM;
				}
			})
			
			var donutChart = {
				colors: ['#03a9f4', '#ffee47', '#fb6f92'],
				    chart: {
				        height: 350,
				        type: 'donut',
				        toolbar: {
				          show: false,
				        }
				    },
				    series: [TT01Count, TT02Count, TT04Count],
				    labels: [TT01Nm, TT02Nm, TT04Nm],
				    responsive: [{
				        breakpoint: 480,
				        options: {
				            chart: {
				                width: 200
				            },
				            legend: {
				                position: 'bottom'
				            }
				        }
				    }], 
				    legend: {
				        position: 'bottom',
				        offsetY: -10
				    },
				    
				}

				var donut = new ApexCharts(
				    document.querySelector("#myTodoChart"),
				    donutChart
				);

				donut.render();
		},
		error: function(res){
			alert("error2")
		}
	})
	
})

	function connection(url) {
		var webSocket = null;
		if ('WebSocket' in window) {
			webSocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			webSocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return webSocket;
	}
	
	function processOpen() {
		connectionType = "firstConnection";
		username = "${member.mbrId}";
		webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
	}
	
	var jsonDataTemp;
	//server에서 메시지가 넘어왔을때
	function processMessage(message) {
		var jsonData = JSON.parse(message.data);

		console.log("jsonData.allUsers : " + jsonData.allUsers);
		console.log("jsonData.disconnectedUser : " + jsonData.disconnectedUser);
		
		
		if (jsonData.allUsers != null) {
			jsonDataTemp = jsonData.allUsers;
			//다른 사용자 접속 시,
			displayUsers(jsonData.allUsers);
		} 
		
		if (jsonData.disconnectedUser != null) {
			console.log("jsonDataTemp : " + JSON.stringify(jsonDataTemp));	//백업
			console.log("jsonData.disconnectedUser : " + JSON.stringify(jsonData.disconnectedUser)); //나간회원
			
			let jsonDataArr = new Array();
			let cnt = 0;
			let exitUser = JSON.stringify(jsonData.disconnectedUser);
			exitUser = exitUser.replace(/\"/gi, "");
			//백업 - 나간회원
			$.each(jsonDataTemp,function(i,value){
					console.log("value : " + value + ", value2 : " + exitUser);
					if(value!=exitUser){
						jsonDataArr[cnt] = value;
						cnt++;
					}
			});
			
			console.log("jsonDataArr : " + jsonDataArr);
			//json
			jsonDataTemp = jsonDataArr;
			
			//다른 사용자가 접속을 끊을 때,
			$("#"+jsonData.disconnectedUser).remove();
			//배열
			displayUsers(jsonDataArr);
			webSocket.close();
		}
	}
	
	
	function displayUsers(userList) {
		console.log("userlist:",userList);
		getAllMbr(pjtNo, userList);
	}
	
	window.onbeforeunload = function() {
		webSocket.close();
	};

//클라우드 사용량 표시	
function triggerTransition(){
  d3.select("#rectArea")
    .transition()
    .delay(100)
    .duration(3000)
    .attr("width", total)
}



</script>
<!-- aside submenu space -->
<div class="layout-px-spacing" style="color: #515365">
<!-- aside submenu space -->
	<div class="bodyDiv">
		<div class="leftDiv">
		
			<div class="statbox widget box box-shadow" style="background-color: #fdfdfd; height: 250px; margin-bottom: 80px;">
                <div class="widget-content widget-content-area" style="padding: 30px 30px 10px;"> 
                    <div class="row">
                        <div style="display:flex; justify-content: space-between" class="col-xl-12 col-md-12 col-sm-12 col-12">
                            <h4 style="font-weight: 600; color : #515365; font-size:2em;">${pjt.pjtNm }</h4>
                            <c:if test='${grant=="no"}'>
                            	<a href="/project/projectInfo.do?pjtNo=${pjt.pjtNo}"><svg style="margin-top:5px;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-right"><polyline points="13 17 18 12 13 7"></polyline><polyline points="6 17 11 12 6 7"></polyline></svg></a>
                            </c:if>
                            <c:if test='${grant=="yes"}'>
	                            <div class="dropdown custom-dropdown">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink-2" style="will-change: transform;">
                                        <a href="/project/projectUpdate.do?pjtNo=${pjt.pjtNo}" class="dropdown-item" href="javascript:void(0);">수정</a>
                                        <a class="dropdown-item" href="javascript:void(0);" onclick="projectDelete()">삭제</a>
                                    </div>
	                            </div>
                            </c:if>
                        </div>
                    </div>
                     <h6 style="font-weight: 600; margin-top:10px;">${myRole.name}님은   <span style="color:#007bff">  ${myRole.role}</span>입니다</h6>
                	<br>
                <span style="margin-right: 30px; display: inline-block; width: 80px; height: 30px; font-size: 1.5em;"> <span>개요</span></span>
                    <div class="sorting_1" style="width: 80%; display: inline-block; margin-bottom: 20px; font-size: 1.5em;"> ${pjt.pjtOl } </div>
                <br> 
                <span style="margin-right: 30px; display: inline-block; width: 80px; height: 30px; font-size: 1.5em"> <span>진행률</span> </span>
                    <div class="sorting_1" style="width: 80%; display: inline-block;">
						<div class="progress" style="height: 30px; border-radius: 6px">
							<div class="progress-bar bg-primary bg-gradient-danger" role="progressbar" style="width: ${progress}%; border-radius: 6px; font-size: 1.2em; background-image: linear-gradient(to right, #d4d9fd 0%, #29347a 100%);" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${progress}%</div>
						</div>
					</div>
                <div style="display: inline-block; width: 60%">
                <table style="width: 100%; margin: 15px 25px; margin-left:0px; font-size: 1.20em; color: #515365; vertical-align:middle">
                	<tr style="height:20px;">
                		<td><span>개발일정</span>&nbsp; ${pjt.pjtStrtYmd} ~ ${pjt.pjtEndYmd}</td>
                	</tr>
                	<tr>
                		<td><span>총 인원</span>&nbsp;&nbsp; ${pjtMbr.size()} 명</td>
                		<td><span>Project Leader</span>&nbsp; ${pl.MBR_NM }</td>
                	</tr>
                </table>
                </div>
                <div style="display: inline-block; float: right; margin: 20px 25px;">
                <h2 id='dDay'></h2>
                <script>
                var today = new Date();
                var day = '${pjt.pjtEndYmd}'
                var dday = new Date(day.substr(0,4), day.substr(5,2) - 1 , day.substr(8,2));
                var gap = dday.getTime() - today.getTime();
                var result = Math.ceil(gap / (1000*60*60*24));
                var str = "";
                if(result == 0){
                	str = 'D - day'
                } else if(result < 0){
                	str = 'D + ' + (result * -1)
                } else {
                	str = 'D - ' + result
                }
              
                $('#dDay').text(str)
                </script>
                </div>
                </div> 
            </div>
            <div style="display: flex; width: 100%; margin-top: 100px; margin-bottom: 10px;">
			<div id="totalTodo" class="statbox widget box box-shadow" style="background-color: #fdfdfd; width: 69%; padding-bottom: 20px;">
				<div class="widget-header" style="margin-top: 20px;">                                
		            <div class="row"> 
		                <div class="col-xl-12 col-md-12 col-sm-12 col-12" style="text-align: center;">  
		                    <p class="title">구성원 진행도</p>
		                </div>
		            </div>
		        </div>
	        	<div id="totalTodoChart" style="margin-bottom: 15px;"></div>
			</div>
			
	        <div id="myTodo" class="statbox widget box box-shadow" style=" background-color: #fdfdfd; padding-bottom: 20px; margin-left: 15px; width: 30%;">
		        <div class="widget-header" style="margin-top: 20px; ">                                
		            <div class="row" style="margin-bottom: 30px;"> 
		                <div class="col-xl-12 col-md-12 col-sm-12 col-12" style="text-align: center;">  
		                    <p class="title">내 진행도</p>  
		                </div>
		            </div>
		        </div>
	        	<div id="myTodoChart" ></div>
	        </div>
	        </div>
	        <div class="statbox widget box box-shadow" style="background-color: #fdfdfd; display: inline-block; width: 100%; margin-top: 5px; margin-bottom: 20px;">
	        	<div class="widget-header" style="margin-top: 20px;">                                
		            <div class="row">
		                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
		                    <p class="title">최근이슈</p> 
		                </div>
		            </div>
		        </div>
	        	<div class="searchable-container" >
	        	<div class="searchable-items" style="border: none;">
	        	<c:forEach var = "issue" items="${issueList }">
		        	<div class="items">
		                <div class="user-profile">
		                    <img src="/resources/profileImage/${issue.MBR_IMG }" alt="avatar"> 
		                    <p style="margin: auto"> &nbsp;&nbsp;&nbsp;${issue.MBR_NM }</p>
		                </div>
		                <div class="user-email" style="width: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
		                    <a href="/project/issuemain.do?pjtNo=${pjt.pjtNo}">${issue.ISSUE_TTL}</a>
		                </div>
		                <div class="action-btn">
		                	<p>${fn:substring(issue.ISSUE_YMD,0,10)}</p> 
		                </div>
		            </div>
	            </c:forEach>
	        </div>
	        </div>
	        </div>
		</div>
		
		<div class="rightDiv">
		
		<div id="usingAmount" class="widget widget-table-two rightside" style="width : 300px; cursor: pointer; background-color:#fdfdfd;">
			<p class="spantitle">드라이브 사용량</p>
			<div id="chart_div">
			  <svg width="300px" height="100px" >
			      <rect
			        id="rectArea2" x="40" y="10"
			        width="210" height="30" stroke="#666978"
			        fill="#9191c9" stroke-width="0.5"/>
			      <rect
			        id="rectArea" x="40" y="10"
			        width="0" height="30" stroke="black"
			        fill="#0f0f66" stroke-width="0.5"/>
			      <text x="170" y="30" font-size="15" fill="white">${changeMb/200*100}%</text>
					<text x="70" y="75" fill="#0f0f66" font-weight="bold"  font-size="15">
						    ${changeMb}MB
						  </text>
					<text x="140" y="75" fill="#888ea8" font-weight="bold"  font-size="15">
						     / 200MB
						  </text>
			 		 </svg>
				</div>
			</div>
		<div class="widget widget-table-two rightside" id="pjtMbrList" style="width : 300px; background-color:#fdfdfd;">
		</div>
		</div>
	</div>
</div>

	
	
	
	
	
	
	

<div class="modal fade profile-modal" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content" style="background-color: #434c5a;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>

      <div class="modal-header justify-content-center" id="profileModalLabel">
        <div class="modal-profile mt-4">
            <img alt="avatar" width="90px" height="90px" src="assets/img/profile-2.jpeg" class="rounded-circle">
        </div>
      </div>
      <div class="modal-body text-center">
            <h5 class="nameP" style="color:#fdfdfd;"></h5>
            <p class="mt-2"></p>
            <input type="hidden" class="pjMemEmail">
      </div>
      <div class="modal-footer justify-content-center mb-4">
          <ul class="list-inline">
              <li class="list-inline-item">
                   <div class="social-icon" id="chat">
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
                  <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
                  </div>                                     
              </li>
              <li class="list-inline-item">&nbsp;</li>
              <li class="list-inline-item">
                  <div class="social-icon" id="pjemail">
                  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke:currentColor;">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                  </div>
              </li>
          </ul>
<!--         <button type="button" class="btn">View</button> -->
      </div>
    </div>
  </div>
</div>	


<!--메일 작성 Modal -->
<div class="modal fade" id="composeMailModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body" style="padding: 25px 14px;"> 
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="modal">
                 <line x1="18" y1="6" x2="6" y2="18"></line>
                 <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
                <div class="compose-box">
                    <div class="compose-content">
                        <form action="/user/email/insertFile" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="d-flex mb-4 mail-to"> 
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
                                         <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                         <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <div class="">
                                        	<input type="hidden" id="m-sendid" value="${member.mbrId}">
                                            <input type="email" id="m-from" placeholder="From" class="form-control" value="${member.mbrEml}" disabled="disabled" style="width: 237%!important;">
                                            <span class="validation-text2"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex mb-4 mail-to"> <!-- 받는사람 이메일 -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
                                         <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                         <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        
                                        <div class="">
                                            <input type="email" id="m-to" placeholder="To" class="form-control"  style="width: 237%!important;"> 
                                            <span class="validation-text"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex mb-4 mail-subject"> <!-- 메일 제목 -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">
                                 <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                 <polyline points="22,6 12,13 2,6"></polyline>
                                </svg>
                                <div class="w-100">
                                    <input type="text" id="m-subject" placeholder="Subject" class="form-control" maxlength="50" >
                                    <span class="validation-text"></span>
                                </div>
                            </div>
                            
                            <div class="d-flex"><!-- 첨부파일 -->
                                <input type="file" class="form-control-file" name="uploadFile" id="mail_File_attachment" multiple="multiple" />
                            </div>
                            
                            <div id="editor-container"><!-- 메일 내용 -->

                            </div>
                            <sec:csrfInput />
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btn-save" class="btn float-left"> 임시저장</button>
                <button id="btn-reply-save" class="btn float-left"> 임시저장</button>
                <button id="btn-fwd-save" class="btn float-left"> 임시저장</button>

                <button class="btn" data-dismiss="modal"> 
                	<i class="flaticon-delete-1"></i> 취소하기
                </button>

                <button id="btn-reply" class="btn"> 답장하기</button>
                <button id="btn-fwd" class="btn"> 전달하기</button>
                <button id="btn-send" class="btn"> 보내기</button>
            </div>
        </div>
    </div>
</div>
<!-- 메일 작성 모달 끝 -->


<script>
var pjtNo = ${pjt.pjtNo};
	function projectDelete(){
	const swalWithBootstrapButtons = swal.mixin({
	    confirmButtonClass: 'btn btn-success btn-rounded',
	    cancelButtonClass: 'btn btn-danger btn-rounded mr-3',
	    buttonsStyling: false,
	  })
	  
	  swalWithBootstrapButtons({
	    title: '프로젝트를 삭제하시겠습니까?',
	    text: "삭제된 프로젝트는 복구할 수 없습니다",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonText: '삭제',
	    cancelButtonText: '취소',
	    reverseButtons: true,
	    padding: '2em'
	  }).then(function(result) {
	    if (result.value) {
	    
	      swalWithBootstrapButtons(
	        '삭제완료',
	        '프로젝트가 삭제되었습니다',
	        'success'
	      ).then(function(result){
		  		if(result){
		  			location.href="/";	
		  		}
	  		})
	      
	 		
	  		$.ajax({
	    		url : "/project/projectDelete.do",
	    		type : 'post',
	    		async: false,
	    		data : {
	    			pjtNo:pjtNo,
	    		},
	    		success : function(data) {
	    	     }
	    	});
	     		
	    } else if (
	      // Read more about handling dismissals
	      result.dismiss === swal.DismissReason.cancel
	    ) {
	      swalWithBootstrapButtons(
	        '뒤로',
	        '프로젝트 삭제가 취소되었습니다',
	        'error'
	      )
	    }
	  })
	}
</script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script> 
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/apex/apexcharts.min.js"></script>
<script src="/resources/plugins/apex/custom-apexcharts.js"></script>
    <script src="/resources/plugins/editors/quill/quill.js"></script>