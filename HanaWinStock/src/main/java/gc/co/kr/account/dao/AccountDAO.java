package gc.co.kr.account.dao;

import java.util.List;
import java.util.Map;

import gc.co.kr.account.vo.AccountStockVO;
import gc.co.kr.account.vo.AccountVO;

public interface AccountDAO {

	int createAcc(AccountVO account);
	
	AccountVO selectByAccNum(String gcaNumber);

	List<AccountVO> selectAllAccounts(String userID);

	AccountVO signinAccount(AccountVO accountVO);
	
	
	void transactStock(Map<String , Object> params );
	
	
	List<AccountStockVO> getAllAccountStockVO(String key);
	
}
