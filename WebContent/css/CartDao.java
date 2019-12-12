package bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

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

public List<CartVo>search() {
	
      System.out.println("search단 접근");
      List<CartVo> list = null;

	
	try {

		System.out.println("list 접근");
     list = (ArrayList)sqlSession.selectList("cart.search"); 
     System.out.println("list 메소드 수행"); ////////
     System.out.println(list.size());
     System.out.println(list+"aa");
	  if(list==null) { System.out.println("list값 null임"); }
	  if(list!=null) {System.out.println("list값이 null이 아님"); }
	}catch(Exception ex) {
	
		ex.printStackTrace();
	}finally {
       

	return list;
	}
}
	



public Object getParam() {
	return Param;
}

public void setParam(Object param) {
	Param = param;
}

public Object show(HttpServletRequest req) {
	
	return null;
}

}