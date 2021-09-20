package kr.ac.kopo.hanaroAccount.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;
import kr.ac.kopo.hanaroAccount.vo.SplitKindInfoVO;

public interface HanaroAccountDAO {
	
	//하나로 통장 조회
	HanaroVO selectHanaroAcc(int userCode);
	//userCode로 account정보 조회
	AccountVO selectHanaroInfo(int userCode);
	//id로 조회
	/* AccountVO selectHanaroInfoById(String id); */
	
	//하나로 통잔 전환
	void updateType(String accountNo);
	void insert(AccountVO account);
	
	//잔액 이동
	void splitMoney(SplitHistoryVO splitHistory);

	//void splitMoney(SplitInfoVO splitInfo);
	
	//잔액 이동 내역 삽입
	void insertSplitHistory(SplitHistoryVO splitHistory);
	
	//기본금 거래내역
	List<SplitHistoryVO> historyByKind(SplitKindInfoVO splitKindInfo);
	//List<SplitHistoryVO> basicHistory(String accountNo);
	
	//급여일 급여액 설정
	void setSalary(HanaroVO hanaro);
}
