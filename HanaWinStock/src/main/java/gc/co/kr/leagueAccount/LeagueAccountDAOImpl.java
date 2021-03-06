package gc.co.kr.leagueAccount;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeagueAccountDAOImpl implements LeagueAccountDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private SqlSession session;
	

	@Override
	public LeagueAccountVO selectLeagueAcc(String userID) {
		System.out.println("selecting League Acc");
		LeagueAccountVO leagueUserVO  = sqlSessionTemplate.selectOne("account.AccountDAO.selectLeagueAcc" , userID);
		return leagueUserVO;
	}

	@Override
	public List<LeagueFollowVO> selectFollowers(String userID) {
		System.out.println("selecting followers : " + userID);
		List<LeagueFollowVO>  leagueFollowUserVO =  sqlSessionTemplate.selectList("account.AccountDAO.selectFollowers" , userID); 		
		return leagueFollowUserVO;
	}


	@Override
	public int createLeagueAcc(LeagueAccountVO leagueAccountVO) {
		System.out.println("creating league acc");
		int row = session.insert("account.AccountDAO.createLeagueAcc" , leagueAccountVO);		
		return row;
	}

	@Override 
	public void transactLeagueStock(Map<String, Object> params) {
		// TODO Auto-generated method stub
		session.update("account.AccountDAO.transactAccountLeague", params);
		session.update("account.AccountDAO.transactAccountStock", params);
		session.insert("account.AccountDAO.transactAccountStockLog" , params);
	}

	@Override
	public List<LeagueFollowVO> selectmyfollow(String followerId) {
		// TODO Auto-generated method stub
		List<LeagueFollowVO> list = sqlSessionTemplate.selectList("account.AccountDAO.selectmyfollow" , followerId);
		return list;
	}

	@Override
	public void subscribeUser(LeagueFollowVO leagueFollowVO) {		
		session.insert( "account.AccountDAO.subscribeUser",  leagueFollowVO);
	}

	@Override
	public void unSubscribeUser(LeagueFollowVO leagueFollowVO) {
		
		session.delete( "account.AccountDAO.unSubscribeUser",  leagueFollowVO);
	}

	@Override
	public void leagueAcclogin(String id) {
		session.update("account.AccountDAO.leagueAcclogin" , id);		
	}

	@Override
	public void leagueAcclogout(String id) {
		session.update("account.AccountDAO.leagueAcclogout" , id);		
	}

	@Override
	public List<LeagueAccountVO> getSessionFollowers(List<String> users) {
		// TODO Auto-generated method stub
		List<LeagueAccountVO> list = session.selectList("account.AccountDAO.getSessionFollowers" , users);
		return list;
	}
}
