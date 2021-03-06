<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import='java.util.Random'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="people ps ps--active-y">
<form name="usersForm" action="/chat/chatMain.do">
	<c:forEach var="ChatRoomVO" items="${list}">
    <div class="person" data-chat="${ChatRoomVO.chatrmNo }">
        <div class="user-info">
            <div class="f-head">
                <img src="/resources/assets/img/doit.png" alt="avatar">
            </div>
            <div class="f-body">
                <div class="meta-info">
                    <span class="user-name" data-name="${ChatRoomVO.chatrmNm }">${ChatRoomVO.chatrmNm }</span>
                </div>
                	<span class="preview">${ChatRoomVO.chatList[fn:length(ChatRoomVO.chatList) - 1].chatCn }</span>
            </div>
        </div>
    </div>
    </c:forEach>
	<div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; height: 722px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 502px;"></div></div>
</form>
<div style="bottom:20px; width: 100%; text-align: center; position: sticky">
	<button id="chatRoomBtn" class="btn btn-dark mb-2 mr-2 rounded-circle" data-toggle="modal" data-target="#chatRoomModalCenter">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
		</svg>
	</button>
</div>
</div>