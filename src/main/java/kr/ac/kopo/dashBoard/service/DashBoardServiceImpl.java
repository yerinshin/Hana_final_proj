package kr.ac.kopo.dashBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dashBoard.dao.DashBoardDAO;
import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;
import kr.ac.kopo.hanaroAccount.vo.AutoSplitVO;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private DashBoardDAO dao;
	
	//내 설정 고정출금, 소비예산, 저축액 조회
	public MonthlyBudgetVO myMonthlyBudget(String accountNo) {
		
		AutoSplitVO monthlySplit = dao.myMonthlySplit(accountNo);
		FixedExpenseVO monthlyFixedExpense = dao.myMonthlyFixedExpense(accountNo);
				
		MonthlyBudgetVO monthlyBudget = new MonthlyBudgetVO();
		monthlyBudget.setConsumption(monthlySplit.getMoneyToConsumption());
		monthlyBudget.setSaving(monthlySplit.getMoneyToSaving());
		
		monthlyBudget.setFixedExpense(monthlyFixedExpense.getTransMoney());
		System.out.println(monthlyBudget);
		
		return monthlyBudget;
	}
	
	//내 또래 평균 고정출금, 소비예산, 저축액 조회
	public MonthlyBudgetVO agesAvgBudget(int ageGroup) {
		
		MonthlyBudgetVO agesAvgSplit = dao.agesAvgSplit(ageGroup);
		MonthlyBudgetVO agesAvgFixedExpense = dao.agesAvgFixedExpense(ageGroup);
		
		MonthlyBudgetVO agesAvgBudget = new MonthlyBudgetVO();
		agesAvgBudget.setConsumption(agesAvgSplit.getConsumption());
		agesAvgBudget.setSaving(agesAvgSplit.getSaving());
		agesAvgBudget.setFixedExpense(agesAvgFixedExpense.getFixedExpense());
		
		System.out.println(agesAvgBudget);
		
		return agesAvgBudget;
	}


}
