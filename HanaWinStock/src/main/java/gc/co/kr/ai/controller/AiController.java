package gc.co.kr.ai.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import gc.co.kr.ai.service.AiModelsService;
import gc.co.kr.ai.vo.AiModelsUsageVO;
import gc.co.kr.ai.vo.AiModelsVO;
import gc.co.kr.member.vo.MemberVO;
import gc.co.kr.stocksummary.service.StockSummaryService;
import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;

@Controller
@RequestMapping("/artificial")
public class AiController {
	
	@Autowired
	private AiModelsService service;
	
	@Autowired
	private StockSummaryService summaryService;
	
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
	
	@GetMapping("/manageModel")
	public String manageModle(HttpSession session , HttpServletRequest request ,  Model model) {		
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
		List<Map<String, Object>> list= service.selectTodayUsage();		
		System.out.println("working? : " +  list.size());		
		model.addAttribute("modelUsage" , list);				
		return "ai/manageModel";
	}
	
	@GetMapping("/eachSymbolModel/{symbol}")
	public String viewEachSymbolModel(@PathVariable("symbol") String symbol , HttpSession session , HttpServletRequest request , Model model){
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
		List<AiModelsVO> list = service.getAiModelsListEachSymbol(symbol);
		model.addAttribute("modelList" , list);				
		return "ai/symbolModel";
	}
	
	
	@PostMapping("/eachSymbolModel/{symbol}")
	public String updateNewModel(@PathVariable("symbol") String symbol , HttpSession session , HttpServletRequest request , Model model){
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
				
		String modelName = request.getParameter("modelName");
		service.updateflag(symbol ,modelName );
		
		List<AiModelsVO> list = service.getAiModelsListEachSymbol(symbol);
		model.addAttribute("modelList" , list);
		
		
		return "ai/symbolModel";
	}
	
	
}
