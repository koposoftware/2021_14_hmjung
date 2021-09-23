package gc.co.kr.advertise.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gc.co.kr.advertise.vo.AdRequestVO;
import gc.co.kr.advertise.vo.AdvertiseMemberRequestVO;

@Repository
public class AdvertiseDAOImpl implements AdvertiseDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private SqlSession session;

	@Override
	public int createRequest(AdvertiseMemberRequestVO advertiseMemberRequestVO) {
		// TODO Auto-generated method stub
		int row = session.insert("advertise.AdvertiseDAO.createRequest" , advertiseMemberRequestVO);
		return row;
	}

	@Override
	public List<AdvertiseMemberRequestVO> selectAllAdvertiseMemberRequestVO() {
		// TODO Auto-generated method stub
		List<AdvertiseMemberRequestVO> list =  sqlSessionTemplate.selectList("advertise.AdvertiseDAO.selectAllAdvertiseMemberRequestVO");
		return list;
	}

	@Override
	public AdvertiseMemberRequestVO selectAdvertiseMemberRequestVO(int no) {
		// TODO Auto-generated method stub		
		AdvertiseMemberRequestVO  AdvertiseMemberRequestVO =  sqlSessionTemplate.selectOne("advertise.AdvertiseDAO.selectAdvertiseMemberRequestVO" , no);
		return AdvertiseMemberRequestVO;
	}

	@Override
	public int updateRequestStatus(AdvertiseMemberRequestVO advertiseMemberRequestVO) {
		// TODO Auto-generated method stub
		int row = session.update("advertise.AdvertiseDAO.updateRequestStatus", advertiseMemberRequestVO);
		return row;
	}

	@Override
	public List<AdvertiseMemberRequestVO> getApprovedSymbols(String id) {
		// TODO Auto-generated method stub
		List<AdvertiseMemberRequestVO> list = sqlSessionTemplate.selectList("advertise.AdvertiseDAO.getApprovedSymbols" , id);
		return list;
	}

	@Override
	public int createVideoRequest(AdRequestVO requestVO) {
		int row = session.insert("advertise.AdvertiseDAO.createVideoRequest" , requestVO);
		return row;
	}

	@Override
	public List<AdRequestVO> selectAllRequestVO() {
		List<AdRequestVO> list = sqlSessionTemplate.selectList("advertise.AdvertiseDAO.selectAllRequestVO");
		return list;
	}

	@Override
	public AdRequestVO selectOneRequestVO(int no) {
		// TODO Auto-generated method stub
		AdRequestVO adRequestVO = sqlSessionTemplate.selectOne("advertise.AdvertiseDAO.selectOneRequestVO" , no);
		return adRequestVO;
	}

	@Override
	public int updateVideoRequestVOStatus(AdRequestVO requestVO) {
		// TODO Auto-generated method stub
		
		int row = session.update("advertise.AdvertiseDAO.updateVideoRequestVOStatus" , requestVO);
		return row;
	}

	@Override
	public List<AdRequestVO> getAllapprovedAds(float frequency) {
		// TODO Auto-generated method stub
		
		List<AdRequestVO> list  = sqlSessionTemplate.selectList("advertise.AdvertiseDAO.getAllapprovedAds" , frequency  );
		return list;
	}			
}
