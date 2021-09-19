package gc.co.kr.advertise.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gc.co.kr.advertise.dao.AdvertiseDAO;

@Service
@Transactional
public class AdvertiseServiceImpl implements AdvertiseService{
	
	@Autowired
	private AdvertiseDAO advertiseDAO;

}
