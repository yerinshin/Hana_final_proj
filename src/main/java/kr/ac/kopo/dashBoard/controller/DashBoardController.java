package kr.ac.kopo.dashBoard.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.dashBoard.service.DashBoardService;
import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.dashBoard.vo.MonthlySavingVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService dashBoardservice;
	
	@Autowired
	private HanaroAccountService hanaroAccService;
	
	@GetMapping("/dashBoard/budgetAnalysis")
	public ModelAndView budgetAnalysis(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		String id = loginMember.getId();
	//	System.out.println(id);
		
		String accountNo = hanaroAccService.selectHanaroInfoById(id).getAccountNo();
	//	System.out.println(accountNo);
		 
		MonthlyBudgetVO myMonthlyBudget = dashBoardservice.myMonthlyBudget(accountNo);
	//	System.out.println(monthlyBudget);
			
		ModelAndView mav = new ModelAndView("dashBoard/budgetAnalysis");
		mav.addObject("myMonthlyBudget", myMonthlyBudget);
		
		
		//또래 평균 설정 예산 조회
		//나이대 선택
		int birthYear = Integer.parseInt(loginMember.getSs1().substring(0, 2));
		System.out.println(birthYear);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		System.out.println("year : "+year);
		if(birthYear >=(year-2000)) {
			birthYear += 1900;
			}else {
				birthYear += 2000;
			}
		int ageGroup = (year-birthYear) - (year-birthYear)%10;
		System.out.println(ageGroup);
		
		//또래 설정 예산 조회 service
		MonthlyBudgetVO agesAvgBudget = dashBoardservice.agesAvgBudget(ageGroup);
		
		mav.addObject("agesAvgBudget", agesAvgBudget);
		
		return mav;
	}
	
	
	@GetMapping("/dashBoard/savingAnalysis")
	public ModelAndView savingAnalysis(HttpServletRequest request) throws Exception{		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
	//	System.out.println(id);
		
	
	//	List<MonthlySavingVO> monthlySavingList = dashBoardservice.monthlySaving("081000000010");
	//	System.out.println("controller : "+monthlySavingList);
	//	ModelAndView mav = new ModelAndView("dashBoard/savingAnalysis");
		
	//	mav.addObject("monthlySavingList", monthlySavingList);
		HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode);
		System.out.println(hanaro);
		ModelAndView mav = new ModelAndView("dashBoard/savingAnalysis");
		mav.addObject("savingBalance", hanaro.getSavingBalance());
		
	//	return "dashBoard/savingAnalysis";
		return mav;
	}
	
	//monthlySaving 조회
	@ResponseBody
	@PostMapping("/dashBoard/monthlySaving")
	public List<MonthlySavingVO> monthlySaving(@RequestBody MemberVO member) {
	//	System.out.println("ajax..???" + member.getUserCode());
		int userCode = member.getUserCode();
		String accountNo = hanaroAccService.selectHanaroInfo(userCode).getAccountNo();
		
		List<MonthlySavingVO> monthlySavingList = dashBoardservice.monthlySaving(accountNo);
		System.out.println("controller : "+monthlySavingList);
		return monthlySavingList;
	}
}
