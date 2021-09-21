package kr.ac.kopo.spending.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.DaySpendingVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import kr.ac.kopo.spending.vo.WeeklySpendingVO;

public interface SpendingDAO {
	
//	List<TransactionHistoryVO> spendingByCategory(String accountNo);
	List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo);
	
	List<String> topSpending(SpendingInfoVO spendingInfo);
	
	List<CalendarVO> spendingByDate(String accountNo);
	List<CalendarVO> incomeByDate(String accountNo);
	
	List<TransactionHistoryVO> historyByDate(Map<String, String> map);
	
	//주별소비
	WeeklySpendingVO weeklySpending(String accountNo);

	//요일 별 소비
	DaySpendingVO daySpending(String accountNo);
}
