package kr.or.ddit.chat.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.or.ddit.chat.service.ChatRoomService;
import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.chat.vo.ChatVO;
import kr.or.ddit.user.controller.AlarmController;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.vo.MemberVO;
import kr.or.ddit.util.LogCrud;

@RequestMapping("/chat")
@Controller
public class ChatRoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatRoomController.class);
	
	@Autowired
	ChatRoomService chatRoomService;
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	AlarmService alarmService;
	
	
	@RequestMapping(value = "/chatMain.do")
	public String chatList(Model  model, HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String mbrId = memberVO.getMbrId();
		List<ChatRoomVO> list = this.chatRoomService.roomList(mbrId);
		
		for(int i = 0; i < list.size(); i++) {
			List<ChatVO> chatList = this.chatService.chatContent(list.get(i).getChatrmNo());
			list.get(i).setChatList(chatList);
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("loginId", mbrId);
		return "chat/chatting/chatMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertChat", method = RequestMethod.POST)
	public void insertChat(Model model, @RequestParam Map<String, String> map, HttpSession session) {
		ChatVO chatVo = new ChatVO();
		chatVo.setChatrmNo(map.get("roomId"));
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String mbrId = memberVO.getMbrId();
		chatVo.setMbrId(mbrId);
		chatVo.setChatCn(map.get("textMessage"));
		chatService.chatBubbleInsert(chatVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/roomChatList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> roomChatList(@RequestParam String chatrmNo, HttpSession session){
		List<ChatVO> list = chatService.chatContent(chatrmNo);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String mbrId = memberVO.getMbrId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("mbrId", mbrId);
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/memInfo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public MemberVO memInfo(@RequestParam String mbrId){
		MemberVO memVO = chatRoomService.memInfo(mbrId);
		return memVO;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/fileName", method = RequestMethod.POST)
	public String fileName(MultipartHttpServletRequest mtfRequest, 
			final HttpServletRequest request, final HttpServletResponse response) {
		String name = "";
		if(mtfRequest!=null) {
			List<MultipartFile> fileList = mtfRequest.getFiles("fileList");
			for(int i = 0; i < fileList.size(); i++) {
				MultipartFile multi = fileList.get(i);
				if(multi == null) {
					
				}else if(multi.getSize() == 0) {
					
				}else {
					name = multi.getOriginalFilename();
				}
			}
		}
		return name;
	}
	
	
	@ResponseBody
	@PostMapping("/fileUpload")
	public String fileUpload(@RequestBody MultipartFile[] fileList, @RequestParam String roomId, HttpSession session) {
		LogCrud.getCreate("ChatRoomController");
		String imgTagSrc = "";
		String uploadFolder = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/chat/";
		
		File uploadPath = new File(uploadFolder, roomId + "/" + getFolder());
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		for(MultipartFile file : fileList) {
			UUID uuid = UUID.randomUUID();
			String strgFileNm = uuid.toString() + "_" + file.getOriginalFilename();
			File saveFile = new File(uploadPath, strgFileNm);
			imgTagSrc = "<img src='/chat/imageView.do?fileName=" + saveFile.getAbsolutePath().substring(81).replace('\\', '/') + "'>";
			try {
				file.transferTo(saveFile);
				
				ChatVO chatVo = new ChatVO();
				chatVo.setChatrmNo(roomId);
				MemberVO memberVO = (MemberVO) session.getAttribute("member");
				String mbrId = memberVO.getMbrId();
				chatVo.setMbrId(mbrId);
				chatVo.setChatCn(imgTagSrc);
				chatService.chatBubbleInsert(chatVo);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		return imgTagSrc;
	}
	
	@RequestMapping(value = "/imageView.do", method = RequestMethod.GET)
	public void imageView(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String imagePath = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/chat/";
		String filePath = imagePath + File.separator + request.getParameter("fileName");
		File file = new File(filePath);
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		if(file.exists()) {
			try {
				// ????????? ????????? ?????? ?????? >> response?????? ??????
				bos = new BufferedOutputStream(response.getOutputStream());
				
				// ?????? ????????? ????????? ?????? ??????
				bis = new BufferedInputStream(new FileInputStream(file));
				
				byte[] buffer = new byte[1024*1024*10];
				int len = -1;
				
				// byte????????? ???????????? ?????? ????????? ????????? ????????? ??????????????? ????????????.
				while((len=bis.read(buffer))>0) {
					bos.write(buffer, 0, len);
				}
				bos.flush();
				
			} catch (IOException e) {
				System.out.println("????????? ?????? : " + e.getMessage());
			} finally {
				if(bos!=null) try {bos.close();} catch(IOException e) {}
				if(bis!=null) try {bis.close();} catch(IOException e) {}
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/chatRoomMake", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public void chatRoomMake(@RequestParam Map<String, Object> map, HttpSession session) {
		ChatRoomVO chatroomVO = new ChatRoomVO();
		System.out.println(map.get("peopleNum"));
		// ????????? ?????? ????????? ?????? ??????
		chatroomVO.setChatrmNo(String.valueOf(chatRoomService.chatMaxNum()));
		
		String chatRoomNm = (String) map.get("chatRoom");
		chatroomVO.setChatrmNm(chatRoomNm);
		Gson gson = new Gson();
		List<String> peopleNum = gson.fromJson((String) map.get("peopleNum"), List.class);
		System.out.println(peopleNum);
		peopleNum.add(((MemberVO)session.getAttribute("member")).getMbrId());
		
		for(int i = 0; i < peopleNum.size(); i++) {
			chatroomVO.setMbrId(peopleNum.get(i));
			chatRoomService.chatRoomMake(chatroomVO);
			if(!((MemberVO)session.getAttribute("member")).getMbrId().equals(peopleNum.get(i))) {
				alarmService.insertAlarmMsg(((MemberVO)session.getAttribute("member")).getMbrId(), "A01", peopleNum.get(i), ((MemberVO)session.getAttribute("member")).getMbrNm());
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/plusUser", method = RequestMethod.POST)
	public void plusUser(@RequestParam(value="roomNum") String roomNum ,@RequestParam(value="data[]") List<String> userList, HttpSession session) {
		ChatRoomVO chatroomVO = new ChatRoomVO();
		System.out.println("size >>> " + userList.size());
		for(int i = 0; i < userList.size(); i++) {
			System.out.println("userList >>> " + userList.get(i));
			chatroomVO.setChatrmNo(roomNum);
			chatroomVO.setMbrId(userList.get(i));
			chatRoomService.userInsert(chatroomVO);
		//	AlarmController.insertAlarmMsg(((MemberVO)session.getAttribute("member")).getMbrId(), "A01", userList.get(i));
		}
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
}
