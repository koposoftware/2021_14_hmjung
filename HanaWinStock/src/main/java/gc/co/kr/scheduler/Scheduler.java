package gc.co.kr.scheduler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import gc.co.kr.advertise.service.AdvertiseService;
import gc.co.kr.advertise.vo.AdRequestVO;
import gc.co.kr.chating.handler.SocketHandler;



//
//Map<String, String> test = new HashMap<String , String>();
//test.put("room", "AAPL");
//test.put("userName",  "admin"  );
//test.put("msg", "testing sending Message");
//test.put("tier", "SILVER");
//test.put("year", "2019" );
//test.put("hourMin", "15:25");
//test.put("type", "message");		
//JSONObject obj =  new JSONObject(test);		
//socketHandler.sendAdvertise(obj);
//


@Component
public class Scheduler {
	
	@Autowired
	SocketHandler socketHandler;
	
	@Autowired
	AdvertiseService advertiseService;

	@Scheduled(cron = "0 * * * * *")
	public void autoUpdate() {
		System.out.println("1 minute pass");		
		List<AdRequestVO> list = getAllapprovedAds30Min();
		System.out.println("ad video list : " + list.size());
		for(AdRequestVO ad : list) {
			Map<String, String> admap = new HashMap<String , String>();
			admap.put("type", "ad");
			admap.put("room",  ad.getAdvertiseSymbol()  );
			admap.put("msg", ad.getFilePath());
			
			JSONObject obj =  new JSONObject(admap);
			socketHandler.sendAdvertise(obj);						
		}														
	}
	
	@Scheduled( cron = "0 0 0/1 * * *")
	public void everyhourUpdate() {
		System.out.println("1 minute pass");		
		List<AdRequestVO> list = getAllapprovedAds1hour();
		System.out.println("ad video list : " + list.size());
		for(AdRequestVO ad : list) {
			Map<String, String> admap = new HashMap<String , String>();
			admap.put("type", "ad");
			admap.put("room",  ad.getAdvertiseSymbol()  );
			admap.put("msg", ad.getFilePath());
			
			JSONObject obj =  new JSONObject(admap);
			socketHandler.sendAdvertise(obj);						
		}					
	}
	
	
	@Scheduled( cron = "0 0 0/2 * * *")
	public void every2hourUpdate() {
		System.out.println("1 minute pass");		
		List<AdRequestVO> list = getAllapprovedAds2hour();
		System.out.println("ad video list : " + list.size());
		for(AdRequestVO ad : list) {
			Map<String, String> admap = new HashMap<String , String>();
			admap.put("type", "ad");
			admap.put("room",  ad.getAdvertiseSymbol()  );
			admap.put("msg", ad.getFilePath());
			
			JSONObject obj =  new JSONObject(admap);
			socketHandler.sendAdvertise(obj);						
		}					
	}
	
	
	@Scheduled(cron = "0 0 0 * * *")
	public void updateLeagues() {
		System.out.println("리그 계좌 티어 업데이트");
		
	}
	
	
	
	
	
		
	public List<AdRequestVO> getAllapprovedAds30Min(){		
		List<AdRequestVO> list =  advertiseService.getAllapprovedAds( (float) 0.5);		
		return list;
	}
	
	public List<AdRequestVO> getAllapprovedAds1hour(){		
		List<AdRequestVO> list =  advertiseService.getAllapprovedAds( (float) 1 );		
		return list;
	}
	public List<AdRequestVO> getAllapprovedAds2hour(){		
		List<AdRequestVO> list =  advertiseService.getAllapprovedAds( (float) 2);		
		return list;
	}
	
	
	
	
	
	
}


