package kr.ac.kopo.dashBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;

@Repository
public class DashBoardDAOImpl implements DashBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*
	 * public AutoSplitVO myMonthlySplit(String accountNo) {
	 * 
	 * AutoSplitVO monthlySplit =
	 * sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.myMonthlySplit",
	 * accountNo); System.out.println("dao : "+monthlySplit); return monthlySplit; }
	 * 
	 * public FixedExpenseVO myMonthlyFixedExpense(String accountNo) {
	 * FixedExpenseVO monthlyFixedExpense =
	 * sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.myMonthlyFixedExpense",
	 * accountNo); System.out.println("dao : "+monthlyFixedExpense); return
	 * monthlyFixedExpense; }
	 */
	public MonthlyBudgetVO myMonthlySplit(String accountNo) {
		
		MonthlyBudgetVO monthlySplit = sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.myMonthlySplit", accountNo);
		System.out.println("dao : "+monthlySplit);
		return monthlySplit;
	}
	
	public MonthlyBudgetVO myMonthlyFixedExpense(String accountNo) {
		MonthlyBudgetVO monthlyFixedExpense = sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.myMonthlyFixedExpense", accountNo);
		System.out.println("dao : "+monthlyFixedExpense);
		return monthlyFixedExpense;
	}

	public MonthlyBudgetVO agesAvgSplit(int ageGroup) {
		//또래 나이대 고객의 설정 월 소비예산, 월 저축액 평균
		MonthlyBudgetVO agesAvgSplit = sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.agesAvgSplit", ageGroup);
		System.out.println(agesAvgSplit);

		return agesAvgSplit;
	}

	public MonthlyBudgetVO agesAvgFixedExpense(int ageGroup) {
		
		//또래 나이대 고객의 설정 월 고정지출
		MonthlyBudgetVO agesAvgFixedExpense = sqlSessionTemplate.selectOne("dashBoard.DashBoardDAO.agesAvgFixedExpense", ageGroup);
		System.out.println(agesAvgFixedExpense);
		
		return agesAvgFixedExpense;
	}

	public List<SplitHistoryVO> monthlySaving(String accountNo) {
		List<SplitHistoryVO> savingSplitList = sqlSessionTemplate.selectList("dashBoard.DashBoardDAO.monthlySaving", accountNo);
		
		System.out.println(savingSplitList);
		return savingSplitList;
	}
	
	

}
