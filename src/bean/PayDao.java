package bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import MyBatis.MyBatisFactory;

public class PayDao {

Object Param;
int totListSize;
SqlSession sqlSession ;
PayVo vo;
PayParam para;
RecordVo rv;
public PayDao() {

		sqlSession = MyBatisFactory.getFactory().openSession();
	
}
public boolean kakao(Map<String , Object> map) {
	boolean b = false;
	try {	
		int cnt = sqlSession.insert("payout.insert", map); //(board insert 결과 변화상수)
		if(cnt>0) {
			b = true;
			sqlSession.commit();
		}
		 
	}catch(Exception ex) {
		sqlSession.rollback();
		ex.printStackTrace();
   }
	return b;
}

public String insert(HttpServletRequest req){
	List<RecordVo> list = new ArrayList<RecordVo>();
	 Map<String, Object> map = new HashMap<String, Object>();
		List<PayVo> list2 = new ArrayList<PayVo>();
		 Map<String, Object> map2 = new HashMap<String, Object>();
	String msg= "결제가 정상적으로 처리되었습니다.";
	String Json= req.getParameter("json");
    boolean b = false;
	System.out.println("paydao57번쨰 줄"+Json);
   JsonParser jsonParser = new JsonParser();
   JsonArray jsonArray = (JsonArray)jsonParser.parse(Json);
	System.out.println(jsonArray);
	
   for(int i=0; i<jsonArray.size(); i++) {
	   JsonObject object = (JsonObject)jsonArray.get(i);
	   String serial = object.get("serial").getAsString();
	   String user_id = object.get("user_id").getAsString();
	   String item_code = object.get("item_code").getAsString();
	   String item_name = object.get("item_name").getAsString();
	   String item_ea = object.get("item_ea").getAsString();
	   String item_price = object.get("item_price").getAsString();
	   String cal_price = object.get("cal_price").getAsString();
	   String delter = object.get("delter").getAsString();
       String rcalprice = cal_price.replaceAll(",","");
        

		
	   
	   RecordVo rv = new RecordVo();
	   
       rv.setrSerial(Integer.parseInt(serial));
       rv.setrCode(item_code);
       rv.setrName(item_name);
       rv.setrId(user_id);
       rv.setrEa(Integer.parseInt(item_ea));
       rv.setrPrice(Integer.parseInt(item_price));
       rv.setrAfter(Integer.parseInt(rcalprice));
       rv.setrDelter(1);
       
        
       list.add(rv);
       System.out.println("1List<object>"+list.toString());
       map.put("list", list);
   
   }
   
	try {
	    System.out.println("2listSize"+list.size());
		System.out.println("3map"+map);
	
		int cnt = sqlSession.insert("payout.insert", map); //(board insert 결과 변화상수)
	
		if(cnt>0) {
			 b= true;
			msg = "결제가 정상적으로 처리되었습니다.";
			sqlSession.commit();
		}
		 
	}catch(Exception ex) {
		sqlSession.rollback();
		ex.printStackTrace();
		msg = ex.toString();
	  b= false;
   }
	
	if(b==true) {
	try {
	int cnt = sqlSession.delete("payout.delete", map);
	
	if(cnt>0) {
		
		sqlSession.commit();
	}
	
	}catch(Exception ex) {
		
	ex.printStackTrace();
	sqlSession.rollback();
	}
	}
	
	if(b==true) {
//	try {
//	    String Json2= req.getParameter("json_address");
//	    JsonArray jsonArray2 = (JsonArray)jsonParser.parse(Json2);
//	    for(int i=0; i<jsonArray2.size(); i++) {
//	 	   JsonObject object = (JsonObject)jsonArray.get(i);
//	 	   String serial = object.get("serial").getAsString();
//	 	   String user_id= object.get("user_id").getAsString();
//           String user_name = object.get("user_name").getAsString();
//           String postal = object.get("postal").getAsString();
//           String phone = object.get("phone").getAsString();
//           String address = object.get("address").getAsString();
//	 		
//	 	   
//	 	   PayVo pv = new PayVo();
//	 	   
//	        pv.setKserial(serial);
//	        pv.setKid(user_id);
//	        pv.setKphone(phone);
//	        pv.setKpostal(postal);
//	        pv.setKsname(user_name);
//	        pv.setKaddress(address);
//	         
//	        list2.add(pv);
//	    
//	        map2.put("list", list2);
//	        
//	        int cnt = sqlSession.insert("payout.insert", map2);
//	        
//	        if(cnt>0) {
//	        	
//	        	sqlSession.commit();
//	        }
//	     }
//	   }catch(Exception e) {
//	    	e.printStackTrace();
//	    	sqlSession.rollback();
//	    }
	    
	}
	
	return msg;
	}

	public List<RecordVo> data(String json){
		
		//무통장입금 그래서 delter는 항상 1
		List<RecordVo> list = new ArrayList<RecordVo>();
		JsonParser jsonParser = new JsonParser();
		   JsonArray jsonArray = (JsonArray)jsonParser.parse(json);
			System.out.println(jsonArray);
			
		   for(int i=0; i<jsonArray.size(); i++) {
			   JsonObject object = (JsonObject)jsonArray.get(i);
			   String user_id = object.get("user_id").getAsString();
			   String item_code = object.get("item_code").getAsString();
			   String item_name = object.get("item_name").getAsString();
			   String item_ea = object.get("item_ea").getAsString();
			   String item_price = object.get("item_price").getAsString();
			   String cal_price = object.get("cal_price").getAsString();
		       String rcalprice = cal_price.replaceAll(",","");
		        
			   RecordVo rv = new RecordVo();
			   SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			   Date time = new Date();
			   rv.setrDate(format1.format(time));
		       rv.setrCode(item_code);
		       rv.setrName(item_name);
		       rv.setrId(user_id);
		       rv.setrEa(Integer.parseInt(item_ea));
		       rv.setrPrice(Integer.parseInt(item_price));
		       rv.setrAfter(Integer.parseInt(rcalprice));
		       rv.setrDelter(1);

		       list.add(rv);
		   }
		   return list;
	}
}
