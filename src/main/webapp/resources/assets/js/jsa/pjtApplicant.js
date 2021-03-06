
//내가 작성한 프로젝트에 참여 신청한 사용자들 목록
function getAllApplicant(mbrId){
	$.ajax({
		url : "/project/getAllApplicant",
		type : "post",
		data : {mbrId : mbrId},
		success : function(res){
			var str = "";
			$("#left-datas").empty();
			
			$.each(res, function(i,v){
				 str += '<div class="media d-md-flex d-block text-sm-left text-center getInfo" style="width : 520px;">';
		          if (v.MBR_IMG == null){
		          	str += '<img alt="'+v.MBR_NM+'" src="/resources/profileImage/profileimage.png" class="img-fluid" style="box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);" />';              
		          } else {          
		            str += '<img alt="'+v.MBR_NM+'" src="/resources/profileImage/'+ v.MBR_IMG +'" class="img-fluid" style="box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);" />';
		          }
		          str += '<div class="media-body">';
		          str += '<div class="d-xl-flex d-block justify-content-between">';
		          str += '<div class="mem">';
				  str += '<table><tr><td class="aplList" style="width:60px; text-align:left;"><span class="hdnSpan" style="display:none;">'+v.MBR_ID + ','+ v.PJT_NO+'</span>'+v.MBR_NM+'</td>';
				  str += '<td class="aplList" style="width:100px;">' + v.MBR_DEPT+'</td><td class="aplPjt" style="width:180px;">'+v.PJT_NM+'</td><td class="aplList" style="width:50px;">'+v.PJT_APPLY_DT+'</td></tr></table>';	
				  str += '</div></div></div></div>';
			})
			$("#left-datas").append(str);
			var hdnSpan = document.querySelectorAll(".hdnSpan");
			var infos = document.querySelectorAll(".getInfo");
			for(var i = 0; i < infos.length; i++){
				infos[i].addEventListener("click", getAllInfo.bind(this, hdnSpan[i])); //클릭 이벤트로 정보 상세보기 ㄱㄱ
			}
		}
	})
}

function getAllInfo(hdnSpan){
	//console.log("내가 선택한 유저와 프젝번호:", hdnSpan.innerText);
	hdnSpan = hdnSpan.innerText;
	var user = hdnSpan.split(',')[0];
	var pjtNo = hdnSpan.split(',')[1];
	//console.log("잘 잘랐니???" + user, pjtNo);
	getUser(user); //내가 선택한 유저의 신청내용 보기
	allPrtpnt(pjtNo); //선택한 유저가 신청한 프로젝트의 구성원 목록
}

function getUser(user){
	//console.log("선택자:"+user);
	$.ajax({
		url : "/project/getAllApplicant",
		data : {mbrId : mbrId, user : user}, //세션 접속자랑 접속자가 선택한 userId 
		type : "post",
		success : function(res){
			var v = res[0]; 
			var str = '';
			str += '<div class="totalDiv"><div class="applyDiv">';
			str += '<div class="user-profile" style="z-index: none;">';
			if(v.MBR_IMG == 'null'){
			   str += '<img class="selfImg" src="/resources/profileImage/profileimage.png" title="'+v.MBR_NM+'" >';
			} else {
			   str += '<img class="selfImg" src="/resources/profileImage/'+v.MBR_IMG+'" title="'+v.MBR_NM+'" >';
			}	
			str += '</div><div class="">';
			str += '<span class="nameSpan">'+v.MBR_NM+'</span>';
			str += '<span class="meta-time-date" style="position: relative; top: -26px; right: -6px;">신청일 '+v.PJT_APPLY_DT+'</span>';
			str += '<div class="cnDiv">'+v.PJT_APPLY_CN+'</div></div></div>';
			str += '<div class="buttonsDiv"><input type="hidden" value="'+v.MBR_ID +','+ v.PJT_NO +'"><button class="btn btn-outline-primary mb-2" data-toggle="modal" data-target="#deny">거절</button>&nbsp;&nbsp;';
	        str += '<button class="btn btn-outline-primary mb-2" data-toggle="modal" data-target="#accept">승인</button></div></div>';
			
			$(".applyInfo").html(str);
		}
	})
}




//프로젝트 구성원 목록
function allPrtpnt(pjtNo){
	$.ajax({
		url : "/project/allPrtpnt",
		data : {pjtNo : pjtNo},
		type : "post",
		dataType : "json",
		success : function(res){
			var str = '';
			$.each(res, function(i, v){
			  $("#pjtHeader").text(v.PJT_NM + " 구성원");
              str += '<div class="media d-md-flex d-block text-sm-left text-center" style="width : 520px;">';
              if (v.MBR_IMG == null){
              	str += '<img alt="'+v.MBR_NM+'" src="/resources/profileImage/profileimage.png" class="img-fluid" style="box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);" />';              
              } else {          
	            str += '<img alt="'+v.MBR_NM+'" src="/resources/profileImage/'+ v.MBR_IMG +'" class="img-fluid" style="box-shadow: 0 0px 0.9px rgb(0 0 0 / 7%), 0 0px 7px rgb(0 0 0 / 14%);"/>';
              }
              str += '<div class="media-body">';
              str += '<div class="d-xl-flex d-block justify-content-between">';
              str += '<div class="mem">';
              str += '<span style="display:none;">'+v.MBR_ID+'</span><h6 class="">'+v.MBR_NM + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + v.MBR_DEPT;
              str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ v.MBR_TELNO;
			  str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-pills outline-badge-primary">'+ v.PJT_PRTPNT_RL +'</span></h6>';	
              str += '</div></div></div></div>';
			});		
			$("#right-defaults").html(str);
		}
	})
}


//신청 승인 시
function becomePrtpnt(){
	
	var role = $("input[type=radio]:checked").val(); //선택한 역할
	var data = $(".buttonsDiv").find("input").val(); //신청자 아이디와 프로젝트 번호
	var mbrId = data.split(',')[0];
	var pjtNo = data.split(',')[1];
	console.log(data);
	
	$.ajax({
		url : "/project/becomePrtpnt",
		data : {mbrId : mbrId, role : role, pjtNo : pjtNo},
		type :"get",
		success : function(res){
			getAllApplicant(mbrId); //신청목록 다시 리셋
			$(".applyInfo").html(""); //신청 정보 리셋
			allPrtpnt(pjtNo); //구성원 목록을 다시 보여준다.
		}
	})
}



//신청 거절!!
function deny(){
	var rsn = $("#denyContent").val();
	var data = $(".buttonsDiv").find("input").val();
	var user = data.split(',')[0];
	var pjtNo = data.split(',')[1];
	
	$('#deny').modal('hide');
	$.ajax({
		url : "/project/denyUser",
		data : {user : user, pjtNo : pjtNo, rsn : rsn},
		type : "post",
		success : function(res){
			getAllApplicant(mbrId); //거절 시에는 신청목록 다시 리셋
			$(".applyInfo").html(""); //신청 정보 리셋
			$("#right-defaults").html(""); //프젝 구성원 리셋
			$("#pjtHeader").text("프로젝트 구성원");
		}
	})
}




