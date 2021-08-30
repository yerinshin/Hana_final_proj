package kr.ac.kopo.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountDAO dao;
	
	public List<AccountVO> selectAll(int userCode) {
		System.out.println(dao);
		
		List<AccountVO> accountList = dao.selectAll(userCode);
		
		return accountList;
	}

	public AccountVO selectByAccNo(String accountNo) {
		
		AccountVO account = dao.selectByAccNo(accountNo);
		return account;
	}

}
