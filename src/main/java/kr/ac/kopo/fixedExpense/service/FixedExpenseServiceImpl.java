package kr.ac.kopo.fixedExpense.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.fixedExpense.dao.FixedExpenseDAO;
import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;

@Service
public class FixedExpenseServiceImpl implements FixedExpenseService {
	
	@Autowired
	private FixedExpenseDAO dao;
	
	public List<FixedExpenseVO> selectAll(String accountNo) {
		
		List<FixedExpenseVO> fixedExpenseList = dao.selectAll(accountNo);
		
		return fixedExpenseList;
	}

	public void insert(FixedExpenseVO fixedExpense) {
		dao.insert(fixedExpense);
	}

	public void delete(int expenseCode) {
		dao.delete(expenseCode);
	}

}
