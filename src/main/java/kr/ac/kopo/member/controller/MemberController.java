package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes("loginMember")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/signUp")
	public String signUpForm() {
		
		return "member/signUp";
	}
	
	@GetMapping("/member/login")
	public String loginForm() {
		
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String login(MemberVO member, Model model, HttpSession session) {
		
		MemberVO loginMember = service.login(member);
		
		if(loginMember == null) {
			String msg = "아이디 또는 패스워드가 잘못되었습니다";
			model.addAttribute("msg", msg);
			
			return "member/login";
		}
		
		model.addAttribute("loginMember",loginMember);
		
		String dest = (String)session.getAttribute("dest");
		if(dest != null ) {
			session.removeAttribute("dest");
			return "redirect:/" + dest;
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/member/logout")
	public String logout(SessionStatus sessionStatus) {
		System.out.println(sessionStatus.isComplete());
		sessionStatus.setComplete();
		return "redirect:/";
	}
}
