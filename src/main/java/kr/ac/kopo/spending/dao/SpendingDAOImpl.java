package kr.ac.kopo.spending.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.DaySpendingVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import kr.ac.kopo.spending.vo.WeeklySpendingVO;

@Repository
public class SpendingDAOImpl implements SpendingDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<SpendingInfoVO> spendingByCategory(SpendingInfoVO spendingInfo) {
		
		List<SpendingInfoVO> spendingList = sqlSessionTemplate.selectList("spending.SpendingDAO.spendingByCategory", spendingInfo);
		return spendingList;
	}
	/*
	 * public List<TransactionHistoryVO> spendingByCategory(String accountNo) {
	 * 
	 * List<TransactionHistoryVO> spendingList =
	 * sqlSessionTemplate.selectList("spending.SpendingDAO.spendingByCategory",
	 * accountNo); return spendingList; }
	 */

	public List<String> topSpending(SpendingInfoVO spendingInfo) {
		
		List<String> topSpendingList = sqlSessionTemplate.selectList("spending.SpendingDAO.topSpending", spendingInfo);
		return topSpendingList;
	}

	//캘린더 : 일별 지출 금액
	public List<CalendarVO> spendingByDate(String accountNo) {	
		List<CalendarVO> spendingList = sqlSessionTemplate.selectList("spending.SpendingDAO.spendingByDate" , accountNo);
	//	System.out.println("start ??? : "+spendingList);
		return spendingList;
	}
	
	//캘린더 : 일별 수입 금액
	public List<CalendarVO> incomeByDate(String accountNo) {
		List<CalendarVO> incomeList = sqlSessionTemplate.selectList("spending.SpendingDAO.incomeByDate" , accountNo);
		
		return incomeList;
	}
	//일별 거래내역
	public List<TransactionHistoryVO> historyByDate(Map<String, String> map) {
	//	System.out.println("dao Map: !!" + map);
		List<TransactionHistoryVO> historyByDate = sqlSessionTemplate.selectList("spending.SpendingDAO.transHistoryByDate" , map);
		
		return historyByDate;
	}
	
	//주별 소비(최근6주)
	public WeeklySpendingVO weeklySpending(String accountNo) {
		
		WeeklySpendingVO weeklySpending = sqlSessionTemplate.selectOne("spending.SpendingDAO.weeklySpending", accountNo);
		return weeklySpending;
	}

	//요일 별 소비
	public DaySpendingVO daySpending(String accountNo) {
		
		DaySpendingVO daySpending = sqlSessionTemplate.selectOne("spending.SpendingDAO.daySpending",accountNo);
		return daySpending;
	}
	
	


}
