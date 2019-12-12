package kakaopay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.PayDao;
import bean.RecordVo;

@Service
public class KakaoDao {
	 private static final String HOST = "https://kapi.kakao.com";
	    
	    private KakaoPayReadyVO kakaoPayReadyVO;
	    List<RecordVo> list = new ArrayList<RecordVo>();
	    Map<String, Object> map = new HashMap<String, Object>();
		int hap_price;
		String main_item;
		int item_count;
	    
		public KakaoDao(String json) {
			kakaoPayReadyVO = null;
	    	hap_price =0;
	    	main_item = "";
	    	item_count =0;
	    	//결제할 데이터
	    	JsonParser jsonParser = new JsonParser();
	    	JsonArray jsonArray = (JsonArray)jsonParser.parse(json);
	    	for(int i=0; i<jsonArray.size(); i++) {
	    		JsonObject object = (JsonObject)jsonArray.get(i);
	    		String serial = object.get("serial").getAsString();
	    		String item_code = object.get("item_code").getAsString();
	    		String item_name = object.get("item_name").getAsString();
	    		String item_ea = object.get("item_ea").getAsString();
	    		String user_id = object.get("user_id").getAsString();
	    		String item_price = object.get("item_price").getAsString();
	    		String cal_price = object.get("cal_price").getAsString();
	    		String delter = object.get("delter").getAsString();
	    		String rcalprice = cal_price.replaceAll(",","");
	    		int ppp = Integer.parseInt(rcalprice);
	    		RecordVo rv = new RecordVo();
	    		rv.setrSerial(Integer.parseInt(serial));
	    		rv.setrCode(item_code);
	    		rv.setrName(item_name);
	    		rv.setrId(user_id);
	    		rv.setrEa(Integer.parseInt(item_ea));
	    		rv.setrPrice(Integer.parseInt(item_price));
	    		rv.setrAfter(ppp);
	    		rv.setrDelter(Integer.parseInt(delter));
	    		list.add(rv);
	    	    map.put("list", list);
	    	    hap_price += ppp;
	    	    if(i==0) {
	    	    	main_item = item_name;
	    	    }
	    	    item_count++;
	    	   }
	    	
	    	if(item_count >1) {
	    		main_item = main_item+" 외 "+item_count+"개";
	    	}
	    	
	    	if(item_count>1) {
	    		item_count = list.size()-1;//상품 총 개수
	    	}else {
	    		item_count = list.size();//상품 총 개수
	    	}
		}
		
	    public String kakaoPayReady() {
	    	
	        RestTemplate restTemplate = new RestTemplate();
	        
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "a516adba97516b1260ea6d124706201e");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        System.out.println(main_item +"//"+item_count+"//"+hap_price+"//");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", "SIMSINSA");
	        params.add("partner_user_id", "JHTA");
	        params.add("item_name", main_item);
	        params.add("quantity", Integer.toString(item_count));
	        params.add("total_amount",Integer.toString(hap_price));
	        params.add("tax_free_amount", Integer.toString((int) (hap_price*0.9)));
	        params.add("approval_url", "http://192.168.0.3:9991/1903_final/index.jsp?content=success.pay");
	        params.add("cancel_url", "http://192.168.0.3:9991/1903_final/index.jsp?content=cancel.pay");
	        params.add("fail_url", "http://192.168.0.3:9991/1903_final/index.jsp?content=fail.pay");
	 
	         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	 
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	            
	             System.out.println(kakaoPayReadyVO.getNext_redirect_pc_url());
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
	        return "/pay";
	    }
	    
	    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) throws Exception {
	    	 
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "a516adba97516b1260ea6d124706201e");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "SIMSINSA");
	        params.add("partner_user_id", "JHTA");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", hap_price+"");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	        	PayDao dao = new PayDao();
	        	boolean b = false; 
	        	b = dao.kakao(map);
	        	if(b) {
	        		KakaoPayApprovalVO vo = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	        		return vo;	        		
	        	}else {
	        		Exception ex = new Exception();
	        		throw ex;
	        	}
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
}
