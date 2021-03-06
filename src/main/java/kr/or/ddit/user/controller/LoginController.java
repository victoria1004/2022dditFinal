package kr.or.ddit.user.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.RecruitmentService;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.service.MailService;
import kr.or.ddit.user.vo.MemberVO;


@Controller
public class LoginController {
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginController.class);
	 
	@Autowired
	LoginService loginService;
	
	@Autowired
	RecruitmentService recruitmentService;
	
	
	@Autowired
	private MailService mailService;
	
	//Get방식 loginForm 연결
	@GetMapping("/login.do")
	public String loginForm(@ModelAttribute MemberVO memberVo, Model model) {

		return "user/login/login";
	}
	
	//Post방식 login실행
	@PostMapping("/loginPost.do")
	public String loginPost(@ModelAttribute MemberVO memberVO
				, HttpServletRequest request, Model model) {
		
		//입력받은 비밀번호 암호화
		String memberPw = memberVO.getMbrPw();
		String encMemberPw = getSHA256(memberPw);
		
		//새 VO에 세팅
		MemberVO memVO = memberVO;
		memVO.setMbrPw(encMemberPw);
		
		//받은 id,pw로 회원정보 받기
		MemberVO member = this.loginService.loginPost(memberVO);
		
		if(member==null) { //입력된 계정 정보가 틀린 경우
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "/login.do");
			model.addAttribute("button", "확인");
			
			return "/user/alert";
		}else { //회원정보가 있는 경우
			String memCd = member.getMbrCtgrCd();
			if(memCd.equals("M03")){
				model.addAttribute("msg", "가입 승인 대기중입니다.");
				model.addAttribute("url", "/login.do");
				model.addAttribute("button", "확인");
				
				return "/user/alert";
			}else{
				String id = member.getMbrId();
				//세션 객체 받아오기
				HttpSession session = request.getSession();
				session.setAttribute("prjNo", null);
				//세션의 존속 시간을 60분으로 설정
				session.setMaxInactiveInterval(60*60);
				//세션 속성명으로 member 사용하여 member객체 세팅
				session.setAttribute("member", member);
				
				//로그인 성공화면으로 보내기
				return "redirect:/";
			}
		}
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		//세션 객체 받아오기
		HttpSession session = request.getSession();
		
		//세션 무효화
		session.invalidate();
		
		//로그인화면으로 보내기
		return "redirect:/login.do";
	}
	
	//id찾기
		@RequestMapping(value = "/findId.do")
		//     @ResponseBody : Object to Json 변경
		public @ResponseBody Map<String, Object> findId(@RequestParam HashMap<String, Object> params) {
			//받은 데이터 확인
			//logger.info("findId : {}", params);
			
			String mbrNm = MapUtils.getString(params, "mbrNm");
			String mbrEml = MapUtils.getString(params, "mbrEml");
			
			MemberVO findIdUser = new MemberVO();
			findIdUser.setMbrNm(mbrNm);
			findIdUser.setMbrEml(mbrEml);
			
			//이름과 이메일로 아이디 찾기
			MemberVO findIdMbr = loginService.findId(findIdUser);
			
			if(findIdMbr==null){
				Map<String, Object> result = new HashMap<>();
				result.put("msg", "가입되지 않은 회원정보입니다.");
				result.put("sta", "fail");
				return result;
			}else {
				Map<String, Object> result = new HashMap<>();
				result.put("mbrId", findIdMbr.getMbrId());
				result.put("mbrNm", findIdMbr.getMbrNm());
				result.put("mbrEml", findIdMbr.getMbrEml());
				result.put("sta", "success");
				return result;
			}
		}
		
		//PW찾기
		@RequestMapping(value = "/findPw.do")
		public @ResponseBody Map<String, Object> findPw(@RequestParam HashMap<String, Object> params) {
			//받은 데이터 확인
			String mbrId = MapUtils.getString(params, "mbrId");
			String mbrNm = MapUtils.getString(params, "mbrNm");
			String mbrEml = MapUtils.getString(params, "mbrEml");
			
			MemberVO findPwUser = new MemberVO();
			findPwUser.setMbrId(mbrId);
			findPwUser.setMbrNm(mbrNm);
			findPwUser.setMbrEml(mbrEml);
			
			//아이디,이름,이메일 정보 확인하기
			MemberVO result = loginService.findPw(findPwUser);
			if(result==null) {
				Map<String, Object> resMap = new HashMap<>();
				resMap.put("msg", "가입되지 않은 회원정보입니다.");
				resMap.put("sta", "fail");
				return resMap;
			}else{
				Map<String, Object> resMap = new HashMap<>();
				resMap.put("mbrId", result.getMbrId());
				resMap.put("mbrNm", result.getMbrNm());
				resMap.put("mbrEml", result.getMbrEml());
				resMap.put("sta", "success");
			
				return resMap;
			}
			
		}
		
		//임시비밀번호 메일 발송
		@RequestMapping("/mailSend.do")
		public @ResponseBody String sendEmail(String mbrEml, String mbrId) throws Exception {
			
			//임시 비밀번호 생성
			String temppass = getRamdomPassword(8);
			
			//메일 발송
			String fromAddr = "sunsinlee1545@gmail.com"; //보내는 주소 : 실제 존재하는 계정만 이용 가능
			String toAddr = mbrEml;
			String subject = "임시 비밀번호 안내 입니다.";
			String body = "안녕하세요?\r\n doIT에서 임시 비밀번호를 보내드립니다.\r\n 회원님의 임시 비밀번호는 "+temppass+" 입니다.";
			mailService.sendEmail(fromAddr, toAddr, subject, body);
			
			//임시비밀번호 암호화
			String encTemppass = getSHA256(temppass);
			
			//임시 비밀번호로 변경하기
			MemberVO findMember = new MemberVO();
			findMember.setMbrId(mbrId);
			findMember.setMbrPw(encTemppass);
			findMember.setMbrEml(mbrEml);
			
			int pwUp= loginService.pwUpdate(findMember);
			
			return toAddr;
		}

		//임시 비밀번호 생성 메서드
		public String getRamdomPassword(int size){ 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 
				'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 
				'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', 
				 '^', '&' }; 
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0; 
		int len = charSet.length; 
		for (int i=0; i<size; i++) { 
			idx = (int) (len * Math.random()); 
			idx = sr.nextInt(len); 
			sb.append(charSet[idx]); 
			}
		return sb.toString(); 
		}
		
		//비밀번호 암호화(64 크기) 메서드
		public String getSHA256(String input){

			String toReturn = null;

			try {
				MessageDigest digest = MessageDigest.getInstance("SHA-256");
				digest.reset();
				digest.update(input.getBytes("utf8"));
				toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
			} catch (Exception e) {
				e.printStackTrace();
			}

			return toReturn;
			
		}


}
