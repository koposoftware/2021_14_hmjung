package gc.co.kr.advertise.service;

import java.util.List;

import gc.co.kr.advertise.vo.AdRequestVO;
import gc.co.kr.advertise.vo.AdvertiseMemberRequestVO;

public interface AdvertiseService {

	int createRequest(AdvertiseMemberRequestVO advertiseMemberRequestVO);
	
	List<AdvertiseMemberRequestVO> selectAllAdvertiseMemberRequestVO();
	
	AdvertiseMemberRequestVO selectAdvertiseMemberRequestVO(int no);
	
	int updateRequestStatus(AdvertiseMemberRequestVO advertiseMemberRequestVO);
	
	List<AdvertiseMemberRequestVO> getApprovedSymbols(String id);
	
	int createVideoRequest(AdRequestVO requestVO);
	
	List<AdRequestVO> selectAllRequestVO();
	
	AdRequestVO selectOneRequestVO(int no);
	
	int updateVideoRequestVOStatus(AdRequestVO requestVO);
	
	List<AdRequestVO> getAllapprovedAds(float frequency);
	
}
