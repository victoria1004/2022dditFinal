/*
 * eGovFrame Web Messager
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 이영지(슈퍼개발자K3)
 */
package kr.or.ddit.chat.server;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.chat.server.config.ChatServerAppConfig;
import kr.or.ddit.chat.server.model.ChatMessage;
import kr.or.ddit.chat.server.model.Message;
import kr.or.ddit.chat.server.model.UsersMessage;
import kr.or.ddit.chat.server.model.decoder.MessageDecoder;
import kr.or.ddit.chat.server.model.encoder.MessageEncoder;
import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.chat.service.impl.ChatServiceImpl;
import kr.or.ddit.chat.vo.ChatVO;

/**
 * 
 * chatPopupBubble.jsp
 * 
 * @author PC-11
 *
 */
@ServerEndpoint(value = "/chat/{room}", encoders = { MessageEncoder.class }, decoders = {
		MessageDecoder.class }, configurator = ChatServerAppConfig.class)
public class ChatServerEndPoint {
	
	ChatService chatService = new ChatServiceImpl();
	/**
	 * ChatServerEndPoint 해당 하는 로그 정보를 출력 하고자 할때 객체 인스턴스를 매모리 변수로 선언후 재사용..
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatServerEndPoint.class);

	/**
	 * 챙팅방에 로그인 사용자 정보를 담아 두는 객체...
	 */
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());

	/**
	 * Handshaking 함수
	 * 
	 * websocket.onopen
	 * 
	 * /chat/{room} 호출 되었을 경우.. room 아이디에 해당 하는 객체에 사용자(session) 객체를 주입을 시켜줌
	 *
	 * @param userSession 사용자 session
	 */
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {
		// userSession 객체 안에 room 아이디를 등록을 해줌...
		userSession.getUserProperties().put("room", room);

		// 체팅방 chatroomUsers 변수 객체에 등록된 room 정보를 그룹으로 묵어 주기 위하여 add 추가 시켜줌..
		chatroomUsers.add(userSession);
		
		System.out.println(chatroomUsers.size() + " <<<<<<<<<<<<<<");
	}

	/**
	 * 메시지 전달 함수
	 *
	 * websocket.onmessage
	 *
	 * @param incomingMessage 들어오는 메시지
	 * @param userSession     사용자 session
	 * @param room            room Id
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {

		// 들어오는 메시지
		ChatMessage incomingChatMessage = (ChatMessage) incomingMessage;
		ChatMessage outgoingChatMessage = new ChatMessage();
		String username = (String) userSession.getUserProperties().get("username");
		if (username == null) { // 등록되지 않은 사용자 사용자 등록을 하고 메시지를 전달

			// incomingChatMessage 등록된 사용 이름 뽑아 오는 기능
			username = incomingChatMessage.getMessage();
			System.out.println("작성자 : " + username );
			// username 값이 null 아니면 ..
			if (username != null) {
				// userSession username 등록된 사용자 정보가 있으면 등록을 하고, 동일한 정보가 있으면 업데이트 put 기능으로 작동
				userSession.getUserProperties().put("username", username);
			}

			// chatroomUsers 동기화를 할꺼에요..
			synchronized (chatroomUsers) {
				// chatroomUsers 목록을 꺼내와서 반복을 할꺼에요. 10명이 있으면 10번 반복 합니다.
				for (Session session : chatroomUsers) {
					// session 등록된 원격지 사용자 목록에 메시지를 전달(sendObject 오퍼레이션/메소드)
					// UsersMessage 인스턴스를 생성을 하고
					// room 방이 같은 녀석의 사용자들에게 메시지를 전달 ..
					session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
				}
			}

		} else { // 등록된 사용자들에게 메시지를 전달...

			outgoingChatMessage.setName(username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());
			System.out.println("메시지 내용 : " + outgoingChatMessage.getMessage());
			System.out.println("작성자 : " + username);
			System.out.println("방번호 : " + room);
			for (Session session : chatroomUsers) {
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}

	/**
	 * 누군가가 접속 끊을때 websocket.onclose
	 * 
	 * @param userSession
	 * @param room
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers) {
			session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
		}
	}

	/**
	 * 사용자가 접속 끊기 전 호출되는 함수 websocket.onerror
	 * 
	 * @param session
	 * @param throwable
	 * @param room
	 */
	@OnError
	public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
		// Error handling
		LOGGER.info("ChatServerEndPoint (room: " + room + ") occured Exception!");
		LOGGER.info("Exception : " + throwable.getMessage());
	}

	/**
	 * 사용자 정보를 가져오는 함수
	 *
	 * @return
	 */
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}

}
