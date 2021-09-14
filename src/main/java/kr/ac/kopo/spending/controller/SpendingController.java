package kr.ac.kopo.spending.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.spending.service.SpendingService;
import kr.ac.kopo.spending.vo.SpendingInfoVO;

@Controller
public class SpendingController {
	
	@Autowired
	private SpendingService spendingService;
	

	@Autowired
	private HanaroAccountService hanaroAccService;
	
	@GetMapping("/spending/myCalendar")
	public String myCalendar() {
		
		return "spending/myCalendar";
	}
	
	@GetMapping("/spending/spendingAnalysis")
	public String spendingAnalysis()  {
		
		
		return "spending/spendingAnalysis";
	}
	
	//월 별 카테고리 별 소비차트
	@ResponseBody
	@PostMapping("/spending/categoryChart")
	public List<SpendingInfoVO> spendingChart(@RequestBody SpendingInfoVO spendingInfo, HttpServletRequest request) throws Exception {
		System.out.println("카테고리차트");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		spendingInfo.setAccountNo(accountNo);
		System.out.println(spendingInfo);
		
		List<SpendingInfoVO> spendingList = spendingService.spendingByCategory(spendingInfo);
		System.out.println("categorySpendingList : "+spendingList);
		
		//top3 가져오는 sqlMap, dao, 서비스까지는 만듬
		
		return spendingList;		
	}
	
	//top3
	@ResponseBody
	@PostMapping("/spending/topSpending")
	public List<String> topSpending(@RequestBody SpendingInfoVO spendingInfo, HttpServletRequest request) throws Exception {
		System.out.println("top3");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		spendingInfo.setAccountNo(accountNo);
		System.out.println(spendingInfo);
		
		List<String> topSpendingList = spendingService.topSpending(spendingInfo);
		System.out.println("topSpendingList : "+topSpendingList);
		
		//top3 가져오는 sqlMap, dao, 서비스까지는 만듬
		
		return topSpendingList;		
	}
	
}
