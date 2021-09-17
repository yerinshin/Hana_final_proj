package kr.ac.kopo.spending.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

public interface SpendingService {
	
	//List<TransactionHistoryVO> spendingByCategory(String accountNo);
	List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo);

	List<String> topSpending(SpendingInfoVO spendingInfo);

	List<CalendarVO> calendarListByDate(String accountNo);

	List<TransactionHistoryVO> historyByDate(Map<String, String> map);
}
