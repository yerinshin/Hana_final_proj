package kr.ac.kopo.hanaroAccount.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitInfoVO;


@Repository
public class HanaroAccountDAOImpl implements HanaroAccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public HanaroVO selectHanaroAcc(int userCode) {
		
		HanaroVO hanaro = sqlSessionTemplate.selectOne("hanaroAccount.HanaroAccountDAO.selectHanaroAcc", userCode); 
		System.out.println(hanaro);
		
		return hanaro;
	}

	public AccountVO selectHanaroInfo(int userCode) {
		
		AccountVO account = sqlSessionTemplate.selectOne("hanaroAccount.HanaroAccountDAO.selectHanaroInfo", userCode);
		
		return account;
	}
	
	public void updateType(String accountNo) {
		
		sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.changeType", accountNo);
		
	}

	public void insert(AccountVO account) {
		sqlSessionTemplate.insert("hanaroAccount.HanaroAccountDAO.insert", account);
		
	}
	
	public void splitMoney(SplitInfoVO splitInfo) {
		System.out.println(splitInfo);
		sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.splitMoney", splitInfo);
		System.out.println("dao");
	}

	
	

}
