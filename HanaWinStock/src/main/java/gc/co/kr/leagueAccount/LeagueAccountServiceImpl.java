package gc.co.kr.leagueAccount;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LeagueAccountServiceImpl implements LeagueAccountService{

	@Autowired
	private LeagueAccountDAO leagueAccountDAO;
	
	@Override
	public LeagueAccountVO selectLeagueAcc(String userID) {
		LeagueAccountVO leagueAccountVO  = leagueAccountDAO.selectLeagueAcc(userID);		
		return leagueAccountVO;
	}

	@Override
	public List<LeagueFollowVO> selectFollowers(String userID) {
		List<LeagueFollowVO> leagueFollowVO = leagueAccountDAO.selectFollowers(userID) ;
		return leagueFollowVO;
	}

	@Override
	public int createLeagueAcc(LeagueAccountVO leagueAccountVO) {
		System.out.println("inserting  leagueAccountVO : " + leagueAccountVO);
		int row = leagueAccountDAO.createLeagueAcc(leagueAccountVO);
		return row;
	}

	@Override
	public void transactLeague(Map<String, Object> params) {
		System.out.println("league transact start");
		leagueAccountDAO.transactLeagueStock(params);
		
	}

	@Override
	public List<LeagueFollowVO> selectmyfollow(String followerId) {
		// TODO Auto-generated method stub
		List<LeagueFollowVO> list = leagueAccountDAO.selectmyfollow( followerId );		
		return list;
	}

	@Override
	public void subscribeUser(LeagueFollowVO leagueFollowVO) {		
		leagueAccountDAO.subscribeUser(leagueFollowVO);
	}

	@Override
	public void unSubscribeUser(LeagueFollowVO leagueFollowVO) {
		// TODO Auto-generated method stub
		leagueAccountDAO.unSubscribeUser(leagueFollowVO);
	}

	@Override
	public void leagueAcclogin(String id) {
		// TODO Auto-generated method stub
		leagueAccountDAO.leagueAcclogin(id);
	}

	@Override
	public void leagueAcclogout(String id) {
		leagueAccountDAO.leagueAcclogout(id);
		
	}

	@Override
	public List<LeagueAccountVO> getSessionFollowers(List<String> users) {
		// TODO Auto-generated method stub
		List<LeagueAccountVO> list =  leagueAccountDAO.getSessionFollowers(users);
		return list;
	}
}
