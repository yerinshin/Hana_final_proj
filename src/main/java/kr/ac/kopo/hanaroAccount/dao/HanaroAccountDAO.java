package kr.ac.kopo.hanaroAccount.dao;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitInfoVO;

public interface HanaroAccountDAO {
	
	HanaroVO selectHanaroAcc(int userCode);
	AccountVO selectHanaroInfo(int userCode);
	void updateType(String accountNo);
	void insert(AccountVO account);
	
	void splitMoney(SplitInfoVO splitInfo);

}
