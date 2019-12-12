package category;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;

import MyBatis.MyBatisFactory;
import bean.Param;
import bean.ProductVo;

public class CategoryDao {
	 	SqlSession sqlSession;
	   Param param;
	   HttpServletRequest req;

	   MultipartRequest multi;
		String saveDir="C:/workspace22/1903_final/WebContent/supload";
		int maxSize = 1024*1024*100;
		String encoding = "utf-8";
	   
	   int totListSize;
	   int totPage;
	   int listSize = 10;
	   int nowPage = 1;
	   int startNo;
	   int endNo;
	   
	   public CategoryDao() {
		      try {
		         sqlSession = MyBatisFactory.getFactory().openSession();
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
		   }
	   public List<ProductVo> list(int pCategory) {
		   List<ProductVo> list = new ArrayList<ProductVo>();
		   		   
		   try {
			   list = sqlSession.selectList("product.CSearch",pCategory);
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.clearCache();
				return list; 
			}
	   }
	 
	   public List<ProductVo> totalFindSearch(String totalFindStr){
	         List<ProductVo> list = new ArrayList<ProductVo>();
	         
	         try {
	            list = sqlSession.selectList("product.totalFindstr", totalFindStr);
	         }catch (Exception ex) {
	         ex.printStackTrace();
	      }finally {
	    	  sqlSession.clearCache();
	         return list;
	      }
	      }
	   
}
