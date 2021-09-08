package kr.ac.kopo.dashBoard.dao;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;
import kr.ac.kopo.hanaroAccount.vo.AutoSplitVO;

public interface DashBoardDAO {
	
	//내 한달 설정 소비예산(생활금), 저축액(비상금) 조회
	AutoSplitVO myMonthlySplit(String accountNo);
	
	//한달 고정 지출액 조회(기본금)
	FixedExpenseVO myMonthlyFixedExpense(String accountNo);
	
	//또래 한달 설정 소비예산(생활금), 저축액(비상금) 조회
	MonthlyBudgetVO agesAvgSplit(int ageGroup);
	//또래 한달 고정 지출액 조회(기본금)
	MonthlyBudgetVO agesAvgFixedExpense(int ageGroup);
	
}
