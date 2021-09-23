package kr.ac.kopo.spending.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.dao.SpendingDAO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.DaySpendingVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import kr.ac.kopo.spending.vo.WeeklySpendingVO;

@Service
public class SpendingServiceImpl implements SpendingService{
	
	@Autowired
	private SpendingDAO dao;
	
	/*
	 * public List<TransactionHistoryVO> spendingByCategory(String accountNo) {
	 * 
	 * List<TransactionHistoryVO> spendingList = dao.spendingByCategory(accountNo);
	 * 
	 * return spendingList; }
	 */
	public List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo) {

		List<SpendingInfoVO> spendingList = dao.spendingByCategory(spendingInfo);
		
		return spendingList;
	}

	public List<String> topSpending(SpendingInfoVO spendingInfo) {
		
		List<String> topSpendingList = dao.topSpending(spendingInfo);
		
		return topSpendingList;
	}

	public List<CalendarVO> calendarListByDate(String accountNo) {
		
		List<CalendarVO> spendingList = dao.spendingByDate(accountNo);
		List<CalendarVO> incomeList = dao.incomeByDate(accountNo);
		List<CalendarVO> calendarList = new ArrayList<CalendarVO>();
		
		
		for(CalendarVO spending : spendingList) {
				//spending.setColor("pink");
				spending.setColor("#fff0");
				spending.setTextColor("red");
				calendarList.add(spending);
		}
		
		
		for(CalendarVO income : incomeList) {
			//income.setColor("skyblue");
			income.setTextColor("blue");
			income.setColor("#fff0");
			
			calendarList.add(income);
			
		}
		System.out.println(calendarList);
		
		return calendarList;
	}

	public List<TransactionHistoryVO> historyByDate(Map<String, String> map) {
		
		List<TransactionHistoryVO> historyList = dao.historyByDate(map);
		
		return historyList;
	}

	public WeeklySpendingVO weeklySpending(String accountNo) {
		
		WeeklySpendingVO weeklySpending = dao.weeklySpending(accountNo);
		return weeklySpending;
	}

	public DaySpendingVO daySpending(String accountNo) {
		DaySpendingVO daySpending = dao.daySpending(accountNo);
		
		return daySpending;
	}

}
