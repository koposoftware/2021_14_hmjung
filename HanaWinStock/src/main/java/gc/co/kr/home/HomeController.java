package gc.co.kr.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	/*
	 * @RequestMapping(value = "/chatting", method = RequestMethod.GET) public
	 * String view_chat(HttpServletRequest request, HttpServletResponse response,
	 * Model model) throws Exception {
	 * 
	 * return "chat/view_chat"; }
	 */

	@RequestMapping("/home-template")
	public String homeTemplate() {
		return "home-template";
	}
	
	@RequestMapping("/dash-template")
	public String dashTemplate() {
		return "dash-template";
	}
	
	@RequestMapping("/testing")
	public String testing() {
		return "testing";
	}
	
	@RequestMapping("/chatting")
	public String testing2() {
		System.out.println("chatting");
		return "chatting2";
	}
	
	
}
