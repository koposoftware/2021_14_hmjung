package gc.co.kr.ai.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gc.co.kr.ai.dao.AiModelsDAO;
import gc.co.kr.ai.vo.AiModelsUsageVO;
import gc.co.kr.ai.vo.AiModelsVO;


@Service
@Transactional
public class AiModelsService {
	
	@Autowired
	AiModelsDAO aiModelsDAO;
	
	
	public List<AiModelsVO> getAiModelsList(){
		
		//List<AiModelsVO> list = aiModelsDAO.getAiModelsList();
		
		return null;
	}
	
	public List<Map<String, Object> > selectTodayUsage(){
		
		List<Map<String, Object> > list = aiModelsDAO.selectTodayUsage();
		return list;
	};
	
	public List<AiModelsVO> getAiModelsListEachSymbol(String symbol){
		List<AiModelsVO>  list = aiModelsDAO.getAiModelsListEachSymbol(symbol);
		return list;		
	}
	
	
	public void deleteModel(int no) {
		aiModelsDAO.deleteModel(no);
		
	}
	
	@Transactional
	public void updateflag(String symbol , String modelName) {
		aiModelsDAO.allflagsdown(symbol);
		Map<String,String> map = new HashMap<String,String>();
		map.put("symbol", symbol);
		map.put("modelName", modelName);
		aiModelsDAO.flagup(map);		
	}
	
	
	
}
