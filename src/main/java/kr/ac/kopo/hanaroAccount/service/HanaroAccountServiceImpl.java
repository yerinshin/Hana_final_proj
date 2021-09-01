package kr.ac.kopo.hanaroAccount.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.dao.HanaroAccountDAO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;

@Service
public class HanaroAccountServiceImpl implements HanaroAccountService {
	
	@Autowired
	private HanaroAccountDAO hanaroAccountDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	public HanaroVO selectHanaroAcc(int userCode) {
		
		HanaroVO hanaro = hanaroAccountDAO.selectHanaroAcc(userCode);
		System.out.println(hanaro);
		return hanaro;
	}

	public AccountVO selectHanaroInfo(int userCode) {
		AccountVO account = hanaroAccountDAO.selectHanaroInfo(userCode);
		
		return account;
	}
	
	public void changeToHanaro(String accountNo) {
		
		//1. accountType변경
			hanaroAccountDAO.updateType(accountNo);
			AccountVO account = accountDAO.selectByAccNo(accountNo);
			
			System.out.println(account);
			
		//2. hanaro통장 table에 insert
			hanaroAccountDAO.insert(account);
		
	}


	
	
}
