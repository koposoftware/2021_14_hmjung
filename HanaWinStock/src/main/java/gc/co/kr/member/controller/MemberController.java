package gc.co.kr.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gc.co.kr.member.service.MemberService;
import gc.co.kr.member.vo.MemberVO;

@SessionAttributes({ "userVO" }) 
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
		
	@GetMapping("/signin")
	public String loginForm() {
		return "member/signin";
	}
	
	@PostMapping("/signin")
	public String login(MemberVO member, Model model, HttpSession session) {
		System.out.println("info : "  +  member);
		MemberVO userVO = service.signin(member);
		System.out.println("userVO : "  +  userVO);
		String msg = "";
		String view = "";
		if (userVO == null) {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
			view = "member/signin";
			model.addAttribute("msg", msg);
		} else {
			
			model.addAttribute("userVO", userVO);
			msg = "success:로그인 완료:환영합니다. " + userVO.getName() + "님";			
			session.setAttribute("msg", msg);
			// 이제 로그인 후에 그냥 가면 안되고 직전 페이지로 가게함.
			String dest = (String) session.getAttribute("dest");
			if (dest != null) {
				session.removeAttribute("dest");
				view = "redirect:" + dest;
			} else {
				view = "redirect:/";
			}
		}
		return view;
	}
	
	@GetMapping("/signout")
	public String login(SessionStatus sessionStatus, HttpSession session) {		
		sessionStatus.setComplete();
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/signcontract")
	public String signContract() {				
		System.out.println("이용약관");		
		return "member/signcontract";		
	}
	
	@GetMapping("/signup/{userType}")
	public String signup(Model model) {
		System.out.println("회원가입 신청");
		model.addAttribute("memberVO", new MemberVO());		
		return "member/signup";
	}	
	
	@PostMapping("/signup/{userType}")
	public String signup(MemberVO member, Model model, HttpSession session, @PathVariable("userType") int userType) {
		member.setUserType(userType);
		System.out.println("info : " + member);
		String msg = "";
		String view = "";
		try {
			int row = service.signup(member);
			System.out.println("rowCount : " + row);
			MemberVO userVO = member;
			model.addAttribute("userVO", userVO);
			msg = "환영합니다. " + userVO.getName();
			msg = "success:회원가입 완료:" + msg;
			session.setAttribute("msg", msg);
			String dest = (String) session.getAttribute("dest");
			if (dest != null) {
				session.removeAttribute("dest");
				view = "redirect:" + dest;
			} else {
				view = "redirect:/";
			}
		} catch (Exception e) {
			view = "member/signup";
			msg = "warning:에러 발생:서버 문제로 회원가입에 실패 하셨습니다.";
			System.out.println(e);
		}
		model.addAttribute("msg", msg);
		System.out.println(view);
		System.out.println(msg);
		return view;
	}
		
	
}
