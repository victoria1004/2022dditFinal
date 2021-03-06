function list() {
	$.ajax({
		url : "/user/getUser.do",
		type : "get",
		dataType : "json",
		success:function(res){
			getMem(res);
		}
	})
}

function getMem(res){
	console.log("res!!",res);
	var str = "";
	$.each(res, function(i, v){
		str += '<div class="items">';
		str += '<div class="item-content">';
		str += '<div class="user-profile">';
		str += '<img src="/resources/profileImage/';
		if (v.mbrImg == null){
			str += 'profileimage.png"';
		} else {
			str += v.mbrImg +'"';
		}
		str += ' alt="'+v.mbrNm+'" />';
		str += '<div class="user-meta-info">';
		str += '<p class="user-name" data-name="'+v.mbrNm+'">'+v.mbrNm+'</p>';
		str += '<p class="user-work" data-occupation="'+v.mbrDept+'">'+v.mbrDept+'</p></div></div>';
		str += '<div class="action-btn" dataId="'+v.mbrId+'" dataNm="'+v.mbrNm+'">';     	
		str += '<a style="cursor:pointer;" data-toggle="true" onclick="changeIcon()">';
		str += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>';
		str += '</a></div></div></div>';
	})
	$(".searchable-items").html(str);
}


//멤버 추가 버튼 클릭시 버튼 모양 바뀌기
function changeIcon(){
	var chDiv = $(event.target).closest("a")[0];
	var selection = $(event.target).parents(".action-btn");
	var selectedNm = selection.attr("dataNm");
	var selectedId = selection.attr("dataId");
	var selectedIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>';
	var icon = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>';
	var v_add = false; //추가안한다!!
	
	if(!$(chDiv).data("toggle")){
		$(chDiv).html(icon);
		$(chDiv).data("toggle","true");	// jQuery data메소드가 조금 특별 메모리상에서 처리	
	} else {
		$(chDiv).html(selectedIcon);
		$(chDiv).data("toggle","");
		v_add = true; //추가할거다!!
	}
		selectMem(selectedNm,selectedId,v_add); // memList div로 생성할 function
}

//선택된 이름 추가
function selectMem(selectedNm,selectedId,p_opt){
	console.log(selectedNm,selectedId,p_opt);
	
	var findit = document.querySelectorAll(".memList");
	
	if(findit.length > 10){ //추가인원 제한 
		return;
	}
	var list = document.createElement("div");
		list.setAttribute("class", "memList");
		
	var getId = document.createElement("input");
		getId.setAttribute("type","hidden");
		getId.setAttribute("name","mbrId");
		getId.setAttribute("value", selectedId);

	if(p_opt){
		list.innerText = selectedNm;
		list.appendChild(getId);
 		$(".mbrCollect").append(list);	
	}else{
		for (var i = 0; i < findit.length; i++) {
			if ($(findit[i]).text() == selectedNm) {
				$(findit[i]).remove();
		    }
	    }
	}
}
	
//사용자 추가 후 Next 버튼 클릭 시 
function addUser() {
	var input = [];
	var frm = document.frm;
	var selectedList = document.querySelectorAll(".memList");
	for(var i = 0; i < selectedList.length; i++){
		input.push(selectedList[i].lastChild.value);
	}
	$('#chatMember').css('display', 'none');
	$('#chatRoom').css('display', 'block');
	
	displayUser(input);
}

// 선택된 사용자 프로필 사진 출력
function displayUser(input) {
	console.log(input);
	$.ajax({
		url : "/user/addMember",
		type : "post",
		data : {"data" : JSON.stringify(input)},
		success : function(res){
			var str = ""
			$.each(res, function(i, v){
				str += "<div class='avatar translateY-axis'>"
				str += "<img alt='"+v.mbrId+"' src='"+v.mbrImgPath.substr(66)+"\\"+v.mbrImg+"' class='rounded-circle bs-tooltip' data-original-title='"+v.mbrNm+"' />"
				str += "</div>"
			})
			str +="<div class='notification' style='margin-left: -0.75rem;position: relative;'>";
			str +="<span class='badge badge-primary' style='border-radius: 50%; border: 1px solid white;'>"+res.length+"</span>";
			str +="</div>";
			$(".avatar--group").append(str);
		}
	})
	
}


function plusUser(){
	var input = [];
	var frm = document.frm;
	var selectedList = document.querySelectorAll(".memList");
	for(var i = 0; i < selectedList.length; i++){
		input.push(selectedList[i].lastChild.value);
	}
	var roomNum = $('#roomNum').val();
	
	const swalWithBootstrapButtons = swal.mixin({
		confirmButtonClass : 'btn btn-success btn-rounded',
		cancelButtonClass : 'btn btn-danger btn-rounded mr-3',
		buttonsStyling : false,
	})

	swalWithBootstrapButtons({
		title : '인원을 추가하시겠습니까?',
		text : "",
		type : 'warning',
		showCancelButton : true,
		confirmButtonText : 'OK',
		cancelButtonText : 'Cancel',
		reverseButtons : true,
		padding : '2em'
	}).then(function(result) {
		if (result.value) {
			swalWithBootstrapButtons('인원이 추가되었습니다', '', 'success')

			$.ajax({
				url : '/chat/plusUser',
				data : {"roomNum" : roomNum, "data" : input},
				type : 'post',
				success : function(){
					console.log("success");
					window.location.href="/chat/chatMain.do";
				}
			})

		} else if (
		// Read more about handling dismissals
		result.dismiss === swal.DismissReason.cancel) {
			swalWithBootstrapButtons('인원 추가가 취소되었습니다', '', 'error')
		}
	})
	
	$("#chatRoomModalCenter").modal('hide');
}



//검색 시 이름 조회
$(document).on("keyup", "#input-search", function() {
	var keyword = $(this).val();
	searchNm(keyword);
})

//검색 시 이름 조회
function searchNm(keyword) {
	console.log(keyword);
	$.ajax({
		url : "/user/getUser.do",
		data : {
			keyword : keyword
		},
		type : "get",
		success : function(res) {
			console.log("res",res)
			getMem(res);
		}
	})
}


	