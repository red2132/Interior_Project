package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class QnADAO {
	@Autowired
	private QnAMapper mapper;
	//1-1. Q&A 게시글 리스트
	public List<QnAVO> qnaBoardListData(Map map){
		return mapper.qnaBoardListData(map);
	}
	//1-2. 총페이지 구하기
	public int qnaBoardTotalPage() {
		return mapper.qnaBoardTotalPage();
	}
	
	
	
	
	//2. Q&A 게시글 작성
	public void qnaBoardInsert(QnAVO vo) {
		mapper.qnaBoardInsert(vo);
	}
	
	
	
	
	//3. Q&A 게시글/답변게시글 상세보기(hit+1 증가 후 게시글 상세페이지 출력)
	public QnAVO qnaBoardDetailData(int no) {
		mapper.hitIncrement(no);
		return mapper.qnaBoardDetailData(no);
	}
	
	
	
	
	//4. Q&A 답변게시글 작성
	public void qnaBoardReplyBoardInsert(int pno, QnAVO vo) {
		//4-1. 답변할 게시글의 정보 읽어오기
		QnAVO qvo=mapper.qnaParentInfoData(pno);
		//4-2. group_step+1 증가
		mapper.qnaBoardGroupStepIncrement(qvo);
		//4-3. 데이터 추가(g_stap, g_tab 각각+1)
		vo.setG_id(qvo.getG_id());
		vo.setG_step(qvo.getG_step()+1);
		vo.setG_tab(qvo.getG_tab()+1);
		vo.setRoot(pno);
		mapper.qnaBoardReplyBoardInsert(vo);
		//4-4. depth 증가
		mapper.qnaBoardDepthIncrement(pno);
	}
	
	
	
	//5. Q&A 게시글/답변게시글 수정
	//5-1. 수정할 게시글 원본 데이터 불러오기
	public QnAVO qnaBoardUpdateData(int no) {
		return mapper.qnaBoardDetailData(no);
	}
	//5-2. 실제 수정
	public int qnaBoardUpdate(QnAVO vo) {
		int result=0;
		//5-2-1. 비밀번호 읽기
		String db_pwd=mapper.qnaBoardGetPassword(vo.getNo());
		//5-2-2. 비밀번호 일치 시 실제 수정, 불일치 시 수정x
		if(db_pwd.equals(vo.getPwd())){
			result=1;
			mapper.qnaBoardUpdate(vo);
		}else {
			result=0;
		}return result;
	}
	
	
	
	
	//6. Q&A 게시글/답변게시글 삭제(트랜젝션으로 비번일치,하위 답변게시글 없을 때만 한 번에 수정 처리)
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int qnaBoardDelete(int no, String pwd) {
		int result=0;
		//6-1. 비밀번호 읽어오기
		String db_pwd=mapper.qnaBoardGetPassword(no);
		//6-2. 비밀번호 일치 시
		if(db_pwd.equals(pwd)) {
			result=1;
			//6-2-1. depth 읽어와서 depth==0이면 삭제, depth!=이면 삭제x
			QnAVO vo=mapper.qnaBoardGetDepth(no);
			if(vo.getDepth()==0) {
				mapper.qnaBoardDelete(no);
			}else {
				QnAVO pvo=new QnAVO();
				pvo.setSubject("관리자가 삭제한 게시물입니다.");
				pvo.setContent("관리자가 삭제한 게시물입니다.");
				pvo.setNo(no);
				mapper.qnaBoardDeleteUpdate(pvo);
			}
			//6-2-2. depth 감소
			mapper.depthDecrement(vo.getRoot());
		}
		//6-3. 비밀번호 불일치 시
		else {
			result=0;
		}
		return result;
	}
	
	
	///////////////////////////////////////////////////////////
	// 1.댓글 업로드
	public void qnaBoardReplyInsert(QnaReplyVO vo) {
		mapper.qnaBoardReplyInsert(vo);
	}
	
	// 2.댓글 목록
	public List<QnaReplyVO> qnaBoardReplyList(int bno){
		return mapper.qnaBoardReplyList(bno);
	}
	
	// 3.댓글 수정
	public void qnaBoardReplyUpdate(QnaReplyVO vo) {
		mapper.qnaBoardReplyUpdate(vo);
	}
	
	// 4.대댓글 추가
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void qnaBoareReplyReplyInsert(int pno,QnaReplyVO vo) {
		QnaReplyVO pvo=mapper.qnaBoardReplyParentInfoData(pno);
		vo.setG_id(pvo.getG_id());
		vo.setG_step(pvo.getG_step()+1); //출력 순서
		vo.setG_tab(pvo.getG_tab()+1); //답변 들여쓰기
		vo.setRoot(pno);
		mapper.qnaBoareReplyReplystepIncrement(pvo);
		mapper.qnaBoareReplyReplyInsert(vo);
		mapper.qnaBoardReplyDepthIncrement(pno);
	}
	
	
	
	
	//5. 댓글/대댓글 삭제
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void qnaBoardReplyDelete(int no) {
		QnaReplyVO vo=mapper.qnaBoardReplyDepthInfoData(no);
		if(vo.getDepth()==0) {
			mapper.qnaBoardReplyDelete(no);
		}else {
			mapper.qnaBoardReplyMsgUpdate(no);
		}
		mapper.qnaBoardReplyDepthDecrement(vo.getRoot());
	}
}
