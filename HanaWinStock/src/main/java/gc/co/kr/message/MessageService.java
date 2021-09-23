package gc.co.kr.message;

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

}
