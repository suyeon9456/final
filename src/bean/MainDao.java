package bean;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import MyBatis.MyBatisFactory;

public class MainDao {
   SqlSession sqlsession;

   public MainDao() {
      try {
         sqlsession = MyBatisFactory.getFactory().openSession();

      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   //베스트 남바원
   public ProductVo searchOne(ProductVo vo) {
      ProductVo pvo = null;
      try {
         pvo   = sqlsession.selectOne("main.searchOne");
         String[] pColor = pvo.getpColor().split("_");
         List<String> pRgb = new ArrayList<String>(Arrays.asList(pColor));
         pvo.setRgb(pRgb);
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         return pvo;
      }
   }
   
   //베스트들 뽑아내는 곳
   public List<ProductVo> search(ProductVo vo) {
      List<ProductVo> list = null;
      try {
         list = sqlsession.selectList("main.search");
         list.remove(0);
         for(int i = 0; i<list.size(); i++) {
            String[] pColor = list.get(i).getpColor().split("_");
            list.get(i).setRgb(new ArrayList<String>(Arrays.asList(pColor)));
         }
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         sqlsession.clearCache();
         return list;
      }
   }
   
   //랜덤으로 커먼상품 10개 뽑아주기
   public List<ProductVo> search2(ProductVo vo) {
      String randomStr="";
      List<ProductVo> list2 = null;
      List<ProductVo> list3 = null;
      try {
         list2 = sqlsession.selectList("main.searchA");
         for(int i=0; i<list2.size()-1; i++) {
            randomStr+= ("'"+list2.get(i).getpCode()+"', " );
         }
         randomStr+= (" '"+list2.get(list2.size()-1).getpCode()+"'");
         list3 = sqlsession.selectList("main.searchRandom",randomStr);
         
         for(int i = 0; i<list3.size(); i++) {
            String[] pColor = list3.get(i).getpColor().split("_");
            list3.get(i).setRgb(new ArrayList<String>(Arrays.asList(pColor)));
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         return list3;
      }
   }

}