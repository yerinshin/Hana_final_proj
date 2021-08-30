package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;

public interface AccountDAO {
	
	List<AccountVO> selectAll(int userCode);
	
	AccountVO selectByAccNo(String accountNo);

}
