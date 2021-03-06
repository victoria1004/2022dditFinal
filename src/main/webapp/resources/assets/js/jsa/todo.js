//모든 일감 가져오기
function getAllTds(flag, pjtNo, mbrId, currentPage, keyword, finish, stts, impr){
	console.log("flag:",flag,"mbrId:",mbrId,"pjtNo:",pjtNo,"finish:",finish,"stts:",stts,"impr:",impr);
	var data = {}
	switch(flag){
		case 1: //모든 목록
			//console.log("ppp");
			data.pjtNo = pjtNo;
			break;
		case 2: //내일감보기 체크했을때
			data.pjtNo = pjtNo;
			data.mbrId = mbrId;
			break;
		case 3: //페이징처리
			data.pjtNo = pjtNo;
			data.currentPage = currentPage;
			break;
		case 4: //일감 검색
			data.pjtNo = pjtNo;
			data.currentPage = currentPage;
			data.keyWord = keyword;
			break;
		case 5: //완료된 일감 검색
			data.pjtNo = pjtNo;
			data.finish = finish;
			break;
		case 6: //진행상태 선택
			data.pjtNo = pjtNo;
			data.stts = stts;
			break;
		case 7: //중요도 선택
			data.pjtNo = pjtNo;
			data.impr = impr;
			break;
			
	}
	console.log("data", data);
	
	$.ajax({
	
		url : "/project/getAllTodos",
		data : data,
		type : "post",
		success : function(res){
			var list = document.querySelectorAll(".center");
			if(list){
				$(list).remove();
			}
			//console.log(res.list);
			var str = '';
			
			//목록 뿌리기
			var list = res.list.content;
			
			if (list.length == 0){
				str += '<tr><td style="position:relative; left: 420px;">일감이 없습니다.</td></tr>"';
			}
			
			for(var i = 0; i < list.length; i++){
				var v = list[i];
				//console.log("v", v);
				str += '<tr role="row">';
				str += '<td style="padding-left:20px;" class="sorting_1">'+v.TD_CTGR_CD+'</td>';
				str += '<td><a href="/project/todoDetail.do?pjtNo='+v.PJT_NO+'&tdNo='+v.TD_NO+'">'+v.TD_TTL+'</a></td>';
				str += '<td style="padding-left:20px;">'+v.TD_STTS+'</td>';
				str += '<td class="sorting_1"><div class="progress br-30">';
				str += '<div class="progress-bar bg-gradient-danger" role="progressbar" ';
				str += 'style="width:'+parseInt(v.PRGRS)+'%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>';
				str += '</div></td><td style="padding-left:30px;">';
				if(v.TD_IMPR_CD == '긴급'){
					str += '<span class="badge badge-pills badge-danger">'+v.TD_IMPR_CD+'</span>';
				}
				if(v.TD_IMPR_CD == '중요'){
					str += '<span class="badge badge-pills outline-badge-danger">'+v.TD_IMPR_CD+'</span>';
				}
				if(v.TD_IMPR_CD == '보통'){
					str += '<span class="badge badge-pills outline-badge-primary">'+v.TD_IMPR_CD+'</span>';
				}
				if(v.TD_IMPR_CD == '낮음'){
					str += '<span class="badge badge-pills outline-badge-dark">'+v.TD_IMPR_CD+'</span>';
				}
				//str += +v.TD_IMPR_CD+'</td>';
				str += '<td style="padding-left:20px;">';
				str += '<img title="'+v.TD_PIC_ID+'" width="40px;" height="40px;" src="/resources/profileImage/'+v.MBR_IMG+'" class="rounded-circle">&nbsp;&nbsp;&nbsp;'+v.TD_PIC_ID+'</td>';
				str += '</tr>';
			}
			$("tbody").html(str);
			
			//페이지 수 세팅
//			var pageStr = '전체 ' + res.list.endPage + '페이지 중 ' + res.list.currentPage + '페이지';
//			$("#style-2_info").text(pageStr);
			
			//페이징 처리
			for(var j = res.list.endPage; j >= res.list.startPage; j--){
				//console.log("j"+j);
				var li = document.createElement("li");
				li.setAttribute("class", "center");
				
				var aTag = document.createElement("a");
				aTag.setAttribute("aria-controls", "dataTable");
				aTag.setAttribute("data-dt-idx", "1");
				aTag.setAttribute("tabindex", "0");
				aTag.innerText = j;
				aTag.addEventListener("click", setActive);
				
				if(j == res.list.currentPage){ //현재 페이지 활성화
					li.classList.add('active');
				}
				li.appendChild(aTag);
				var prev = document.querySelector(".prev");
				prev.parentNode.insertBefore(li, prev.nextSibling);
			
			}
			
		} //success	
	});
}


//페이지 클릭 시
function setActive(){
	var prev = $(this).parent().prev();
	prev.removeClass("active");
	
	$(this).parent().addClass("active");
	var currentPage = $(this).text();
	
	flag = 3;
	getAllTds(flag, pjtNo, mbrId, currentPage);
}


	

























//일감 담당자 선택
function getAllMbr(pjtNo, mbrId, picId){
	//console.log(picId);
	$.ajax({

		url: "/project/getMbr",
		data: {pjtNo: pjtNo, mbrId : mbrId},
		type: "post",
		success: function(res) {
			//console.log("모든멤버 가져왔니", res);
			var selectTag = document.querySelector("#tdPicId");

			$.each(res, function(i, v){
				var optionTag = document.createElement("option");
				optionTag.setAttribute("data-select2-id", v.mbrId);
				optionTag.setAttribute("name", "tdPicId");
				optionTag.setAttribute("value", v.mbrId);
				if (mbrId == v.mbrId){
					optionTag.innerText = "< 나 >";
				} else {
					optionTag.innerText = v.mbrNm;
				}

				if (picId == v.mbrNm){ //넘어온 담당자와 드롭박스 데이터의 값이 같으면 
					optionTag.selected = true;
				}
				selectTag.appendChild(optionTag);
			})
		}
	});
}

//form 제출 전에 들러서 date 잘라서 가기
function getTodo(map) {
    console.log("테스트"+map);
    
    var receiver = $("select[name=tdPicId] option:selected").val();
    
    console.log(receiver);
    sock.send(receiver);
    
    
	var selects = document.querySelectorAll("select");
	for (var i = 0; i < selects.length; i++){
		if (!selects[i].value) {
			$(selects[i]).focus();
			return false;
		}
	}

	var datas = document.querySelectorAll("input[type=text]");
	for (var i = 6; i < datas.length; i++) { //5번까지는 헤더값
		if (!datas[i].value){
			$(datas[i]).focus();
			return false;
		}
	}

	prgrs = document.querySelector("input[type=number]");
	if (!prgrs.value) {
		$(prgrs).focus();
		return false;
	}

	var selectedTd = $("input[name=tdDate]").val();
	if (!selectedTd) {
		swal({
			title: "업무 기간을 설정해주세요.",
			type: "warning",
			confirmButtonClass: "btn-danger",
			confirmButtonText: "확인",
			closeOnConfirm: true
		})
		$("input[name=tdDate]").focus();
	}

	$("input[name=tdStrtDt]").val(selectedTd.split("~")[0].trim());
	$("input[name=tdEndDt]").val(selectedTd.split("~")[1].trim());

	if (map) { //map이라는 변수에 데이터 있을 경우 = 수정인 경우
		swal({
			title: '수정 완료!',
			text: "일감이 수정되었습니다.",
			type: 'success',
			padding: '2em'
		}).then(function() {
			sock.send(map.tdPicId);
			$("#todoVO").submit();
		})
	} else {
		swal({
			title: '등록 완료!',
			text: "일감이 등록되었습니다.",
			type: 'success',
			padding: '2em'
		}).then(function() {
			$("#todoVO").submit();
		})
	}
}

//진척도 제한 경고창
var confirm = function(prgrs) {
	swal({
		title: "100 이하의 숫자만 입력 가능합니다.",
		type: "warning",
		confirmButtonClass: "btn-danger",
		confirmButtonText: "확인",
		closeOnConfirm: true
	})
}

//유형, 중요도, 진행상태 세팅
function getTodoCd(tdCtgrCd, tdImprCd, tdStts) {
	console.log(tdCtgrCd, tdImprCd, tdStts);
	$.ajax({
		url: "/project/getTodoCd",
		type: "get",
		success: function(res) {
			var ctgrTag = document.querySelector("#tdCtgrCd");
			var imprTag = document.querySelector("#tdImprCd");
			var sttsTag = document.querySelector("#tdStts");
			$.each(res, function(i, v) {
				for (var k = 0; k < v.length; k++) {
					var optionTag = document.createElement("option");
					optionTag.setAttribute("data-select2-id", v[k].cmDvsnCtgrCd);
					optionTag.setAttribute("name", "tdCtgrCd");
					optionTag.setAttribute("value", v[k].cmDvsnCtgrCd);
					optionTag.innerText = v[k].cmDvsnCtgrNm;

					//수정 시 기존 데이터와 드롭박스 데이터의 값이 같다면 선택된 걸로 보여주기
					if (tdImprCd == v[k].cmDvsnCtgrNm || tdCtgrCd == v[k].cmDvsnCtgrNm || tdStts == v[k].cmDvsnCtgrNm) {
						optionTag.selected = true;
					}

					if (v == res.tdCtgrCd) {
						ctgrTag.appendChild(optionTag);
					} else if (v == res.tdImprCd) {
						imprTag.appendChild(optionTag);
					} else {
						sttsTag.appendChild(optionTag);
					}
				}
			})
		}
	});
}


//하위 일감
function getLeaf(leaf, pjtNo) {
	var tdParent = document.querySelector("#tdCtgrCd").innerText;
	//console.log("부모", tdParent);
	tdParent = tdParent.split('#')[1];

	//console.log("getLeaf:", leaf, pjtNo, tdParent);
	$.ajax({
		url: "/project/getLeaf",
		data: { tdNo: leaf, pjtNo: JSON.stringify(pjtNo), tdParent: tdParent },
		type: "post",
		dataType: "json",
		success: function(res){
			$(".list-unstyled").empty();
			var str = "";
			str += '<div class="leafCont"><li class="media" style="margin-top:15px;"><div class="profileDiv">';
			if (res.MBR_IMG == null) {
				str += '<img class="rounded" src="/resources/profileImage/profileimage.png" title="' + res.TD_PIC_ID + '"><span class="userNm">' + res.TD_PIC_ID;
			} else {
				str += '<img class="rounded" src="/resources/profileImage/' + res.MBR_IMG + '" title="' + res.TD_PIC_ID + '"><span class="userNm">' + res.TD_PIC_ID;
			}
			str += '<span></div><div class="media-body" style="position:relative; top:-26px; right: 51px;">';
			str += '<h5 class="media-heading"><a href="/project/todoDetail.do?pjtNo=' + res.PJT_NO + '&tdNo=' + res.TD_NO + '"> #' + res.TD_NO + '</a></h5>';
			str += '<h6 style="width:500px;"><a href="/project/todoDetail.do?pjtNo=' + res.PJT_NO + '&tdNo=' + res.TD_NO + '">' + res.TD_TTL + '</a></h6>';
			str += '</div></li></div>';

			$(".list-unstyled").append(str);
		}
	})
}

//일감 삭제
function deleteTodo(tdNo) {
	swal({
		text: "일감을 삭제하시겠습니까?",
		type: "warning",
		showCancelButton: true,
		confirmButtonClass: "btn-danger",
		confirmButtonText: "예",
		cancelButtonText: "아니오",
		closeOnConfirm: false,
		closeOnCancel: true
	}).then(function(result) {
		if(result.value){ // 예 누르면!
			$.ajax({
				url: "/project/deleteTodo",
				data: {tdNo : tdNo},
				type: "post",
				success: function(res) {
					swal({
						title: '삭제 완료!',
						text: "일감이 삭제되었습니다.",
						type: 'success',
						padding: '2em'
					}).then(function() {
						location.href = "/project/todo.do?pjtNo=" + pjtNo;
					})
				}

			})
		}
	})
}







