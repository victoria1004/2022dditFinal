//프로젝트의 모든 구성원 출력
function getAllMbr(pjtNo, userList){
	
	$.ajax({
		
		url : "/project/getAllMbr",
		data : {pjtNo : pjtNo},
		type : "post",
		dataType : "json",
		success : function(res){
			//console.log("접속한 목록", userList);
			$("#pjtMbrList").empty();
			
			var str = '';
			$.each(res, function(i, v){	
				//console.log("i",i);
				str += '<div class="table-responsive"><table class="table"><tbody><tr>';
				
				var flag = false;

				for(var k = 0; k < userList.length; k++){
					if (v.mbrId == userList[k]){
					flag = true;
					}
				}
				
				
				if(flag){ //온라인인 경우
					str += '<td><span style="display:none;" class="mbrIdspan">'+v.mbrId+'</span>&nbsp;&nbsp;&nbsp;</td><td><div class="avatar avatar-sm avatar-indicators avatar-online" style="border-radius : 50%;">';
				} else {
					str += '<td><span style="display:none;" class="mbrIdspan">'+v.mbrId+'</span>&nbsp;&nbsp;</td><td><div class="avatar avatar-sm avatar-indicators avatar-offline" style="border-radius : 50%;">';
				}

				if (v.mbrImg == null){
		        str += '<img src="/resources/profileImage/profileimage.png" style="width:40px; height:40px; border-radius : 50%;" alt="'+v.mbrNm+'"></div></td>';
		        } else {
		        str += '<img src="/resources/profileImage/'+v.mbrImg+'" style="width:40px; height:40px; border-radius : 50%;" alt="'+v.mbrNm+'"></div></td>';
		        }
				str += '<td><div class="td-content customer-name profileDiv" style="text-align:center;"><span class="prtpntDept">'+ v.mbrDept + '</span><span class="prtpntNm">' + v.mbrNm+'</span></div></td>';
		        str += '<td>';
		        
		        if (flag){ //온라인인 경우 상태 표시
			        if(v.mbrStts == '1'){
			        	str += '<span id="badge2" class="badge badge-pills outline-badge-primary">접속 중</span></td><td>';
			        } else if(v.mbrStts == '2'){
			        	str += '<span class="badge badge-pills outline-badge-primary">회의 중</span></td><td>';
			        } else if(v.mbrStts == '3'){
			        	str += '<span id="badge3"  class="badge badge-pills outline-badge-primary">다른 용무 중</span></td><td>';
			        } else if(v.mbrStts == '4'){
			        	str += '<span id="badge4"  class="badge badge-pills outline-badge-primary">방해금지</span></td><td>';
			        }
		        } else {
		        	str += '<td>&nbsp;&nbsp;</td>';
		        }
		        str += '</td>';
                str += '</tr></tbody></table></div>';
			}) //each
			$("#pjtMbrList").append(str);
		} //success
	})
}


//접속한 사용자가 참여 중인 프로젝트 목록
function getMyPjtList(mbrId){
	
	let data = {"mbrId":mbrId};
	$.ajax({
	
		url : "/project/getMyPjtList?mbrId="+mbrId,
		type : "get",
		dataType : "json",
		success : function(res){	
			var str = "";
			var getLocal = $.cookie('pjtNo');
			if (getLocal == 'null'){ //기존 메뉴인 경우
				getLocal = $.cookie('menu');
			}
			console.log("클릭!~~~~~", getLocal);
			$.each(res, function(i, v){		
				//console.log("클릭", getLocal, v.pjtNo);
				str += '<li id="' + v.pjtNo + '" class="menu">';
	            str += '<a onclick="menuClass(\''+v.pjtNo+'\', \'/project/main.do\')"  href="#" data-active="false" class="menu-toggle">';
	            str += '<div class="base-menu"><div class="base-icons">';
	            str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon></svg>';              
	            str += '</div><span>' + v.pjtNm +'</span></div></a>';
	            str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>';
	            str += '</li>';
 
			});
			$(".menu-categories").append(str);
			$('#'+getLocal).addClass("clickMenu");
		}
	});
}

function menuClass(pjtNo, url, menu){

	//쿠키 쓰기
	$.cookie('pjtNo', pjtNo, {path: '/'});
	// 페이지 이동 
	if(pjtNo == 'null'){ //기존 메뉴용 세팅
		$.cookie('menu', menu, {path: '/'});
		window.location.href= url;
	} else{
		window.location.href= url+'?pjtNo='+pjtNo;
	}
	
	
	
	
}




function getUserProfile(mbrId){
	//console.log("찍히니???", mbrId);
	
	$.ajax({
		
		url : "/user/getMyInfo",
		data : {mbrId : mbrId},
		type : "post",
		dataType : "json",
		success:function(res){
			//console.log(res);
			if(res.mbrImg == null){
			$(".rounded-circle").attr("src", "/resources/profileImage/profileimage.png");
			}else{
			$(".rounded-circle").attr("src", "/resources/profileImage/"+res.mbrImg);
			}
			$(".nameP").text(res.mbrNm);
			$(".pjMemEmail").attr('value', res.mbrEml);
			$(".mt-2").text(res.mbrIntro);
			$("#profileModal").modal("show");
		}
		
		
	});
		
}


$(document).ready(function() {
	function $_sendMail(getDraftTragetID) {
		$("#btn-send").off('click').on('click', function(event) {
		
			//event.preventDefault();
			/* Act on the event */
			draftTragetID = getDraftTragetID;
			
			//보내는사람 메일
		  	var $_mailFrom = document.getElementById('m-from').value;
		  	console.log("보내는사람 :"+$_mailFrom);
		  	
		  	//보내는사람 아이디 
		  	var $_mailId = document.getElementById('m-sendid').value;
		  	console.log("보내는 아이디 :"+$_mailId);
		  	
		  	//받는사람 메일
		  	var $_mailTo = document.getElementById('m-to').value;
		  	console.log("받는사람 : "+ $_mailTo);
		  	
			//첨부파일
			var formData = new FormData();
			var inputFile = $('input[id="mail_File_attachment"]');
			var files = inputFile[0].files;
			console.log(files);
			
		  	var $_mailAttachment = document.getElementById('mail_File_attachment');
		  	
	        for(var i= 0; i<files.length; i++){
	           console.log(files[i]);
	           formData.append("uploadFile", files[i]);
	        }
	        /* 확인법
			for(var val of formData.values()){
				console.log("chk:",val);
			} 
			*/           
			
		  	//메일 제목
		  	var $_mailSubject = document.getElementById('m-subject').value;
		  	console.log("메일 제목 : "+$_mailSubject);
		  	
		  	//메일 내용
		  	var $_mailDescriptionText = quill.getText();
		  	var $_mailDescriptionInnerHTML = quill.root.innerHTML;
		  	console.log("메일 내용 : "+$_mailDescriptionText);
		  	console.log("메일 내용 : "+$_mailDescriptionInnerHTML);
		  	
		  	var delta = quill.getContents();
		  	var $_textDelta = JSON.stringify(delta);
	
		  	var $outerAttachmentHTML = '';
		  	var $innerAttachmentHTML = '';
		  	var getSVG = '';
		  	
		  	if ($_mailAttachment.files.length >= 1) {
				for (var i = 0; i < $_mailAttachment.files.length; ++i) {
				  	$outerAttachmentHTML += '<span class="">'+ $_mailAttachment.files.item(i).name +'</span>';
	
				  	// Dectecting the format/type of the uploaded file for appling the icon/svg accordingly 
					if ($_mailAttachment.files.item(i).type.split('/')[0] === 'image') {
						getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-image"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>';
					} else if ($_mailAttachment.files.item(i).type.split('/')[0] === 'application') {
						if ($_mailAttachment.files.item(i).type.split('/')[1] === 'zip') {
							getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package"><line x1="16.5" y1="9.4" x2="7.5" y2="4.21"></line><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>';
						} else if ($_mailAttachment.files.item(i).type.split('/')[1]  === 'vnd.openxmlformats-officedocument.spreadsheetml.sheet' || $_mailAttachment.files.item(i).type.split('/')[1]  === 'vnd.openxmlformats-officedocument.wordprocessingml.document' ) {
							getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>';
						} else  {
							getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>';
						}
					} else if ($_mailAttachment.files.item(i).type.split('/')[0] === 'video') {
						getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>';
					} else {
						getSVG = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>';
					}
	
				  	$innerAttachmentHTML += '<div class="attachment file"> <div class="media"> '+ getSVG +' <div class="media-body"> <p class="file-name">'+ $_mailAttachment.files.item(i).name +'</p> <p class="file-size">'+ formatBytes($_mailAttachment.files.item(i).size, 2) +'</p> </div> </div> </div>';
				}
		  	}
	
	        var outerConditionHTML = $_mailAttachment.files.length >= 1 ? '<div class="attachments">' + $outerAttachmentHTML + '</div>' : "";
	
	        var innerConditionHTML = $_mailAttachment.files.length >= 1 ? '<div class="attachments">' + $innerAttachmentHTML + '</div>' : "";
	
	        var attachmentIcon = $_mailAttachment.files.length >= 1 ? '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip attachment-indicator"><path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path></svg>' : "";
	
			var sendId = '${mbrId}';
			console.log('sendId', sendId);
	
			$.ajax({
				url : '/user/email/insert',
				data : {'emlSndr': $_mailId, 
						'emlTtl': $_mailSubject, 
						'emlCtnt': $_mailDescriptionText, 
						'rcvrEmlAddr': $_mailTo },
				type : 'post',
				success : function(res){
					//alert("메일 보내기 성공");
					
					
					//sock.send();
					
					//console.log(formData);
					
					
						$.ajax({
							url : '/user/email/insertFile',
							data : formData,
							contentType: false,               
						    processData: false,               
							type : 'post',
							success : function(res){
								//alert("파일업로드성공");
							},
							error : function(xhr){
								alert("파일업로드실패 - "+xhr.status);
							}
							
						})
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'text'
			})
			
			
	
		    $("#ct").prepend($html);
		    $(".content-box > .msg-close").after($html2);
		    $('#composeMailModal').modal('hide');
		    $(".list-actions#sentmail").trigger('click');
		    swal({
		        title: '메일을 보냈습니다.',
		        type: 'success',
		        padding: '2em'
		    })
		    
		   
		    $_GET_mailItem_Reply();
			$_GET_mailItem_Forward();
			contentBoxPosition();
			stopPropagations();
			mailInboxScroll()
	        if (draftTragetID != "") {
	        	$('[data-target="'+draftTragetID+'"]').parents('.mail-item').remove();
	        	dynamicBadgeNotification('draftmail');
	        }
		});
	}
})
