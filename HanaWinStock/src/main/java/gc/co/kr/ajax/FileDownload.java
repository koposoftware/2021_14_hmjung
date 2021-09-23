package gc.co.kr.ajax;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/ajax/filedown")
public class FileDownload {
	
	
	@RequestMapping(value="/downloadFile")
	public void getLogFile(HttpServletRequest req , HttpSession session, Model model,  HttpServletResponse response) throws Exception {
	    try {
	    	String filePathToBeServed  = req.getParameter("serverPath");
	    	System.out.println("filePathToBeServed : " + filePathToBeServed);
	    	
	        //String filePathToBeServed ="C:\\Users\\hmchu\\git\\2021_14_hmjung\\HanaWinStock\\src\\main\\webapp\\resources\\files\\advertise\\member\\file-20210919_22_58_13.txt";
	        File fileToDownload = new File(filePathToBeServed);
	        Path p = Paths.get(filePathToBeServed);
	        String tempfile = p.getFileName().toString();
	        System.out.println(tempfile);
	        
	        InputStream inputStream = new FileInputStream(fileToDownload);
	        
	        	        
	        response.setContentType("application/force-download");
	        response.setHeader("Content-Disposition", "attachment; filename="+tempfile); 
	        IOUtils.copy(inputStream, response.getOutputStream());
	        response.flushBuffer();
	        inputStream.close();
	    } catch (Exception e){
	        e.printStackTrace();
	    }
	}
	
}
