package gc.co.kr.leagueAccount;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface LeagueAccountService {
		
	LeagueAccountVO selectLeagueAcc(String userID);
	
	List<LeagueFollowVO> selectFollowers(String userID);
	
	int createLeagueAcc(LeagueAccountVO leagueAccountVO);
	
	@Transactional
	void transactLeague(Map<String , Object> params);
	
	List<LeagueFollowVO> selectmyfollow( String followerId );
	
	void subscribeUser(LeagueFollowVO leagueFollowVO);
	
	void unSubscribeUser(LeagueFollowVO leagueFollowVO);
	
	void leagueAcclogin(String id);
	
	void leagueAcclogout(String id);
	
	List<LeagueAccountVO> getSessionFollowers(List<String> users);
}
