package gc.co.kr.ai;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gc.co.kr.member.vo.MemberVO;

@Controller
@RequestMapping("/artificial")
public class AiController {
	
	@GetMapping("/createModel")
	public String createModle(HttpSession session , HttpServletRequest request ,  Model model) {
		
		MemberVO  userVO= (MemberVO) session.getAttribute("userVO");
		String msg = "";
		String referer = request.getHeader("Referer");
		if ( userVO.getUserType() != 3  ) {
			System.out.println("not logged in as league");
			msg = "warning:error:관리자만 이기능을 사용 할 수 있습니다.";
			session.setAttribute("msg", msg);			
			if(  referer != null ) {
				return "redirect:"+ referer;
			}else {
				return "redirect:/";
			}									
		}		
		return "ai/createModel";
	}
	
	
	
	
	
}
