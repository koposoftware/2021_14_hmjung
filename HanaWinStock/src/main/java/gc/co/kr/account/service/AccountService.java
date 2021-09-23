package gc.co.kr.account.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import gc.co.kr.account.vo.AccountStockLog;
import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;

@Transactional
public interface AccountService {
	
	AccountVO selectByAccNum(String gcaNumber);
	
	@Transactional
	int createAcc(AccountVO account);

	List<AccountVO> selectAllAccounts(String userID);

	AccountVO signinAccount(AccountVO accountVO);
	
	@Transactional
	void transact(Map<String, Object> params);
	
	List<AccountStockVO> getAllAccountStockVO(String key);
		
	List<AccountStockLog> getAllAccountStockLogs(String key);
	
	List<AccountStockLog> getAllAccountStockLogsType(Map<String, String> params );
	
}
