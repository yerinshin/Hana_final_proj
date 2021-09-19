package kr.ac.kopo.dashBoard.service;

import java.util.List;

import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.dashBoard.vo.MonthlySavingVO;
import kr.ac.kopo.dashBoard.vo.PreferentialRateVO;
import kr.ac.kopo.dashBoard.vo.ProductSearchInfoVO;
import kr.ac.kopo.dashBoard.vo.SavingProductVO;

public interface DashBoardService {
	
	//내 한달 설정 소비예산(생활금), 저축액(비상금) 조회
	MonthlyBudgetVO myMonthlyBudget(String accountNo);
	
	MonthlyBudgetVO agesAvgBudget(int ageGroup);
	
	//월별 저축액
	List<MonthlySavingVO> monthlySaving(String accountNo);
	
	//검색 조건 and 고객 조건의 예/적금 list
	List<SavingProductVO> savingProductList(ProductSearchInfoVO searchInfo);
	
	//상품 별 우대금리 list
	List<PreferentialRateVO> pRateList(String productName);
}
