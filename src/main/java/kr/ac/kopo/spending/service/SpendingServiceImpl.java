package kr.ac.kopo.spending.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.spending.dao.SpendingDAO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

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

}
