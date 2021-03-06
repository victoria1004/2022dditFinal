<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
var websocket = null;
var first = "true";
var roomId = "";

function connection(url) {
	var websocket = null;
	if ('WebSocket' in window) {
		websocket = new WebSocket(url);
	} else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket(url);
	} else {
		Console.log('Error: WebSocket is not supported by this browser.');
        return null;
	}
	return websocket;
}
$(document).ready(function() {
	const getScrollContainer = document.querySelector('.chat-conversation-box');
	getScrollContainer.scrollTop = getScrollContainer.scrollHeight;
	survey('#roomNum', function(){ 
		if(websocket!=null){
			websocket.close();
		}
        roomId = $('#roomNum').val();
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/' + roomId;
		websocket = connection(url);
		websocket.onopen = function(){
			send('<c:out value="${loginId}"/>');
		};
	
		websocket.onmessage = function(message) {
			processMessage(message);
		};
		
		websocket.onclose = function() {
		};
		
		websocket.onerror = function(message) {
			processError(message);
		};
    }); 
	

	
	// 클릭을 하면 input box 값을 읽어 와서 send 메소드 인자값으로 넘겨줌..
	$('#textMessage').on('keydown', function(e) {
		if(e.keyCode==13) {
			var str = textMessage.value.replace(/</g, "&lt;");
			$.ajax({
				type : "post",
				url : "/chat/insertChat",
				data : {"textMessage" : str, "roomId" : roomId},
				success : function(){
					send(str);
					textMessage.value = "";
				}
			})
		}
	});
	
	$('#uploadBtn').on('click', function(e){
		fileUpload();
	})
	
	$('#leaveBtn').click(function() {
		websocket.close();
	});
});

function survey(selector, callback) {
    var input = $(selector);
    var oldvalue = input.val();
    setInterval(function(){
       if (input.val()!=oldvalue){
           oldvalue = input.val();
           callback();
       }
    }, 100);
 }

function processMessage(message) {
	var jsonData = JSON.parse(message.data);
	if (jsonData.messageType == "ChatMessage") {
		message = jsonData.name + " : "+ jsonData.message + '\n';
		displaybubble(jsonData);
	} 
}


// send 메소드가 호출이 되면.. message 값을  websocket.send 객체로 문자열로 넘겨 줌..
function send(message) {
	//             JSON.stringify 객체는 Object To String 변환  문자열이긴 하나 {} Json 프로토콜을 적용 함.
	// 서버 사이드 @OnMessage 어노테이션에서 처리를 함.
	websocket.send(JSON.stringify({'message' : message , 'room' : roomId}));
}

function displaybubble(data) {
	const getScrollContainer = document.querySelector('.chat-conversation-box');

	if (data.name == "${loginId}") {
		$('.chat[data-chat='+roomId+']').append("<div class='bubble me'>"+data.message +"</div>");
	} else {
		$.ajax({
			type : "post",
    		url : "/chat/memInfo",
    		data : {"mbrId" : data.name},
    		dataType : "json",
    		success: function(res){
			    $('.chat[data-chat='+roomId+']').append(res.mbrNm + "<div style='display: flex;'><div class='avatar avatar-sm'><img src='"+res.mbrImgPath.substr(66)+"\\"+res.mbrImg+"' class='rounded-circle bs-tooltip' /></div><div class='bubble you' style='margin-left: 10px;'>"+data.message+"</div></div>");
    		}
	})
	getScrollContainer.scrollTop = getScrollContainer.scrollHeight;
	}
}

function processError(message) {}

window.onbeforeunload = function() {
	websocket.close();
	
}
</script>



<div class="chat-box" style="height: 600px;">
    <div class="chat-not-selected">
        <p> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg> 채팅방을 클릭해주세요</p>
    </div>

    <div class="chat-box-inner">
        <div class="chat-meta-user">
            <div class="current-chat-user-name"><span><img src="/resources/assets/img/90x90.jpg" alt="dynamic-image"><span class="name"></span></span></div>

            	
            <div style="margin : 15px;">
            	<button id="userPlusBtn" class="btn btn-outline-dark mb-2" data-toggle="modal" data-target="#chatRoomModalCenter">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
					  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
					</svg>
				</button>
			</div>
        </div>
        <div class="chat-conversation-box" style="display: none;">
            <div id="chat-conversation-box-scroll" class="chat-conversation-box-scroll">
				<!-- 말풍선 오는 공간 -->
            </div>
        </div>
        <div class="chat-footer">
        	<div style="display: inline-block;">
				<button id = "addTask" class="btn btn-outline-dark mb-2" style="margin : 3px 0; height: 46.8px;" data-toggle="modal" data-target="#TaskModal">
               		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
					  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
					  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
					</svg>
              	</button>
            </div>
            <div class="chat-input" style="display: inline-block; width: 85%;">
                <form class="chat-form" action="javascript:void(0);">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                    <input type="text" id="textMessage" name="textMessage" class="mail-write-box form-control" placeholder="Message" value="" >
                </form>
            </div>
        </div>
    </div>
</div>
