package kr.ac.kopo.spending.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

public interface SpendingDAO {
	
//	List<TransactionHistoryVO> spendingByCategory(String accountNo);
	List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo);
	
	List<String> topSpending(SpendingInfoVO spendingInfo);
	
	List<CalendarVO> spendingByDate(String accountNo);
	List<CalendarVO> incomeByDate(String accountNo);
	
	List<TransactionHistoryVO> historyByDate(Map<String, String> map);

}
