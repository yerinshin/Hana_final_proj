package kr.ac.kopo.challenge.service;

import java.util.List;

import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

public interface ChallengeService {

	List<ChallengeVO> challengeList(String accountNo); 
	
	List<SpendingInfoVO> spendingList(String accountNo);
}
