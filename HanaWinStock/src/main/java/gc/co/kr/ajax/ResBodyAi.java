package gc.co.kr.ajax;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gc.co.kr.ai.service.AiModelsService;
import gc.co.kr.member.vo.MemberVO;

@Controller
@RequestMapping("/ajax/ai")
public class ResBodyAi {
	
	@Autowired
	private AiModelsService service;
	
	@RequestMapping("/deleteModel.json")
	@ResponseBody
	public Map<String ,  String> deleteModel(HttpServletRequest request , HttpSession session) {
		Map<String , String> result = new HashMap<String, String>();
		try {
			MemberVO userVO = (MemberVO) session.getAttribute("userVO");
			String password = request.getParameter("password"); 
			if(!userVO.getPassword().equals(password)) {
				result.put("result", "fail");
				result.put("msg", "warning:error:비밀번호가 올바르지 않습니다.");
			}
						
			String no = request.getParameter("no");			
			service.deleteModel(Integer.parseInt(no));
			result.put("result", "success");								
		} catch (Exception e) {
			// TODO: handle exception
			result.put("result", "fail");
			result.put("msg", "warning:error:서버에 알 수 없는 문제가 발생했습니다.");
		}			
		return result;
	}		
}
