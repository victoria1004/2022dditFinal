package kr.or.ddit.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.mapper.EmailMapper;
import kr.or.ddit.user.service.EmailService;
import kr.or.ddit.user.vo.EmailReceiverVO;
import kr.or.ddit.user.vo.EmailVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailMapper emailMapper;
	
	//이메일 조회(메인화면)
	@Override
	public List<EmailVO> emailSelect(String mbrEml) {
		return emailMapper.emailSelect(mbrEml);
	}

	//이메일 보내기(등록)
	@Override
	public int emailInsert(EmailVO emailVO) {
		return emailMapper.emailInsert(emailVO);
	}
	//이메일 번호 가져오기
	@Override
	public String emlNoSelect() {
		return emailMapper.emlNoSelect();
	}
	//아이디 찾아서 가져오기
	@Override
	public String mbrIdSelect(String rcvrEmlAddr) {
		return emailMapper.mbrIdSelect(rcvrEmlAddr);
	}

	//파일 번호
	@Override
	public String fileNoSelect() {
		return emailMapper.fileNoSelect(); 
	}
	
	//보낸메일함
	@Override
	public List<EmailVO> emailSend(String mbrEml) {
		return emailMapper.emailSend(mbrEml);
	}
	
	//휴지통 조회
	@Override
	public List<EmailVO> emailTrash(String mbrEml) {
		return emailMapper.emailTrash(mbrEml);
	}
	
	//이메일 임시저장
	@Override
	public int emailSave(EmailVO emailVO) {
		return emailMapper.emailSave(emailVO);
	}
	
	//임시보관함
	@Override
	public List<EmailVO> draftList(String mbrEml) {
		return emailMapper.draftList(mbrEml);
	}

	
	//휴지통으로 보내기
	@Override
	public int emailTrashUpdate(String emlNo) {
		return emailMapper.emailTrashUpdate(emlNo);
	}

	//중요메일함으로 보내기
	@Override
	public int importantEmail(String emlNo) {
		return emailMapper.importantEmail(emlNo);
	}

	//중요메일함
	@Override
	public List<EmailVO> emailImportant(String mbrEml) {
		return emailMapper.emailImportant(mbrEml);
	}
	
	//메일 첨부파일 저장
	@Override
	public int trsmFileEmailInsert(TrsmFileVO trsmFileVO) {
		return emailMapper.trsmFileEmailInsert(trsmFileVO);
	}
	
	//첨부파일 가져오기
	@Override
	public List<TrsmFileVO> emailFile() {
		return emailMapper.emailFile();
	}
	
	//파일 번호에 맞는 첨부파일
	@Override
	public TrsmFileVO emailFileDownload(String fileNo) {
		return emailMapper.emailFileDownload(fileNo);
	}
	
	//휴지통에서 완적삭제하기
	@Override
	public int trashDelete(String emlNo) {
		return emailMapper.trashDelete(emlNo);
	}
	
	//프로필사진 가져오기
	@Override
	public List<MemberVO> memImg() {
		return emailMapper.memImg();
	}

	//이메일 읽음 유무 확인
	@Override
	public int emailReadY(String emlNo) {
		return emailMapper.emailReadY(emlNo);
	}
	//이메일 안읽음
	@Override
	public int emailReadN(String emlNo) {
		return emailMapper.emailReadN(emlNo);
	}

	//메일 가져와서 이름 찾기
	@Override
	public String mbrNmSelect(String rcvrEmlAddr) {
		return emailMapper.mbrNmSelect(rcvrEmlAddr);
	}



	


}
