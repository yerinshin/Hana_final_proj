package kr.ac.kopo.hanaroAccount.service;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;

public interface HanaroAccountService {

	HanaroVO selectHanaroAcc(int userCode);		//내 하나로통장 조회
	AccountVO selectHanaroInfo(int userCode);
	
	void changeToHanaro(String accountNo);	//하나로 통장으로 전환

}
