package kr.or.ddit.user.mapper;

import java.util.List;

import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.vo.EmailVO;
import kr.or.ddit.user.vo.MemberVO;

public interface EmailMapper {

	//이메일 번호 가져오기
	public String emlNoSelect();
	
	//아이디 찾아서 가져오기
	public String mbrIdSelect(String rcvrEmlAddr);
	
	//이름 찾아서 가져오기
	public String mbrNmSelect(String rcvrEmlAddr);

	//이메일 목록 보기
	public List<EmailVO> emailSelect(String mbrEml);
	
	//중요메일함 조회
	public List<EmailVO> emailImportant(String mbrEml);
	
	//임시보관함
	public List<EmailVO> draftList(String mbrEml);
	
	//보낸메일함
	public List<EmailVO> emailSend(String mbrEml);
	
	//휴지통 조회
	public List<EmailVO> emailTrash(String mbrEml);
	
	//이메일 보내기(등록)
	public int emailInsert(EmailVO emailVO);
	
	//파일 번호
	public String fileNoSelect();
	
	//메일 첨부파일 저장
	public int trsmFileEmailInsert(TrsmFileVO trsmFileVO);
	
	//이메일 임시저장
	public int emailSave(EmailVO emailVO);
	
	//중요메일함으로 보내기
	public int importantEmail(String emlNo);
	
	//휴지통으로 보내기
	public int emailTrashUpdate(String emlNo);
	
	//첨부파일 가져오기
	public List<TrsmFileVO> emailFile();
	
	//파일 번호에 맞는 첨부파일
	public TrsmFileVO emailFileDownload(String fileNo);
	
	//휴지통에서 완적삭제하기
	public int trashDelete(String emlNo);
	
	//프로필사진 가져오기
	public List<MemberVO> memImg();
	
	//이메일 읽음
	public int emailReadY(String emlNo);
	
	//이메일 안읽음
	public int emailReadN(String emlNo);
	
}
