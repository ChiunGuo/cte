package com.cte.credit.gw.dao.iface;

import java.util.List;
import java.util.Map;

public interface IAccountService{
	/**
	 * 账户信息查询
	 * @param score
	 */
	public List<Map<String, Object>> queryAcctAll();
	
	/**
	 * 账户ip限制信息查询
	 * @param score
	 */
	public List<Map<String, Object>> queryAcctIps(String acct_id);
	
	/**
	 * 账户产品限制信息查询
	 * @param score
	 */
	public List<Map<String, Object>> queryAcctProds(String acct_id);
	/**
	 * 判断是否测试用户,并且测试条数>0
	 * */
	public boolean isTestUser(String acct_id,String prod);
	/**
	 * 判断正式用户计费条数>0
	 * */
	public boolean isOnlineUser(String acct_id,String prod);
	/**
	 * 测试账户扣除测试条数
	 * @param score
	 */
	public void updateTestProd(String trade_id,String acct_id,String prod);
	/**
	 * 判断是否重复交易
	 * @param score
	 */
	public boolean isRepeatTrad(String reqeust_sn,String acct_id,String prod);
	/**
	 * 正式账户扣除费用
	 * @param trade_id
	 * @param tag
	 * @param acct_id
	 * @param prod
	 * @param flag 1:扣费,2:加载账户信息
	 */
	public boolean updateAcctProd(String trade_id,String tag,String acct_id,String prod,String flag);
}
