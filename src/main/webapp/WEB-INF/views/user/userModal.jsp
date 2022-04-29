<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/structure.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/plugins/animate/animate.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" class="structure">
<link href="/resources/assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" class="structure">
<link rel="stylesheet" type="text/css" href="/resources/assets/css/forms/theme-checkbox-radio.css">
<link href="/resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"> 
 <link href="/resources/assets/css/apps/contacts.css" rel="stylesheet" type="text/css">
 <style>
 #mbrCollect {
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
 .searchable-items {
 	overflow: auto;
	height : 400px; 
 }
 .searchable-items::-webkit-scrollbar{ 
	display:none;

}
 
 
 
 
 </style>
<script>
$(function(){
   //모든 멤버 목록 가져오기
   $.ajax({
      url : "/user/getUser.do",
      type : "get",
      dataType : "json",
      success:function(res){
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
   })
})

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
      $(chDiv).data("toggle","true");   // jQuery data메소드가 조금 특별 메모리상에서 처리   
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
      getId.setAttribute("id","mbrId");
      getId.setAttribute("value",selectedId);

   if(p_opt){
      list.innerText = selectedNm;
      list.appendChild(getId);
       $("#mbrCollect").append(list);   
   }else{
      for (var i = 0; i < findit.length; i++) {
         if ($(findit[i]).text() == selectedNm) {
            $(findit[i]).remove();
          }
       }
   }
}
   
//사용자 추가 후 완료 버튼 클릭 시 
   function addUser() {

      var input = []; //id값 저장할 배열
      var frm = document.frm;
      var selectedList = document.querySelectorAll(".memList");
      
      for(var i = 0; i < selectedList.length; i++){
    	 var selectedId = selectedList[i].childNodes[1].value; //0번째 차일드노드에는 이름이 들어간다.
    	 console.log(">>>", selectedId);
         input.push(selectedId);
      }	
      
      console.log(input);
      
      $.ajax({
         url : "/user/addMember",
         type : "post",
         data : {"data" : JSON.stringify(input)},
         dataType : "json",
         success : function(res) {
            console.log("RES",res);
         }
      })

   }

   //검색 시 이름 조회
   $(document).on("keyup", "#input-search", function() {
      var keyword = $(this).val();
      searchNm(keyword);
   })

   //검색 시 이름 조회
   function searchNm(keyword) {
      $.ajax({
         url : "/user/getUser",
         data : {
            keyword : keyword
         },
         type : "get",
         success : function(res) {
            console.log("success");
         }
      })
   }
</script> 
    
<div class="widget-content searchable-container list" style="height : 800px; margin-top : 200px;">
<div class="row" >
    <div class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
            <div class="action-btn">
              <div style="width:330px;">
                <input type="text" class="form-control product-search" id="input-search" placeholder="멤버를 검색하세요">
              </div>
            </div>
    </div>
</div>
<div class="searchable-items list" style="overflow:auto;">
    </div>
    <form name="frm" action="#" method="post">
      <div id="mbrCollect">
         <div id="imgDiv">
         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
         </div>
      </div>
      <div style="height : 50px; width : 330px; text-align : right;">
      <button onclick="addUser()" type="button" class="btn btn-outline-primary mb-2">완료</button>
      </div>
    </form>
</div>


<script src="/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="/resources/assets/js/papper.min.js"></script>
<script src="/resources/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/js/app.js"></script>
<script>
        $(document).ready(function() {
            App.init();
        });
</script>
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/assets/js/scrollspyNav.js"></script>
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/resources/assets/js/apps/contact.js"></script>