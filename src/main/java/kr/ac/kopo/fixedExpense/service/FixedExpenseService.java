package kr.ac.kopo.fixedExpense.service;

import java.util.List;

import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;

public interface FixedExpenseService {
	
	//내 고정지출 조회
	List<FixedExpenseVO> selectAll(String accountNo);
	
	//고정지출 추가
	void insert(FixedExpenseVO fixedExpense);

}
