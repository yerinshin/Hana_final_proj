package kr.ac.kopo.fixedExpense.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;

@Repository
public class FixedExpenseDAOImpl implements FixedExpenseDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<FixedExpenseVO> selectAll(String accountNo) {
		
		List<FixedExpenseVO> fixedExpenseList = sqlSessionTemplate.selectList("fixedExpense.FixedExpenseDAO.selectAll", accountNo);
		
		return fixedExpenseList;
	}

	public void insert(FixedExpenseVO fixedExpense) {
		System.out.println("고정지출 추가 dao :" + fixedExpense);
		sqlSessionTemplate.insert("fixedExpense.FixedExpenseDAO.insert", fixedExpense);
	}

	public void delete(int expenseCode) {
		sqlSessionTemplate.delete("fixedExpense.FixedExpenseDAO.delete", expenseCode);
	}
	

}
