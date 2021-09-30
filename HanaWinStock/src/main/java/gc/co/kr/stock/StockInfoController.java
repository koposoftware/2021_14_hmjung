package gc.co.kr.stock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.Instant;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import gc.co.kr.realtimestock.service.RealTimeStockService;
import gc.co.kr.realtimestock.vo.DailyStockVO;
import gc.co.kr.realtimestock.vo.RealTimeStockVO;
import gc.co.kr.stocksummary.service.StockSummaryService;
import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;


@Controller
@RequestMapping("/stockinfo")
public class StockInfoController {
	

	@Autowired
	private StockSummaryService summaryService;
	
	@Autowired
	private RealTimeStockService service;
	
	
	@GetMapping("/search")
	public String search(Model model) {
		
		List<StockNameVO> stockNames=  summaryService.selectAllStockNames();
		
		List<String> stockSymbols = new ArrayList<String>();
		for(StockNameVO stock : stockNames) {
			stockSymbols.add(stock.getSymbol());
		}
		
		List<StockSummaryVO> stockSummaryList = summaryService.selectCurrentStockSummary(stockSymbols);	
		
		model.addAttribute("stockSummaryList", stockSummaryList);
		
		return "stock/search";
	}
	
	
	@PostMapping("/search")
	public String searchPost(HttpServletRequest request , Model model) {
		String view = "";
		String symbol = request.getParameter("symbol-code");
		System.out.println(symbol);
		List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();
		Boolean valid = false;
		for(StockNameVO stock : stockNameList) {
			if(symbol.equals(stock.getSymbol())) {
				System.out.println("valid symbol");
				valid = true;
				break;
			}			
		}
		if(!valid) {			
			String msg = "warning:error:입력하신 종목은 존재 하지 않습니다.";
			model.addAttribute("msg" , msg);
			view = "stock/search";
		}else {			
			view= "redirect:/stockinfo/stock/" + symbol;
		}
		
		return view;
	}
	
	
	@RequestMapping("/stock/{symbol}")
	public String getDetailStockInfo(Model model , HttpServletRequest request,  HttpSession session , @PathVariable("symbol") String symbol) {		
		String view = "stock/stockinfo";
		model.addAttribute("symbol" , symbol);
		long unixTimestamp = Instant.now().getEpochSecond();
		long startTime = unixTimestamp - (31622400 * 3); //3years
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("symbol", symbol);
		List<DailyStockVO> list = service.getDailyStockByRange(params );		
		System.out.println(list.size());		
		Gson gson = new Gson();		
		String dailyStockJson = gson.toJson(list);
		model.addAttribute("list" , dailyStockJson);
		
		
		List<String> symbolList=  new ArrayList<String>();
		symbolList.add(symbol);
		System.out.println(symbolList.size());
		
		List<StockSummaryVO> stockSummaryList = summaryService.selectCurrentStockSummary(symbolList);		
		System.out.println(stockSummaryList.size());
				
		StockSummaryVO stockSummary = stockSummaryList.get(0);
		System.out.println(stockSummary);
		
		model.addAttribute("stockSummary" , stockSummary );	
	  	StockNameVO stockNameVO =   summaryService.selectStockName(symbol);
	  	model.addAttribute("stockNameVO" , stockNameVO);
	  	  	
	  	RealTimeStockVO realTimeStockVO = service.getRecentOneRealTime(symbol);
	  	model.addAttribute("realTimeStockVO"  , realTimeStockVO );
	  	
		return view;
	}
	
	
}
