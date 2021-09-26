package kr.ac.kopo.report.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.vo.SmsVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SmsServiceImpl{
	
	
	@Autowired
	private ReportDAO reportDAO;
	
	
	public void smsCreate() {
		List<SmsVO> smsList = reportDAO.smsList();
		System.out.println(smsList);

		
		
		if(smsList != null) {
		
			int i=0;
				
		while(i < smsList.size()) {
			String name = smsList.get(i).getName();
			String tel = smsList.get(i).getTel();
			String accountNo = smsList.get(i).getAccountNo();
			String category = smsList.get(i).getCategory();
			int penaltyMoney = smsList.get(i).getPenaltyMoney();
			int logCode = smsList.get(i).getLogCode();
			
			
			
			String text = "[하나은행]\n";
			text += "홍길동님 [쇼핑 줄이기] 초과소비 패널티 발생!\n";
			text += "이동 : 생활금 → 비상금\n";
			text += "[" + penaltyMoney +"원]";
			
			System.out.println("text : \n"+text);
			
			
			
			 String api_key = ""; 
			 String api_secret = ""; 
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
			 
			
			
				
			
		  i++;
		}
		
		reportDAO.changeFlag(smsList);
	}
}
}