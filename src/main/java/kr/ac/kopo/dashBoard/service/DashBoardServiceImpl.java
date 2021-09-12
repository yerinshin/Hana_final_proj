package kr.ac.kopo.dashBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dashBoard.dao.DashBoardDAO;
import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.dashBoard.vo.MonthlySavingVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private DashBoardDAO dao;
	
	//내 설정 고정출금, 소비예산, 저축액 조회
	public MonthlyBudgetVO myMonthlyBudget(String accountNo) {
		/*
		AutoSplitVO monthlySplit = dao.myMonthlySplit(accountNo);
		FixedExpenseVO monthlyFixedExpense = dao.myMonthlyFixedExpense(accountNo);
				
		MonthlyBudgetVO monthlyBudget = new MonthlyBudgetVO();
		monthlyBudget.setConsumption(monthlySplit.getMoneyToConsumption());
		monthlyBudget.setSaving(monthlySplit.getMoneyToSaving());
		*/
		MonthlyBudgetVO monthlySplit = dao.myMonthlySplit(accountNo);
		MonthlyBudgetVO monthlyFixedExpense = dao.myMonthlyFixedExpense(accountNo);
		
		MonthlyBudgetVO monthlyBudget = new MonthlyBudgetVO();
		monthlyBudget.setConsumption(monthlySplit.getConsumption());
		monthlyBudget.setSaving(monthlySplit.getSaving());
		
		monthlyBudget.setFixedExpense(monthlyFixedExpense.getFixedExpense());
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

	//월별 저축액
	public List<MonthlySavingVO> monthlySaving(String accountNo) {
		//split to 비상금, split from 비상금 select
		List<SplitHistoryVO> savingSplitList = dao.monthlySaving(accountNo);
		System.out.println(savingSplitList);
		
/*		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) +1;
		System.out.println("year : "+year);
		System.out.println("month : "+month);
*/		
		
		List<SplitHistoryVO> splitToSaving = new ArrayList<SplitHistoryVO>();
		List<SplitHistoryVO> splitFromSaving = new ArrayList<SplitHistoryVO>();
	
		//	Map<String, Integer> monthlySaving = new HashMap<String, Integer>();
		
		List<MonthlySavingVO> monthlySavingList = new ArrayList<MonthlySavingVO>();
		
		/* int beginMonth = month -6; */
		// split To 비상금, split From 비상금 분리
		
		for(SplitHistoryVO saving : savingSplitList) {
			if(saving.getSplitTo().equals("saving_balance")) {
				splitToSaving.add(saving);	
			}else
				splitFromSaving.add(saving);
		}
		System.out.println("splitTo : " + splitToSaving);
		System.out.println("splitFrom" + splitFromSaving);
	
		// 월 저축액 = 비상금으로 들어온 금액 - 비상금에서 나간 금액
		for(SplitHistoryVO splitTo : splitToSaving) {
			MonthlySavingVO monthlySaving = new MonthlySavingVO();
			System.out.println(splitTo);
			int savingMoney = splitTo.getTransMoney();
			for(SplitHistoryVO splitFrom : splitFromSaving) {
				if(splitTo.getTransDate().equals(splitFrom.getTransDate())) {
					savingMoney -= splitFrom.getTransMoney();
				}
		//		monthlySaving.put(splitTo.getTransDate(), savingMoney);
				String[] date = splitTo.getTransDate().split("/");
				monthlySaving.setYear(Integer.parseInt(date[0]));
				monthlySaving.setMonth(Integer.parseInt(date[1]));
				monthlySaving.setSavingMoney(savingMoney);
			}
			System.out.println("몇번 : " + monthlySaving);
			monthlySavingList.add(monthlySaving);		
		}
		
		/*		 * //key 큰순서로 정렬 Object[] mapkey = monthlySaving.keySet().toArray();
		 * Arrays.sort(mapkey);
		 * 
		 * 
		 * for (String nKey : monthlySaving.keySet()) {
		 * System.out.println("sort : "+mapkey); }
		 */

		System.out.println(monthlySavingList);
		return monthlySavingList;
	}


}
