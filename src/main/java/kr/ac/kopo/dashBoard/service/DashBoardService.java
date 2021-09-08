package kr.ac.kopo.dashBoard.service;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;

public interface DashBoardService {
	
	//내 한달 설정 소비예산(생활금), 저축액(비상금) 조회
	MonthlyBudgetVO myMonthlyBudget(String accountNo);
	
	MonthlyBudgetVO agesAvgBudget(int ageGroup);
	
}
