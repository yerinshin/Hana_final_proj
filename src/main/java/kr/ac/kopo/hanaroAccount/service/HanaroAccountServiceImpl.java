package kr.ac.kopo.hanaroAccount.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.dao.HanaroAccountDAO;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.hanaroAccount.vo.SplitHistoryVO;
import kr.ac.kopo.hanaroAccount.vo.SplitKindInfoVO;

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
	
	
	/*
	 * public AccountVO selectHanaroInfoById(String id) {
	 * 
	 * AccountVO account = hanaroAccountDAO.selectHanaroInfoById(id); return
	 * account; }
	 */
	
	@Transactional
	public void changeToHanaro(String accountNo) {
		
		//1. accountType변경
			hanaroAccountDAO.updateType(accountNo);
			AccountVO account = accountDAO.selectByAccNo(accountNo);
			
			System.out.println(account);
			
		//2. hanaro통장 table에 insert
			hanaroAccountDAO.insert(account);
		
	}
	
	/*
	 * //잔액이동
	 * 
	 * @Transactional public void splitMoney(SplitInfoVO splitInfo, SplitHistoryVO
	 * splitHistory) { System.out.println("잔액이동으로 넘어가는 splitVO :" + splitInfo);
	 * //잔액이동 hanaroAccountDAO.splitMoney(splitInfo); //잔액이동내역 생성
	 * hanaroAccountDAO.insertSplitHistory(splitHistory); }
	 */
	//잔액이동
	@Transactional
	public void splitMoney(SplitHistoryVO splitHistory) {
		System.out.println("잔액이동으로 넘어가는 splitVO :" + splitHistory);
		//잔액이동
		/* hanaroAccountDAO.splitMoney(splitInfo); */
		hanaroAccountDAO.splitMoney(splitHistory);
		//잔액이동내역 생성
		hanaroAccountDAO.insertSplitHistory(splitHistory);
	}

	// 거래내역+잔액이동 내역 조회
	public List<SplitHistoryVO> historyByKind(SplitKindInfoVO splitKindInfo) {
		System.out.println(splitKindInfo);
		List<SplitHistoryVO> historyList = hanaroAccountDAO.historyByKind(splitKindInfo);
//		List<SplitHistoryVO> basicHistory = hanaroAccountDAO.basicHistory(accountNo);
		
		System.out.println(historyList);
		return historyList;
	}

	
	
	
}
