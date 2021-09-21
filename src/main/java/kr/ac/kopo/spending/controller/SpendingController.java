package kr.ac.kopo.spending.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.spending.service.SpendingService;
import kr.ac.kopo.spending.vo.CalendarVO;
import kr.ac.kopo.spending.vo.DaySpendingVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import kr.ac.kopo.spending.vo.WeeklySpendingVO;

@Controller
public class SpendingController {
	
	@Autowired
	private SpendingService spendingService;	

	@Autowired
	private HanaroAccountService hanaroAccService;
	/*
	@GetMapping("/spending/myCalendar")
	public String myCalendar() {
		
		
		 // List<TransactionHistoryVO> historyList = spendingService.historyByDate(null);
		 // System.out.println(historyList);
		 
		
		
		//주별 소비
		 
		
		return "spending/myCalendar";
	}
	*/
	
	@GetMapping("/spending/myCalendar")
	public ModelAndView myCalendar(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		
		ModelAndView mav = new ModelAndView("spending/myCalendar");
		
		//주별 소비
		WeeklySpendingVO weeklySpending = spendingService.weeklySpending(accountNo);
		mav.addObject("weeklySpending",weeklySpending);
		
		//일별 소비
		DaySpendingVO daySpending = spendingService.daySpending(accountNo);
		mav.addObject("daySpending",daySpending);
		//System.out.println(daySpending);
		
		return mav;
	}
	
	//달력 위 지출 표시
	@ResponseBody
	@PostMapping("/myCalendar/calendarList")
	public List<CalendarVO> calendarList(@RequestBody MemberVO member) {
		int userCode = member.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		List<CalendarVO> calendarList = spendingService.calendarListByDate(accountNo);
		System.out.println(calendarList);
		
		return calendarList;
	}
	
	//날짜 별 소비, 수입 내역
	@ResponseBody
	@PostMapping("/myCalendar/historyListByDate/{date}")
	public List<TransactionHistoryVO> historyList(@RequestBody MemberVO member, @PathVariable("date") String clickedDate){
		int userCode = member.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		String date = clickedDate;
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("accountNo", accountNo);
		map.put("date", date);
		//System.out.println("map : " + map);
		
		List<TransactionHistoryVO> historyList = spendingService.historyByDate(map);
		//System.out.println(historyList);
		
		return historyList;
	}
	
	@GetMapping("/spending/spendingAnalysis")
	public String spendingAnalysis()  {
		
		
		return "spending/spendingAnalysis";
	}
	
	//월 별 카테고리 별 소비차트
	@ResponseBody
	@PostMapping("/spending/categoryChart")
	public List<SpendingInfoVO> spendingChart(@RequestBody SpendingInfoVO spendingInfo, HttpServletRequest request) throws Exception {
		//System.out.println("카테고리차트");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		spendingInfo.setAccountNo(accountNo);
		//System.out.println(spendingInfo);
		
		List<SpendingInfoVO> spendingList = spendingService.spendingByCategory(spendingInfo);
		//System.out.println("categorySpendingList : "+spendingList);
		
		//top3 가져오는 sqlMap, dao, 서비스까지는 만듬
		
		return spendingList;		
	}
	
	//top3
	@ResponseBody
	@PostMapping("/spending/topSpending")
	public List<String> topSpending(@RequestBody SpendingInfoVO spendingInfo, HttpServletRequest request) throws Exception {
		//System.out.println("top3");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		spendingInfo.setAccountNo(accountNo);
		//System.out.println(spendingInfo);
		
		List<String> topSpendingList = spendingService.topSpending(spendingInfo);
		//System.out.println("topSpendingList : "+topSpendingList);
		
		//top3 가져오는 sqlMap, dao, 서비스까지는 만듬
		
		return topSpendingList;		
	}
	
	//주별 소비
	@GetMapping("/spending/weeklySpending")
	public WeeklySpendingVO weeklySpending(HttpServletRequest request) throws Exception {
		System.out.println("주별 소비 !!!!!");
		
		return null;
	}
	
}
