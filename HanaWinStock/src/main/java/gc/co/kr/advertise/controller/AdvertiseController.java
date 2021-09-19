package gc.co.kr.advertise.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import gc.co.kr.advertise.service.AdvertiseService;
import gc.co.kr.advertise.vo.AdvertiseMemberRequestVO;
import gc.co.kr.config.GeneralConfig;

@Controller
@RequestMapping("/advertise")
public class AdvertiseController {
	
	
	@Autowired
	private AdvertiseService service;
	
	@Autowired
	private GeneralConfig generalConfig;
	
	@GetMapping("/valid")
	public String getValidPage() {
		
		return "advertise/valid";
	}
	
	@PostMapping( value= "/valid" , consumes = "multipart/form-data" )
	public String confirmValid(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request, MultipartFile uploadFile, Model model ,HttpSession session ) {
		//System.out.println("advertiseMemberRequestVO : " +  advertiseMemberRequestVO);

		System.out.println("valid process start");
		String a = request.getServletContext().getRealPath("test");
		System.out.println(a);
		System.out.println(request.getContextPath());

		String fileName = file.getOriginalFilename();

		File imageFile = new File(generalConfig.advertiseRequestMemberFilePath, fileName);

		try {
			file.transferTo(imageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "advertise/valid";
	}
	
}
