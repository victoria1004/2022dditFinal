
//파일 업로드 시 파일크기 확인
function checkExtension(fileSize){

	var maxSize = 20971520; // 20MB로 최대크기 지정
 
   if(fileSize > maxSize){
   	 confirm(fileSize);
    // alert("파일 사이즈 초과");
     return false;
   }
  return true;
}

// alert 창 function
var confirm = function(fileSize) {
		swal({
			title : "파일 사이즈 초과",
			html : "20MB 이하의 파일만 업로드 가능합니다.<br>현재 파일 크기는 "+ Math.round((fileSize/1024/1024)*100)/100 +"MB 입니다.",
			type : "warning",
			confirmButtonClass : "btn-danger",
			confirmButtonText : "확인",
			closeOnConfirm : true
		})
	}


//파일 업로드
function fileUpload(){
	
	var formData = new FormData();
	var inputFile = $("input[name='files']");
	var files = inputFile[0].files; //fileList 꺼내기
	
	for(var i = 0; i < files.length; i++){
		if(!checkExtension(files[i].size)){ //저장하는 파일 사이즈가 최대사이즈 넘는지 확인
			return false;
		}
		formData.append("files", files[i]);
	}	
	
	var arrList = document.querySelector("#hdn").value;
	formData.append("folderNm", arrList);
	formData.append("pjtNo", pjtNo);
	
	
	$.ajax({
		type : "post",
		url : "/cloud/fileUpload",
		processData: false,
	    contentType: false,
	    data: formData,
	    success : function(res){
	
			$("#addTaskModal").modal('hide');
			window.location.reload();
			$("#fileLabel").text("");
	    },
	    error : function(err){
	    	console.log("error:",err);
		}
	});	
}

//상위폴더 클릭 시 하위폴더에 접근
function f_jsa1(){
	var folderNm = this.innerText;
	
	// hidden 타입에 선택하는 폴더경로 세팅
	var hdn = document.querySelector("#hdn");
	var bfVal = hdn.value;
	hdn.setAttribute("value", bfVal + '\\' + folderNm);
	
	//선택한 폴더명으로 하위폴더로 접근
    getLowFolders(folderNm);
}


//파일업로드 창이나 폴더생성창 클릭 시 현재 접속한 폴더(상위폴더)를 보여준다.
function getFolder(pjtNo, pjtNm){
		
	$.ajax({
	
		type:"post",
		url:"/cloud/getFolder",
		data : {"pjtNo":pjtNo, "folderNm" : pjtNm},
		success : function(res){
			console.log("getFolder의 결과:" + JSON.stringify(res));
			document.querySelector("#arrayList").innerHTML = "";
			
			var v_div = document.createElement("div");
			v_div.setAttribute("class","parent-folder");
		
			var v_chDiv1 = document.createElement("div");
			v_chDiv1.setAttribute("class","top-folder");
			v_chDiv1.innerHTML='<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>';
			
			var v_chDiv2 = document.createElement("div");
			v_chDiv2.setAttribute("class","btm-folder");
			v_chDiv2.innerHTML = res;			
			v_div.appendChild(v_chDiv1);
			v_div.appendChild(v_chDiv2);
			v_div.addEventListener("click",f_jsa1.bind(v_chDiv2));

			document.querySelector(".folderList").innerHTML="";
			document.querySelector(".folderList").appendChild(v_div);
			
		},
		error : function(res){
			alert("error",res);
		}
	})
}

//하위폴더 목록 가져오기
function getLowFolders(folderNm){
	
	$.ajax({
	
		url : "/cloud/getLowFolders",
		type : "post",
		data : {pjtNo: pjtNo,"folderNm" : folderNm},
		dataType : "json",
		success : function(res){
				
			document.querySelector(".folderList").innerHTML = "";
						
			for(var i = 0; i < res.length; i++){
			
				var v_div = document.createElement("div");
				v_div.setAttribute("class", "parent-folder");
				
				var v_div1 = document.createElement("div");
				v_div1.setAttribute("class", "top-folder");
				v_div1.innerHTML='<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>';
				
				var v_div2 = document.createElement("div");
				v_div2.setAttribute("class", "btm-folder");
				v_div2.innerHTML = res[i].leafFolder;
				
				console.log(res[i]);
				v_div.appendChild(v_div1);
				v_div.appendChild(v_div2);
				
				v_div.addEventListener("click", f_jsa1.bind(v_div2));

				document.querySelector(".folderList").appendChild(v_div);
			}

			var arrStr = document.createElement("span");
			arrStr.innerHTML = folderNm + '<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke:currentColor;"><polyline points="9 18 15 12 9 6"></polyline></svg>';
			document.querySelector("#arrayList").appendChild(arrStr);

		},
	 	error : function(res){
	 		alert("+++error===");
	 	}	
	});
}


//폴더 생성
function addFolder(){

	var path = document.querySelector("#hdn").value; //파일경로
	var leafFolder = document.querySelector("input[name=leafFolder]").value; //생성할 폴더명
	console.log("프젝번호떠라", pjtNo);

	$.ajax({
	
		url : "/cloud/mrDirs",
		data : {"leafFolder" : leafFolder, "path" : path, "pjtNo": pjtNo},
		type : "post",
		success:function(res){
			
			$("#addTaskModal").modal('hide');
			window.location.reload();		
					
		},
		error:function(res){
			alert("mkdirs failed");
		}
	});
}

//파일 삭제
function fileDelete(strgFileNo){
	console.log("삭제할 파일명:", strgFileNo);
	$.ajax({
		url:"/cloud/fileDelete",
		data : {"strgFileNo":strgFileNo},
		type : "post",
		success : function(res){
			//$(".allFiles").load("/cloud/cloud.do .allFiles");
			window.location.reload();
		}
	})
}


//파일 목록 가져오기
function getAllFiles(pjtNo, start, end){
	$.ajax({
		url:"/cloud/cloud.do",
		data:{"pjtNo":pjtNo, "start": start, "end": end},
		type:"get",
		success:function(res){
			getfileList(res);		
		}
	})
}

//파일 업로드 시 파일명 가져와서 input file에 넣어주기
function getFileNm(){

	var fileNm = document.querySelector("input[name='files']").files;
	var labelNm = document.querySelector("#fileLabel");
	labelNm.innerText = "";
	var str = "";
	for(var i = 0; fileNm.length; i++){
		var str = fileNm[i].name + ' ';
		labelNm.append(str);
	}

}

//검색한 파일 목록 가져오기
function searchFiles(pjtNo,fileNm){
	$.ajax({
		url:"/cloud/cloud.do",
		data:{"pjtNo":pjtNo, "fileNm":fileNm},
		type:"get",
		success:function(res){
		   $(".allFiles").empty();
			getfileList(res);
		}
	})
}

//모든 파일 목록 출력하기
function getfileList(res){
	var result = "";
	$.each(res, function(i,v){
		//console.log("getfileList:", v);
	  		result += '<div class="filelist">';
			result += '<div class="dropdown dropup custom-dropdown">';
			result += '<div class="dropdownbox">';
			result += '<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
			result += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical">';
			result += '<circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></a>';
			result += '<div class="dropdown-menu" aria-labelledby="dropdownMenuLink-1" style="will-change: transform; width:100px;">';
			result += '<a id="downClick" class="dropdown-item" href="/cloud/fileDownload?strgFileNo='+v.strgFileNo+'">';
			result += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download-cloud">';
			result += '<polyline points="8 17 12 21 16 17"></polyline><line x1="12" y1="12" x2="12" y2="21"></line></svg> 다운로드 </a>';
			if(v.fileUploader == mbrId){
				result += '<a class="dropdown-item" href="#" onclick="fileDelete('+v.strgFileNo+')">';
				result += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">';
				result += '<polyline points="3 6 5 6 21 6"></polyline>';
				result += '<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>';
				result += '<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> 파일삭제 </a>';
			}
			result += '</div></div></div>';
			result += '<div class="icon-svg">';
			result += '<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file">';
			result += '<path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg></div>';
			result += '<div class="file-title"><span>'+ v.fileNm.substr(0,13)+'</span><br/></div></div>';
			})
			$(".allFiles").append(result);			
	}

//최상위 폴더명 가져와서 좌측 메뉴에 넣어주기
function getParentFolder(pjtNm){
	
 	//추후 세션에서 pjtNm만 꺼내와서 넣어준다.

	var list = document.createElement("li");
	list.setAttribute("class", "file-tree-folder");	
	list.setAttribute("onclick", "dirOpen($(this));");
	list.style.height = "500px";
	const textNode = document.createTextNode(pjtNm);
	list.appendChild(textNode);
	document.querySelector(".file-tree").append(list);
}

//좌측 메뉴 클릭시 해당 폴더 관련된 파일들 가져오기
function getfldrFiles(pjtNo,folderNm){
	$.ajax({
		url:"/cloud/cloud.do",
		data:{"pjtNo":pjtNo, "folderNm":folderNm},
		type:"get",
		async : false,
		success:function(res){
			console.log(">>>>",res);
		  // $(".allFiles").empty();
			getfileList(res);
		}
	});
}

//좌측 메뉴 클릭시 해당 폴더의 하위 폴더목록 가져오기
function getLeaf(pjtNo, folderNm){
	$.ajax({
		url:"/cloud/getLeaf",
		data:{"pjtNo":pjtNo, "folderNm":folderNm},
		type:"get",
		async : false,
		success:function(res){
			$(".allFiles").empty();

			if(res.length > 1){
				var result = "";
				$.each(res, function(i,v){
			  		result += '<div class="fldrList">';
					result += '<div class="icon-svg">';
					result += '<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder">';
					result += '<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg></div>';
					result += '<div class="file-title"><span>'+ res[i]+'</span></div></div>';
					})
					$(".allFiles").append(result);	
					getfldrFiles(pjtNo,folderNm);		
			}
			}
	});
}



function folderList(str, folderArr, data){
	
	console.log("data : " + data);
	if(folderArr==null || folderArr.length==0) return;
	
	if(folderArr[0]==0){
		str += ''
	}else{
		str += '<ul class="hugUl">';
	}
	
	for(var j=0; j<folderArr.length; j++){
		let tempArr = [];
		var tmpLeafFolder = data[folderArr[j]].leafFolder;
		str += '<li class="file-tree-folder"><span class="leafNm" onclick="dirOpen($(this))">' + tmpLeafFolder + '</span>';
		for(var i=folderArr[j]+1; i<data.length; i++){
			if(data[i].parentFolder==tmpLeafFolder){
				tempArr.push(i);
			}
		}
		console.log("하위폴더세팅:"+tempArr);
		if(tempArr.length>0){
			str = folderList(str, tempArr, data);
		}
	}
	str += "</li>";
	str += "</ul>";
	
	return str;
}	
	



//해당 프로젝트의 모든 폴더를 가져온다.
function getAllLeafFolders(pjtNo, pjtNm){

	$.ajax({
	
		url : "/cloud/getAllLeafFolders",
		data : {"pjtNo":pjtNo, "pjtNm" : pjtNm},
		type : "post",
 		async: false,
		success : function(res){
			console.log("결과:",res);			
			var foldArr = [];			
			foldArr.push(0);			
			var str = '';			
			str = folderList(str, foldArr, res);
			$("ul.file-tree").html(str);		
		}
	});
}

