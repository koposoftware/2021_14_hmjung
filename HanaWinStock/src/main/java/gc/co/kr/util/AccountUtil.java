package gc.co.kr.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import gc.co.kr.account.vo.AccountVO;
import gc.co.kr.leagueAccount.LeagueAccountVO;

@Component
public class AccountUtil {
	
	
	private AccountVO accountVO = new AccountVO(); 
	
	public AccountVO convertLeagueToAccount( LeagueAccountVO leagueAccountVO, String pass) {
		accountVO.setGcaNumber( "league:"  +  leagueAccountVO.getId()  );
		accountVO.setGcaPassword( pass );
		accountVO.setBalance(leagueAccountVO.getBalance());
		accountVO.setRegDate(leagueAccountVO.getRegDate());
		accountVO.setId(leagueAccountVO.getId());						
		return accountVO;		
	}
	
	
	public Map<String , Object> getAccountInfo(String accountType, String accountkey ){
		HashMap <String , Object> result = new HashMap<String,Object>();
		
		if(accountType != null && accountType.equals("accountVO")) {
						
		}		
		
		
		return result;
	}
	
	
	
}
