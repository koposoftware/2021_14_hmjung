package gc.co.kr.message;

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
	
}
