package kr.ac.kopo.fixedExpense;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.fixedExpense.service.FixedExpenseService;
import kr.ac.kopo.fixedExpense.vo.FixedExpenseVO;
import kr.ac.kopo.hanaroAccount.service.HanaroAccountService;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class FixedExpenseController {
	
	@Autowired
	private HanaroAccountService hanaroAccService;
	
	@Autowired
	private FixedExpenseService fixedExpenseService;
	
	//고정 출금, 고정 잔액이동 설정page
	
	/*
		@GetMapping("/hanaro/dashBoard")
		public String setFixedBudget() {
			/*
			 * List<FixedExpenseVO> list = fixedExpense(); 
			 * System.out.println(list);
			 
			
		//	List<FixedExpenseVO> list = fixedExpenseService.selectAll("081000000010");
			return "dashBoard/fixedBudget";
		}
*/
		//고정지출(하나로 예산 지출)  page return
		@GetMapping("/hanaro/dashBoard/{userCode}")
		public ModelAndView setFixedBudget(@PathVariable("userCode") int userCode) {
			AccountVO account = hanaroAccService.selectHanaroInfo(userCode);
			String accountNo = account.getAccountNo();
			System.out.println(accountNo);
			
			List<FixedExpenseVO> fixedExpenseList = fixedExpenseService.selectAll(accountNo);
			ModelAndView mav = new ModelAndView("dashBoard/fixedBudget");
			mav.addObject("fixedExpenseList", fixedExpenseList);
			mav.addObject(accountNo);
			
			return mav;
		}
		
		
		//고정지출 목록
		@ResponseBody
		@PostMapping("/hanaro/fixedExpense")
		public List<FixedExpenseVO> fixedExpense(@RequestBody MemberVO loginMember){
			/* System.out.println(userCode); */
			/*
			 * List<FixedExpenseVO> fixedExpenseList =
			 * fixedExpenseService.selectAll(accountNo);
			 */
			
			AccountVO account = hanaroAccService.selectHanaroInfo(loginMember.getUserCode());
			String accountNo = account.getAccountNo();
			List<FixedExpenseVO> fixedExpenseList = fixedExpenseService.selectAll(accountNo);
			
			return fixedExpenseList;
		}
		
		//고정지출 목록 추가
		@ResponseBody
		@PostMapping("/addFixedExpense")
		public void addFixedExpense(@RequestBody FixedExpenseVO fixedExpense) {
			System.out.println(fixedExpense);
			
			fixedExpenseService.insert(fixedExpense);
			
		}
		
		//고정지출 목록 삭제
		@ResponseBody
		@PostMapping("/deleteFixedExpense")
		public void deleteFixedExpense(@RequestBody FixedExpenseVO fixedExpense) {
			System.out.println(fixedExpense);
			
			int expenseCode = fixedExpense.getCode();
			fixedExpenseService.delete(expenseCode);
	
		}
		
		//내 설정 월급 가져오기
		
}
