package member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import MyBatis.MyBatisFactory;

public class NoticeDao {
	SqlSession sqlSession;
	Param param;

	int totListSize;
	int totPage;
	int listSize = 10;
	int nowPage = 1;
	int startNo;
	int endNo;

	public NoticeDao() {
		try {
			sqlSession = MyBatisFactory.getFactory().openSession();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public List<NoticeVo> search(Param param){
	      List<NoticeVo> list = null;
	      this.param = param;
	      
	      try {
	         // 페이징
	         totListSize = sqlSession.selectOne("notice.totListSize",param);
	         
	         totPage = (int)Math.ceil(totListSize/(double)listSize);
	         
	         if(nowPage < 1) nowPage = 1;
	         if(nowPage > totPage) nowPage = totPage;
	         
	         endNo = nowPage * listSize;
	         startNo = endNo - (listSize - 1);
	         
	         param.setStartNo(startNo);
	         param.setEndNo(endNo);
	         param.setNowPage(nowPage);
	         param.setTotPage(totPage);
	         
	         list = sqlSession.selectList("notice.search",param);
	         
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	         
	      }finally {
	         this.nowPage = param.getNowPage();
	         return list;
	      }
	      
	   }

	   public List<QuestionVo> searchh(){                  // 관리자페이지 1:1문의를 보여주기 위한 Dao이다
		      List<QuestionVo> list = null;
		      
		      try {
		         
		         list = sqlSession.selectList("notice.searchh");
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		         
		      }finally {
		         return list;
		      }
		      
		   }
	 
	 // -----------------------------1대1-------------------------- 
	// 1대1 상세조회
	public QuestionVo viewQuestion(Param param) {
		QuestionVo vo = null;
		
		try {
			vo = sqlSession.selectOne("notice.viewQue", param);
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			return vo;
		}
	}
	
	// 1대1 등록
	public String question_insert(QuestionVo vo) {
		String msg = "등록되었습니다.";
		System.out.println("1대1 다오");

		try {
			int cnt = sqlSession.insert("notice.question_insert", vo);
			if (cnt < 1) {
				msg = "등록중 오류가 발생하였습니다.";
			}
		}catch(	Exception ex){
			sqlSession.rollback();
			ex.printStackTrace();
		}finally{
			sqlSession.commit();
			return msg;
		}
	}

	// 1대1조회
	public List<QuestionVo> searchQuestion(Param param) {
		List<QuestionVo> list = null;
		this.param = param;
		try {
			// 페이징
			totListSize = sqlSession.selectOne("notice.totListSizeQ", param);

			totPage = (int) Math.ceil(totListSize / (double) listSize);

			if (nowPage < 1)
				nowPage = 1;
			if (nowPage > totPage)
				nowPage = totPage;

			endNo = nowPage * listSize;
			startNo = endNo - (listSize - 1);

			param.setStartNo(startNo);
			param.setEndNo(endNo);
			param.setNowPage(nowPage);
			param.setTotPage(totPage);
			
			if("admin".equals(param.getrId())) {
				list = sqlSession.selectList("notice.searchQa", param);
			}else {
				list = sqlSession.selectList("notice.searchQ", param);				
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			this.nowPage = param.getNowPage();
			return list;
		}

	}

	//--------------------------------------공지사항---------------------------------
	// 상세공지조회
		public NoticeVo viewNotice(Param param) {
			NoticeVo vo = null;
			try {
				vo = sqlSession.selectOne("notice.viewNot", param);
			} catch (Exception ex) {
				sqlSession.rollback();
				ex.printStackTrace();
			} finally {
				sqlSession.commit();
				return vo;
			}
		}
		
	// 공지등록
	public String notice_insert(NoticeVo vo) {
		String msg = "등록되었습니다.";

		try {
			int cnt = sqlSession.insert("notice.notice_insert", vo);
			
			if (cnt < 1) {
				msg = "등록중 오류가 발생하였습니다.";
			}
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			return msg;
		}
	}

	// 공지 조회
	public List<NoticeVo> searchNotice(Param param) {
		List<NoticeVo> list = null;
		this.param = param;

		try {
			// 페이징
			totListSize = sqlSession.selectOne("notice.totListSize", param);

			totPage = (int) Math.ceil(totListSize / (double) listSize);

			if (nowPage < 1)
				nowPage = 1;
			if (nowPage > totPage)
				nowPage = totPage;

			endNo = nowPage * listSize;
			startNo = endNo - (listSize - 1);

			param.setStartNo(startNo);
			param.setEndNo(endNo);
			param.setNowPage(nowPage);
			param.setTotPage(totPage);

			list = sqlSession.selectList("notice.searchN", param);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			this.nowPage = param.getNowPage();
			return list;
		}

	}
	
	//모든 사용자의 1대1문의 파악 무조건 admin에서만 접근해야
	public List<QuestionVo> jaewookjjang(MyQnaParam param){
		List<QuestionVo> list = new ArrayList<QuestionVo>();
		try {
			this.nowPage = param.getNowPage();
			this.totListSize = sqlSession.selectOne("notice.allqnasize");
			this.totPage = (int)Math.ceil(totListSize/(double)listSize);
	          
	          this.endNo = nowPage * listSize;
	          this.startNo = endNo - (listSize -1);
	          
	          param.setStartNo(startNo);
	          param.setEndNo(endNo);
	          param.setTotPage(totPage);
	          param.setTotListSize(totListSize);

	          list = sqlSession.selectList("notice.allqna", param);
	          System.out.println(list.size());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	//배송준비
	public int stay() {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("notice.stay");
		}catch(Exception ex) {
			
		}finally {
			sqlSession.clearCache();
			return cnt;
		}
	}
	
	//환불반품
	public int refund() {
		//rrefund 가 1또는 2
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("notice.refund");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.clearCache();
			return cnt;
		}
	}
	
	//답글이 안달린 질문 개수
		public int ask() {
			int cnt = 0;
			try {
				cnt = sqlSession.selectOne("notice.ask");
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.clearCache();
				return cnt;
			}
		}
		
		   //1대1 답글 창으로 이동
	      public QuestionVo answer(String qSerial) {
	         QuestionVo vo = new QuestionVo();
	         try {
	            vo = sqlSession.selectOne("notice.reple", qSerial);
	            List<FileVo> list = new ArrayList<FileVo>();
	            list = sqlSession.selectList("notice.repleP", qSerial);
	            vo.setqList(list);
	         }catch(Exception ex) {
	            ex.printStackTrace();
	         }finally {
	            return vo;
	         }
	      }
	      
	      
	   //1대1 답글 넣기
	      public String answerR(QuestionVo vo) {
	         String msg = "답글이 정상적으로 입력되었습니다.";
	         try {
	            int cnt = sqlSession.insert("answer", vo);
	            if(cnt>0) {
	               sqlSession.commit();
	            }else {
	               msg = "오류발생";
	               sqlSession.rollback();
	            }
	         }catch(Exception ex) {
	            ex.printStackTrace();
	         }finally {
	            return msg;
	         }
	      }

}