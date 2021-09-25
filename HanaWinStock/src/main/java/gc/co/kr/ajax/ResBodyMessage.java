package gc.co.kr.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gc.co.kr.message.MessageService;
import gc.co.kr.message.MessageVO;

@Controller
@RequestMapping("/ajax/message")
public class ResBodyMessage {
	
	@Autowired
	private MessageService service;
	
	@RequestMapping("/sendMessage.json")
	@ResponseBody
	public String sendMessage(HttpServletRequest request , HttpSession session) {
		
		String fromId = (String)request.getParameter("fromId");
		String toId = (String)request.getParameter("toId");
		String content = (String)request.getParameter("content");
		
		
		MessageVO messageVO = new MessageVO();
		messageVO.setChecked("false");
		messageVO.setFromId(fromId);
		messageVO.setToId(toId);
		messageVO.setContent(content);
		
		
		int row = service.sendMessage(messageVO);
		String result = "fail";
		if(row == 1) {
			result ="success";
		}		
		return result;
	}
	
    
	@RequestMapping("/checkMessage.json")
	@ResponseBody
	public String checkMessage(HttpServletRequest request , HttpSession session) {		
		int no  = Integer.parseInt(request.getParameter("no"));
		service.checkMessage(no);
		String result = "success";	
		return result;
	}

}
