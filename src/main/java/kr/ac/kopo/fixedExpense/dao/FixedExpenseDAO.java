package kr.ac.kopo.fixedExpense.dao;

import java.util.List;

import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;

public interface FixedExpenseDAO {
	//내 고정지출 목록 조회
		List<FixedExpenseVO> selectAll(String accountNo);
		
		void insert(FixedExpenseVO fixedExpense);
		
		void delete(int expenseCode);
}
