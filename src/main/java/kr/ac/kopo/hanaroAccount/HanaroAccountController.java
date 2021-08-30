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

@Controller
public class HanaroAccountController {
	
	@Autowired
	private AccountService accountService;
	
	
	@GetMapping("/hanaro")
	public String hanaroAccount() {
		
		return "hanaro/hanaroAccount";
	}
	
	@GetMapping("/hanaro/changeToHanaro/{userCode}")
	public ModelAndView accountList(@PathVariable("userCode") int userCode)  {
		
			
		//List<AccountVO> accountList = accountServiceImpl.selectAll(userCode);
		List<AccountVO> accountList = accountService.selectAll(userCode);
		
		ModelAndView mav = new ModelAndView("hanaro/changeToHanaro");
		
		mav.addObject("accountList", accountList);
		
		return mav;
	}
	
	@PostMapping("/hanaro/termsOfService")
	public ModelAndView termsOfService(String accountNo) {
		
		System.out.println("account :" + accountNo);		
		AccountVO account = accountService.selectByAccNo(accountNo);
		
		ModelAndView mav = new ModelAndView("hanaro/termsOfService");
		mav.addObject("account", account);
		
		return mav;
	}
	
}
