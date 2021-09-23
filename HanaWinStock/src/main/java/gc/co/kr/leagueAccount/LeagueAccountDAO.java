package gc.co.kr.leagueAccount;

import java.util.List;
import java.util.Map;

public interface LeagueAccountDAO {
	
	LeagueAccountVO selectLeagueAcc(String userID);
	
	List<LeagueFollowVO> selectFollowers(String userID);
	
	int createLeagueAcc(LeagueAccountVO leagueAccountVO);
		
	void transactLeagueStock(Map<String, Object> params);
	List<LeagueFollowVO> selectmyfollow( String followerId );
	
	void subscribeUser(LeagueFollowVO leagueFollowVO);
	
	void unSubscribeUser(LeagueFollowVO leagueFollowVO);
	
}
