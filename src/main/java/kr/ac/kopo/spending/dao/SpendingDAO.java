package kr.ac.kopo.spending.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.DaySpendingVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import kr.ac.kopo.spending.vo.WeeklySpendingVO;

public interface SpendingDAO {
	
	//카테고리 별 지출금액
	List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo);
	
	//top3 소비카테고리
	List<String> topSpending(SpendingInfoVO spendingInfo);
	
	//한달 총 수입
	int incomeByMonth(SpendingInfoVO spendingInfo);
	//한달 총 지출
	int spendingMonth(SpendingInfoVO spendingInfo);
	
	//일별 지출금액
	List<CalendarVO> spendingByDate(String accountNo);
	//일별 수입금액
	List<CalendarVO> incomeByDate(String accountNo);
	
	//캘린더 : 일별 소비 내역
	List<TransactionHistoryVO> historyByDate(Map<String, String> map);
	
	//주별소비
	WeeklySpendingVO weeklySpending(String accountNo);

	//요일 별 소비
	DaySpendingVO daySpending(String accountNo);
}
