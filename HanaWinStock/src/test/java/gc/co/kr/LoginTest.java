package gc.co.kr;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import gc.co.kr.account.dao.AccountDAO;
import gc.co.kr.account.service.AccountService;
import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;
import gc.co.kr.leagueAccount.LeagueAccountService;
import gc.co.kr.leagueAccount.LeagueAccountVO;
import gc.co.kr.member.service.MemberService;
import gc.co.kr.member.vo.MemberVO;
import gc.co.kr.realtimestock.dao.RealTimeStockDAO;
import gc.co.kr.realtimestock.service.RealTimeStockService;
import gc.co.kr.realtimestock.vo.RealTimeStockVO;
import gc.co.kr.stocksummary.dao.StockSummaryDAO;
import gc.co.kr.stocksummary.service.StockSummaryService;
import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/config/spring/spring-mvc.xml"})
public class LoginTest {
	
	
	
	@Autowired
	private LeagueAccountService  leagueService;
	
	
	@Autowired
	private AccountService service;
	
	
	
	@Ignore
	@Test
	public void transactleage() throws Exception{
		System.out.println("start");
		Map<String,Object> params = new HashMap<String , Object>();
		params.put("id", "hmchung1005");
		params.put("gcaNumber", "league:hmchung1005");
		params.put("counts", 5);
		params.put("price", 155.3 );
		params.put("action" , "B");
		params.put("preBalance", 99999250);
		params.put("totalPrice", -776.5);
		System.out.println("start");
		leagueService.transactLeague(params);				
	}
	@Ignore
	@Test
	public void testing() throws Exception{
		System.out.println(1);
	}
	@Ignore
	@Test
	public void testingJson() throws Exception{
		
		HashMap <String , Object> result = new HashMap<String,Object>();
		AccountVO account = service.selectByAccNum("123456789");
		result.put("account", account);		
		
		List<AccountStockVO> list = service.getAllAccountStockVO("league:hmchung1005" );						
		result.put("stockList", list);
		
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			  String json = mapper.writeValueAsString(result);
			  System.out.println("ResultingJSONstring = " + json);
			  //System.out.println(json);
			} catch (JsonProcessingException e) {
			   e.printStackTrace();
		}
		
	}
	
	@Test
	public void testupdate() throws Exception{
		String accountKey = "hmchung1005";
		LeagueAccountVO account =leagueService.selectLeagueAcc(accountKey);
		System.out.println(account);
		
	}
	
}
