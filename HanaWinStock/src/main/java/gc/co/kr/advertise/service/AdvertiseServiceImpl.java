package gc.co.kr.advertise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gc.co.kr.advertise.dao.AdvertiseDAO;
import gc.co.kr.advertise.vo.AdRequestVO;
import gc.co.kr.advertise.vo.AdvertiseMemberRequestVO;

@Service
@Transactional
public class AdvertiseServiceImpl implements AdvertiseService{
	
	@Autowired
	private AdvertiseDAO advertiseDAO;

	@Override
	public int createRequest(AdvertiseMemberRequestVO advertiseMemberRequestVO) {
		// TODO Auto-generated method stub
		
		int row =  advertiseDAO.createRequest(advertiseMemberRequestVO);
		return row;
	}

	@Override
	public List<AdvertiseMemberRequestVO> selectAllAdvertiseMemberRequestVO() {
		// TODO Auto-generated method stub
		 List<AdvertiseMemberRequestVO> list =  advertiseDAO.selectAllAdvertiseMemberRequestVO();
		return list;
	}

	@Override
	public AdvertiseMemberRequestVO selectAdvertiseMemberRequestVO(int no) {
		// TODO Auto-generated method stub
		AdvertiseMemberRequestVO advertiseMemberRequestVO  =  advertiseDAO.selectAdvertiseMemberRequestVO(no);
		
		return advertiseMemberRequestVO;
	}

	@Override
	public int updateRequestStatus(AdvertiseMemberRequestVO advertiseMemberRequestVO) {
		// TODO Auto-generated method stub
		
		int row =  advertiseDAO.updateRequestStatus( advertiseMemberRequestVO);
		return row;
	}

	@Override
	public List<AdvertiseMemberRequestVO> getApprovedSymbols(String id) {
		// TODO Auto-generated method stub
		List<AdvertiseMemberRequestVO> list = advertiseDAO.getApprovedSymbols(id);
		
		return list;
	}

	@Override
	public int createVideoRequest(AdRequestVO requestVO) {
		int row = advertiseDAO.createVideoRequest(requestVO);
		return row;
	}

	@Override
	public List<AdRequestVO> selectAllRequestVO() {
		// TODO Auto-generated method stub
		List<AdRequestVO> list = advertiseDAO.selectAllRequestVO();
		return list;
	}

	@Override
	public AdRequestVO selectOneRequestVO(int no) {
		// TODO Auto-generated method stub
		AdRequestVO adRequestVO = advertiseDAO.selectOneRequestVO(no);
		return adRequestVO;
	}

	@Override
	public int updateVideoRequestVOStatus(AdRequestVO requestVO) {
		// TODO Auto-generated method stub
		int row = advertiseDAO.updateVideoRequestVOStatus(requestVO) ;
		
		return row;
	}

	@Override
	public List<AdRequestVO> getAllapprovedAds(float frequency) {
		// TODO Auto-generated method stub
		List<AdRequestVO> list =  advertiseDAO.getAllapprovedAds(frequency);		
		return list;
	}
}
