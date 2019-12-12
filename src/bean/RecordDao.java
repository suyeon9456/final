package bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import MyBatis.MyBatisFactory;

public class RecordDao {
   SqlSession sqlsession;
   Param param;
   HttpServletRequest req;
   
   int totListSize;
   int totPage;
   int listSize = 10;
   int nowPage = 1;
   int startNo;
   int endNo;
   
   public RecordDao() {
      try {
         sqlsession = MyBatisFactory.getFactory().openSession();
         
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public List<RecordVo> search(Param param){
	      List<RecordVo> list = null;
	      this.param = param;
	      FileVo vo = null;
	      
	      try {
	         // 페이징
	         totListSize = sqlsession.selectOne("record.totListSize",param);
	         
	         totPage = (int)Math.ceil(totListSize/(double)listSize);
	         
	         if(nowPage < 1) nowPage = 1;
	         if(nowPage > totPage) nowPage = totPage;
	         
	         endNo = nowPage * listSize;
	         startNo = endNo - (listSize - 1);
	         
	         param.setStartNo(startNo);
	         param.setEndNo(endNo);
	         param.setNowPage(nowPage);
	         param.setTotPage(totPage);
	         
	         if(param.getOneDate() == null || param.getOneDate().equals("")) {
	            param.setOneDate("2019-01-01");
	         }
	         
	         if(param.getTwoDate() == null || param.getTwoDate().equals("")) {
	            param.setTwoDate("2019-12-31");
	         }
	         
	         list = sqlsession.selectList("record.search",param);
	         
	         for(int i=0; i<list.size(); i++) {
	             vo = sqlsession.selectOne("record.searchF",list.get(i).getrCode());
	             list.get(i).setfPhoto(vo.getfPhoto()); 
	          }
	         
	         System.out.println(list.size());
	      }catch(Exception e) {
	         e.printStackTrace();
	         
	      }finally {
	    	  sqlsession.clearCache();
	         this.nowPage = param.getNowPage();
	         return list;
	      }
	      
	   }
   
   public List<RecordVo> asearch(Param param){
      List<RecordVo> list = null;
      this.param = param;
      FileVo vo = null;
      
      try {
         // 페이징
         totListSize = sqlsession.selectOne("record.atotListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         if(param.getOneDate() == null || param.getOneDate().equals("")) {
            param.setOneDate("2019-01-01");
         }
         
         if(param.getTwoDate() == null || param.getTwoDate().equals("")) {
            param.setTwoDate("2019-12-31");
         }
         
         list = sqlsession.selectList("record.asearch",param);
         
         for(int i=0; i<list.size(); i++) {
             vo = sqlsession.selectOne("record.searchF",list.get(i).getrCode());
             list.get(i).setfPhoto(vo.getfPhoto());
          }
         
         System.out.println(list.size());
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         this.nowPage = param.getNowPage();
         sqlsession.clearCache();
         return list;
      }
      
   }
   
   public List<RecordVo> daywSearch(Param param){
      List<RecordVo> list = null;
      this.param = param;
      
      try {
         // 페이징
         totListSize = sqlsession.selectOne("record.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = (ArrayList)sqlsession.selectList("record.daysSearch",param);
         
         
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         this.nowPage = param.getNowPage();
         return list;
      }
      
   }
   
   public List<RecordVo> daymSearch(Param param){
      List<RecordVo> list = null;
      this.param = param;
      
      try {
         // 페이징
         totListSize = sqlsession.selectOne("record.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlsession.selectList("record.daymSearch",param);
         
         
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         this.nowPage = param.getNowPage();
         return list;
      }
      
   }
   
   public List<RecordVo> daytmSearch(Param param){
      List<RecordVo> list = null;
      this.param = param;
      
      try {
         // 페이징
         totListSize = sqlsession.selectOne("record.totListSize",param);
         
         totPage = (int)Math.ceil(totListSize/(double)listSize);
         
         if(nowPage < 1) nowPage = 1;
         if(nowPage > totPage) nowPage = totPage;
         
         endNo = nowPage * listSize;
         startNo = endNo - (listSize - 1);
         
         param.setStartNo(startNo);
         param.setEndNo(endNo);
         param.setNowPage(nowPage);
         param.setTotPage(totPage);
         
         list = sqlsession.selectList("record.daytmSearch",param);
         
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         this.nowPage = param.getNowPage();
         return list;
      }
      
   }
   
   
   public String modify1(RecordVo vo) {
      String msg = "정상적으로 수정이 완료되었습니다..";
      
      try {
         int cnt = sqlsession.update("record.rcdUpdate1", vo);
      
         
         if(cnt<1) msg = "수정 중 오류발생.";
         
         
      }catch(Exception e) {
         e.printStackTrace();
         sqlsession.rollback();
      }finally {
         sqlsession.commit();
         return msg;
      }
      
   }
   
   public String modify2(RecordVo vo) {
      String msg = "정상적으로 수정이 완료되었습니다..";
      
      try {   
         int cnt = sqlsession.update("record.rcdUpdate2", vo);
         
         if(cnt<1) msg = "수정 중 오류발생.";
         
         
      }catch(Exception e) {
         e.printStackTrace();
         sqlsession.rollback();
      }finally {
         sqlsession.commit();
         return msg;
      }
      
   }
   
   public String salemodify1(RecordVo vo) {
      String msg = "정상적으로 수정이 완료되었습니다..";
      
      try {
         int cnt = sqlsession.update("record.saleUpdate1", vo);
      
         
         if(cnt<1) msg = "수정 중 오류발생.";
         
         
      }catch(Exception e) {
         e.printStackTrace();
         sqlsession.rollback();
      }finally {
         sqlsession.commit();
         sqlsession.clearCache();
         return msg;
      }
      
   }
   
   public String salemodify2(RecordVo vo) {
      String msg = "정상적으로 수정이 완료되었습니다..";
      
      try {   
         int cnt = sqlsession.update("record.saleUpdate2", vo);
         
         if(cnt<1) msg = "수정 중 오류발생.";
         
         
      }catch(Exception e) {
         e.printStackTrace();
         sqlsession.rollback();
      }finally {
    	  
         sqlsession.commit();
         sqlsession.clearCache();
         return msg;
      }
   }
   
   public RecordVo afsearch(){
      RecordVo vo = new RecordVo();
      try {
         int rDelter1 = 0;
         int rDelter2 = 0;
         
         rDelter1 = sqlsession.selectOne("record.afSearch1");
         rDelter2 = sqlsession.selectOne("record.afSearch2");

         vo.setrDelter1(rDelter1);
         vo.setrDelter2(rDelter2);
         
      }catch(Exception e) {
         e.printStackTrace();
         
      }finally {
         return vo;
      }
      
   }

   
}









