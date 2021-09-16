package kr.ac.kopo.challenge.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.challenge.dao.ChallengeDAO;
import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	private ChallengeDAO dao;
	
	public List<ChallengeVO> challengeList(String accountNo) {
		
		//도전목록 조회
		List<ChallengeVO> challengeList = dao.challengeList(accountNo);
		//이번달 카테고리 별 소비액 조회
		List<SpendingInfoVO> spendingList = dao.spendingList(accountNo);
		
		for(int i = 0; i < challengeList.size(); i ++) {
		//	System.out.println(challengeList.get(i));
			for(SpendingInfoVO spending : spendingList)
			if(challengeList.get(i).getCategory().equals(spending.getCategory())) {
				challengeList.get(i).setNowSpending(spending.getSpendingMoney());
			}
			
		}
		
		System.out.println(challengeList);
		
		return challengeList;
	}

/*
	  public List<SpendingInfoVO> spendingList(String accountNo) {
	  
		  List<SpendingInfoVO> spendingList = dao.spendingList(accountNo); 
		  return spendingList;
	  }
*/

	public void insert(ChallengeVO challenge) {
		System.out.println(challenge);
		dao.insert(challenge);
	}

}
