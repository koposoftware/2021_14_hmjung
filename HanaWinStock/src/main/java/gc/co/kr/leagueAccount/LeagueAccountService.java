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
	
	
}
