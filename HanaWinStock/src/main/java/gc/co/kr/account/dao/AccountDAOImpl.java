package gc.co.kr.account.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private SqlSession session;

	@Override
	public int createAcc(AccountVO account) {
		System.out.println("creating output");
		int row = session.insert("account.AccountDAO.createAcc" , account);
		return row;
	}
	
	@Override
	public AccountVO selectByAccNum(String gcaNumber) {
		System.out.println("selectByAccNum");
		AccountVO member = sqlSessionTemplate.selectOne("account.AccountDAO.selectByAccNum" , gcaNumber);
		return member;		
	}

	@Override
	public List<AccountVO> selectAllAccounts(String userID) {
		
		System.out.println("AccountDAO selectALlAccounts");
		List<AccountVO> list = sqlSessionTemplate.selectList("account.AccountDAO.selectAllAccounts" ,   userID);
		return list;
	}

	@Override
	public AccountVO signinAccount(AccountVO accountVO) {
		
		AccountVO userAccountVO = sqlSessionTemplate.selectOne("account.AccountDAO.signinAccount" , accountVO);		
		return userAccountVO ;
	}

	@Override
	public void transactStock(Map<String, Object> params) {
		System.out.println("1");
		session.update("account.AccountDAO.transactAccount" , params);		
		session.update("account.AccountDAO.transactAccountStock", params);		
		session.insert("account.AccountDAO.transactAccountStockLog" , params);
		System.out.println("2");
	}

	@Override
	public List<AccountStockVO> getAllAccountStockVO(String key) {
		List<AccountStockVO> list = session.selectList( "account.AccountDAO.getAllAccountStockVO" , key);
		return list;
	}	
	
	
	
	
	
	
	
}
