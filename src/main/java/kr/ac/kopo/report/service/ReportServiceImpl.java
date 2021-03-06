package kr.ac.kopo.report.service;



import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.vo.ReportVO;
import kr.ac.kopo.report.vo.SmsVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

//@Component
@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ReportDAO reportDAO;
	
	
	
	
	//@Scheduled(fixedDelay=3000)
	public void schedulerTest() {
		//monthlyReportExecute();
		//monthlyReportExecute();
		System.out.println("test성공??");
	}
	
	//@Scheduled(cron=0 0/5 * * *)
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
	
	/*
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
	*/
	
	
	public void monthlyReportCreate() throws IOException {
		
		BufferedOutputStream bs = null;
		
		try {
			
			String str ="<h3>일자별 지출</h3>";
			
			bs = new BufferedOutputStream(new FileOutputStream("C:\\Users\\HP\\Desktop\\java\\spring-workspace\\Hana-Project\\src\\main\\webapp\\hanaro_report_try.html"));
			
		//	bs.write(str.getBytes()); // Byte형으로만 넣을 수 있음
		//	System.out.println("완료");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

	public void monthlyReportExecute() {

	
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



		if (reportMemberList != null) {
			int i = 0;

			while (i < reportMemberList.size()) {

				String setfrom = "dpfls0101@naver.com";
				String filename = "C:\\Users\\HP\\Desktop\\java\\spring-workspace\\Hana-Project\\src\\main\\webapp\\hanaro_report.html"; // 파일이름

				String tomail = reportMemberList.get(i).getEmail();
				String name = reportMemberList.get(i).getName();

				// db에서 받는 사람 이름
				// 설정==============================================================
				String title = "[하나은행] " + name + " 님의 " + nowMonth + "월 하나원픽 금융리포트입니다."; // 제목

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

					messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목은 생략이 가능하다

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
							+ "						<!-- 비주얼영역 -->\r\n" 						
							+ "							"
							+ "						</div>\r\n"
							+ "						<div style=\"padding: 6% 6% 7%;\">\r\n"
							+ "							<div\r\n"
							+ "								style=\"color: #0050a9; font-size: 16px; font-weight: bold; padding-bottom: 3%; border-bottom: 1px solid #dbdbdb; margin-bottom: 3%;\">2020년\r\n"
							+ "								09월 금융리포트</div>\r\n"
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
							+ "												alt=\"지출 관리\" style=\"margin-left: 14px;\"\r\n"
							+ "												loading=\"lazy\"></td>\r\n"
							+ "											<td><img\r\n"
							+ "												src=\"http://localhost:9999/resources/images/email/balance.png\"\r\n"
							+ "												alt=\"또래 비교\" loading=\"lazy\"></td>\r\n"
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


				} catch (Exception e) {
					System.out.println(e);
				}
				
				i++;
			}
		}
	}

	/*
	public void monthlyReportExecute() {
		
		String setfrom = "dpfls0106@naver.com";
		String tomail = "bubi0106@naver.com";
		String title = "제목입니다";
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
			
			
			mailSender.send(message);
			
			
		} catch(Exception e) {
				e.printStackTrace();
		}
	

		
	}
	*/


	
}
