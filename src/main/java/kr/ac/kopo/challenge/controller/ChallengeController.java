package kr.ac.kopo.challenge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.challenge.service.ChallengeService;
import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService challengeService;
	@Autowired
	private HanaroAccountService hanaroAccService;
	
	@GetMapping("spending/challenge")
	public ModelAndView challenge(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		//도전 목록
		List<ChallengeVO> challengeList = challengeService.challengeList(accountNo);
		
		//카테고리 별 사용 금액
		//List<SpendingInfoVO> spendingList = challengeService.spendingList(accountNo);
	//	System.out.println(spendingList);
		ModelAndView mav = new ModelAndView("spending/challenge");
		mav.addObject("challengeList", challengeList);
		
		return mav;
	}
	
	@PostMapping("/insert")
	public String insert(ChallengeVO challenge, HttpServletRequest request) throws Exception{
		
		MemberVO loginMember = (MemberVO) request.getSession().getAttribute("loginMember");
		int userCode = loginMember.getUserCode();
		String accountNo = hanaroAccService.selectHanaroAcc(userCode).getAccountNo();
		
		challenge.setAccountNo(accountNo);
		
		System.out.println("챌린지 추가 : " +challenge);
		challengeService.insert(challenge);
		
		
		
		return "redirect:spending/challenge";
	}
	
}
