<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<title>do IT</title>

<link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico"/>
<link href="/resources/assets/css/loader.css" rel="stylesheet" type="text/css" />
<script src="/resources/assets/js/jquery-3.6.0.js"></script>
<script src="/resources/assets/js/loader.js"></script>
<script src="/resources/assets/js/app.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<link href="/resources/assets/css/users/user-profile.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/main.css" rel="stylesheet" type="text/css" />

<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/plugins/apex/apexcharts.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" class="dashboard-analytics" />
<link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/plugins/editors/quill/quill.bubble.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/editors/quill/quill.snow.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">

<link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&amp;display=swap" rel="stylesheet">
<link href="/resources/assets/css/apps/mailing-chat.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link rel="stylesheet" href="/resources/assets/css/apps/notes.css" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"> 
<link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/elements/avatar.css" rel="stylesheet" type="text/css">
<link href="/resources/plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/plugins/sweetalerts/sweetalert.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
<script src="/resources/assets/js/syt.js"></script>

<style>
    #arrayList {
        width: 442px; 
        height: 240px; 
        border-radius: 0.25rem; 
        margin-bottom: 10px;
        background-color: #EAEAEA;
        line-height: 240px;
        text-align: center; 
    }
    .bubble img {
    	width: 230px;
    }
    .mbrCollect {
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
	 #input-search{
	    width:250px;
	 }
	.searchable-items {
	 	overflow: auto;
		height : 250px; 
	}
	 .searchable-items::-webkit-scrollbar{ 
		display:none;
	}
</style>

<script>
// 채팅방 만들기
function chatRoomMake(){
	var chatRoom = $('#input-chatRoom').val();
	
	var peopleNum = $('.avatar--group').find('img').length;
	var arr = []
	for(var i = 0; i < peopleNum; i++){
		arr.push($('.avatar--group').find('img').eq(i).attr('alt'));
	}
	console.log('arr >>> ', JSON.stringify(arr));
	console.log('chatRoom >>> ', chatRoom);
	
	$.ajax({
		url : "/chat/chatRoomMake",
		data : {"chatRoom":chatRoom, "peopleNum":JSON.stringify(arr)},
		type : "post",
		success : function(){
			
// 			for(var i = 0; i < arr.length; i++){
// 				console.log(arr[i]);
// 				sock.send(arr[i]);
// 			}
		
			$("#chatRoomModalCenter").modal('hide');
			$(location).attr('href', '/chat/chatMain.do')
		},
		error : function(xhr){
			alert('error' + xhr.status);
		}
	})
}

$(function(){
	//모든 멤버 목록 가져오기
	list();
	
	$('#chatRoomBtn').on('click', function(){
		$('#nextBtn').css('display', 'block');
		$('#finishBtn').css('display', 'none');
	})
	
	$('#userPlusBtn').on('click', function(){
		$('#nextBtn').css('display', 'none');
		$('#finishBtn').css('display', 'block');
	})
	
	$("#files").on('change', function(){
		readURL(this);
	})
	
})
</script> 
	    <div class="row">
	        <div class="col-xl-12 col-lg-12 col-md-12">
	            <div class="chat-system" style='margin-bottom: 0;'>
      	                <div class="user-list-box">
	                    <div class="search">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
	                        <input type="text" class="form-control" placeholder="검색..">
	                    </div>
					<jsp:include page="chatList.jsp" flush="false"/>
	                <input type="hidden" id="roomNum" value="0">
	                </div>
					<jsp:include page="chatBox.jsp" flush="false"/>
	            </div>
	
	        </div>
	    </div>

<!-- 모달 시작1 -->
<div class="modal fade" id="TaskModal" tabindex="-1" role="dialog" aria-labelledby="addTaskModalTitle" aria-modal="true" style="display: none;">
<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="height:400px;">
	  <form id="upload" action="#" method="POST" enctype="multipart/form-data">
        <div class="modal-body" style="height:330px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="modal"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
			<div class="col-md-12">
	        	<div class="input-group mb-3">
	        		<p>보낼 사진</p>
               		<div id="arrayList" ondragover="f_over()" ondrop="f_drop()">
	               		<svg style="margin-top: 100px;" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16" id="plus">
						  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
						</svg>
					</div>
                    <div id="fileDiv1" class="custom-file">
                        <input type="file" class="custom-file-input" name="files" id="files" accept="image/*" multiple />
                        <label id="fileName" class="custom-file-label" for="files">Choose file</label>
                    </div>
                </div>
        	</div>	
        </div>
        <div class="modal-footer" id="uploadFooter" style="height:50px;">
        	<input type="hidden" id="hdn" value="">
          <div class="input-group-append" style="margin-top:5px;">
	          	<div id="fileDiv2">
		          	<a href="#" id="uploadBtn">
		              <span class="input-group-text" id="inputGroupFileAddon02">
		                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload-cloud"><polyline points="16 16 12 12 8 16"></polyline><line x1="12" y1="12" x2="12" y2="21"></line><path d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path><polyline points="16 16 12 12 8 16"></polyline></svg>
		    	     </span></a>
	          	</div>
          </div>
            </div>
		<sec:csrfInput />
		</form>
        </div>
    </div>
</div>
<!-- 모달 끝 -->

<!-- 모달 시작2 -->
<div class="modal fade show" id="chatRoomModalCenter" tabindex="-1" role="dialog" aria-labelledby="chatRoomModalCenterTitle" style="display: none; padding-right: 17px;" aria-modal="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width: 380px;">
    	
    	<div class="modal-content" id="chatMember" >
        	<div class="modal-header">
            	<h5 class="modal-title" id="chatRoomModalCenterTitle">채팅 멤버 추가</h5>
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
   									<input type="text" class="form-control product-search" id="input-search" placeholder="멤버를 검색하세요" style="width:330px;">
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
				      	<div style="height : 50px; width : 330px; text-align : right; display: none;" id="finishBtn">
							<button onclick="plusUser()" type="button" class="btn btn-outline-primary mb-2" data-dismiss="modal">완료</button>
						</div>
			    	</form>		
				</div>
			</div>
		</div>
		
		<div class="modal-content" id="chatRoom" style="display: none;">
        	<div class="modal-header">
            	<h5 class="modal-title" id="exampleModalCenterTitle2">채팅방 설정</h5>
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
				<div class="widget-content searchable-container list" style="height : 210px; ">
					<div class="row" >
 						<div class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
    						<div class="action-btn">
								<div style="width:330px;">
									<p style="margin: 0;">채팅방 명</p>
   									<input type="text" class="form-control product-search" id="input-chatRoom" placeholder="채팅방 이름을 작성하세요">
								</div>
		 					</div>
						</div>
					</div>
					<div class="searchable-items1 list">
						<div class="avatar--group" style="margin: 20px;">
						</div>
					</div>
			      <div style="height : 50px; width : 330px; text-align : center;">
			      <button onclick="chatRoomMake()" type="button" class="btn btn-outline-primary mb-2">완료</button>
			      </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script src="/resources/bootstrap/js/popper.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
        $(document).ready(function() {
            App.init();
        });
</script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/assets/js/apps/mailbox-chat.js"></script>
<script src="/resources/assets/js/apps/notes.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		webSocket.init({ url: '<c:url value="/chat" />' });
	});
</script>
<script>
	var v_wrapper = document.querySelector("#arrayList");
	var v_file;
function f_over(){
	event.preventDefault();
	event.stopPropagation();
}

function fileRead(p_file){
	v_wrapper.innerHTML = '';
	var v_fileReader = new FileReader();
	v_fileReader.readAsDataURL(p_file);
	v_fileReader.onload = function(){
		var v_img = document.createElement("img");
		v_img.setAttribute("src", v_fileReader.result);
		v_img.height = 240;
		v_wrapper.appendChild(v_img);
	}
}

function f_drop() {
	event.preventDefault();
	event.stopPropagation();
	var formData = new FormData($("#upload")[0]);
	v_file = event.dataTransfer.files;
	for (var i = 0; i < v_file.length; i++){
		formData.append("fileList", v_file[i]);
	}
	
	fileName(formData);
	for(var i = 0; i < v_file.length; i++){
        fileRead(v_file[i]); // 비동기 겹칠때 함수로 빼면 거의 해결됨
    }
}

function readURL(input){
	if(input.files && input.files[0]) {
		var formData = new FormData();
		var inputFile = $("input[name='files']");
		v_file = inputFile[0].files;
		for(var i = 0; i < v_file.length; i++){
			formData.append("files", v_file[i]);
			fileRead(v_file[i]);
		}
	}
}

function fileName(formData){
	$.ajax({
		url : "/chat/fileName",
		type: "post",
		data: formData,
		enctype:'multipart/form-data',
		processData:false,
        contentType:false,
        cache:false,
        success:function(res){
        	$("#fileName").html(res);
        }
	})
}


function fileUpload(){
	var roomId = $("#roomNum").val();
	var formData = new FormData($("#upload")[0]);
	
	for (var i = 0; i < v_file.length; i++){
		formData.append("fileList", v_file[i]);
	}
	formData.append("roomId", roomId);
	$.ajax({
		type : "post",
		url : "/chat/fileUpload",
		processData: false,
	    contentType: false,
	    data: formData,
	    async: true,
	    success : function(res){
	    	$("#TaskModal").modal('hide');
	    	send(res);
	    },
	    error : function(res){
	    	console.log("error");
	    }
	})
	
}

window.addEventListener("dragover", function(){
    event.preventDefault();
})
window.addEventListener("drop", function(){
    event.preventDefault();
})
</script>
<script src="/resources/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="/resources/plugins/sweetalerts/custom-sweetalert.js"></script>
