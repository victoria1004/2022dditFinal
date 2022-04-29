$(function(){
//피드 목록 불러오기

//멘션
	//프로젝트 멤버 목록 가져오기
	$.ajax({
		url : "/feed/getMem.do",
	      type : "get",
	      data : {
	    	  pjtNo : pjtNo,
	      },
	      dataType : "json",
	      success:function(res){
				console.log("플젝 멤버 목록",res);
		         var str = "";
		         $.each(res, function(i, v){
		            str += '<div class="items" style=" width:150px; margin-left:100px;">';
		            str += '<div class="item-content">';
		            str += '<div class="user-profile">';
		            str += '<img src="/resources/profileImage/';
		            if (v.MBR_IMG == null){
		               str += 'profileimage.png"';
		            } else {
		               str += v.MBR_IMG +'"';
		            }
		            str += ' alt="'+v.MBR_NM+'" class="br-30" style="width:55px; height:55px; display:inline-block; margin-right:10px;"/>';
		            str += '<div class="user-meta-info" style="display:inline-block;">';
		            str += '<p class="user-name" style="font-size:17px; display:inline-block; margin-right:10px" data-name="'+v.MBR_NM+'">'+v.MBR_NM+'</p>';
		            str += '</div></div>';
		            str += '<div class="action-btn" dataId="'+v.MBR_ID+'" dataNm="'+v.MBR_NM+'">';        
		            str += '</div></div></div>';
		         })
		         $(".autoMaker").html(str);
				
	      }
		
	})
	
})
	
	//댓글창에서 키 입력 시 아래 목록 나오게
	function getAutomaker(event){
		var keyCode = event.keyCode;
// 		alert(keyCode);
	    
	    //댓글창에 @입력 시 목록 나오기
		if(keyCode == 50){
			//작성중인 input찾기
			var v_input = event.target;
			
			//작성중인 input의 클래스명을 바꾼다.
			v_input.className = "skillsChange form-control col-md-10 mx-auto";
			
			//바꾼 클래스 명 밑에 숨어있는 멤버목록 보이게
			var memList = document.querySelector(".skillsChange").nextElementSibling;
			memList.style.display='block';
		}
	}
	//멘션 멤버 선택시
	$(document).on("click", ".user-profile",function(e){
		
		//사용자 이름 가져오기
		var name = $(this).find(".user-name").text();
		console.log(name);
		
		//사용자 아이디 가져오기
		var selectedId = $(this).parent().find(".action-btn").attr("dataId");
		console.log(selectedId);
		
// 	     //작성중인 창에 해당 값 추가

	     var con = "<span id='men' class='badge badge-pills outline-badge-primary' style='margin-left:10px;'>"
	     con += $(".skillsChange").html();
	     con += name;
	     con += "</span>";
	     con += "&nbsp";
	     $(".skillsChange").empty();
	     con += $(".skillsChange").html();
	     $(".skillsChange").empty();
	     $(".skillsChange").html(con);
	     
	     //div 숨기기
	     $(".autoMaker").hide();
	      
	      //알림을 위해 컨트롤러로 멘션 아이디, 이름 보내주기
	      userId.push(selectedId);
	})	
	
	
	
	
	
	
	