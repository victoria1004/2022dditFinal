//승인 회원목록 가져오기
function getM02Users(keyword){
	var ctgrCd = "M02";
	$.ajax({
		url : "/user/getM02Users",
		type : "post",
		data : {keyword : keyword},
		success : function(res){
			mkMbrCard(res, ctgrCd);
		}
	});
}

//미승인 회원목록 가져오기
function getM03Users(keyword){
	var ctgrCd = "M03";
	$.ajax({
		url : "/user/getM03Users",
		data : {keyword : keyword},
		type : "post",
		success : function(res){
			mkMbrCard(res, ctgrCd);
		}
	});
}

//회원목록 카드 만드는 메서드
function mkMbrCard(res, ctgrCd){
	var str = "";
	var cd;
	if (ctgrCd == "M03"){ 
		cd = $("#left-defaults");
	} else if (ctgrCd == "M02"){
		cd = $("#right-defaults");
	} 
	cd.empty();
	$.each(res, function(i, v){

              str += '<div class="media d-md-flex d-block text-sm-left text-center" style="width : 520px;"><span>';
              str += '<label class="new-control new-checkbox checkbox-primary chkAdmin" style="display:none;">';
			  str += '<input type="checkbox" class="new-control-input" value="'+ v.mbrId +'">';
			  str += '<span class="new-control-indicator"></span></label></span>';
			  
              if (v.mbrImg == null){
              	str += '<img alt="'+v.mbrNm+'" src="/resources/profileImage/profileimage.png" class="img-fluid" style="position: relative; right: -11px;" />';              
              } else {          
	            str += '<img alt="'+v.mbrNm+'" src="/resources/profileImage/'+ v.mbrImg +'" class="img-fluid" style="position: relative; right: -11px;"  />';
              }
              str += '<div class="media-body">';
              str += '<div class="d-xl-flex d-block justify-content-between">';
              str += '<div class="mem">';
              str += '<span style="display:none;">'+v.mbrId+'</span><h6 class="">'+v.mbrNm + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + v.mbrDept;
              str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ v.mbrTelno;
			  if (v.mbrCtgrCd == 'M01'){
			  str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-pills outline-badge-primary">관리자</span></h6>';	
			    }
              str += '</div></div></div></div>';
              
	});		
	cd.append(str);
}

//승인/미승인 업데이트 - custom-dragula.js에서 여기로 넘어옴!
function updateUsers(mbrId, mbrCtgrCd){
	  $.ajax({
	  	url : "/user/updateUsersStts",
	  	type : "post",
	  	data : {mbrId : mbrId, mbrCtgrCd : mbrCtgrCd},
	  	success : function(res){
			getM02Users(); //업데이트 후에는 모든 승인/미승인 목록을 다시 뿌려준다.
			getM03Users();
	  	}
	  });
}

//관리자 세팅
function addAdmin(list){
	
	//console.log(list);
	$.ajax({
		url : "/user/addAdmin",
		data : {list : JSON.stringify(list)},
		type : "post",
		async : false,
		success : function(res){
			$("#addAdmin").hide();
			$("#setAdmin").show();
			window.location.href="/user/approvedUser.do";
			//getM02Users();
		}
	});
}

//관리자 버튼 클릭 시
function setAdmin(flag){
	console.log("flag::"+flag);
	
	var card = $("#right-defaults").find("label");
	if(flag){
		card.show();
	} else { // !flag
		card.hide();
	}
}


//관리자 승인 취소할지 확인
var confirm = function(mbrNm, mbrId) {
	swal({
			html : "선택하신 사용자  '"+ mbrNm+ "'님은 관리자입니다.<br>관리자 권한을 해제하시겠습니까?",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : false,
			closeOnCancel : true
		}).then(function(isConfirm) {
			if(isConfirm.value){
				swal('', '관리자를 해제합니다.', "success");
				$("#addAdmin").hide();
				$("#setAdmin").show();
				removeAdmin(mbrId);
				
			}else{
				swal('', '관리자 해제를 취소합니다.', "error");
				
				$("input[type=checkbox][checked]").each(function(){
					$(this).attr('checked', false);
					});
					
				setAdmin(false);
				$("#addAdmin").hide();
				$("#setAdmin").show();
			}
		})
}


//관리자 해제
function removeAdmin(mbrId){
	
	$.ajax({
		url : "/user/removeAdmin",
		data : {mbrId : mbrId},
		type : "post",
		success : function(){
			getM02Users();
		
		}
	});
}