package kr.ac.kopo.hanaroAccount.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;
import kr.ac.kopo.hanaroAccount.vo.SplitKindInfoVO;

public interface HanaroAccountService {

	HanaroVO selectHanaroAcc(int userCode);		//내 하나로통장 조회
	AccountVO selectHanaroInfo(int userCode);
	
	/* AccountVO selectHanaroInfoById(String id); */
	
	void changeToHanaro(String accountNo);		//하나로 통장으로 전환
	
	//void splitMoney(SplitInfoVO splitInfo, SplitHistoryVO splitHistory);		//잔액 이동
	void splitMoney(SplitHistoryVO splitHistory);
	
	//기본금 거래내역
	List<SplitHistoryVO> historyByKind(SplitKindInfoVO splitKindInfo);
	/*
	 * List<SplitHistoryVO> basicHistory(String accountNo);
	 */	
}
