package kr.ac.kopo.account.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;

public interface AccountService {
	
	List<AccountVO> selectAll(int userCode);
	
	AccountVO selectByAccNo(String accountNo);
	
}
