package kr.ac.kopo.challenge.service;

import java.util.List;

import kr.ac.kopo.challenge.vo.ChallengeVO;

public interface ChallengeService {

	List<ChallengeVO> challengeList(String accountNo); 
	
	void insert(ChallengeVO challenge);
	
	/* List<SpendingInfoVO> spendingList(String accountNo); */
}
