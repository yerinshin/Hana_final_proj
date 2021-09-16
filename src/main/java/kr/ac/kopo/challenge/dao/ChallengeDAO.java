package kr.ac.kopo.challenge.dao;

import java.util.List;

import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

public interface ChallengeDAO {
	
	//도전하기 목록
	List<ChallengeVO> challengeList(String accountNo); 
	
	//도전하기 추가
	void insert(ChallengeVO challenge);
	
	
	//이번 달 카테고리 별 사용 금액
	List<SpendingInfoVO> spendingList(String accountNo);
	
	
}
