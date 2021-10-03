package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.challenge.vo.ChallengeVO;
import kr.ac.kopo.dashBoard.dao.DashBoardDAO;
import kr.ac.kopo.dashBoard.vo.MonthlyBudgetVO;
import kr.ac.kopo.fixedExpense.service.FixedExpenseService;
import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.vo.ReportVO;
import kr.ac.kopo.report.vo.SmsVO;
import kr.ac.kopo.spending.vo.SpendingInfoVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@EnableScheduling 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class test {
	
	@Autowired
	private FixedExpenseService fixedExpenseService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ReportDAO reportDAO;
	
	@Autowired
	private DashBoardDAO dashBoardDAO;
	
	@Ignore	
	@Test  
	public void Service생성테스트() throws Exception {
		//System.out.println("dataSource : " + dataSource);
		assertNotNull(fixedExpenseService);    	//dataSource가 가지고 있는 값이 null이 아닌지만 확인
	}
	//@Ignore
	@Test
	public void smsCreate2() {

		
		
	
				
				
				String text = "[하나은행]\n";
				text += "강하나님 [쇼핑 줄이기] 초과소비 패널티 발생!\n";
				text += "이동 : 생활금 → 비상금\n";
				//text += "[" + penaltyMoney +"원]";
				text += "[25020원]";
				
				System.out.println("text : \n"+text);
				
				
				
				String api_key = "NCS9XWBKWK5YKNTD"; 
				String api_secret = "IO9LVLNUVWWJ5ZRDFEEMLR9TRZHQWLEF"; 
				Message coolsms = new Message(api_key,api_secret); 
				HashMap<String, String> params = new HashMap<String, String>();
				
				params.put("from", "01047520453");
				params.put("to", "01047520453"); 
				params.put("type","SMS"); 
				params.put("text", text); 
				params.put("app_version", "test app 1.2");
				
				try { JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
				
				} catch (CoolsmsException e) { 
					System.out.println(e.getMessage());
					System.out.println(e.getCode()); 
				}
				
				
				
				
				
		
		
	}
	@Ignore
	@Test
	public void smsCreate() {
		List<SmsVO> smsList = reportDAO.smsList();
		System.out.println(smsList);

		
		
		if(smsList != null) {
		
			int i=0;
				
		while(i < smsList.size()) {
			String name = smsList.get(i).getName();
			String tel = smsList.get(i).getTel();
			//String accountNo = smsList.get(i).getAccountNo();
			String category = smsList.get(i).getCategory();
			int penaltyMoney = smsList.get(i).getPenaltyMoney();
			//int logCode = smsList.get(i).getLogCode();
			
			
			
			String text = "[하나은행]\n";
			text += name +" 님 [" +category+ "줄이기] 초과소비 패널티 발생!\n";
			text += "이동 : 생활금 → 비상금\n";
			text += "[" + penaltyMoney +"원]";
			
			
			System.out.println("text : \n"+text);
			
			
			
			 String api_key = ""; 
			 String api_secret = ""; 
			 Message coolsms = new Message(api_key,api_secret); 
			 HashMap<String, String> params = new HashMap<String, String>();
			 
			 params.put("from", "01047520453");
			 params.put("to", tel); 
			 params.put("type","SMS"); 
			 params.put("text", text); 
			 params.put("app_version", "test app 1.2");
			 
			 try { JSONObject obj = (JSONObject) coolsms.send(params);
			 System.out.println(obj.toString());
			 
			 } catch (CoolsmsException e) { 
				 System.out.println(e.getMessage());
				 System.out.println(e.getCode()); 
			 }
			 
			
			
				
			
		  i++;
		}
		
		reportDAO.changeFlag(smsList);
	}
		
		
	}
	@Ignore
	@Test
	public void sendSms() {
		
		

        String api_key = "NCS9XWBKWK5YKNTD";
        String api_secret = "IO9LVLNUVWWJ5ZRDFEEMLR9TRZHQWLEF";
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> params = new HashMap<String, String>();

        params.put("to", "01047520453");
        params.put("from", "01047520453");
        params.put("type", "SMS");
        params.put("text", "sms 테스트!");
        params.put("app_version", "test app 1.2");

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}
	
	@Ignore
	@Test
	public void monthlyReportCreate() throws IOException {
		
		
		List<ReportVO> reportMemberList = reportDAO.reportMemberList();
		System.out.println(reportMemberList);
		
		// 정보사항 - 날짜
		Date date = new Date();
		SimpleDateFormat dateTitle = new SimpleDateFormat("YYYY년 MM월");
		SimpleDateFormat dateContent = new SimpleDateFormat("MM월");
		String nowYearMonth = dateTitle.format(date); // 오늘 연도 월
		String nowMonth = dateContent.format(date); // 오늘 월
		SimpleDateFormat yearMonthDate = new SimpleDateFormat("YYYYMM");
		String yearMonth = yearMonthDate.format(date);
		
		//고객정보
		String name="";
		String accountNo = "";
		
		
		//9월 달성 title 3
		
		//예산구성
		int basicBudget =0;
		int consumptionBudget =0;
		int savingBudget =0;
		
		//이번달 수입, 지출
		int incomeTotal =0;
		int spendingTotal =0;
		
		int basicSpent;
		int consumptionSpent;
		int savingSpent;
		
		
		if(reportMemberList.size() > 0) {
			int i = 0;
			
			while( i < reportMemberList.size()) {
				FileOutputStream fos = null;
				BufferedOutputStream bos = null;
				
				name = reportMemberList.get(i).getName();
				accountNo = reportMemberList.get(i).getAccountNo();
				System.out.println(name);
				System.out.println(accountNo);
				//예산구성
				MonthlyBudgetVO monthlyBudget = dashBoardDAO.myMonthlySplit(accountNo);
				basicBudget = dashBoardDAO.myMonthlyFixedExpense(accountNo).getFixedExpense();
				consumptionBudget = monthlyBudget.getConsumption();
				savingBudget = monthlyBudget.getSaving();
		
				incomeTotal = reportDAO.incomeTotal(accountNo);
				spendingTotal = reportDAO.spendingTotal(accountNo);
				MonthlyBudgetVO realSpent = reportDAO.realSpent(accountNo);
				basicSpent = realSpent.getFixedExpense();
				consumptionSpent = realSpent.getConsumption();
				savingSpent = realSpent.getSaving();
				System.out.println("예산..!!" + monthlyBudget);
				System.out.println("예산..!!" + realSpent);
				System.out.println("??????????????????????");
				
				
				//도전
				List<ChallengeVO> challenge;
				
				//소비, 사용처
				List<SpendingInfoVO> categoryTop;
				
				//일자 최고 소비
				List<TransactionHistoryVO> dayTop;
				
			
		
			try {
						
				
				
				
				fos = new FileOutputStream("C:\\Users\\HP\\Desktop\\java\\spring-workspace\\Hana-Project\\src\\main\\webapp\\hanaro_report.html");
				bos = new BufferedOutputStream(fos);
				String str ="<!DOCTYPE html>\r\n"
						+ "<html>\r\n"
						+ "<head>\r\n"
						+ "<meta charset=\"UTF-8\">\r\n"
						+ "<title>Insert title here</title>\r\n"
						+ "   <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js\"></script>\r\n"
						+ "	<script src=\"https://code.jquery.com/jquery-3.6.0.js\" integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\" crossorigin=\"anonymous\"></script> \r\n"
						+ "	<link rel=\"stylesheet\" href=\"http://localhost:9998/Hana-Project/resources/template/css/bootstrap.min.css\">\r\n"
						+ "    <!-- style CSS\r\n"
						+ "		============================================ -->\r\n"
						+ "    <link rel=\"stylesheet\" href=\"http://localhost:9998/Hana-Project/resources/template/css/style.css\">\r\n"
						+ "    <link rel=\"stylesheet\" href=\"http://localhost:9998/Hana-Project/resources/css/style.css\">\r\n"
						+ "    <link rel=\"stylesheet\" href=\"http://localhost:9998/Hana-Project/resources/css/email.css\">\r\n"
						+ "\r\n"
						+ "	<script type=\"text/javascript\"> 	\r\n"
						+ "	var oldTab = [ 1, 1 ];\r\n"
						+ "		function tabShowHideFunc(t, n, b) { // t = this, n = x번째 탭, b = 탭아닌 버튼으로 탭 컨트롤시..\r\n"
						+ "			var gStr = t.href.split('.html#')[1]; 		\r\n"
						+ "		if (!gStr) {\r\n"
						+ "				gStr = t.href.split('.htm#')[1]; 			\r\n"
						+ "				if (!gStr) {\r\n"
						+ "					gStr = t.href.split('#')[1]; 			} 		}\r\n"
						+ "			gStr1 = gStr.substr(0, gStr.length - 1);\r\n"
						+ "			var gNum = (t.href).substr((t.href).length - 1, (t.href).length); \r\n"
						+ "			if (arguments[2] != undefined) {\r\n"
						+ "				if (arguments[2] == 'btn') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[gNum - 1]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					document.documentElement.scrollTop = 0;\r\n"
						+ "					document.body.scrollTop = 0;\r\n"
						+ "				} else if (arguments[2] == 'slide') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					setTimeout(function() {\r\n"
						+ "						var targetPos = document.getElementById(gStr).offsetTop;\r\n"
						+ "						window.scroll(0, targetPos); 				}, 200);\r\n"
						+ "				} else if (arguments[2] == 'voice') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					setTimeout(function() {\r\n"
						+ "						var targetPos = document.getElementById(gStr).offsetTop;\r\n"
						+ "						window.scroll(0, targetPos); 				}, 200);\r\n"
						+ "				} else if (arguments[2] == 'revolg') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					setTimeout(function() {\r\n"
						+ "						var targetPos = document.getElementById(gStr).offsetTop;\r\n"
						+ "						window.scroll(0, targetPos); 				}, 200);\r\n"
						+ "				} else if (arguments[2] == 'revol') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[1]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					setTimeout(function() {\r\n"
						+ "						var targetPos = document.getElementById(gStr).offsetTop;\r\n"
						+ "						window.scroll(0, targetPos); 				}, 200);\r\n"
						+ "				} else if (arguments[2] == 'minus') {\r\n"
						+ "					document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
						+ "							.getElementsByTagName(\"a\")[0].click();\r\n"
						+ "					setTimeout(function() {\r\n"
						+ "						var targetPos = document.getElementById(gStr).offsetTop;\r\n"
						+ "						window.scroll(0, targetPos); 				}, 200);\r\n"
						+ "				} 		} else {\r\n"
						+ "				t.parentNode.className = \"on col-md-4\";\r\n"
						+ "				document.getElementById(gStr1 + gNum).style.display = \"block\";\r\n"
						+ "				if (oldTab[n - 1] != gNum) {\r\n"
						+ "					t.parentNode.parentNode.getElementsByTagName(\"li\")[oldTab[n - 1] - 1].className = \"col-md-4\";\r\n"
						+ "					document.getElementById(gStr1 + oldTab[n - 1]).style.display = \"none\";\r\n"
						+ "				} 			oldTab[n - 1] = gNum; 		\r\n"
						+ "				} 	\r\n"
						+ "			}\r\n"
						+ "\r\n"
						+ "		</script> \r\n"
						+ "		<script> 	\r\n"
						+ "		$(document).ready(function() {\r\n"
						+ "			$(\".ac-label\").click(function(e) { 			\r\n"
						+ "				e.preventDefault();\r\n"
						+ "				$check = $(this).prev(); 			\r\n"
						+ "				if ($check.prop('checked'))\r\n"
						+ "					$check.prop(\"checked\", false); 			\r\n"
						+ "				else\r\n"
						+ "					$check.prop(\"checked\", true); 		\r\n"
						+ "				}); \r\n"
						+ "\r\n"
						+ "			});\r\n"
						+ "	</script> \r\n"
						+ "\r\n"
						+ "</head>\r\n";
				
				
					str += "<body>\r\n"
						+ "<div class=\"div-body container\">\r\n"
						+ "\r\n"
						+ "<div class=\"header-div\"> 			\r\n"
						+ "	<h2>hana bank</h2>\r\n"
						+ "</div>\r\n"
						+ "<div class=\"content\" id=\"content\" >\r\n"
						+ "	\r\n"
						+ "	<h1 id=\"h1\"> "+ nowYearMonth +"<span style=\"font-size : 18pt\"> &nbsp;&nbsp;&nbsp;하나로통장 월간 금융 리포트 </span></h1> \r\n"
						+ "	\r\n"
						+ "	<!-- 탭 선택 -->\r\n"
						+ "	<ul class=\"mailGuideTab tab3 emailTab row\" id=\"email\">\r\n"
						+ "	\r\n"
						+ "		<li class=\"on col-md-4\"><a href=\"#email01\" onclick=\"tabShowHideFunc(this,1); return false;\">요약</a></li>\r\n"
						+ "		<li class=\"col-md-4\"><a href=\"#email02\" onclick=\"tabShowHideFunc(this,1); return false;\">"+nowMonth +" 소비</a></li>\r\n"
						+ "		<li class=\"col-md-4\"><a href=\"#email03\" onclick=\"tabShowHideFunc(this,1); return false;\">도전 현황</a></li>\r\n"
						+ "	</ul>\r\n"
						+ "	\r\n";
						
						
					str += "	<!----------------------------------------- 첫번째 탭 ---------------------------------------------->\r\n"
						+ "	<div class=\"select-div\" id=\"email01\" style=\"display: block;\">\r\n"
						+ "	\r\n"
						+ "		<span class=\"span-big\"> 강하나님</span> \r\n"
						+ "		하나은행을 이용해주셔서 감사합니다.<br>\r\n"
							+ nowMonth + " 하나로 통장 금융 리포트입니다.\r\n"
						+ "		\r\n"
						+ "		<div id=\"accountInfo\">\r\n"
						+ "			상품명 : 하나로 통장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호 : "+accountNo	
						+ "</div>\r\n"
						+ "		\r\n"
						+ "		<div class=\"title\">" + nowMonth + " 달성 Title </div>\r\n"
						+ "	\r\n"
						+ "	\r\n"
						+ "	\r\n"
						+ "		<div class=\"service\">  \r\n"
						+ "	      <div class=\"row\">\r\n"
						+ "	       		\r\n"
						+ "	       		<div class=\"col-md-4\">\r\n"
						+ "	           	<div class=\"service-box account-add-box\" id=\"add-box\">\r\n"
						+ "	           		카페인 중독자<br> #커피\r\n"
						+ "	           	</div> \r\n"
						+ "	           </div>\r\n"
						+ "	        <div class=\"col-md-4\">\r\n"
						+ "	           <div class=\"service-box account-add-box\" id=\"add-box\">\r\n"
						+ "	           		내 발은 소중해 <br> #택시\r\n"
						+ "	           </div> \r\n"
						+ "	        </div>\r\n"
						+ "	        <div class=\"col-md-4\">\r\n"
						+ "	           <div class=\"service-box account-add-box\" id=\"add-box\">\r\n"
						+ "					지름신<br> #쇼핑        \r\n"
						+ "	           </div> \r\n"
						+ "	        </div>\r\n"
						+ "	      	\r\n"
						+ "	        \r\n"
						+ "	          \r\n"
						+ "	        </div>\r\n"
						+ "	      </div>\r\n"
						+ "	      \r\n"
						+ "	      \r\n"
						+ "	     <div class=\"title\"> 예산 구성</div>\r\n"
						+ "	     	\r\n"
						+ "	     	\r\n"
						+ "	     	<div class=\"row\">\r\n"
						+ "	     	\r\n"
						+ "	     	<div class=\"col-md-6 piechart\">\r\n"
						+ "			   <canvas height=\"140vh\" width=\"180vw\" id=\"pieChart\"></canvas>\r\n"
						+ "			</div>\r\n"
						+ "			<div>\r\n"
						+ "					<q>순자산이 늘었어요!</q><br>\r\n"
						+ "					2021년 9월 수입 :" + incomeTotal +"<br>\r\n"
						+ "					2021년 9월 지출 :"+ spendingTotal +"\r\n"
						+ "				<table style=\"width : 50%; margin-top : 15px;\">\r\n"
						+ "					<tr>\r\n"
						+ "					<td>분류</td>\r\n"
						+ "					<td>사용/저축 금액</td>\r\n"
						+ "					<td>예산 대비</td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<td>고정지출</td>\r\n"
						+ "					<td>"+ basicSpent +"원</td>\r\n"
						+ "					<td>+2만원</td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<td>생활비</td>\r\n"
						+ "					<td>"+ consumptionSpent +"원</td>\r\n"
						+ "					<td>-20만원</td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<td>비상금</td>\r\n"
						+ "					<td>"+ savingSpent +"원</td>\r\n"
						+ "					<td>+2만원</td>\r\n"
						+ "					</tr>\r\n"
						+ "				</table>\r\n"
						+ "				\r\n"
						+ "			</div>\r\n"
						+ "	     	</div>\r\n"
						+ "	\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "	</div>\r\n"
						+ "	\r\n";
					str += "	<!----------------------------------------- 두번째 탭 ---------------------------------------------->\r\n"
						+ "	<div class=\"select-div\" id=\"email02\" style=\"display: none;\">\r\n"
						+ "		\r\n"
						+ "		<div class=\"title\"> Top3 소비 카테고리 / 사용처</div>\r\n"
						+ "		<div class=\"row\">\r\n"
						+ "			<div class=\"col-md-6\">\r\n"
						+ "				카테고리\r\n"
						+ "			<table>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP1</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP2</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP3</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "			</table>\r\n"
						+ "			</div>\r\n"
						+ "			<div class=\"col-md-6\">\r\n"
						+ "				사용처\r\n"
						+ "				<table>\r\n"
						+ "				<tr>\r\n"
						+ "					<th>TOP1</th>\r\n"
						+ "					<td></td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<th>TOP2</th>\r\n"
						+ "					<td></td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<th>TOP3</th>\r\n"
						+ "					<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				</table>\r\n"
						+ "			</div>\r\n"
						+ "		</div>\r\n"
						+ "		<div class=\"title\"> 갑자기 늘어난 지출</div>\r\n"
						+ "		<div class=\"row\">\r\n"
						+ "			<div class=\"col-md-3\">\r\n"
						+ "				2021년 8월\r\n"
						+ "			<table>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP1</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP2</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				<tr>\r\n"
						+ "				<th>TOP3</th>\r\n"
						+ "				<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "			</table>\r\n"
						+ "			</div>\r\n"
						+ "			<div class=\"col-md-9\">\r\n"
						+ "				2021년 9월\r\n"
						+ "				<table>\r\n"
						+ "				<tr>\r\n"
						+ "					<th>TOP1</th>\r\n"
						+ "					<td></td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<th>TOP2</th>\r\n"
						+ "					<td></td>\r\n"
						+ "					</tr>\r\n"
						+ "					<tr>\r\n"
						+ "					<th>TOP3</th>\r\n"
						+ "					<td></td>\r\n"
						+ "				</tr>\r\n"
						+ "				</table>\r\n"
						+ "			</div>\r\n"
						+ "		</div>\r\n"
						+ "		\r\n"
						+ "								\r\n"
						+ "	<!-- 아코디언.. -->\r\n"
						+ "	<div class=\"title\"> 일자별 지출 TOP3</div>\r\n"
						+ "				<div class=\"accordion-stn\">\r\n"
						+ "                    <div class=\"panel-group\" data-collapse-color=\"nk-green\" id=\"accordionGreen\" role=\"tablist\" aria-multiselectable=\"true\">\r\n"
						+ "                        <div class=\"panel panel-collapse notika-accrodion-cus\">\r\n"
						+ "                            <div class=\"panel-heading\" role=\"tab\">\r\n"
						+ "                                <h4 class=\"panel-title\">\r\n"
						+ "                                    <a data-toggle=\"collapse\" data-parent=\"#accordionGreen\" href=\"#accordionGreen-one\" aria-expanded=\"false\" class=\"collapsed\">\r\n"
						+ "				TOP1  날짜 ex) 2021년 09월 23일\r\n"
						+ "			</a>\r\n"
						+ "                                </h4>\r\n"
						+ "                            </div>\r\n"
						+ "                            <div id=\"accordionGreen-one\" class=\"collapse\" role=\"tabpanel\" aria-expanded=\"false\" style=\"height: 0px;\">\r\n"
						+ "                                <div class=\"panel-body\">\r\n"
						+ "   									<table>\r\n"
						+ "   									<tr>\r\n"
						+ "   										<td>no</td>\r\n"
						+ "   										<td>사용처</td>\r\n"
						+ "   										<td>금액</td>\r\n"
						+ "   									<tr>\r\n"
						+ "   									</table>\r\n"
						+ "                                </div>\r\n"
						+ "                            </div>\r\n"
						+ "                        </div>\r\n"
						+ "                        <div class=\"panel panel-collapse notika-accrodion-cus\">\r\n"
						+ "                            <div class=\"panel-heading\" role=\"tab\">\r\n"
						+ "                                <h4 class=\"panel-title\">\r\n"
						+ "                                    <a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accordionGreen\" href=\"#accordionGreen-two\" aria-expanded=\"false\">\r\n"
						+ "				Collapse Green #2\r\n"
						+ "			</a>\r\n"
						+ "                                </h4>\r\n"
						+ "                            </div>\r\n"
						+ "                            <div id=\"accordionGreen-two\" class=\"collapse\" role=\"tabpanel\" aria-expanded=\"false\" style=\"height: 0px;\">\r\n"
						+ "                                <div class=\"panel-body\">\r\n"
						+ "                                    <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry cry then richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf msr noontemporem, sunt aliqua put a bird on it squid single-origin coffee nullassumendan shoreditch et.</p>\r\n"
						+ "                                </div>\r\n"
						+ "                            </div>\r\n"
						+ "                        </div>\r\n"
						+ "                        <div class=\"panel panel-collapse notika-accrodion-cus\">\r\n"
						+ "                            <div class=\"panel-heading active\" role=\"tab\">\r\n"
						+ "                                <h4 class=\"panel-title\">\r\n"
						+ "                                    <a class=\"\" data-toggle=\"collapse\" data-parent=\"#accordionGreen\" href=\"#accordionGreen-three\" aria-expanded=\"true\">\r\n"
						+ "				Collapse Green #3\r\n"
						+ "			</a>\r\n"
						+ "                                </h4>\r\n"
						+ "                            </div>\r\n"
						+ "                            <div id=\"accordionGreen-three\" class=\"collapse in\" role=\"tabpanel\" aria-expanded=\"true\" style=\"\">\r\n"
						+ "                                <div class=\"panel-body\">\r\n"
						+ "                                    <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry cry then richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf msr noontemporem, sunt aliqua put a bird on it squid single-origin coffee nullassumendan shoreditch et.</p>\r\n"
						+ "                                </div>\r\n"
						+ "                            </div>\r\n"
						+ "                        </div>\r\n"
						+ "                    </div>\r\n"
						+ "                </div><!-- 아코디언 end -->\r\n"
						+ "	\r\n"
						+ "</div>\r\n";
					str += "	<!----------------------------------------- 세번째 탭 ---------------------------------------------->\r\n"
						+ "	<div class=\"select-div\" id=\"email03\" style=\"display: none;\">  	\r\n"
						+ "		<div class=\"title\"> 9월 도전 결과 </div>\r\n"
						+ "			\r\n"
						+ "           <h2 class=\"challengeTotal\"> 09월 도전하기 패널티로 <br>\r\n"
						+ "           <br>비상금에 총 18,000원이 저축되었습니다.</h2>\r\n"
						+ "		<div class=\"service\">  \r\n"
						+ "	      <div class=\"row\">\r\n"
						+ "			<div class=\"col-md-6\">\r\n"
						+ "                  <div class=\"service-box account-box challenge\">\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                   <h2 id=\"nickname\" class=\"col-md-9\"> \r\n"
						+ "                     커피 값 아끼기\r\n"
						+ "                  </h2>\r\n"
						+ "                  <h3 class=\"col-md-2\" id=\"penalty-box\">\r\n"
						+ "                     30%\r\n"
						+ "                  </h3>\r\n"
						+ "                \r\n"
						+ "                  </div>\r\n"
						+ "            	<div class=\"challengeResult\" style=\"background : red\">실패</div>\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                  	<div class=\"col-md-6\">지출액</div>\r\n"
						+ "                  	<div class=\"col-md-6\">목표금액</div>\r\n"
						+ "                  	\r\n"
						+ "                  </div>\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                     <h2 id=\"balance\" class=\"col-md-6\">\r\n"
						+ "                    	 560,000\r\n"
						+ "                      </h2>\r\n"
						+ "                     <h2 id=\"balance\" class=\"col-md-6\">\r\n"
						+ "                    	 500,000원\r\n"
						+ "                      </h2>\r\n"
						+ "                  </div>\r\n"
						+ "                  </div>\r\n"
						+ "           </div>\r\n"
						+ "			<div class=\"col-md-6\">\r\n"
						+ "                  <div class=\"service-box account-box challenge\">\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                   <h2 id=\"nickname\" class=\"col-md-9\"> \r\n"
						+ "                     교통비 아끼기\r\n"
						+ "                  </h2>\r\n"
						+ "                  <h3 class=\"col-md-2\" id=\"penalty-box\">\r\n"
						+ "                     30%\r\n"
						+ "                  </h3>\r\n"
						+ "                \r\n"
						+ "                  </div>\r\n"
						+ "            	<div class=\"challengeResult\">성공</div>\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                  	<div class=\"col-md-6\">지출액</div>\r\n"
						+ "                  	<div class=\"col-md-6\">목표금액</div>\r\n"
						+ "                  	\r\n"
						+ "                  </div>\r\n"
						+ "                  <div class=\"row\">\r\n"
						+ "                     <h2 id=\"balance\" class=\"col-md-6\">\r\n"
						+ "                    	 50,000\r\n"
						+ "                      </h2>\r\n"
						+ "                     <h2 id=\"balance\" class=\"col-md-6\">\r\n"
						+ "                    	 100,000원\r\n"
						+ "                      </h2>\r\n"
						+ "                  </div>\r\n"
						+ "                  </div>\r\n"
						+ "	           </div>\r\n"
						+ "	           </div>         \r\n"
						+ "           </div>\r\n"
						+ "\r\n"
						+ "           \r\n"
						+ "	</div>\r\n"
						+ "</div>\r\n"
						+ "</div>\r\n"
						+ "</body>\r\n";
					str += "<script>\r\n"
						+ "(function ($) {\r\n"
						+ "	 \"use strict\";\r\n"
						+ "\r\n"
						+ "		var ctx = document.getElementById(\"pieChart\")\r\n"
						+ "		var pieChart = new Chart(ctx, {\r\n"
						+ "		    type: 'pie',\r\n"
						+ "		    data: {\r\n"
						+ "		    	labels: [\r\n"
						+ "		    	    '기본금',\r\n"
						+ "		    	    '생활비',\r\n"
						+ "		    	    '비상금'\r\n"
						+ "		    	  ],\r\n"
						+ "		    	  datasets: [{\r\n"
						+ "		    	    label: 'My First Dataset',\r\n"
						+ "		    	    data: ["+ basicBudget+"," +consumptionBudget +","+ savingBudget+"],\r\n"
						+ "		    	    backgroundColor: [\r\n"
						+ "		    	      'rgba(52, 152, 219, 0.5)',\r\n"
						+ "		    	      'rgba(243, 156, 18, 0.5)',\r\n"
						+ "		    	      'rgba(231, 76, 60, 0.5)',\r\n"
						+ "		    	   \r\n"
						+ "		    	    ],\r\n"
						+ "		    	 \r\n"
						+ "		    	  }]\r\n"
						+ "		    },\r\n"
						+ "		 \r\n"
						+ "		});\r\n"
						+ "		\r\n"
						+ "})(jQuery); \r\n"
						+ "</script>\r\n"
						+ "\r\n"
						+ "	<script src=\"http://localhost:9998/Hana-Project/resources/template/js/plugins.js\"></script>\r\n"
						+ " 	<script src=\"http://localhost:9998/Hana-Project/resources/template/js/charts/Chart.js\"></script>\r\n"
						+ "	<script src=\"http://localhost:9998/Hana-Project/resources/template/js/vendor/jquery-1.12.4.min.js\"></script>\r\n"
						+ "	<script src=\"http://localhost:9998/Hana-Project/resources/template/js/bootstrap.min.js\"></script>	\r\n"
						+ "	<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n"
						+ "	<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"></script>\r\n"
						+ "	<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>\r\n"
						+ "	<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>\r\n"
						+ "</html>";
				
				bos.write(str.getBytes()); // Byte형으로만 넣을 수 있음
				System.out.println("완료");
				
				bos.flush();
			}catch (Exception e) {
				e.printStackTrace();
			}
			i++;
		}
			 
		}
		
	}
	
	//@Ignore
	@Test
	public void monthlyReportExecute() {
		
		String setfrom = "dpfls0106@naver.com";
		String tomail = "bubi0106@naver.com";
		String title = "강하나님 08월 하나로통장 금융리포트입니다";
		String content = "내용입니다";
		
		String filename = "C:\\Users\\HP\\Desktop\\java\\spring-workspace\\Hana-Project\\src\\main\\webapp\\hanaro_report.html";
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
			
			// 파일첨부
			FileSystemResource fsr = new FileSystemResource(filename);
			messageHelper.addAttachment("hanaro_report.html", fsr);
			
			messageHelper.setText("<!DOCTYPE HTML>\r\n" + "<html lang=\"ko\">\r\n" + "<head>\r\n"
					+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
					+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n"
					+ "<title>메일</title>\r\n" + "</head>\r\n" + "<body class=\"ko_KR \">\r\n"
					+ "	<div class=\"viewWrap\" id=\"previewContent\">\r\n"
					+ "		<div class=\"coverWrap\">\r\n" + "			<div id=\"readFrame\">\r\n"
					+ "				<div\r\n"
					+ "					style=\"max-width: 710px; min-width: 320px; margin: 0 auto; background-color: #fff; text-align: left;\">\r\n"
					+ "					<!-- header-->\r\n"
					+ "					<div style=\"height: 47px; padding: 0 0 20px 0; margin: 0;\">\r\n"
					+ "						<h1\r\n"
					+ "							style=\"float: left; margin: 0; padding: 25px 0 0 0; font-size: 0; line-height: 0;\">\r\n"
					+ "							<a href=\"http://localhost:9999/\" target=\"_blank\"\r\n"
					+ "								title=\"새창 열림\" rel=\"noreferrer noopener\"><img\r\n"
					+ "								src=\"http://localhost:9999/resources/images/email/email-logo2.jpg\"\r\n"
					+ "								alt=\"hanabank\" style=\"border: 0px;\" loading=\"lazy\"></a>\r\n"
					+ "						</h1>\r\n" + "					</div>\r\n"
					+ "					<!-- //header-->\r\n" + "					<!-- content -->\r\n"
					+ "					<!-- 내용 -->\r\n" + "					<!-- content -->\r\n"
					+ "					<div\r\n"
					+ "						style=\"line-height: 1.5; color: #555555; font-size: 14px; font-family: AppleSDGothicNeo-light, 'malgun gothic', 'dotum', '돋움', sans-serif;\">\r\n"
					+ "						<!-- 비주얼영역 -->\r\n" + "						<div>\r\n"
					+ "							"
					+ "						</div>\r\n"
					+ "						<div style=\"padding: 6% 6% 7%;\">\r\n"
					+ "							<div\r\n"
					+ "								style=\"color: #0050a9; font-size: 16px; font-weight: bold; padding-bottom: 3%; border-bottom: 1px solid #dbdbdb; margin-bottom: 3%;\">2021년\r\n"
					+ "								08월 금융리포트</div>\r\n"
					+ "							<div style=\"font-size: 16px; color: #000; font-weight: bold;\">이메일\r\n"
					+ "								금융리포트 확인방법</div>\r\n"
					+ "							<div\r\n"
					+ "								style=\"padding: 4% 5%; background: #f6f6f6; margin-top: 1.5em;  margin-bottom: 30px;\">\r\n"
					+ "								<div\r\n"
					+ "									style=\"font-size: 14px; font-weight: bold; margin-bottom: 2%;\">첨부파일을\r\n"
					+ "									클릭하세요.</div>\r\n"
					+ "								<div style=\"font-size: 14px;\">이메일 금융리포트 첨부파일 확인방법 : 첨부파일을\r\n"
					+ "									클릭하신 후 금융리포트를 확인하시면 됩니다.</div>\r\n"
					+ "							</div>\r\n" + "							\r\n"
					+ "							<div style=\"font-weight: bold; color: #000; font-size: 16px;\">금융리포트를 더욱 스마트하게 사용하기</div>\r\n"
					+ "							<div\r\n"
					+ "								style=\"border: 1px solid #e1e1e1; padding: 5% 2%; margin-top: 1em; text-align: center; line-height: 1.4;\">\r\n"
					+ "								<table\r\n"
					+ "									style=\"width: 100%; table-layout: fixed; font-size: 12px; text-align: center; line-height: 1.4;\">\r\n"
					+ "									<tbody>\r\n"
					+ "										<tr>\r\n"
					+ "											<td style=\"height: 65px;\"><img\r\n"
					+ "												src=\"http://localhost:9999/resources/images/email/monitor.png\"\r\n"
					+ "												alt=\"나의 예산\" loading=\"lazy\"></td>\r\n"
					+ "											<td><img\r\n"
					+ "												src=\"http://localhost:9999/resources/images/email/billing.png\"\r\n"
					+ "												alt=\"소비 관리\" style=\"margin-left: 14px;\"\r\n"
					+ "												loading=\"lazy\"></td>\r\n"
					+ "											<td><img\r\n"
					+ "												src=\"http://localhost:9999/resources/images/email/balance.png\"\r\n"
					+ "												alt=\"도전 현황\" loading=\"lazy\"></td>\r\n"
					+ "										</tr>\r\n"
					+ "										<tr>\r\n"
					+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
					+ "													style=\"font-weight: bold;\">나의 예산</div></td>\r\n"
					+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
					+ "													style=\"font-weight: bold;\">지출 관리</div></td>\r\n"
					+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
					+ "													style=\"font-weight: bold;\">또래 비교</div></td>\r\n"
					+ "										</tr>\r\n"
					+ "										<tr>\r\n"
					+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
					+ "													style=\"max-width: 150px; margin: 0 auto;\">한 달 예산을 작성하고 관리하며 자산형성</div></td>\r\n"
					+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
					+ "													style=\"max-width: 170px; margin: 0 auto;\">매일 예산과 지출을 관리하며 지출목표 달성</div></td>\r\n"
					+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
					+ "													style=\"max-width: 130px; margin: 0 auto;\"> 나이, 자산규모에 따른 최적의 예산비율을 추천</div></td>\r\n"
					+ "										</tr>\r\n"
					+ "										<tr>\r\n"
					+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
					+ "												href=\"http://localhost:9999/product/onepick/budget\"\r\n"
					+ "												target=\"_blank\"\r\n"
					+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
					+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
					+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
					+ "												href=\"http://localhost:9999/product/onepick/dashboard\"\r\n"
					+ "												target=\"_blank\"\r\n"
					+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
					+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
					+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
					+ "												href=\"http://localhost:9999/product/onepick/analysis\"\r\n"
					+ "												target=\"_blank\"\r\n"
					+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
					+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
					+ "										</tr>\r\n"
					+ "									</tbody>\r\n"
					+ "								</table>\r\n" + "							</div>\r\n"
					+ "						</div>\r\n" + "					</div>\r\n"
					+ "					<!-- //content -->\r\n" + "					<!-- //내용 -->\r\n"
					+ "					<!-- //content -->\r\n" + "					<!-- 공지 only -->\r\n"
					+ "					<div\r\n"
					+ "						style=\"text-align: center; color: #666; font-size: 12px; line-height: 1.5;\">\r\n"
					+ "						<div style=\"padding: 5.3% 5% 4.7%; background: #f6f6f6;\">\r\n"
					+ "							본 메일은 하나은행에서 발송한 메일이며 발신전용 메일입니다.<br> 관련 문의사항은 하나은행 <a\r\n"
					+ "								href=\"http://localhost:9999\"\r\n"
					+ "								target=\"_blank\" title=\"새창 열림\"\r\n"
					+ "								style=\"color: #666666; text-decoration: underline;\"\r\n"
					+ "								rel=\"noreferrer noopener\">홈페이지</a>에서 가능합니다.\r\n"
					+ "						</div>\r\n" + "						<div\r\n"
					+ "							style=\"max-width: 488px; margin: 0 auto; margin-top: 27px; padding: 0px 20px; line-height: 1.5;\">\r\n"
					+ "							<div>\r\n"
					+ "								<span>전자금융상담 전용 1588-3555</span><br>\r\n"
					+ "								<span>은행업무 1588-1111 / 1599-1111</span>\r\n"
					+ "							</div>\r\n" + "							<div\r\n"
					+ "								style=\"margin-top: 18px; padding-top: 14px; border-top: 1px solid #efefef;\">\r\n"
					+ "								<span\r\n"
					+ "									style=\"display: inline-block; margin-right: 6px; vertical-align: middle; margin-top: 5px;\">\r\n"
					+ "									서울특별시 중구 을지로 35(을지로1가, 하나은행) 주식회사 하나은행</span> \r\n"
					+ "									<span\r\n"
					+ "									style=\"display: inline-block; vertical-align: middle; margin-top: 5px;\">\r\n"
					+ "									대표이사:지성규 사업자등록번호:202-81-14695</span>\r\n"
					+ "							</div>\r\n"
					+ "							<div style=\"margin-top: -2px;\">\r\n"
					+ "								<span\r\n"
					+ "									style=\"display: inline-block; margin-top: 5px; vertical-align: middle;\">\r\n"
					+ "									COPYRIGHT ⓒ 2020 Hana Bank CO.LTD.ALL RIGHTS RESERVED.</span>\r\n"
					+ "							</div>\r\n"
					+ "							<div style=\"margin-top: 20px; padding-bottom: 60px;\">\r\n"
					+ "								<img\r\n"
					+ "									src=\"http://localhost:9999/resources/images/email/email-logo2.jpg\"\r\n"
					+ "									alt=\"하나은행\" loading=\"lazy\" style=\"width: 40%; height: 40%;\">\r\n"
					+ "							</div>\r\n" + "						</div>\r\n"
					+ "					</div>\r\n" + "					<!--//footer-->\r\n"
					+ "				</div>\r\n" + "				<br>\r\n" + "			</div>\r\n"
					+ "		</div>\r\n" + "	</div>\r\n" + "</body>\r\n" + "</html>\r\n" + "", true); // 메일 내용

			
			
			mailSender.send(message);
			
			
		} catch(Exception e) {
				e.printStackTrace();
		}
	

		
	}

}
