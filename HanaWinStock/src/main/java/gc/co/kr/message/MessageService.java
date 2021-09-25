package gc.co.kr.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	@Autowired
	private MessageDAO messageDAO;
		
	
	public int sendMessage(MessageVO messageVO) {
		int row = messageDAO.sendMessage(messageVO);		
		return row;
	}					
	
	public List<MessageVO> getUncheckedMessages(String id){
		List<MessageVO> list = messageDAO.getUncheckedMessages(id);
		return list;
	}

	public void checkMessage(int no) {
		messageDAO.checkMessage(no);
	}
	
}
