package kr.ac.kopo.spending.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.spending.vo.SpendingInfoVO;

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


}
