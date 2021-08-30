package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MybatisTest {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private	SqlSessionFactory sqlFactory;
	
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Test
	public void 로그인테스트() throws Exception {
		MemberVO member = new MemberVO();
		member.setId("yerin");
		member.setPassword("1234");
		
		MemberVO userVO = sessionTemplate.selectOne("member.MemberDAO.login", member);
		
		assertNotNull(userVO);
	}
	
	@Ignore	
	@Test  
	public void DataSource생성테스트() throws Exception {
		//System.out.println("dataSource : " + dataSource);
		assertNotNull(dataSource);    	//dataSource가 가지고 있는 값이 null이 아닌지만 확인
	}
	
	@Ignore
	@Test
	public void mybatis연동테스트() throws Exception {
//		assertNotNull(sqlFactory);
		assertNotNull(sessionTemplate);
	}
	
}
