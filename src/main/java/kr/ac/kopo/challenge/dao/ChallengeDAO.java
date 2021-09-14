package kr.ac.kopo.challenge.dao;

import java.util.List;

import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

public interface ChallengeDAO {
	
	List<ChallengeVO> challengeList(String accountNo); 
	
	List<SpendingInfoVO> spendingList(String accountNo);
}
