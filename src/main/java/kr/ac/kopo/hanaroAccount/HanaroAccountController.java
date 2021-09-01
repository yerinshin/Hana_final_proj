package kr.ac.kopo.hanaroAccount;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.hanaroAccount.vo.HanaroVO;

@Controller
public class HanaroAccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private HanaroAccountService hanaroAccService;
	
	//내 하나로 통장 조회
	@GetMapping("/hanaro/{userCode}")
	public ModelAndView hanaroAccount(@PathVariable("userCode") int userCode) {
		
		AccountVO hanaroInfo = hanaroAccService.selectHanaroInfo(userCode);
		HanaroVO hanaro = hanaroAccService.selectHanaroAcc(userCode);
		
		ModelAndView mav = new ModelAndView("hanaro/hanaroAccount");
		
		mav.addObject("hanaroInfo", hanaroInfo);
		mav.addObject("hanaro", hanaro);
		
		
		/*
		 * Map<AccountVO, HanaroVO> hanaroMap = new HashMap<AccountVO, HanaroVO>();
		 * 
		 * hanaroMap.put(hanaroInfo, hanaroAcc); System.out.println(hanaroMap);
		 * 
		 * mav.addObject("hanaroMap", hanaroMap);
		 * 
		 * System.out.println("value : " + hanaroMap.get(hanaroInfo));
		 * System.out.println("key : " + hanaroMap.keySet());
		 */
		return mav;
	}
	
	//통장전환 page 호출
	@GetMapping("/hanaro/changeToHanaro/{userCode}")
	public ModelAndView accountList(@PathVariable("userCode") int userCode)  {
		
			
		//List<AccountVO> accountList = accountServiceImpl.selectAll(userCode);
		List<AccountVO> accountList = accountService.selectAll(userCode);
		
		ModelAndView mav = new ModelAndView("hanaro/changeToHanaro");
		
		mav.addObject("accountList", accountList);
		
		return mav;
	}
	
	//전환할 통장 선택
	@PostMapping("/hanaro/changeToHanaro")
	public ModelAndView selectAccount(String accountNo) {
		
		System.out.println("account :" + accountNo);		
		AccountVO account = accountService.selectByAccNo(accountNo);
		
		ModelAndView mav = new ModelAndView("hanaro/termsOfService");
		mav.addObject("account", account);
		
		return mav;
	}
	
	//약관동의 후 통장전환 process 실행
	@PostMapping("/hanaro/termsOfService")
	public String changeToHanaro(String accountNo, int userCode) {
		
		System.out.println(accountNo);
		
		//	하나로 통장 전환 : (1. account type -> 하나로 통장	 	2.하나로 통장 table에 INSERT) 
		
		hanaroAccService.changeToHanaro(accountNo);
			
		//  3. 타입 바뀐 통장정보 불러오기
		return "redirect:/hanaro/" + userCode;
	}
	
}
