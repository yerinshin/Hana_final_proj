package kr.ac.kopo.report.dao;

import java.util.List;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.report.vo.ReportVO;
import kr.ac.kopo.report.vo.SmsVO;

public interface ReportDAO {
	
	//sms 보낼 List
	List<SmsVO> smsList();
	
	//sms보내기 완료시 로그 flag 수정
	void changeFlag(List<SmsVO> smsList);
	
	
	//하나로멤버
	List<ReportVO> reportMemberList();

	//월 총 수입, 지출
	int incomeTotal(String accountNo);
	int spendingTotal(String accountNo);
	
	//실제 사용 기본,생활,비상금
	MonthlyBudgetVO realSpent(String accountNo);
}
