package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.fixedExpense.service.FixedExpenseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class test {
	
	@Autowired
	private FixedExpenseService fixedExpenseService;
	
//	@Ignore	
	@Test  
	public void Service생성테스트() throws Exception {
		//System.out.println("dataSource : " + dataSource);
		assertNotNull(fixedExpenseService);    	//dataSource가 가지고 있는 값이 null이 아닌지만 확인
	}

}
