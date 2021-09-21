package kr.ac.kopo.hanaroAccount.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;
import kr.ac.kopo.hanaroAccount.vo.SplitKindInfoVO;


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
	
	/*
	 * public AccountVO selectHanaroInfoById(String id) { AccountVO account =
	 * sqlSessionTemplate.selectOne(
	 * "hanaroAccount.HanaroAccountDAO.selectHanaroInfoById", id); return account; }
	 */
	
	public void updateType(String accountNo) {
		
		sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.changeType", accountNo);
		
	}

	public void insert(AccountVO account) {
		sqlSessionTemplate.insert("hanaroAccount.HanaroAccountDAO.insert", account);
		
	}
	
	public void splitMoney(SplitHistoryVO splitHistory) {
		System.out.println("splitInfo"+splitHistory);
		sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.splitMoney", splitHistory);
		
		
		//System.out.println("dao");
	}

	/*
	 * public void splitMoney(SplitInfoVO splitInfo) {
	 * System.out.println("splitInfo"+splitInfo);
	 * sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.splitMoney",
	 * splitInfo);
	 * 
	 * 
	 * //System.out.println("dao"); }
	 */
	public void insertSplitHistory(SplitHistoryVO splitHistory) {
		System.out.println("splitHistory : "+splitHistory);
		sqlSessionTemplate.insert("hanaroAccount.HanaroAccountDAO.insertSplitHistory", splitHistory);
	}

	public List<SplitHistoryVO> historyByKind(SplitKindInfoVO splitKindInfo) {
		System.out.println("내역조회 dao : !!!"+splitKindInfo);
		List<SplitHistoryVO> historyList = sqlSessionTemplate.selectList("hanaroAccount.HanaroAccountDAO.splitHistoryByKind", splitKindInfo);
		
		return historyList;
	}
	//급여액 설정
	public void setSalary(HanaroVO hanaro) {
		System.out.println(hanaro);
		sqlSessionTemplate.update("hanaroAccount.HanaroAccountDAO.setSalary", hanaro);
	}
	

}
