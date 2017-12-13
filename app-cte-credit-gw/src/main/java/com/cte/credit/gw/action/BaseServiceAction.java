package com.cte.credit.gw.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.util.Base64Utils;

import com.alibaba.fastjson.JSON;
import com.cte.credit.api.Conts;
import com.cte.credit.api.dto.CRSCoreRequest;
import com.cte.credit.api.dto.CRSCoreResponse;
import com.cte.credit.api.iface.ICoreService;
import com.cte.credit.common.annotation.ProductInterceptorClass;
import com.cte.credit.common.util.SpringContextUtils;
import com.cte.credit.common.util.StringUtil;
import com.cte.credit.gw.action.crypto.WandaAES;
import com.cte.credit.gw.action.crypto.WandaCryptoAESException;
import com.cte.credit.gw.action.dto.ProductDto;
import com.cte.credit.gw.dto.Account;
import com.cte.credit.gw.dto.ProdLimit;
import com.cte.credit.gw.quartz.init.AccountInitUtil;

public class BaseServiceAction {
	private final  Logger logger = LoggerFactory.getLogger(BaseServiceAction.class);
	
	private static Map<String,Object> implObjectMap = null;
	private final String key_retcode ="retcode";
	private final String key_retmsg ="retmsg";
	private final String key_retdata ="retdata";
	private final String key_retdate ="retdate";
	private final String key_version ="version";
	private final String key_response_sn ="response_sn";
	protected final String key_request_sn ="request_sn";

	@Resource(name="customService")
	private ICoreService  customService;
	/**
	 * 构建接口输出 
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> formatOutPut(CRSCoreResponse resp,String request_sn) throws Exception{
		Map<String,Object> respMap = new HashMap<String,Object>();
		if(resp.getRetcode()!=null){
			respMap.put(key_retcode, resp.getRetcode());
		}
		if(resp.getRetmsg()!=null){
			respMap.put(key_retmsg, resp.getRetmsg());
		}
		if(resp.getRetdata()!=null){
			respMap.put(key_retdata,resp.getRetdata());
		}
		if(resp.getRetdate()!=null){
			respMap.put(key_retdate, resp.getRetdate());
		}
		if(resp.getVersion()!=null){
			respMap.put(key_version, resp.getVersion());
		}
		if(resp.getResponse_sn()!=null){
			respMap.put(key_response_sn, resp.getResponse_sn());
		}
		if(!StringUtil.isEmpty(request_sn)){
			respMap.put(key_request_sn, request_sn);
		}
		return respMap;
	}
	
	/**
	 * 匹配产品拦截器
	 * @param prod_code
	 * @return
	 */
	public <T> T findMatchedInterceptor(String prod_code) {
		if (implObjectMap == null) {
			ApplicationContext ac = SpringContextUtils.getContext();
			implObjectMap = ac.getBeansWithAnnotation(ProductInterceptorClass.class);
		}
		for(Object obj :  implObjectMap.values()){
			if (obj != null) {
				ProductInterceptorClass interceptorClass = obj.getClass().getAnnotation(
						ProductInterceptorClass.class);
				if (interceptorClass.bindingProductId().contains(prod_code)) {
					return (T) obj;
				}
			}
		}
		return null;
	}
	/**
	 * 把请求投递至指定的处理模块
	 * @param trade_id
	 * @param request
	 * @return
	 */
	public CRSCoreResponse route2Next(String trade_id,CRSCoreRequest request){
		CRSCoreResponse resp = null;
		long start = new Date().getTime();
		String prefix = trade_id +" "+ Conts.KEY_SUPPORT_HEADER; //流水号标识
		logger.info("{} 产品处理器：开始请求后端定制产品.目标投递：{}",prefix,"custom");
		resp = customService.request(trade_id,request);
		logger.info("{} 产品处理器：投递结束,总计耗时：{} ms",new Object[]{prefix,new Date().getTime()-start});
		return resp;
	}
	/**
	 * 入参信息进行解密
	 * @param trade_id
	 * @param request
	 * @return
	 * @throws DecoderException 
	 * @throws WandaCryptoAESException 
	 */
	public ProductDto encodeRepStr(String trade_id,Account account,String reqStr) 
			throws DecoderException, WandaCryptoAESException{
		logger.info("{} 解密账户信息：{}",trade_id,JSON.toJSONString(account));
		logger.info("{} 加密信息：{}",trade_id,reqStr);
		WandaAES wandaAES = new WandaAES(Hex.decodeHex(account.getApi_key().toCharArray()));
		byte[] encryptAESReqByte = Base64Utils.decodeFromString(reqStr);
        byte[] reqByte = wandaAES.decrypt(encryptAESReqByte);
        String decodeStr = new String(reqByte);
        JSONObject rsponse = (JSONObject) JSONObject.fromObject(decodeStr);
        ProductDto prod = (ProductDto)JSONObject.toBean(rsponse, ProductDto.class);
        return prod;
	}
	/**
	 * 校验账户信息是否可用:0:正常,-1:无权限调用此产品,-2:测试条数已用完,-3:销户
	 * */
	public int acctNormal(Account account,String product){
		if("0".equals(account.getStatus())){
			ProdLimit prod = matchProd(account.getAcct_id(),product);
			logger.info("获取产品信息:{}",JSON.toJSONString(prod));
			if(prod!=null){
				if("1".equals(prod.getStatus())){
					return 1;						
				}else{
					return -1;
				}
			}else{
				return -1;
			}
		}
		return -3;
	}
	/**
	 * 匹配产品信息
	 * */
	public ProdLimit matchProd(String acct_id,String product){
		ProdLimit match = null;
		for(ProdLimit prod:AccountInitUtil.prodLimitList){
			if(product.equals(prod.getProd_limit()) 
					&& acct_id.equals(prod.getAcct_id())){
				match = prod;
				break;
			}
		}
		return match;
	}
	/**
	 * 判断标签是否需要扣费
	 * */
	public boolean isPayTag(String iface_tag,String prod_tags){
		for(String tag:prod_tags.split(",")){
			if(iface_tag.equals(tag)){
				return true;
			}
		}
		return false;
	}
}
