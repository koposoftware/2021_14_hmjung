package gc.co.kr.ajax;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gc.co.kr.realtimestock.service.RealTimeStockService;
import gc.co.kr.realtimestock.vo.DailyStockVO;
import gc.co.kr.realtimestock.vo.RealTimeStockVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping("/ajax")
public class ResBodyRealTimeStock {

	@Autowired
	private RealTimeStockService service;
	
	
	@RequestMapping("/realTimeStock.json")
	@ResponseBody
	public List<RealTimeStockVO> getRealTimeStock(HttpServletRequest request ){		
		//yyyy-MM-DD-HH24:MI:SS
		Map<String, Object> params = new HashMap<String , Object>();
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		List<String> symbolList = Arrays.asList( request.getParameter("symbols").split(","));		
		System.out.println(symbolList);
		System.out.println(symbolList);		
		System.out.println(start + " : "  + end);
		params.put("start", start);
		params.put("end", end);
		params.put("symbolList", symbolList);
		List<RealTimeStockVO> list= service.selectStockByTimeSymbols(params);
		
	
		
		List<RealTimeStockVO> result = null;
		if(list != null && list.size() > 0) {
			result = list;			
		}
		return result;
	}
	
	@RequestMapping("/getInitStockValues.json")
	@ResponseBody
	public List<Map<String,Object>> getInitValues(HttpServletRequest request){		
		List<Map<String,Object>> result = null;		
		Map<String,Object> params = new HashMap<String  , Object>();
		int interval =  Integer.parseInt(request.getParameter("interval"));		
		int startTime= Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));		
		String symbolList  = request.getParameter("symbols");	
		params.put("interval", interval);
		params.put("startTime" , startTime);
		params.put("endTime", endTime);		
		params.put("symbolList", symbolList);
		result = service.getInitValues(params);			
		return result;		
	}
	
	@RequestMapping("/getInitStockValuesLines.json")
	@ResponseBody
	public List<Map<String,Object>> getInitValuesLines(HttpServletRequest request){		
		List<Map<String,Object>> result = null;		
		Map<String,Object> params = new HashMap<String  , Object>();
		int interval =  Integer.parseInt(request.getParameter("interval"));		
		int startTime= Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));		
		String symbolList  = request.getParameter("symbols");	
		params.put("interval", interval);
		params.put("startTime" , startTime);
		params.put("endTime", endTime);		
		params.put("symbolList", symbolList);
		result = service.getInitValues(params);		
		return result;		
	}
	
	@RequestMapping("/getDailyStockValues.json")
	@ResponseBody
	public Map<String,List<DailyStockVO>>  getDailyStockValues(HttpServletRequest request){
		Long startTime = Long.parseLong(request.getParameter("startTime"));
		String symboljoin = request.getParameter("symboljoin");
		String[] symbolArray = symboljoin.split(",");			
		Map<String, Object> params = new HashMap<String, Object>();				
		params.put("startTime", startTime);
		params.put("symbolArray", symbolArray);		
		Map<String,List<DailyStockVO>> dataResult = new HashMap<String , List<DailyStockVO> >();				
		for(String symbol : symbolArray ) {
			List<DailyStockVO> temp = new ArrayList<DailyStockVO>();			
			dataResult.put(symbol , temp);			
		}
		List<DailyStockVO> list = service.getDailyStocksByRange(params );
		for(DailyStockVO  stock : list  ) {
			List<DailyStockVO> temp = dataResult.get(stock.getSymbol());
			temp.add(stock);
			dataResult.put(stock.getSymbol(), temp);
		}
		return dataResult;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("getRealTimeStock.json")
	@ResponseBody
	public Map<String,Object> getRealTimeStockData(HttpServletRequest request){
		Map<String, Object> result = null;
		Map<String, Object> params = new HashMap<String , Object>();
		
		//int interval =  Integer.parseInt(request.getParameter("interval"));		
		int startTime= Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));		
		String symbol  = request.getParameter("symbol");
		
		params.put("startTime" , startTime);
		params.put("endTime", endTime);		
		params.put("symbol", symbol);
		List<RealTimeStockVO> realTimeData  = service.getRealTimeStockData(params);
		List<Float> priceList = realTimeData.stream().map(RealTimeStockVO::getMarketPrice).collect(Collectors.toList());		
		if (priceList.size() > 0 ) {
			float firstPrice = priceList.get(0);
			float lastPrice = priceList.get(priceList.size() - 1);
			float maxPrice = Collections.max(priceList, Collections.reverseOrder());
			float minPrice = Collections.min(priceList, Collections.reverseOrder());				
			RealTimeStockVO realtimeStockVO = realTimeData.get(realTimeData.size() - 1);				
			ObjectMapper oMapper = new ObjectMapper();		
			result = oMapper.convertValue(realtimeStockVO, Map.class);				
			result.put("firstPrice", firstPrice);
			result.put("lastPrice" , lastPrice);
			result.put("maxPrice", maxPrice);
			result.put("minPrice", minPrice);				
			return result;
		}else {
			System.out.println("size 0 - returning 0");
			return null;
		}
		
	}
	
	
	@RequestMapping("getRealTimeStockLine.json")
	@ResponseBody
	public RealTimeStockVO getRealTimeStockDataLine(HttpServletRequest request){
		RealTimeStockVO result = null;
		Map<String, Object> params = new HashMap<String , Object>();		
				
		int startTime= Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));		
		String symbol  = request.getParameter("symbol");
		
		params.put("startTime" , startTime);
		params.put("endTime", endTime);		
		params.put("symbol", symbol);
		result  = service.getRealTimeStockDataLine(params);
					
		return result;
	}

}
