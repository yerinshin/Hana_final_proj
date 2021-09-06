package kr.ac.kopo.dashBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
	
	@GetMapping("/dashBoard/budgetAnalysis")
	public String budgetAnalysis() {
		
		return "dashBoard/budgetAnalysis";
	}
	
	@GetMapping("/dashBoard/savingAnalysis")
	public String savingAnalysis() {
		
		return "dashBoard/savingAnalysis";
	}
}
