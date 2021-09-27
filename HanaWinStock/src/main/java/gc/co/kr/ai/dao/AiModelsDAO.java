package gc.co.kr.ai.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import gc.co.kr.ai.vo.AiModelsVO;

@Repository
public class AiModelsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private SqlSession session;
	
	
	public List<Map<String, Object> > selectTodayUsage(){			
		List<Map<String, Object>> list = sqlSessionTemplate.selectList("aimodels.AiModelsDAO.selectTodayUsage");
		return list;
	};	
	
	
	public List<AiModelsVO> getAiModelsListEachSymbol(String symbol){
		List<AiModelsVO>  list = sqlSessionTemplate.selectList("aimodels.AiModelsDAO.getAiModelsListEachSymbol" ,symbol);		
		return list;		
	}
	
	
	
	public void deleteModel(int no) {
		session.delete( "aimodels.AiModelsDAO.deleteModel" , no);		
	}
	
	
	public void allflagsdown(String symbol) {
		session.update("aimodels.AiModelsDAO.allflagsdown" , symbol);		
	};
	
	public void flagup(Map<String,String> map) {
		session.update("aimodels.AiModelsDAO.flagup" , map);
	};
	
}
