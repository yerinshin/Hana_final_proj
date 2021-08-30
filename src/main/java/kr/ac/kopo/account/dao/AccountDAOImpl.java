package kr.ac.kopo.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<AccountVO> selectAll(int userCode) {
		
		List<AccountVO> accountList = sqlSessionTemplate.selectList("account.AccountDAO.selectAll", userCode);
		System.out.println(accountList);
		return accountList;
	}

	public AccountVO selectByAccNo(String accountNo) {
		
		AccountVO account = sqlSessionTemplate.selectOne("account.AccountDAO.selectByAccNo", accountNo);
		System.out.println(account);
		
		return account;
	}

}
