package gc.co.kr.message;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private SqlSession session;


	public int sendMessage(MessageVO messageVO) {
		int row = session.insert("message.MessageDAO.sendmessage" , messageVO);
		
		return row;
	}
	
	public List<MessageVO> getUncheckedMessages(String id){
		List<MessageVO> list = session.selectList("message.MessageDAO.getUncheckedMessages" , id);
		return list;		
	}
	
	public void checkMessage(int no ) {
		session.update("message.MessageDAO.checkMessage" , no);
		
	}
}
