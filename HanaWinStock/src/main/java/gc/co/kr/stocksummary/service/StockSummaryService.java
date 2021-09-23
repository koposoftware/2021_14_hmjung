package gc.co.kr.stocksummary.service;

import java.util.List;



import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;

public interface StockSummaryService {
		
	List<StockSummaryVO> selectCurrentStockSummary(List<String> symbols);
	
	StockNameVO selectStockName(String symbol);
	
	List<StockNameVO> selectAllStockNames();
	
	
}
