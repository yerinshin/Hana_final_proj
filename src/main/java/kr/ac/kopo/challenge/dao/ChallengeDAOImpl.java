package kr.ac.kopo.challenge.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

@Repository
public class ChallengeDAOImpl implements ChallengeDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<ChallengeVO> challengeList(String accountNo) {
		
		List<ChallengeVO> challengeList = sqlSessionTemplate.selectList("challenge.ChallengeDAO.challengeList",accountNo);		
		
		return challengeList;
	}

	public void insert(ChallengeVO challenge) {
		
		sqlSessionTemplate.insert("challenge.ChallengeDAO.insert", challenge);
	}

	
	public List<SpendingInfoVO> spendingList(String accountNo) {
		List<SpendingInfoVO> spendingList = sqlSessionTemplate.selectList("challenge.ChallengeDAO.nowSpendingByCategory", accountNo);
		return spendingList;
	}


	
}
