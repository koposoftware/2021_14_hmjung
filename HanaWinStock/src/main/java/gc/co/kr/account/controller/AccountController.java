  
package gc.co.kr.account.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import gc.co.kr.account.service.AccountService;
import gc.co.kr.account.vo.AccountStockLog;
import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;
import gc.co.kr.leagueAccount.LeagueAccountService;
import gc.co.kr.leagueAccount.LeagueAccountVO;
import gc.co.kr.leagueAccount.LeagueFollowVO;
import gc.co.kr.member.vo.MemberVO;
import gc.co.kr.message.MessageService;
import gc.co.kr.message.MessageVO;
import gc.co.kr.stocksummary.service.StockSummaryService;
import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;


@Controller
@RequestMapping("/account")
public class AccountController { 
	
	@Autowired
	private AccountService service;
	
	@Autowired
	private LeagueAccountService leagueService;
	
	@Autowired
	private StockSummaryService summaryService;
	
	@Autowired
	private MessageService messageService;
	
	//@Autowired
	//private RealTimeStockService realTimeservice;

	ObjectMapper mapper = new ObjectMapper();
	
	@GetMapping("/contract")
	public String getContract() {
		System.out.println("contract");		
		return "gcaccount/accountContract";		
	}
	
	@GetMapping("/create")
	public String createAccountForm(Model model) {
		System.out.println("create");
		model.addAttribute("accountVO" , new AccountVO());
		return "gcaccount/create";
	}
	
	@PostMapping("/create")
	public String createAccount(AccountVO account, Model model, HttpSession session) {		
		System.out.println("inserting new account");
		System.out.println("inserted account  info: " + account);
		String msg = "";
		String view = "";
		try {
			MemberVO userVO  =  (MemberVO)session.getAttribute("userVO");
			account.setId(userVO.getId());
			int row = service.createAcc(account);
			if(row == 1) {
				msg ="성공적으로 계좌를 생성 했습니다.";
				String dest = (String) session.getAttribute("dest");
				if(dest != null) {
					session.removeAttribute(dest);
					view = "redirect:" + dest;
				}else {
					view = "redirect:/";
				}
			}else {
				msg = "계좌번호 생성시 문제가 발생 했습니다.";
				view = "gcaccount/create";
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg = "서버에 문제 발생 했습니다.";			
			view = "gcaccount/create";
		}
		System.out.println(msg);
		session.setAttribute("msg", msg);
		return view;
	}
	
	@RequestMapping("/viewother/transaction/{viewId}/{page}")
	public String viewothertransaction(@PathVariable("viewId") String viewId , HttpSession session , HttpServletRequest request , Model model , @PathVariable("page") int page) {
		String view = "gcaccount/transaction";
		String accountType = (String) session.getAttribute("accountType");
		String msg = "";
		String referer = request.getHeader("Referer");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		List<LeagueFollowVO> list = leagueService.selectFollowers( viewId );
		Boolean valid = false;
		if(list  != null && list.size() > 0 ) {
			for(LeagueFollowVO follower : list) {
				String followerId = follower.getFollowerId();
				if( followerId.equals(userVO.getId()  ) ) {
					valid = true;
					break;
				};
			}						
		}
		
		if(!valid) {
			msg = "warning:error:구독이 안된 계좌 입니다.";
			session.setAttribute("msg", msg);
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}												
		}
		String type=  (String)request.getParameter("type");
		List<AccountStockLog> logList;
		if(type == null ) {
			logList = service.getAllAccountStockLogs(viewId);
		}else{
			Map<String,String> params = new HashMap<String, String>();
			params.put("key" , viewId);
			params.put("type" , type);
			logList = service.getAllAccountStockLogsType(params);
		}
		
		int each = 10;		
		float pagefloat =  ((float)logList.size()) /  ((float)each);		
		int pageCounts = (int) Math.ceil( pagefloat  );		
		System.out.println(pageCounts);
				
		List<AccountStockLog> showingLogs  = new ArrayList<AccountStockLog>();
		System.out.println("log size : " +  logList.size());
		int cnt = (page-1) * each;
		for(int i = 0 ; i <  each ; i++ ) {
			System.out.println(cnt);
			if(cnt > logList.size() - 1) {
				break;
			}
			showingLogs.add( logList.get(cnt) );
			cnt++;
		}
		model.addAttribute("currentPage" , page);			
		model.addAttribute("pageCounts" , pageCounts);		
		model.addAttribute("showingLogs" , showingLogs);
		
		model.addAttribute("viewId" , viewId);
		return view;		
	}

	

	
	@GetMapping("/transaction/{page}")
	public String showTransaction(Model model , HttpServletRequest request,  HttpSession session , @PathVariable("page") int page) {
		String accountKey = (String) session.getAttribute("accountKey");
		System.out.println(accountKey);
		
		String type=  (String)request.getParameter("type");
		System.out.println("type : " + type);
		List<AccountStockLog> logList;
		if(type == null ) {
			logList = service.getAllAccountStockLogs(accountKey);
		}else{
			Map<String,String> params = new HashMap<String, String>();
			params.put("key" , accountKey);
			params.put("type" , type);
			logList = service.getAllAccountStockLogsType(params);
		}

		int each = 10;
		
		float pagefloat =  ((float)logList.size()) /  ((float)each);		
		int pageCounts = (int) Math.ceil( pagefloat  );		
		System.out.println(pageCounts);
				
		List<AccountStockLog> showingLogs  = new ArrayList<AccountStockLog>();
		System.out.println("log size : " +  logList.size());
		int cnt = (page-1) * each;
		
		for(int i = 0 ; i <  each ; i++ ) {
			System.out.println(cnt);
			if(cnt > logList.size() - 1) {
				break;
			}
			showingLogs.add( logList.get(cnt) );
			cnt++;
		}
		model.addAttribute("currentPage" , page);			
		model.addAttribute("pageCounts" , pageCounts);		
		model.addAttribute("showingLogs" , showingLogs);
		
		
		model.addAttribute("viewId" , accountKey);
		
		return "gcaccount/transaction";
	}
	
	
	@PostMapping("/signin")
	public String accountDetail(AccountVO accountVO, Model model, HttpSession session) {
		System.out.println("계좌 상세");
		//ModelAndView mav = new ModelAndView();
		MemberVO userVO  =  (MemberVO)session.getAttribute("userVO");
		accountVO.setId(userVO.getId());
		System.out.println("accountVO : " + accountVO);
		String view ="";
		accountVO = service.signinAccount(accountVO);		
		System.out.println("userAccountVO : "  + accountVO);
		if(accountVO == null) {
			String  msg ="패스워드 정보가 잘못 입력 되었습니다.";
			view = showAllAccounts(model, session);
			model.addAttribute("msg" , msg);			
			System.out.println(msg);
		}else {
			session.setAttribute("accountVO", accountVO);
			session.setAttribute("accountType" , "accountVO");
			session.setAttribute("accountKey" , accountVO.getGcaNumber());			
			
			
			leagueService.leagueAcclogout(userVO.getId());
			
			
			String dest = (String) session.getAttribute("dest2");
			System.out.println(dest);
			if (dest != null &&!dest.equals("/account/signOut" ) ) {
				session.removeAttribute("dest2");
				view = "redirect:" + dest;
			} else {
				view = "redirect:/";
			}			
		}
		System.out.println("post viewaccounts view : "  + view);
		return view;		
	}
	
	
	@PostMapping("/leagueSignin")
	public String leagueAccountDetail(@RequestParam("password") String password , Model model , HttpSession session  ) {
		System.out.println("league sign in~~~~~~~~~");
		MemberVO userVO  =  (MemberVO)session.getAttribute("userVO");
		String view;
		String msg;
		if( password != null && !password.equals(userVO.getPassword() ) ) {
			System.out.println("password : " + password);
			System.out.println("userpassword : " + userVO.getPassword());
			msg ="패스워드 정보가 잘못 입력 되었습니다.";
			view = showAllAccounts(model, session);
			model.addAttribute("msg", msg);
		}else {
			LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(userVO.getId());
			if(leagueAccountVO == null) {
				msg ="리그 계좌가 없습니다.";
				view = showAllAccounts(model, session);
				model.addAttribute("msg" , msg);
				System.out.println( msg);
			}else {	
				session.setAttribute("leagueAccountVO", leagueAccountVO);				
				leagueService.leagueAcclogin(userVO.getId());				
				session.setAttribute("accountType" , "leagueAccountVO");
				session.setAttribute("accountKey" , userVO.getId() );
				String dest = (String) session.getAttribute("dest2");
				System.out.println(dest);
				if(dest != null && !dest.equals("/account/signOut" ) ) {
					view = "redirect:" + dest;
					session.removeAttribute("dest2");
				}else {
					view = "redirect:/";					
				}
				System.out.println("성공");
				
				List<LeagueFollowVO> followerList = leagueService.selectmyfollow(userVO.getId());				
				List<String> users = new ArrayList<String>();
				for(LeagueFollowVO follower: followerList) {
					users.add(follower.getFollowedId());
				}
				List<LeagueAccountVO> followerLeagueList =  leagueService.getSessionFollowers(users);
				System.out.println("my followerLeagueList: " + followerLeagueList.size());		
				
				session.setAttribute("followerLeagueList" , followerLeagueList);								
			}
		}		
		System.out.println("post viewleagueaccounts : " + view);
		return view;
	}	
	
	@GetMapping("/signOut")
	public String accountSignOut(HttpServletRequest request  , HttpSession session) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		leagueService.leagueAcclogout(userVO.getId());
		
		session.removeAttribute("accountVO");
		session.removeAttribute("leagueAccountVO");
		session.removeAttribute("followerLeagueList");
		String referer = request.getHeader("Referer");
		
		
	    return "redirect:"+ referer;	
	}
	

	@PostMapping("/createLeagueAcc")
	public String createLeagueAcc(Model model ,  HttpSession session) {
		System.out.println("creating new League Account");
		LeagueAccountVO leagueAccountVO =  new LeagueAccountVO();
		String id = ((MemberVO)session.getAttribute("userVO")).getId();		
		leagueAccountVO.setId(id);
		leagueAccountVO.setBalance(100000000);
		leagueAccountVO.setFollowPrice(0);
		leagueAccountVO.setTier("BRONZE");
		LeagueAccountVO existingCheck = leagueService.selectLeagueAcc(id);
		String msg = "";
		if(existingCheck != null) {
			msg = "warning:Error:이미 리그 계좌가 존재 합니다. 계좌 초기화 하시겠습니까?";
		}else {
			int row = leagueService.createLeagueAcc(leagueAccountVO);			
			if(row == 1) {
				msg = "success:회원가입 성공:리그 계좌를 성공적으로 생성 했습니다.";			
			}else {
				msg = "warning:Error:계좌 생성 중 문제가 발생했습니다.";
			}
		}	
		session.setAttribute("msg", msg);
		return "redirect:/account/signin";	
	}
	
	
	@GetMapping("/signout")
	public String accountSignout(HttpSession session) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		leagueService.leagueAcclogout(userVO.getId());		
		session.removeAttribute("accountVO");
		session.removeAttribute("followerLeagueList");
		return "redirect:/account/signin";
	}
		
	@GetMapping("/hts")
	@CrossOrigin(origins = "*", allowedHeaders = "*")
	public String getHTC(Model model , HttpSession session) {
		System.out.println("hts~~~~~~~~~~~~~");
		List<StockSummaryVO> stockSummaryList = null;
		List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();
		List<String>  symbols= new ArrayList<String>();
		if(stockNameList != null && stockNameList.size() > 0) {			
			for(StockNameVO stock : stockNameList) {
				symbols.add(stock.getSymbol());
			}			
			stockSummaryList = summaryService.selectCurrentStockSummary(symbols);			
		}		
		Map<String, String> stockNameMap = new HashMap<String, String>();		
		for( StockNameVO stock : stockNameList ) {
			stockNameMap.put(stock.getSymbol() , stock.getLongName());
		}				
		Gson gson = new Gson();
        String serializeString = gson.toJson(stockNameMap);
        model.addAttribute("stockNameMap" , serializeString);			
		model.addAttribute("stockSummaryList" , stockSummaryList);
		String accountType = (String) session.getAttribute("accountType");
		String accountKey = (String) session.getAttribute("accountKey");		
		String userAccountInfo = getAccountInfo(accountType, accountKey);		
		model.addAttribute("userAccountInfo" , userAccountInfo);		
		return "gcaccount/hts";
	}

	
	
	
	public String getAccountInfo(String accountType, String accountKey ){
		HashMap <String , Object> result = new HashMap<String,Object>();			
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
	
	
	public Map<String,Object> getAccountInfoMap(String accountType, String accountKey ){
		HashMap <String , Object> result = new HashMap<String,Object>();			
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
		return result;
	}
	
	
	public Map<String , AccountStockVO> getAllstockForEach(String accountKey){
		List<AccountStockVO> list = service.getAllAccountStockVO( accountKey );
		Map<String , AccountStockVO> map = new HashMap<String , AccountStockVO>();
		for(AccountStockVO stock : list) {
			String currentSymbol = stock.getSymbol();
			map.put(currentSymbol , stock);			
		}		
		return map;
	}
	
	public Map<String , List<AccountStockLog> > getAllLogsForEach(String accountKey , List<String> symbols  ){
		Map<String , List<AccountStockLog> > map =  new HashMap<String , List<AccountStockLog>>();		
		for(String stock :  symbols) {
			List<AccountStockLog> list = new ArrayList<AccountStockLog>();
			map.put(stock, list);
		}		
		List<AccountStockLog> list = service.getAllAccountStockLogs(accountKey);
		for( AccountStockLog log : list  ) {
			String symbol = log.getSymbol();		
			List<AccountStockLog> loglist =  map.get(symbol );
			loglist.add(log);			
			map.put(symbol, loglist);			
		}												
		return map;
	}

	
	
	@RequestMapping("/viewother/portfolio/{viewId}")
	public String viewotherportfolio(@PathVariable("viewId") String viewId , HttpSession session , HttpServletRequest request , Model model) {
		String view = "gcaccount/leagueportfolio";						
		String accountType = (String) session.getAttribute("accountType");
		String msg = "";
		String referer = request.getHeader("Referer");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		List<LeagueFollowVO> list = leagueService.selectFollowers( viewId );
		Boolean valid = false;
		if(list  != null && list.size() > 0 ) {
			for(LeagueFollowVO follower : list) {
				String followerId = follower.getFollowerId();
				if( followerId.equals(userVO.getId()  ) ) {
					valid = true;
					break;
				};
			}						
		}
		
		if(!valid) {
			msg = "warning:error:구독이 안된 계좌 입니다.";
			session.setAttribute("msg", msg);
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}										
		}
		
		LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(viewId);
		model.addAttribute("leagueAccountVO" , leagueAccountVO);
		List<AccountStockVO> stockMap  = service.getAllAccountStockVO( viewId );
		if(stockMap.size() == 0) {
			msg = "warning:warning: "+  viewId + "가 보유한 주식이 없습니다.";
			session.setAttribute("msg", msg);
			return "redirect:"+ referer;
		}else {
			model.addAttribute("stockMap" , stockMap);
			
			Gson gson3 = new Gson();
	        String stockMapString = gson3.toJson(stockMap);
			model.addAttribute("stockMapString" , stockMapString);							
				
			//List<String> symbolList = new ArrayList<String>(stockMap.keySet());
			List<String> symbolList = new ArrayList<String>();
			for(AccountStockVO stock : stockMap) {
				symbolList.add(stock.getSymbol());
			}		
			Map<String , List<AccountStockLog>> logMap = getAllLogsForEach(viewId, symbolList);
			System.out.println("logMap size : " + logMap.size());				
			model.addAttribute("logMap" , logMap);
		
			List<StockSummaryVO> stockSummaryList = summaryService.selectCurrentStockSummary(symbolList);
			Map<String ,StockSummaryVO > temp = new HashMap<String , StockSummaryVO>();
			for(StockSummaryVO summary: stockSummaryList ){
		        temp.put(summary.getSymbol(), summary);
	        }
			Gson gson2 = new Gson();
	        String stockSummaryListString = gson2.toJson(temp);
			model.addAttribute("stockSummaryList" , stockSummaryListString);	

			
			List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();
			Map<String, String> stockNameMap = new HashMap<String, String>();		
			for( StockNameVO stock : stockNameList) {
				stockNameMap.put(stock.getSymbol() , stock.getLongName());
			}				
			Gson gson = new Gson();
	        String serializeString = gson.toJson(stockNameMap);
	        model.addAttribute("stockNameMap" , serializeString);
	        
	        model.addAttribute("viewId" , viewId);
	        
			return view;		
		}								
	}
	

	@GetMapping("/portfolio")
	public String getPortfolio(Model model, HttpSession session) {		
		String accountType = (String) session.getAttribute("accountType");
		String accountKey = (String) session.getAttribute("accountKey");
		System.out.println(accountType);
		System.out.println(accountKey);
		String view = "gcaccount/leagueportfolio";
		if(accountType != null && accountType.equals("accountVO")) {
			AccountVO accountVO = service.selectByAccNum(accountKey);			
			model.addAttribute("leagueAccountVO" , accountVO);
		}else if(accountType != null && accountType.equals("leagueAccountVO")) {
			LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(accountKey);
			model.addAttribute("leagueAccountVO" , leagueAccountVO);
		}
		//Map<String , AccountStockVO> stockMap = getAllstockForEach(accountKey);
		List<AccountStockVO> stockMap  = service.getAllAccountStockVO( accountKey );
		if(stockMap.size() == 0) {
			String msg = "warning:warning:현재 보유하신 주식이 없습니다.";
			session.setAttribute("msg", msg);
			return "redirect:/account/hts";
		}else {
			model.addAttribute("stockMap" , stockMap);
			
			Gson gson3 = new Gson();
	        String stockMapString = gson3.toJson(stockMap);
			model.addAttribute("stockMapString" , stockMapString);							
			
			
			//List<String> symbolList = new ArrayList<String>(stockMap.keySet());
			List<String> symbolList = new ArrayList<String>();
			for(AccountStockVO stock : stockMap) {
				symbolList.add(stock.getSymbol());
			}
			
			
			Map<String , List<AccountStockLog>> logMap = getAllLogsForEach(accountKey, symbolList);
			System.out.println("logMap size : " + logMap.size());				
			model.addAttribute("logMap" , logMap);
			
			
			List<StockSummaryVO> stockSummaryList = summaryService.selectCurrentStockSummary(symbolList);
			Map<String ,StockSummaryVO > temp = new HashMap<String , StockSummaryVO>();
			for(StockSummaryVO summary: stockSummaryList ){
		        temp.put(summary.getSymbol(), summary);
	        }
			Gson gson2 = new Gson();
	        String stockSummaryListString = gson2.toJson(temp);
			model.addAttribute("stockSummaryList" , stockSummaryListString);	

			
			List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();
			Map<String, String> stockNameMap = new HashMap<String, String>();		
			for( StockNameVO stock : stockNameList) {
				stockNameMap.put(stock.getSymbol() , stock.getLongName());
			}				
			Gson gson = new Gson();
	        String serializeString = gson.toJson(stockNameMap);
	        model.addAttribute("stockNameMap" , serializeString);
	        
	        model.addAttribute("viewId" , accountKey);
			return view;
			
		}								
	}		
	

	
	@GetMapping("/search")
	public String searchChannel(HttpSession session , HttpServletRequest request) {
		String accountType = (String) session.getAttribute("accountType");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			String msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			String referer = request.getHeader("Referer");
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		
		String view = "gcaccount/search";
		return view;
	}

	@PostMapping("/search")
	public String postsearchChannel(HttpServletRequest request , Model model , HttpSession session) {
		String accountType = (String) session.getAttribute("accountType");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			String msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			String referer = request.getHeader("Referer");
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		
		
		
		String view= "";
		String viewId = request.getParameter("viewId");
		System.out.println("viewId : " +   viewId);
		LeagueAccountVO viewLeagueVO = leagueService.selectLeagueAcc(viewId );
		if(viewLeagueVO == null) {
			System.out.println("no league accoutn ");
			String msg = "warning:error:입력하신 리그 계좌는 존재 하지 않습니다.";
			model.addAttribute("msg" , msg);
			view = "gcaccount/search";			
		}else {
			view = "redirect:/account/viewother/account/" + viewId;			
		}	
		return view;
	}

	
	@GetMapping("/channel")
	public String getMyChannel(HttpSession session , HttpServletRequest request, Model model) {
		
		MemberVO userVO  =  (MemberVO)session.getAttribute("userVO");	
		String accountType = (String) session.getAttribute("accountType");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			String msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			String referer = request.getHeader("Referer");
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		
		
		String view = "gcaccount/channel";
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			String msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			String referer = request.getHeader("Referer");
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(userVO.getId());
		
		
		model.addAttribute("leagueAccountVO", leagueAccountVO);
		
		
		List<LeagueFollowVO> list = leagueService.selectFollowers( userVO.getId() );					
		model.addAttribute("leagueFollowList", list );
		List<LeagueAccountVO> followerAccountList = new ArrayList<LeagueAccountVO>();
		if(list  != null && list.size() > 0 ) {
			for(LeagueFollowVO follower : list) {
				String followerId = follower.getFollowerId();
				LeagueAccountVO leagueUser = leagueService.selectLeagueAcc(followerId);
				System.out.println(leagueUser);
				followerAccountList.add(leagueUser);
			}						
		}
		model.addAttribute("followerAccountList" , followerAccountList);
		
		System.out.println(followerAccountList.size());	
		
		
		
		List<AccountStockVO> otherstockList = service.getAllAccountStockVO( userVO.getId() );		
		int stockCount = 0;
		for(AccountStockVO stock : otherstockList) {
			stockCount = stockCount + stock.getTotalCounts();			
		}		
		model.addAttribute("totalstockCounts" , stockCount);	
		
		
		
		List<MessageVO> messageList = messageService.getUncheckedMessages(userVO.getId());
		model.addAttribute("messageList", messageList);
		
		
		return view;		
	}
	
	@GetMapping("/viewother/account/{viewId}")
	public String viewotheraccount(@PathVariable("viewId") String viewId , HttpSession session , HttpServletRequest request , Model model) {
		String view = "gcaccount/otheraccount";
		
		String accountType = (String) session.getAttribute("accountType");
		if (! accountType.equals( "leagueAccountVO" )) {
			System.out.println("not logged in as league");
			String msg = "warning:error:이 기능을 사용하기 위해서는 리그 계좌로 로그인 해야 합니다.";
			session.setAttribute("msg", msg);
			String referer = request.getHeader("Referer");
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}
		
		model.addAttribute("viewId" , viewId); 		
		
		System.out.println(viewId);
        MemberVO userVO = (MemberVO) session.getAttribute("userVO");
        LeagueAccountVO otherleagueAccountVO = leagueService.selectLeagueAcc(viewId);
		model.addAttribute("otherleagueAccountVO", otherleagueAccountVO);		        
		
		List<LeagueFollowVO> list = leagueService.selectFollowers( viewId );					
		model.addAttribute("otherleagueFollowList", list );
				
		List<LeagueAccountVO> followerAccountList = new ArrayList<LeagueAccountVO>();
		if(list  != null && list.size() > 0 ) {
			for(LeagueFollowVO follower : list) {
				String followerId = follower.getFollowerId();
				LeagueAccountVO leagueUser = leagueService.selectLeagueAcc(followerId);
				System.out.println(leagueUser);
				followerAccountList.add(leagueUser);
			}						
		}
		model.addAttribute("followerAccountList" , followerAccountList);
		System.out.println(followerAccountList.size());		
		
		
								
		
		List<AccountStockVO> otherstockList = service.getAllAccountStockVO( viewId );		
		int otherstockCount = 0;
		for(AccountStockVO stock : otherstockList) {
			otherstockCount = otherstockCount + stock.getTotalCounts();			
		}		
		model.addAttribute("othertotalStockCounts" , otherstockCount);	
		
		
		
		String subscribed = "false";
		if(list != null && list.size() > 0 ) {
			for(LeagueFollowVO leagueFollowVO : list) {
				if(leagueFollowVO.getFollowerId().equals(userVO.getId())) {
					subscribed = "true";
					break;
				}
			}		

		}
		model.addAttribute("subscribed" , subscribed);							
		return view;		
	}
	
	
	
	@GetMapping("/signin")
	public String showAllAccounts(Model model, HttpSession session) {
				
		
		System.out.println("전체 계좌 조회");
		MemberVO userVO  =  (MemberVO)session.getAttribute("userVO");		
		
		
		String userID = userVO.getId();
		List<AccountVO> list =  service.selectAllAccounts(userID);		
		model.addAttribute("list", list);
		List<LeagueFollowVO> leagueFollowVOlist = leagueService.selectFollowers(userID);
		LeagueAccountVO leagueAccountVO = leagueService.selectLeagueAcc(userID);
		
		model.addAttribute("leagueFollowList", leagueFollowVOlist );		
		model.addAttribute("leagueAccountVO", leagueAccountVO);				
		String userAccountInfo = getAccountInfo("leagueAccountVO", userVO.getId());		
		model.addAttribute("leagueAccountInfo" , userAccountInfo);			
		List<AccountStockVO> stockList = service.getAllAccountStockVO( userVO.getId() );		
		int stockCount = 0;		
		for(AccountStockVO stock : stockList) {
			stockCount = stockCount + stock.getTotalCounts();			
		}		
		model.addAttribute("totalStockCounts" , stockCount);		
		return "gcaccount/viewaccounts";
	}
	
	
	@PostMapping("/subscribe")
	public String subsribePost(Model model, HttpSession session , HttpServletRequest request) {
				
		String password = (String) request.getParameter("password");		
		String viewId = (String) request.getParameter("viewId");
		String view = "redirect:/account/viewother/account/" + viewId;
		System.out.println("pwd : "  +   password);
		
		LeagueAccountVO followedUserVO = leagueService.selectLeagueAcc(viewId);
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String msg = "";
		if(password == null ||  !password.equals(userVO.getPassword())  ) {
			System.out.println("password error");
			msg = "warning:error:패스워드가 일치하지 않습니다";
			session.setAttribute("msg", msg);
									
		}else {
			
			List<LeagueFollowVO> list = leagueService.selectFollowers( viewId );
			Boolean valid = false;
			if( list == null ||  list.size() ==  0 ) {
				valid = true;
			}
			if(!valid) {
				valid = true;
				for(LeagueFollowVO follower : list) {
					if(follower.getFollowerId().equals(userVO.getId()) ) {
						valid = false;
						break;
					}
				}				
			}
			if(!valid) {
				System.out.println("already subscriber");
				msg = "warning:error:이미 구독자 이십니다.";
				session.setAttribute("msg", msg);
				
			}else {
				LeagueFollowVO leagueFollowVO = new LeagueFollowVO();			
				leagueFollowVO.setFollowPrice(followedUserVO.getFollowPrice());
				leagueFollowVO.setFollowedId(viewId);
				leagueFollowVO.setFollowerId(userVO.getId());						
				leagueService.subscribeUser(leagueFollowVO);
				msg = "success:success:구독 신청이 완료 되었습니다.";
				session.setAttribute("msg", msg);
				
				
				List<LeagueFollowVO> followerList = leagueService.selectmyfollow(userVO.getId());				
				List<String> users = new ArrayList<String>();
				for(LeagueFollowVO follower: followerList) {
					users.add(follower.getFollowerId());
				}
				System.out.println("my users : " + users.size());
				List<LeagueAccountVO> followerLeagueList =  leagueService.getSessionFollowers(users);
				System.out.println("my followerLeagueList: " + followerLeagueList.size());		
				
				session.setAttribute("followerLeagueList" , followerLeagueList);
			}																		
		}
		return view;
	}
	
	
	
	@PostMapping("/unsubscribe")
	public String unsubscribePost(Model model , HttpSession session , HttpServletRequest request) {		
		String password = (String) request.getParameter("password");
		String viewId = (String) request.getParameter("viewId");		
		String view = "redirect:/account/viewother/account/" + viewId;
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String msg = "";
		if(password == null ||  !password.equals(userVO.getPassword())  ) {
			System.out.println("password error");
			msg = "warning:error:패스워드가 일치하지 않습니다";
			session.setAttribute("msg", msg);
									
		}else {			
			List<LeagueFollowVO> list = leagueService.selectFollowers( viewId );
			Boolean valid = true;
			if( list == null ||  list.size() ==  0 ) {
				valid = false;
			}
			if(valid) {
				valid = false;
				for(LeagueFollowVO follower : list) {
					if(follower.getFollowerId().equals(userVO.getId()) ) {
						valid = true;
						break;
					}
				}							
			}
			if(!valid) {
				System.out.println("already subscriber");
				msg = "warning:error:구독이 안되어 있습니다.";
				session.setAttribute("msg", msg);
			}else {
				LeagueFollowVO leagueFollowVO = new LeagueFollowVO();				
				leagueFollowVO.setFollowedId(viewId);
				leagueFollowVO.setFollowerId(userVO.getId());				
				leagueService.unSubscribeUser(leagueFollowVO);
				msg = "success:success:구독이 취소 되었습니다.";
				session.setAttribute("msg", msg);
			}													
		}				
		return view;
	}
	
	

	
	
	
	
	
	//view =  "gcaccount/htc";
//	@GetMapping("/htc")
//	public String htsHome(HttpSession session) {
//		AccountVO userAccountVO = (AccountVO)session.getAttribute("userAccountVO");
//		System.out.println("trading center arrived");
//		System.out.println(userAccountVO);
//		session.removeAttribute("userAccountVO");
//		return "/";
//	}	
}
