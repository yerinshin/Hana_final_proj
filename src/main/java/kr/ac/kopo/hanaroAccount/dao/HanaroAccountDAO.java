package kr.ac.kopo.hanaroAccount.dao;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitInfoVO;

public interface HanaroAccountDAO {
	
	HanaroVO selectHanaroAcc(int userCode);
	//userCode로 조회
	AccountVO selectHanaroInfo(int userCode);
	//id로 조회
	AccountVO selectHanaroInfoById(String id);
	
	void updateType(String accountNo);
	void insert(AccountVO account);
	
	void splitMoney(SplitInfoVO splitInfo);

}
