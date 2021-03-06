









function asideMake(sessionNo){
	if(sessionNo != null && sessionNo != '9005'){
	   var num = "";
	   var str = "";
	   $.ajax({
		   url: "/aside/projectSubmenu",
		   type: "post",
		   data: {"sessionNo" : sessionNo},
		   success: function(res){
			   str += "<ul class='submenu-list' style='font-size: 17px; list-style:none; padding-left:0px; padding-top: 20px;'>";
			   $.each(res, function(i, v){
				   num = v.PJT_NO;
			   })
			   if(window.localStorage.getItem("active")=='일감'){
				   str += "<li class='active'>";
			   }else{
				   str += "<li>";
			   }
			   str += "<a class='whiteFont' href='/project/todo.do?pjtNo=" + num + "' ><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-layers'><polygon points='12 2 2 7 12 12 22 7 12 2'></polygon><polyline points='2 17 12 22 22 17'></polyline><polyline points='2 12 12 17 22 12'></polyline></svg>&nbsp; 일감</a></li>";
			  
			   if(window.localStorage.getItem("active")=='업무보고'){
				   str += "<li class='active'>";
			   }else{
				   str += "<li>";
			   }
			   str += "<a class='whiteFont' href='/project/report.do?pjtNo=" + num + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-file-text'><path d='M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z'></path><polyline points='14 2 14 8 20 8'></polyline><line x1='16' y1='13' x2='8' y2='13'></line><line x1='16' y1='17' x2='8' y2='17'></line><polyline points='10 9 9 9 8 9'></polyline></svg>&nbsp; 업무보고</a></li>";
			   
			   if(window.localStorage.getItem("active")=='드라이브'){
				   str += "<li class='active'>";
			   }else{
				   str += "<li>";
			   }
			   str += "<a class='whiteFont' href='/cloud/main.do?pjtNo=" + num + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-cloud'><path d='M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z'></path></svg>&nbsp; 드라이브</a></li>";
			   
			   $.each(res, function(i, v){
				   if(window.localStorage.getItem("active")==v.CM_DVSN_CTGR_NM){
					   str += "<li class='active'>";
				   }else{
					   str += "<li>"; 
				   }
				   if(v.LYT_NO == 'L01'){
					   str += "<a class='whiteFont' href='/project/gantt.do?pjtNo=" + v.PJT_NO + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-sliders'><line x1='4' y1='21' x2='4' y2='14'></line><line x1='4' y1='10' x2='4' y2='3'></line><line x1='12' y1='21' x2='12' y2='12'></line><line x1='12' y1='8' x2='12' y2='3'></line><line x1='20' y1='21' x2='20' y2='16'></line><line x1='20' y1='12' x2='20' y2='3'></line><line x1='1' y1='14' x2='7' y2='14'></line><line x1='9' y1='8' x2='15' y2='8'></line><line x1='17' y1='16' x2='23' y2='16'></line></svg> &nbsp;" + v.CM_DVSN_CTGR_NM + "</a>"
				   } else if(v.LYT_NO == 'L02'){
					   str += "<a class='whiteFont' href='/project/calendar.do?pjtNo=" + v.PJT_NO + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-calendar'><rect x='3' y='4' width='18' height='18' rx='2' ry='2'></rect><line x1='16' y1='2' x2='16' y2='6'></line><line x1='8' y1='2' x2='8' y2='6'></line><line x1='3' y1='10' x2='21' y2='10'></line></svg> &nbsp;" + v.CM_DVSN_CTGR_NM + "</a>"
				   } else if(v.LYT_NO == 'L03'){
					   str += "<a class='whiteFont' href='/project/kanban.do?pjtNo=" + v.PJT_NO + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-trello'><rect x='3' y='3' width='18' height='18' rx='2' ry='2'></rect><rect x='7' y='7' width='3' height='9'></rect><rect x='14' y='7' width='3' height='5'></rect></svg> &nbsp;" + v.CM_DVSN_CTGR_NM + "</a>"
				   } else if(v.LYT_NO == 'L04'){
					   str += "<a class='whiteFont' href='/feed/main.do?pjtNo=" + v.PJT_NO + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-zap'><polygon points='13 2 3 14 12 14 11 22 21 10 12 10 13 2'></polygon></svg> &nbsp;" + v.CM_DVSN_CTGR_NM + "</a>"
				   } else if(v.LYT_NO == 'L05'){
					   str += "<a class='whiteFont' href='/project/issuemain.do?pjtNo=" + v.PJT_NO + "'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-alert-circle'><circle cx='12' cy='12' r='10'></circle><line x1='12' y1='8' x2='12' y2='12'></line><line x1='12' y1='16' x2='12.01' y2='16'></line></svg> &nbsp;" + v.CM_DVSN_CTGR_NM + "</a>"
				   }
					str += "</li>";
			   })
			   
			   str += "</ul>";
			   $('#submenu').html(str);
		   },
	   })
   } else if(sessionNo == '9005'){
  	 var str = '';
     str += "<ul class='submenu-list' style='font-size: 17px; list-style:none; padding-left:0px; padding-top: 20px;'>";

     	   
     	   if(window.localStorage.getItem("active")=='팀원모집 관리'){
		   str += "<li class='active'>";
		   }else{
		   
			   str += "<li>";
		   }
		   str += "<a class='whiteFont' href='/project/pjtApply.do' ><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-layers'><polygon points='12 2 2 7 12 12 22 7 12 2'></polygon><polyline points='2 17 12 22 22 17'></polyline><polyline points='2 12 12 17 22 12'></polyline></svg>&nbsp;팀원모집 관리</a></li>";
		  	
     	   if(window.localStorage.getItem("active")=='내 신청 목록'){
		   str += "<li class='active'>";
		   }else{
			   str += "<li>";
		   }
		   str += '<a class="whiteFont" href="/project/applyList.do" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>&nbsp;내 신청 목록</a></li>';

		   str += '</ul>';
     
     
   $('#submenu').html(str);

   } else {
	   $('#submenu').hide();
   }
   $(document).on('click', '.submenu-list li', function(){
	   window.localStorage.setItem("active", $.trim($(this).text()))
   })
}