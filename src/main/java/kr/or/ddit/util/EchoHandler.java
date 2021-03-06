package kr.or.ddit.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.AlarmVO;
import kr.or.ddit.user.vo.MemberVO;

@Component
public class EchoHandler extends TextWebSocketHandler {
    
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
  // 로그인 한 전체
  List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
  // 1대1
  Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
   
    @Autowired
	AlarmService service;
		
	@Autowired
	ReloadableResourceBundleMessageSource res;

	@Autowired
	ProjectService projectService;

	@Autowired
	GetUserService userService;
   
  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      //접속한 전체 유저 아이디
      sessions.add(session);
      
      logger.info("접속한 모든 유저:" + sessions.toString());
      logger.info("접속한 유저:" + session.toString());
      //로그인한 개별 유저 아이디를 가져온다.
      String senderID = getId(session);
      logger.info("접속유저:" + senderID);
      //userSessionsMap 에 개별유저아이디를 넣는다.
      userSessionsMap.put(senderID, session);
      //logger.info("map=========",userSessionsMap.toString());
  }

  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
     String userId=getId(session);
     String receiverId = message.getPayload();
     
     //logger.info("사용자:"+userId+"+"+message.getPayload());
     Map<String, Object> httpSession = session.getAttributes();
     MemberVO vo = (MemberVO) httpSession.get("member"); 
     if(vo!=null) {
   
      //접속한 해당 유저 읽지않은 알림 데이터 전체 카운트 만 가져올 경우  
//       int countMsg = service.getAllNotReadedCount(vo.getMbrId());
       int countMsg = service.getAllNotReadedCount(receiverId);
    	//logger.info("안읽은 메시지 갯수: " + countMsg);
      //1.해당 유저 알림데이터 전체 가져오기
//    	List<AlarmVO> msg = service.getAllNotReadedMsg(vo.getMbrId());
    	List<AlarmVO> msg = service.getAllNotReadedMsg(receiverId);
    	//logger.info("모든 메시지 : " + msg.toString());
    	List<Map<String, String>> getAllMsg = new ArrayList<Map<String, String>>();
    	
		for(AlarmVO alarm : msg) {
				//logger.info("알람리스트 : " + alarm.toString());
				if(alarm.getAlrmCtgrNo().equals("A01")) { //채팅알림
					Map<String, String> map = new HashMap<String, String>();
					Object[] args = {alarm.getAlrmSndInfo()}; //채팅 보낸 사람 이름
					String str = res.getMessage("chat", args, Locale.getDefault());
					map.put("chat", str); 
					map.put("alrmNo", alarm.getAlrmNo()); 
					getAllMsg.add(map);
					//logger.info(str);
				}
				if(alarm.getAlrmCtgrNo().equals("A02")) { //멘션알림
					Map<String, String> map = new HashMap<String, String>();
					Object[] args = {alarm.getAlrmSndInfo()}; //멘션한 사람 이름
					String str = res.getMessage("mension", args, Locale.getDefault());
					map.put("mension", str); 
					map.put("alrmNo", alarm.getAlrmNo()); 
					map.put("location", alarm.getAlrmLocation());
					getAllMsg.add(map);
					//logger.info(str);
				}
				if(alarm.getAlrmCtgrNo().equals("A03")) { //일감알림
					Map<String, String> map = new HashMap<String, String>();
					ProjectVO projectVO =  projectService.getPjt(alarm.getAlrmSndInfo()); //일감 추가한 프로젝트번호로 프젝 객체 꺼냄
					//logger.info("객체 보여줘" + projectVO.toString());
					Object[] args = {projectVO.getPjtNm()}; //일감 추가한 프로젝트명
					String str = res.getMessage("todo", args, Locale.getDefault());
					//logger.info("일감메시지:" + alarm.toString());
					map.put("todo", str); 
					map.put("alrmNo", alarm.getAlrmNo());
					//logger.info("주소값 찍히니" + alarm.getAlrmLocation());
					map.put("location", alarm.getAlrmLocation());
					getAllMsg.add(map);
					//logger.info(str);
				}
				if(alarm.getAlrmCtgrNo().equals("A04")) { //메일알림
					Map<String, String> map = new HashMap<String, String>();
					Object[] args = {alarm.getAlrmSndInfo()}; //메일 보낸 사람 이름
					String str = res.getMessage("mail", args, Locale.getDefault());
					map.put("mail", str); 
					map.put("alrmNo", alarm.getAlrmNo()); 
					getAllMsg.add(map);
					//logger.info(str);
				}
				if(alarm.getAlrmCtgrNo().equals("A05")) { //회의알림
					Map<String, String> map = new HashMap<String, String>();
					String array  = alarm.getAlrmSndInfo();
					//logger.info("회의알림:", array);
					String[] arrayList = array.split("/");
					MemberVO member = userService.getUser(alarm.getAlrmSndId());
					String mtrNo = ""; 
					String time = ""; 
					String month = ""; 
					String day = ""; 
					for(String s : arrayList) {
						//logger.info(s);
						mtrNo = arrayList[0];
						time = arrayList[2];
						String[] times = arrayList[1].split("-");
						month = times[1];
						day = times[2];
					}
					Object[] args = {member.getMbrNm(), month, day, time, mtrNo};
					String str = res.getMessage("mtr", args, Locale.getDefault());
					map.put("mtr", str); 
					map.put("alrmNo", alarm.getAlrmNo()); 
					getAllMsg.add(map);
					//logger.info(str);
				}
				if(alarm.getAlrmCtgrNo().equals("A06")) { //프젝 참여 알림
					Map<String, String> map = new HashMap<String, String>();
					ProjectVO projectVO = projectService.getPjt(alarm.getAlrmSndInfo()); //참여하는 프로젝트 번호
					MemberVO memberVO = userService.getMyInfo(alarm.getAlrmSndId()); //알림보낸 사람 객체 꺼내기
					//logger.info(projectVO.toString());
					String senderNm = memberVO.getMbrNm(); //알림보낸 사람 이름
					Object[] args = {senderNm, projectVO.getPjtNm()};
					//logger.info(args.toString());
					String str = res.getMessage("pjt", args, Locale.getDefault());
					map.put("pjt", str); 
					map.put("alrmNo", alarm.getAlrmNo()); 
					map.put("pjtNo", alarm.getAlrmSndInfo()); 
					getAllMsg.add(map);
					//logger.info(str);
				}
				
				
			}
		
    	
    	
    	
       
//      WebSocketSession webSocketSession = userSessionsMap.get(userId);
      WebSocketSession webSocketSession = userSessionsMap.get(receiverId);
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("msg", getAllMsg); //안읽을 메시지 내용 
      map.put("countMsg", countMsg); //안읽은 메시지 갯수
      Gson gson = new Gson();
      TextMessage textMessage = new TextMessage(gson.toJson(map));   
      webSocketSession.sendMessage(textMessage);
        }
  }

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
     // System.out.println("afterConnectionClosed " + session + ", " + status);
      //소켓 연결이 끊겼을 때 개별 접속아이디 해체 저리한다.
      userSessionsMap.remove(session.getId());
      //소켓 연결이 끊겼을 때 전체 접속자 아이디 해체 저리한다.
      sessions.remove(session);
  }
   

  // 웹소켓 id 가져오기
  private String getId(WebSocketSession session) {
	  //logger.info(session.toString());
      Map<String, Object> httpSession = session.getAttributes();
      MemberVO member = (MemberVO) httpSession.get("member"); 
     // logger.info("로그 멤버아이디",member.getMbrId());
      String loginId = member.getMbrId();       
      if (loginId == null) {
          return session.getId();
      } else {
          return loginId;
      }
  }
  


}
