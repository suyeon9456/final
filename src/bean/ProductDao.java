package bean;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.bytecode.LineNumberAttribute.Pc;
import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import MyBatis.MyBatisFactory;

public class ProductDao {
   SqlSession sqlSession;
   Param param;
   HttpServletRequest req;
   
    MultipartRequest multi;
	String saveDir="C:/Users/JHTA/eclipse-workspace2/1903_final/WebContent/supload";
	int maxSize = 1024*1024*100;
	String encoding = "utf-8";
   
   int totListSize;
   int totPage;
   int listSize = 10;
   int nowPage = 1;
   int startNo;
   int endNo;
   
   public ProductDao() {
      try {
         sqlSession = MyBatisFactory.getFactory().openSession();
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public List<ProductVo> search(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         // 페이징
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.search",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         this.nowPage = param.getNowPage();
         return list;
      }
      
   }
   
   public List<ProductVo> daySearch(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.daySearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         this.nowPage = param.getNowPage();
         return list;

      }
      
   }
   
   public List<ProductVo> daytSearch(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.daytSearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         this.nowPage = param.getNowPage();
         return list;

      }
      
   }
   
   public List<ProductVo> daysSearch(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.daysSearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         this.nowPage = param.getNowPage();
         return list;

      }
      
   }
   
   public List<ProductVo> aSearch(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.ASearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         this.nowPage = param.getNowPage();
         return list;

      }
      
   }
   
   public List<ProductVo> dSearch(Param param){
      List<ProductVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         totListSize = sqlSession.selectOne("product.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlSession.selectList("product.DSearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlSession.selectOne("record.searchF",list.get(i).getpCode());
             list.get(i).setAttFileB(vo.getfPhoto()); 
          }
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         this.nowPage = param.getNowPage();
         return list;

      }
      
   }

   public String insert(HttpServletRequest qqq) {
	   String msg = "판매 정보가 정상적으로 저장됨";
		int cnt= 0;
		ProductVo vo = new ProductVo();
		try {
			
			multi = new MultipartRequest(qqq, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			
			vo.setTcolor(multi.getParameter("Tcolor"));
			vo.setpContent(multi.getParameter("pContent"));
			vo.setpName(multi.getParameter("pName"));
			vo.setpSize(multi.getParameter("pSize"));
			vo.setpCode(multi.getParameter("pCode"));
		
			vo.setpPoint(Integer.parseInt(multi.getParameter("pPoint")));
			vo.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
			vo.setpPromotion(Integer.parseInt(multi.getParameter("pPromotion")));
			vo.setpSale(Integer.parseInt(multi.getParameter("pSale")));
			vo.setPsaleck(Integer.parseInt(multi.getParameter("Psaleck")));
			vo.setpStock(Integer.parseInt(multi.getParameter("pStock")));
			vo.setTbig(Integer.parseInt(multi.getParameter("Tbig")));
			vo.setTgender(Integer.parseInt(multi.getParameter("Tgender")));
			vo.setTsmall(Integer.parseInt(multi.getParameter("Tsmall")));
			vo.setpLike(Integer.parseInt(multi.getParameter("pLike")));		
			vo.setAttFileB(multi.getFilesystemName("attFileB"));
			cnt+=sqlSession.insert("shop.insert",vo); 
			cnt+=sqlSession.insert("shop.insert2",vo);
			if(cnt<2) msg="판매 정보저장중오류발생";
			
			
			List<ProductSAttVo> list = new ArrayList<ProductSAttVo>();
		    
		    Enumeration<String> en = multi.getFileNames();
		  
		    while (en.hasMoreElements()) {
		    	String tag = (String) en.nextElement();
		    	
		         if (multi.getFilesystemName(tag) == null)
		            continue;
		        ProductSAttVo attvo = new ProductSAttVo();
		         attvo.setAttFile(multi.getFilesystemName(tag));
		         attvo.setAttOri(multi.getOriginalFileName(tag));
	
		         list.add(attvo);			
		      }  
		     vo.setList(list);
		     cnt=sqlSession.insert("shop.productSAtt", vo);
		}catch(Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.commit();
			return msg;
		}
	}
	
   public ProductVo list_v(String PCode, String mId) {
	      ProductVo vo = new ProductVo();
	      List<String> list = new ArrayList<String>();
	      try {
	         vo= sqlSession.selectOne("shop.view", PCode);
	         list = sqlSession.selectList("shop.file", PCode);
	         
	         vo.setDelFile(list);
	         
	         if(mId != null && !mId.equals("")) {
	            list = sqlSession.selectList("shop.like", mId);
	            vo.setLikeList(list);            
	         }
	         
	      } catch (Exception ex) {
	         ex.printStackTrace();
	      }finally {
	         return vo; 
	      }
	   }
	public  String delete(ProductVo vo) {
		String msg="회원 정보가 정상적으로 삭제되었습니다.";
		
		try {
			int cnt = sqlSession.update("shop.delete",vo); //vo값을 가지고 member.xml member.delete란으로 가서 쿼리문을 돌림.
			if(cnt<1) msg = "회원 정보 수정중 오류 발생";
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.commit();
			return msg;
			
		}
	}
	
	public ProductVo modify_view(String pCode) {
		ProductVo vo = new ProductVo();
		   List<String> list = new ArrayList<String>();
		   try {
			   vo= sqlSession.selectOne("shop.modifyview", pCode);
			   list = sqlSession.selectList("shop.file", pCode);
			   vo.setDelFile(list);
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				return vo; 
			}
	   }

	public void likeAdd(SlikeVo vo) {
	      
	      try {
	         int cnt = sqlSession.insert("shop.like_insert", vo);
	         
	      }catch (Exception ex) {
	         sqlSession.rollback();
	         ex.printStackTrace();
	   }finally {
	      sqlSession.commit();
	   }
	}
	 public List<ProductVo> modifyR(int pModify) {
		   List<ProductVo> Mlist = new ArrayList<ProductVo>();
		   		   
		   try {
			   Mlist = sqlSession.selectList("shop.update",pModify);
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.clearCache();
				return Mlist; 
			}
	   }
	
	public ProductVo info(String pCode) {
		ProductVo vo = new ProductVo();
		try {			
			vo = sqlSession.selectOne("shop.info", pCode);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
   
}









