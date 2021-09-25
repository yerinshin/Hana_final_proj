package kr.ac.kopo.report.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.report.vo.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReportVO> reportMemberList() {
		
		List<ReportVO> reportMemberList = sqlSessionTemplate.selectList("report.ReportDAO.reportMemberList");
		
		return reportMemberList;
	}

	public int incomeTotal(String accountNo) {
		int incomeTotal = sqlSessionTemplate.selectOne("report.ReportDAO.incomeTotal",accountNo);
		return incomeTotal;
	}

	public int spendingTotal(String accountNo) {
		int spendingTotal  = sqlSessionTemplate.selectOne("report.ReportDAO.spendingTotal",accountNo);
		return spendingTotal;
	}

	public MonthlyBudgetVO realSpent(String accountNo) {
		MonthlyBudgetVO realSpent = sqlSessionTemplate.selectOne("report.ReportDAO.realSpent", accountNo);
		return realSpent;
	}

}
