package gc.co.kr.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import gc.co.kr.account.service.AccountService;
import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;
import gc.co.kr.leagueAccount.LeagueAccountService;
import gc.co.kr.leagueAccount.LeagueAccountVO;


@Controller
@RequestMapping("/ajax/account")
public class ResBodyAccount {	
	@Autowired
	private AccountService service;
	
	@Autowired
	private LeagueAccountService leagueService;
	
	ObjectMapper mapper = new ObjectMapper();
	
	
	@RequestMapping("/updateUserAccountInfo.json")
	@ResponseBody
	public String updateUserAccountInfo(HttpServletRequest  request,  HttpSession session ) {
		HashMap <String , Object> result = new HashMap<String,Object>();
		String accountType = (String)request.getParameter("accountType");
		String accountKey = (String)request.getParameter( "accountKey" );
		System.out.println("accountType :  " +  accountType);
		System.out.println("accountKey  :  " +  accountKey);
		
		if(accountType != null && accountType.equals("accountVO")) {
			result.put("accountType", "accountVO");			
			AccountVO account = service.selectByAccNum(accountKey);
			result.put("account", account);										
		}else if(accountType != null && accountType.equals("leagueAccountVO")) {
			result.put("accountType", "leagueAccountVO");
			LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(accountKey);
			result.put("account", leagueAccountVO );				
		}
		List<AccountStockVO> list = service.getAllAccountStockVO( accountKey );	
		result.put("stockList", list);	
		String json = null;
		try {
			  json = mapper.writeValueAsString(result);
			  System.out.println("ResultingJSONstring = " + json);
			  //System.out.println(json);
			} catch (JsonProcessingException e) {
			   e.printStackTrace();
		}
		return json;
	}
	
	
	
	
	
	@RequestMapping("/transact.json")
	@ResponseBody
	public Map<String ,  String> transact( HttpServletRequest request , HttpSession session ){
		Map<String ,  String> result = new HashMap<String , String>();
		
		try {
			int counts = Integer.parseInt(request.getParameter("counts"));
			float price = Float.parseFloat(request.getParameter("price"));
			String action = request.getParameter("action");
			String symbol = request.getParameter("symbol");
			String accountType = request.getParameter("accountType");
			Double preBalance = Double.parseDouble(request.getParameter("preBalance"));
			String gcaNumber = request.getParameter("gcaNumber");
					
			
			Map<String , Object> params = new HashMap<String , Object>();	
			
			params.put("price", price);
			params.put("action" , action);
			params.put("preBalance", preBalance);
			params.put("gcaNumber", gcaNumber);
			
			double totalPrice = counts * price;
			if(action != null && action.equals("B")) {
				totalPrice = -1 * totalPrice;
				
			}else {
				counts = -1 * counts;
			}
			params.put("counts", counts);
			
			params.put("totalPrice", totalPrice);
			params.put("symbol", symbol);
			System.out.println("------------------------------------");
			for (String keys : params.keySet())  
			{
			   System.out.println(keys + ":"+ params.get(keys));
			}
			System.out.println("------------------------------------");
			
			if( accountType != null && accountType.equals("leagueAccountVO")){				
				System.out.println("processing league");
				leagueService.transactLeague(params);			
			}else {						
				System.out.println("processing account");
				service.transact(params);			
			}
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			System.out.println(e);
		}
		
						
		return result;
	}	
}
