package kr.or.ddit.feed.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.ddit.cloud.service.CloudService;
import kr.or.ddit.feed.service.LikesService;
import kr.or.ddit.feed.service.MapService;
import kr.or.ddit.feed.service.PstService;
import kr.or.ddit.feed.service.VoteService;
import kr.or.ddit.feed.service.VtFrmtService;
import kr.or.ddit.feed.service.VtRsltService;
import kr.or.ddit.feed.vo.LikesVO;
import kr.or.ddit.feed.vo.MapVO;
import kr.or.ddit.feed.vo.PstCmntVO;
import kr.or.ddit.feed.vo.PstVO;
import kr.or.ddit.feed.vo.VoteVO;
import kr.or.ddit.feed.vo.VtFrmtVO;
import kr.or.ddit.feed.vo.VtRsltVO;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.service.MbrService;
import kr.or.ddit.user.vo.MemberVO;

@RequestMapping("/feed")
@Controller
public class PstController {
	private static final Logger logger = LoggerFactory.getLogger(PstController.class);
	
	@Autowired PstService pstService;
	@Autowired LikesService likesService;
	@Autowired VoteService voteService;
	@Autowired VtFrmtService vtFrmtService;
	@Autowired VtRsltService vtRsltService;
	@Autowired LoginService loginService;
	@Autowired MapService mapService;
	@Autowired MbrService mbrService;
	@Autowired ProjectService service;
	@Autowired CloudService cloudService;

	
	// 피드 목록
	@RequestMapping("/main.do")
	public String select(Model model, HttpSession session, @RequestParam String pjtNo) {
//		logger.info("등록");
		logger.info("pjtNo : " + pjtNo);
		
	      //우측 클라우드 표시
	    int total = cloudService.getAllSz(pjtNo);
	    model.addAttribute("total", total);                                                                                                      
	    String changeMb = String.format("%.2f",(double)total/1024/1024); //MB로 변환
	    model.addAttribute("changeMb", changeMb);

		
		List<Map<String, Object>> list = pstService.select(pjtNo);
		logger.info(">>>>" + list.size());
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		//세션에 member객체 세팅
		session.setAttribute("member", member);
		logger.info("피드 세션 member: " + member.toString());
		
		//세션에 project세팅
		ProjectVO vo = service.getPjt(pjtNo);
		session.setAttribute("project", vo);
		logger.info("프로젝트 세션 project :", vo.toString());
		
		//좋아요 확인
		List<LikesVO> like = likesService.findLikes(member.getMbrId());
		logger.info("like",like);
		
		for(int i = 0 ; i<list.size(); i++) {
			//피드별 좋아요 개수
			int count = likesService.selectLikes((String) list.get(i).get("PST_NO"));
			list.get(i).put("count", count);
			list.get(i).put("yn", false);
			for(int j = 0; j<like.size(); j++) {
				//피드 번호와 좋아요를 누른 피드 번호가 일치할 때
				if(list.get(i).get("PST_NO").equals(like.get(j).getPstNo())) {
					list.get(i).put("yn", true);
					break;
				}
			}
		}
		
		//피드별 댓글 목록 출력
		List<Map<String, Object>> cmnt = pstService.cmntList();
		
		for(int i = 0; i<list.size(); i++) {
			list.get(i).put("cmntyn",false);
			for(int j = 0; j<cmnt.size(); j++) {
				if(list.get(i).get("PST_NO").equals(cmnt.get(j).get("PST_NO"))){
					list.get(i).put("cmntyn",true);
					break;
				}
			}
		}
		
		//투표
		//투표 형식 출력
		List<VtFrmtVO> frmt = vtFrmtService.selectVtFrmt();
		logger.info("frmt :"+frmt);
		
		for(int i = 0; i<list.size(); i++) {
			list.get(i).put("frmtyn",false);
			for(int j = 0; j<frmt.size(); j++) {
				if(list.get(i).get("PST_NO").equals(frmt.get(j).getPstNo())) {
					list.get(i).put("frmtyn",true);
					break;
				}
			}
 		}
		
		//투표 내용 출력
		List<VoteVO> vote = vtFrmtService.selectVote();
		logger.info("vote :"+vote);
		
		for(int i=0; i<frmt.size(); i++) {
			frmt.get(i).setVoteYn(false);
			for(int j=0; j<vote.size(); j++) {
				if(frmt.get(i).getVtNo().equals(vote.get(j).getVtNo())) {
					frmt.get(i).setVoteYn(true);
					break;
				}
			}
		}
		List<VtFrmtVO> vtFrmtList = vtFrmtService.selectVoteList(pjtNo);
		model.addAttribute("vtFrmtList", vtFrmtList);
		System.out.println("asdfasdfasdfasdfasdf >>>> " + vtFrmtList.toString());
		//투표 결과 출력
		
		//투표 수
		List<Map<String, Object>> getCount = new ArrayList<Map<String,Object>>();
	
		//투표 항목별 사람 이름, 아이디 뽑기
		List<Map<String, Object>> voter = new ArrayList<Map<String,Object>>();
		
		//투표 전체 결과 조회
		List<VtRsltVO> res = vtRsltService.resultVote();
		logger.info("투표 결과 다 가져오기"+res);
		
		for(int i=0; i<res.size();i++) {
//			getCount = vtRsltService.getCount(res.get(i));
			logger.info("투표수 가져와"+getCount);
			
			voter = vtRsltService.getVoter(res.get(i));
			logger.info("투표자 이름 가져와"+voter);
		}

		//지도 내용 출력
		List<MapVO> mapInfo = mapService.selectMap();
		logger.info("mapInfo"+mapInfo);
		
		//이미지 출력
		//피드번호로 해당 피드 이미지 찾기
	      List<TrsmFileVO> getFile = pstService.getPstFile();
	      logger.info("피드 테이블 이미지 찾아라~"+getFile);
	      
	      for(int i=0; i<list.size(); i++) {
	         list.get(i).put("imageYn",false);
	         for(int j=0; j<getFile.size(); j++) {
	            if(list.get(i).get("PST_NO").equals(getFile.get(j).getPstNo())){
	               list.get(i).put("imageYn",true);
	               break;
	            }
	         }
	      }

		
		//피드
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		//좋아요
		model.addAttribute("like", like);
		//댓글
		model.addAttribute("cmnt", cmnt);
		//투표형식 담기
		model.addAttribute("frmt", frmt);
		//투표내용 담기
		model.addAttribute("vote", vote);
		//지도
		model.addAttribute("map", mapInfo);
		
		//투표 전체 결과
		model.addAttribute("resVt", res);
		//투표 항목별 사람 이름, 아이디
		model.addAttribute("vtVoter", voter);
		//투표 카운트
		model.addAttribute("getCount", getCount);
	    //이미지
	    model.addAttribute("image",getFile);

		
		return "feed/main";

	}
	
	@ResponseBody
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	public void insertPost(Model model, @RequestParam Map<String, Object> data, HttpSession session){
		logger.info("insertPost----------------------------------");
		
//		logger.info("업로드한 파일 확인"+ uploadFile);
		
		//json 객체를 java 객체로 변환해준다.
		Gson gson = new Gson();
		List<String> strList = gson.fromJson((String) data.get("data"), List.class);
		
		//작성자 아이디 담을 변수
		String mbrId = "";
		//프로젝트 번호 담을 변수
		String pjtNo = "";
		//피드내용 담을 변수
		String str = "";
		//공지 담을 변수
		String nyn = "";
		//익명여부 담을 변수
		String ann = "";
		//마감일 담을 변수
		String ddate = "";
		//지도 정보 담을 리스트
		List<String> mapInfo = new ArrayList<String>();
		//투표항목 담을 리스트
		List<String> vote = new ArrayList<String>();
		
		for(int i=0; i<strList.size(); i++) {
			System.out.println("결과 : " + strList.get(i));
			if(strList.get(i) != null) {
				mbrId = strList.get(0);
				pjtNo =	strList.get(1);	
				str = strList.get(2);
				nyn = strList.get(3);
				ann = strList.get(4);
				ddate = strList.get(5);
				mapInfo.add(strList.get(6));
				mapInfo.add(strList.get(7));
				mapInfo.add(strList.get(8));
			}
		}
		//투표 항목 담기
		
		for(int i=9; i<strList.size(); i++) {
			if(strList.get(i) != null) {
				vote.add(strList.get(i));
			}
		}
		
		//피드 부분을 담을 객체
		PstVO pstVO = new PstVO();

		//프젝 번호넣기
		pstVO.setPjtNo(pjtNo);
		//피드 작성자 아이디 넣기
		pstVO.setMbrId(mbrId);
		//피드 내용 넣기
		pstVO.setPstCn(str);
		//공지여부 넣기
		pstVO.setNtcYn(nyn);
		
		int insertPst = pstService.insert(pstVO);
		
		//방금 등록된 피드번호 가져오기
		String pstNo = pstService.selectPstNo();
		logger.info("insert된 pstNo"+pstNo);
		
//		//마감일, 익명여부를 담을 객체
		VtFrmtVO vtFrmtVO = new VtFrmtVO();
		vtFrmtVO.setVtDt(ddate);
		vtFrmtVO.setAnnYn(ann);
		vtFrmtVO.setPstNo(pstNo);
		
		int insertFrmt = vtFrmtService.insertVtFrmt(vtFrmtVO);
		
		//방금 등록된 투표번호 가져오기
		String vtNo = vtFrmtService.selectVtNo();
		logger.info("insert된 vtNo"+vtNo);
		
		//투표 항목을 담을 객체
		VoteVO voteVO = new VoteVO();
		voteVO.setVtNo(vtNo);
		
		for(int i = 0; i < vote.size(); i++) {
			voteVO.setVtItm(vote.get(i));
			int insertVote = voteService.insertVote(voteVO);
		}
		
		//지도 내용을 담을 객체
		MapVO mapVO = new MapVO();
		mapVO.setPstNo(pstNo);
		
		for(int i=0; i<mapInfo.size(); i++) {
			mapVO.setMapAddr(mapInfo.get(0));
			mapVO.setMapLat(mapInfo.get(1));
			mapVO.setMapLot(mapInfo.get(2));
		}
		
		int insertMap = mapService.insertMap(mapVO);
		
		model.addAttribute("pstVO", new PstVO());
		model.addAttribute("voteVO", new VoteVO());
		model.addAttribute("vtFrmtVO", new VtFrmtVO());
		model.addAttribute("mapVO", new MapVO());
		model.addAttribute("vtRsltVO", new VtRsltVO());
		// forwarding
//		return "redirect:/feed/main.do";
	}
	@ResponseBody
	@PostMapping("/pstFileInsert.do")
	public void pstFileInsert(@RequestParam("uploadFile") MultipartFile[] uploadfile, Model model) {
		logger.info("ajax로 보낸 uploadFile"+uploadfile);
		
		TrsmFileVO trsmVO = new TrsmFileVO();
		
		//방금 넣은 feed의 번호를 뽑자
		String getPstNo = pstService.selectPstNo();
		logger.info("getPstNo"+getPstNo);
		trsmVO.setPstNo(getPstNo);
		
		//업로드 시 사용될 폴더
		String uploadFolder = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/TrsmFile";
		
		for(MultipartFile multipartFile : uploadfile) {
			logger.info("파일명 : " + multipartFile.getOriginalFilename());			
			logger.info("파일크기 : " + multipartFile.getSize());
			
			//UUID 파일명 처리 시작
			//동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함
			UUID uuid = UUID.randomUUID();
			String fileNm = uuid.toString() + "_" + multipartFile.getOriginalFilename();
			File saveFile = new File(uploadFolder, fileNm);
			
			try {
				//파일 실제명을 담기
				trsmVO.setTrsmFileNm(fileNm); //파일을 vo에 저장
				//파일 저장 경로 담기
				trsmVO.setTrsmFileAddr(saveFile.getPath());
				
				//transferTO() : 물리적으로 파일 업로드가 됨
				multipartFile.transferTo(saveFile);
				
				//DB에 넣기
				logger.info("trsmVO는 :"+trsmVO.toString());
				int trsmInsert = pstService.pstFileUpload(trsmVO);
				
				if(trsmInsert > 0) {
					logger.info("첨부파일 업로드 성공");
				}else {
					logger.info("첨부파일 업로드 실패");
				}
				
			}catch(Exception e){
				logger.info(e.getMessage());
			}
			
		}
		
//		return res;
	}
	
	@RequestMapping(value = "/imageView.do", method = RequestMethod.GET)
	public void imageView(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String imagePath = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/TrsmFile/";
		String filePath = imagePath + File.separator + request.getParameter("fileName");
		File file = new File(filePath);
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		if(file.exists()) {
			try {
				// 출력용 스트림 객체 생성 >> response객체 이용
				bos = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 입력용 스트림 객체 생성
				bis = new BufferedInputStream(new FileInputStream(file));
				
				byte[] buffer = new byte[1024*1024*10];
				int len = -1;
				
				// byte배열을 이용하여 파일 내용을 읽어와 출력용 스트림으로 출력한다.
				while((len=bis.read(buffer))>0) {
					bos.write(buffer, 0, len);
				}
				bos.flush();
				
			} catch (IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(bos!=null) try {bos.close();} catch(IOException e) {}
				if(bis!=null) try {bis.close();} catch(IOException e) {}
			}
		}
	}
	
	
	// 피드 수정하기
	@ResponseBody
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updatePost(@RequestParam String pstCn, @RequestParam String pstNo, @RequestParam String ntcYn) {
		logger.info("------------------------------");
//		logger.info("수정");
		logger.info("update pstCn : " + pstCn);
		logger.info("update pstNo : " + pstNo);
		logger.info("update ntcYn : " + ntcYn);
		
		PstVO pstVO = new PstVO();
		pstVO.setPstNo(pstNo);
		pstVO.setPstCn(pstCn);
		pstVO.setNtcYn(ntcYn);;

		int updateRes = this.pstService.update(pstVO);
		if (updateRes < 0) { // 수정 실패 시
			return "feed/main";
		}
		return "redirect:/feed/main.do";
	}

	// 피드 삭제하기
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam String pstNo) {
//		logger.info("삭제");		
		logger.info("delete pstNo : " + pstNo);

		int deleteRes = this.pstService.delete(pstNo);
		if (deleteRes < 0) { // 삭제 실패 시
			return "feed/main";
		}
		return "redirect:/feed/main.do";

	}
	
	@ResponseBody
	@RequestMapping(value = "/resultVote", method = RequestMethod.POST)
	public int resultVote(@RequestParam String optnNo, @RequestParam String vtNo, VtRsltVO vtRsltVO) {
		vtRsltVO.setOptnNo(optnNo);
		vtRsltVO.setVtNo(vtNo);
		
		return vtRsltService.getCount(vtRsltVO);
	}
	
	

}
