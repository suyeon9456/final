package bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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

public String insert(HttpServletRequest req){
	List<RecordVo> list = new ArrayList<RecordVo>();
	 Map<String, Object> map = new HashMap<String, Object>();
	String msg= "";
	String Json= req.getParameter("paylist");

   JsonParser jsonParser = new JsonParser();
   JsonArray jsonArray = (JsonArray)jsonParser.parse(Json);
	
   for(int i=0; i<jsonArray.size(); i++) {
	   JsonObject object = (JsonObject)jsonArray.get(i);
	   String item_code = object.get("item_code").getAsString();
	   String item_ea = object.get("ea").getAsString();
	   String item_price = object.get("item_price").getAsString();
	   String point = object.get("point").getAsString();
	   String promotion = object.get("promotion").getAsString();
	   String calprice = object.get("cal_price").getAsString();
	   
        String rcalprice = calprice.replaceAll(",","");
        

		
	   
	   RecordVo rv = new RecordVo();
	   rv.setrId("elderanni");
       rv.setrCode(item_code);
       rv.setrEa(Integer.parseInt(item_ea));
       rv.setrPrice(Integer.parseInt(item_price));
       rv.setrDelive(0);
       rv.setrRefund(""+0);
       rv.setrAfter(Integer.parseInt(rcalprice));
       
       
       list.add(rv);
      
       map.put("list", list);
       System.out.println("listSize"+list.size());
   }
   
	try {
	
		int cnt = sqlSession.insert("payout.insert", list); //(board insert 결과 변화상수)
		boolean b = true;
		
		if(cnt>0) {
			if(rv.getMap().size()>0) { //첨부파일이 있는경우
				cnt = sqlSession.insert("insert", rv.getMap()); //첨부파일이 있는 경우 변화
			if(cnt<1) {
				throw new Exception("결제중 문제발생");
			      }
			}
			}else {
				throw new Exception("자료 저장중 오류발생");
			}
	}catch(Exception ex) {
		sqlSession.rollback();
		ex.printStackTrace();
		msg = ex.toString();
	}finally {
		
		sqlSession.commit();
	   
	return "결제가 정상적으로 처리되었습니다";

}

}
}