package kr.ac.kopo.spending.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpendingController {
	
	@GetMapping("/spending/myCalendar")
	public String myCalendar() {
		
		return "spending/myCalendar";
	}
}
