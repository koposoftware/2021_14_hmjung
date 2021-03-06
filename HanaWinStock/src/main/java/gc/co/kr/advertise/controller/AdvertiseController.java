package gc.co.kr.advertise.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;

import com.google.gson.Gson;

import gc.co.kr.advertise.service.AdvertiseService;
import gc.co.kr.advertise.vo.AdRequestVO;
import gc.co.kr.advertise.vo.AdvertiseMemberRequestVO;
import gc.co.kr.chating.handler.SocketHandler;
import gc.co.kr.config.GeneralConfig;
import gc.co.kr.member.vo.MemberVO;
import gc.co.kr.message.MessageService;
import gc.co.kr.message.MessageVO;
import gc.co.kr.stocksummary.service.StockSummaryService;
import gc.co.kr.stocksummary.vo.StockNameVO;
import gc.co.kr.stocksummary.vo.StockSummaryVO;

@Controller
@RequestMapping("/account/advertise")
public class AdvertiseController {
	
	@Autowired
	private StockSummaryService summaryService;
	
	@Autowired
	private AdvertiseService service;
	
	@Autowired
	private GeneralConfig generalConfig;
	
	@Autowired
	private MessageService messageService;
	
	
	@Autowired
	private SocketHandler socketHandler;
	

	@GetMapping("/valid")
	public String getValidPage(HttpServletRequest request) {
		List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();		
		
		List<String> symbols = new ArrayList<String>();
		for(StockNameVO s : stockNameList) {
			symbols.add(s.getSymbol());
		}
		Gson gson = new Gson();		
		String symbolJson = gson.toJson(symbols);		
		System.out.println(symbolJson);
		request.setAttribute("symbols"  , symbolJson);				
		return "advertise/valid";
	}
	
	@PostMapping( value= "/valid" , consumes = "multipart/form-data" )
	public String confirmValid(@RequestParam("file") MultipartFile file,  AdvertiseMemberRequestVO advertiseMemberRequestVO,  MultipartHttpServletRequest request, Model model ,HttpSession session ) {
		System.out.println("advertiseMemberRequestVO : " +  advertiseMemberRequestVO);		
		System.out.println("valid process start");
		String view ="";
		String msg ="";
		try {
			MemberVO userVO = (MemberVO) session.getAttribute("userVO");
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
			String[] temps = fileName.split("\\.");			
			System.out.println(Arrays.toString(temps));			
			String originalExt = temps[temps.length - 1];		
			String timeStamp = new SimpleDateFormat("yyyyMMdd_HH_mm_ss").format(new Date());
			String newFileName = "file-" + timeStamp + "." + originalExt ;
			System.out.println(newFileName);
			File imageFile = new File(generalConfig.advertiseRequestMemberFilePath, newFileName);
			String filePath = imageFile.getPath();
			file.transferTo(imageFile);
			advertiseMemberRequestVO.setFilePath(filePath);
			advertiseMemberRequestVO.setId(userVO.getId());
			advertiseMemberRequestVO.setStatus("WAIT");
			advertiseMemberRequestVO.setClientAlarm("CHECKED");						
			System.out.println(filePath);
			System.out.println("advertiseMemberRequestVO : " +  advertiseMemberRequestVO);
			int row = service.createRequest(advertiseMemberRequestVO);
			if(row == 1) {
				msg = "success:??????:?????? ?????? ??????";				
			}else {
				msg = "warning:Error:???????????? ????????? ?????? ????????????.";
			}
			session.setAttribute("msg", msg);
			view ="redirect:/";
		} catch (IOException e){
			e.printStackTrace();
			view ="advertise/valid";
			msg ="warning:Error:???????????? ????????? ?????? ????????????.";
			model.addAttribute("msg" , msg);
		}
		return view;
	}
	
	@GetMapping("/checkvalid")
	public String checkValidPage(Model model) {
		
		List<AdvertiseMemberRequestVO> list = service.selectAllAdvertiseMemberRequestVO();
		model.addAttribute("list" , list);		
		return "advertise/checkvalid";	
	}
	
	
	@GetMapping("/valid/each/{no}")
	public String checkValidEach(@PathVariable("no") int no , Model model) {
		
		AdvertiseMemberRequestVO advertiseMemberRequestVO = service.selectAdvertiseMemberRequestVO(no);
		model.addAttribute("advertiseMemberRequestVO"  , advertiseMemberRequestVO );
		
		return "advertise/detailvalid";
	}
	@PostMapping("/valid/each/{no}")
	public String checkValidEachForm(@PathVariable("no") int no , AdvertiseMemberRequestVO advertiseMemberRequestVO, HttpSession session) {		
		//AdvertiseMemberRequestVO advertiseMemberRequestVO = service.selectAdvertiseMemberRequestVO(no);
		System.out.println(advertiseMemberRequestVO);
		advertiseMemberRequestVO.setNo(no);
		int row = service.updateRequestStatus(advertiseMemberRequestVO);
		String msg;
		if(row ==1 ) {
			msg = "success:success:??????????????? ?????? ????????? ????????????.";
			MessageVO messageVO = new MessageVO();
			messageVO.setFromId("admin");
			messageVO.setToId(advertiseMemberRequestVO.getId());
			if (advertiseMemberRequestVO.getStatus().equals("DISPROVE")) {
				System.out.println("sending disprove message");
				messageVO.setContent("?????? ?????? ????????? ?????? ?????? ???????????????.");
			}else if(advertiseMemberRequestVO.getStatus().equals("APPROVE")) {
				System.out.println("sending approve message");
				messageVO.setContent("?????? ?????? ????????? ?????? ???????????????. ?????? ????????? ????????? ?????? ?????? ?????? ????????? ?????? ????????????. ???????????????.");
			}
			messageVO.setChecked("false");
			System.out.println(messageVO);
			messageService.sendMessage(messageVO);						
		}else {
			msg = "warning:warning:?????? ????????? ?????? ??????"	;		
		}
		session.setAttribute("msg", msg);
		return "redirect:/account/advertise/checkvalid";
	}
	
	
	@GetMapping("/requestad")
	public String requestAd(HttpSession session , Model model) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		List<AdvertiseMemberRequestVO> list = service.getApprovedSymbols(userVO.getId());		
		model.addAttribute("list" , list);

		List<StockSummaryVO> stockSummaryList = null;
		List<StockNameVO> stockNameList =  summaryService.selectAllStockNames();
		List<String>  symbols= new ArrayList<String>();
		if(stockNameList != null && stockNameList.size() > 0) {			
			for(StockNameVO stock : stockNameList) {
				symbols.add(stock.getSymbol());
			}			
			stockSummaryList = summaryService.selectCurrentStockSummary(symbols);			
		}		
		Map<String, StockNameVO> stockNameMap = new HashMap<String, StockNameVO>();		
		for( StockNameVO stock : stockNameList   ) {
			stockNameMap.put(stock.getSymbol() , stock);
		}				
		Gson gson = new Gson();
        String serializeString = gson.toJson(stockNameMap);
        model.addAttribute("stockNameMap" , serializeString);
                             
        Map<String ,StockSummaryVO > temp = new HashMap<String , StockSummaryVO>();
        
        for(StockSummaryVO summary: stockSummaryList ){
        	temp.put(summary.getSymbol(), summary);
        }

        Gson gson2 = new Gson();
        String stockSummaryListString = gson2.toJson(temp);
		model.addAttribute("stockSummaryList" , stockSummaryListString);								
	
		return "advertise/requestad";		
	}		
	
	
	
	
	@PostMapping( value= "/requestad" , consumes = "multipart/form-data" )
	public String requestAdPost(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session , AdRequestVO requestVO,  Model model) {
		String view = "";
		String msg = "";
		try {
			
			String daysStr = request.getParameter("days-count");
			System.out.println("daysStr : " +  daysStr);
			int addingDays = Integer.parseInt(daysStr);
			
			
			String pattern = "MM/dd/yyyy";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(new Date());
			System.out.println(date);
			requestVO.setStartDate(date);
			
						
			Calendar c= Calendar.getInstance();
			c.add(Calendar.DATE, addingDays);
			String date2 = simpleDateFormat.format(  c.getTime());
			System.out.println(date2);
			requestVO.setEndDate(date2);
			
			
			MemberVO userVO = (MemberVO)session.getAttribute("userVO");
			requestVO.setId(userVO.getId());			
			String fileName = file.getOriginalFilename();
			String[] temps = fileName.split("\\.");
			System.out.println(Arrays.toString(temps));
			String originalExt = temps[temps.length - 1];
			String timeStamp = new SimpleDateFormat("yyyyMMdd_HH_mm_ss").format(new Date());
			String newFileName = "file-" + timeStamp + "." + originalExt ;
			File imageFile = new File(generalConfig.advertiseVideoPath, newFileName);
			String filePath = imageFile.getPath();
			requestVO.setFilePath(filePath);
			requestVO.setStatus("WAIT");
			
			
			
			System.out.println("requestVO : "  +  requestVO);			
			file.transferTo(imageFile);
			int row = service.createVideoRequest(requestVO);
			if(row == 1) {
				msg = "success:??????: ?????? ?????? ??????";				
			}else {
				msg = "warning:Error:???????????? ????????? ?????? ????????????.";
			}
			session.setAttribute("msg", msg);
			view ="redirect:/";						
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
			view ="redirect:/account/advertise/requestad";
			msg ="warning:Error:???????????? ????????? ?????? ????????????.";
			session.setAttribute("msg" , msg);
		}								
		return  view;				
	}
	

	
	
	@GetMapping("/requestadcheck")
	public String checkRrequestAD(Model model) {		
		List<AdRequestVO> list = service.selectAllRequestVO();
		model.addAttribute("list" , list);				
		return "advertise/requestadcheck";
	}
	
	@GetMapping("/adcheck/each/{no}")
	public String checkRequestadcheckEach(@PathVariable("no") int no , Model model) {
		System.out.println("no : " +   no);
		AdRequestVO adRequestVO = service.selectOneRequestVO( no );
		System.out.println("adRequestVO : " +    adRequestVO);
		model.addAttribute("adRequestVO"  , adRequestVO);			
		return "advertise/detailrequest";
	}
	

	
	@PostMapping("/adcheck/each/{no}")
	public String checkRequestadcheckEachPost(@PathVariable("no") int no , AdRequestVO adRequestVO , HttpSession session ) {		
		adRequestVO.setNo(no);
		int row = service.updateVideoRequestVOStatus(adRequestVO);
		String msg;
		if(row ==1 ) {
    		msg = "success:success:??????????????? ?????? ????????? ????????????.";
    		MessageVO messageVO = new MessageVO();
    		messageVO.setFromId("admin");
    		messageVO.setToId(adRequestVO.getId());
    		if (adRequestVO.getStatus().equals("DISPROVE")) {
    			System.out.println("sending disprove message");
    			messageVO.setContent("?????? ????????? ?????? ???????????????.");
    		}else if(adRequestVO.getStatus().equals("APPROVE")) {
    			    			
    			
    			    			    			    			    			
    			System.out.println("sending approve message");
    			messageVO.setContent("?????? ?????? ?????? ????????? ?????? ???????????????. ?????? ?????? ????????? ?????? ?????? ????????? ?????? ?????? ????????? ?????? ???????????? ???????????????.");
    		}
    		messageVO.setChecked("false");
    		System.out.println(messageVO); 
    		messageService.sendMessage(messageVO);						
    	}else {
    		msg = "warning:warning:?????? ????????? ?????? ??????"	;		
    	}
    	session.setAttribute("msg", msg);
    	return "redirect:/account/advertise/requestadcheck";
	}
	
//	@PostMapping("/valid/each/{no}")
//	public String checkValidEachForm(@PathVariable("no") int no , AdvertiseMemberRequestVO advertiseMemberRequestVO, HttpSession session) {		
//		//AdvertiseMemberRequestVO advertiseMemberRequestVO = service.selectAdvertiseMemberRequestVO(no);
//		System.out.println(advertiseMemberRequestVO);
//		advertiseMemberRequestVO.setNo(no);
//		int row = service.updateRequestStatus(advertiseMemberRequestVO);
//		String msg;
//		if(row ==1 ) {
//			msg = "success:success:??????????????? ?????? ????????? ????????????.";
//			MessageVO messageVO = new MessageVO();
//			messageVO.setFromId("admin");
//			messageVO.setToId(advertiseMemberRequestVO.getId());
//			if (advertiseMemberRequestVO.getStatus().equals("DISPROVE")) {
//				System.out.println("sending disprove message");
//				messageVO.setContent("?????? ?????? ????????? ?????? ?????? ???????????????.");
//			}else if(advertiseMemberRequestVO.getStatus().equals("APPROVE")) {
//				System.out.println("sending approve message");
//				messageVO.setContent("?????? ?????? ????????? ?????? ???????????????. ?????? ????????? ????????? ?????? ?????? ?????? ????????? ?????? ????????????. ???????????????.");
//			}
//			messageVO.setChecked("false");
//			System.out.println(messageVO);
//			messageService.sendMessage(messageVO);						
//		}else {
//			msg = "warning:warning:?????? ????????? ?????? ??????"	;		
//		}
//		session.setAttribute("msg", msg);
//		return "redirect:/account/advertise/checkvalid";
//	}
//	
	
	
}
