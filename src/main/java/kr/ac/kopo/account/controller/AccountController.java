package kr.ac.kopo.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService service;
	
	@GetMapping("/account")
	public ModelAndView accountList(int userCode) {
		
		
		return null;
	}

}
