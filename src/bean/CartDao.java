package bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import MyBatis.MyBatisFactory;

public class CartDao {

Object Param;
int totListSize;
SqlSession sqlSession ;
CartVo vo;
CartParam para;
public CartDao() {

		sqlSession = MyBatisFactory.getFactory().openSession();
}

public List<CartVo>search(String user_id) {
	
      List<CartVo> list = null;
	try {
     list = sqlSession.selectList("cart.search", user_id); 
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
	return list;
	}
}
public String insert(CartVo vo) {

    String cid = vo.getCid();
    
    String msg="Y";
    int cnt=0;
    try {
       
       if(vo.getCea() == 0) {
          vo = sqlSession.selectOne("cart.select", vo.getCcode());
          if(vo.getCid().equals("1")) {
             vo.setCpoint("N");
          }else {
             vo.setCpoint("Y");
          }
          vo.setCid(cid);
       }
       if(vo.getCea() == 0) {
    	   vo.setCea(1);
       }
       cnt = sqlSession.insert("cart.insert",vo);
       if(cnt<1) {
          msg="N";
          sqlSession.rollback();
       }
    }catch(Exception ex) {
       sqlSession.rollback();
       ex.printStackTrace();
    }finally {
       sqlSession.commit();
       return msg;
    }
 }

public String Merge(HttpServletRequest req) {
	
	String msg = "장바구니에서 정상적으로 수정되었습니다.";
	List<CartVo> list = new ArrayList<CartVo>();
	List<CartVo> list2 = new ArrayList<CartVo>();
	 Map<String, Object> map = new HashMap<String, Object>();
	 Map<String, Object> map2 = new HashMap<String, Object>();
	 HttpSession session = req.getSession();
	 String Dbname = (String)session.getAttribute("user_id");
	boolean b =false; // 전체  
	String Json = req.getParameter("savelist");
		
	//for create DB
	try {	
		sqlSession.update("cart.createdb", Dbname );
		b=true;
	}catch(Exception e) {
		e.printStackTrace();
	   b= false;
	}

	if(b==true) {
		try {
				JsonParser jsonParser = new JsonParser();
				JsonArray jsonArray = (JsonArray)jsonParser.parse(Json);
				
				for(int i=0; i<jsonArray.size(); i++) {
					JsonObject object = (JsonObject)jsonArray.get(i);
					String user_id = object.get("user_id").getAsString();
					String item_photo = object.get("item_img").getAsString();
					String item_code = object.get("item_code").getAsString();
					String item_name = object.get("item_name").getAsString();
					String item_ea = object.get("ea").getAsString();
					String item_price = object.get("item_price").getAsString();
					String point = object.get("point").getAsString();
					String promote = object.get("promote").getAsString();
					CartVo vo = new CartVo();
					vo.setCid(user_id);  
					vo.setCcode(item_code);
					vo.setCname(item_name);
					vo.setCea(Integer.parseInt(item_ea));
					vo.setCpoint(point);
					vo.setCphoto(item_photo);
					vo.setCpromotion(Integer.parseInt(promote));
					vo.setCprice(Integer.parseInt(item_price));
					list.add(vo);
					map.put("list", list);
					}
				
				int cnt = 0;
				
				if(map.size()>0) {
					cnt = sqlSession.insert("cart.insertdb", map);
					}
				if(cnt>=0) {
					b= true;
					msg = "장바구니에서 삭제되었습니다.";
					sqlSession.commit();
					}else {
						b= false;
						msg = "입력실패1";
						}
				}catch(Exception e) {
					sqlSession.rollback();
					e.printStackTrace();
					b = false;
					msg = "입력중 오류발생";
					}
		}
	
	if(b==true) {
		try {
			Json = req.getParameter("deletelist");
			JsonParser jsonParser = new JsonParser();
			JsonArray jsonArray = (JsonArray)jsonParser.parse(Json);
			
			for(int i=0; i<jsonArray.size(); i++) {
				JsonObject object = (JsonObject)jsonArray.get(i);
				String user_id = object.get("user_id").getAsString();
				String item_code = object.get("item_code").getAsString();
				CartVo vo = new CartVo();
				vo.setCid(user_id);
				vo.setCcode(item_code);
				list2.add(vo);
				map2.put("list2", list2);
				}
	         int cnt = sqlSession.delete("cart.deletedb", map2);
	         b= true;
	         }catch(Exception e) {
	        	 e.printStackTrace();
	        	 b= false;
				msg = "입력실패2";
				}
		}
	
	if(b==true) {
		try{
			int cnt = sqlSession.update("cart.mergedb", Dbname);
			b=true;
			}catch(Exception e) {
				e.printStackTrace();
				b=false;
				msg ="통합 실패 에러발생 MERGE ERROR";
				}
		}
	
	if(b==true) {
		try{
			int cnt = sqlSession.update("cart.dropdb", Dbname);
			b=true;
			}catch(Exception e) {
				e.printStackTrace();
				b= false;
				msg ="테이블 삭제실패 Table Error";
				}
		finally {
			sqlSession.commit();
			}
		}
	return msg; 
	}
}

