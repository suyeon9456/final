package member;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import MyBatis.MyBatisFactory;
import bean.ProductVo;
import bean.SlikeVo;
import mail.TestMailer;

public class MemberDao {
	SqlSession sqlSession;
	TestMailer testmailer;
	
	int nowPage = 1;
	int startNo = 1;
	int totPage;
	int endNo = 1;
	int listSize =10;
	int totListSize;
	
	public MemberDao() {
		try {
			sqlSession = MyBatisFactory.getFactory().openSession();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public MemberVo insert(MemberVo vo) {
		MemberVo result = new MemberVo();
		try {
			int cnt = sqlSession.insert("member.insert", vo);
			if(cnt>0) {
				result = vo;
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			sqlSession.clearCache();
			return result;
		}
	}
	
	public MemberVo login(MemberVo vo) {
		MemberVo result = new MemberVo();
		try {
			result = sqlSession.selectOne("member.login", vo);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.clearCache();
			return result;
		}
	}
	
	public MemberVo select(String id) {
		MemberVo result = new MemberVo();
		try {
			result = sqlSession.selectOne("member.select", id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return result;
		}
	}
	
	public MemberVo findid(MemberVo vo) {
		MemberVo result = new MemberVo();
		try {
			result = sqlSession.selectOne("member.findid", vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return result;
		}
	}
	
	public int totprice(String id) {
		int tot = 0;
		try {
			tot = sqlSession.selectOne("member.toto", id);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return tot;
		}
	}
	
	public int findpwd(MemberVo vo) {
		int result = 0;
		MemberVo mvo = new MemberVo();
		try {
			mvo = sqlSession.selectOne("member.findid", vo);
			if(mvo.getmId() != null && !mvo.getmId().equals("")) {
				String temp = "";
				result = 1;
				for(int i=0; i<8; i++) { 
					int rndVal = (int)(Math.random() * 62); 
					if(rndVal < 10) { temp += rndVal; 
					}else if(rndVal > 35) { 
						temp += (char)(rndVal + 61); 
					}else { 
						temp += (char)(rndVal + 55); 
					} 
				}
				
				vo.setmPwd(temp);
				
				int cnt2 = sqlSession.update("member.pwd", vo);
				if(cnt2==1) {
					result =2;
					try {
						testmailer = new TestMailer();
						testmailer.sendMail(vo.getmEmail(), "쇼핑몰에서 임시비밀번호를 알려드립니다.", temp+"\n 변경된 임시비밀번호입니다. \n 빠른시일내에 비밀번호를 변경하시기 바랍니다." );
						result=3;
					}catch(Exception ex) {
						ex.printStackTrace();
					}
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			return result;
		}
	}
	
	
	public MemberVo modify(MemberVo vo) {
		MemberVo result = new MemberVo();
		try {
			int cnt =0;
			if(!vo.getmPwd().isEmpty()) {
				cnt = sqlSession.update("member.modify", vo);				
			}else {
				cnt = sqlSession.update("member.modify_no_pwd", vo);
			}
			if(cnt>0) {
				result = vo;
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			return result;
		}
	}
	
	public boolean delete(MemberVo vo) {
		boolean b = false;
		try {
			int cnt = sqlSession.delete("member.delete", vo);
			if(cnt>0) {
				b = true;
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			return b;
		}
	}
	
	public boolean cpwd(MemberVo vo) {
		boolean b = false;
		try {
			int cnt = sqlSession.selectOne("member.cpwd", vo);
			if(cnt==1) {
				b = true;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
   public String id_check(String id) {
	      String result = "사용가능한 아이디 입니다.";
	      int cnt = 0;
	      try {
	         cnt = sqlSession.selectOne("member.check", id);
	         if(cnt > 0) {
	            result = "이미 사용중인 아이디 입니다.";
	         }
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      }finally {
	         return result;
	      }
	   }
	   
	   public int email_check(String email) {
	      int cnt = 0;
	      try {
	         cnt = sqlSession.selectOne("member.echeck", email);
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      }finally {
	         return cnt;
	      }
	   }
	   
	   public void sns_insert(MemberVo vo) {
		      try {
		         int cnt = sqlSession.selectOne("member.checksns", vo.getmId());
		         if(cnt==0) {
		            if(vo.getmPwd() == null) {
		               vo.setmPwd("sns");
		            }
		            if(vo.getmDate() == null) {
		               vo.setmDate("1900-01-01");
		            }
		            if(vo.getmGender() == null) {
		               vo.setmGender("sns");
		            }
		            int cnt2 = sqlSession.insert("member.insertsns", vo);
		            if(cnt2 == 1) {
		               sqlSession.commit();
		            }else {
		               sqlSession.rollback();
		            }
		         }
		      }catch(Exception ex) {
		         ex.printStackTrace();
		         sqlSession.rollback();
		      }
		   }

	   
      public List<QnaVo> myqna_search(MyQnaParam qparam){
          List<QnaVo> list = new ArrayList<QnaVo>();
          
          this.nowPage = qparam.getNowPage();
          
          this.totListSize = sqlSession.selectOne("member.qnaTotListSize", qparam.getqId());
          
          this.totPage = (int)Math.ceil(totListSize/(double)listSize);
          
          this.endNo = nowPage * listSize;
          this.startNo = endNo - (listSize -1);
          
          qparam.setStartNo(startNo);
          qparam.setEndNo(endNo);
          qparam.setTotPage(totPage);
          qparam.setTotListSize(totListSize);
          
          list = sqlSession.selectList("member.qnaSearch", qparam);
          
          try {
             
          }catch (Exception ex) {
             ex.printStackTrace();
          }finally {
             return list;
          }
          
       }
      
      public List<QnaVo> myqna_view(MyQnaParam qparam){
          List<QnaVo> list = new ArrayList<QnaVo>();
          //qparam에는 선택한 q시리얼이 들어있당
          try {
             list = sqlSession.selectList("member.qnaview", qparam.getqSerial());   
             for(int i =0; i<list.size() ; i++) {
            	 List<FileVo> photo = sqlSession.selectList("member.qnaphoto", list.get(i).getqSerial());
            	 list.get(i).setList(photo);
             }
          }catch(Exception ex) {
             ex.printStackTrace();
          }finally {
             return list;
          }
       }
	      
	      
	
	public boolean myqna_insert(QnaVo vo) {
		boolean b = false;
		
		try {
			
			int cnt = sqlSession.insert("member.qna_insert", vo);
			
			if(vo.getList() != null) {
				for(int i = 0; i<vo.getList().size(); i++) {
					cnt = sqlSession.insert("member.qna_file_insert", vo.getList().get(i));
				}					
			}
			if(cnt==1) {
				b = true;
				sqlSession.commit();
			}
		}catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
			b = false;
		}finally {
			return b;
		}
	}
	
	public boolean myqna_modify(QnaVo vo) {
	  //삭제요청한 파일 삭제
	   List<String> delFile = new ArrayList<String>();
	   if(vo.getDelFile() != null) {
			delFile = vo.getDelFile();
			String saveDir = "C:/Users/JHTA/Documents/카카오톡 받은 파일/째수의 19-10-30 결과물/WebContent/upload";
			for(String s : delFile) {			
				if(!s.equals("")) {						
					File file2 = new File(saveDir +"/"+s);				
					if(file2.exists()) {
						file2.delete();
					}
				}
			}
		}
		
	   boolean b = false;
	   try {
		   //삭제요청한 파일 DB삭제
		   if(delFile.size() >0) {
			   for(int i=0; i<delFile.size() ; i++) {
				   sqlSession.delete("member.qna_file_del", delFile.get(i));				   
			   }
		   }
		   //내용업데이트
		   System.out.println(vo.getqOrder()+"이거 큐오더");
			int cnt = sqlSession.update("member.qna_update", vo);
			System.out.println(vo.getqOrder()+"이거 큐오더");
			//추가한 사진 DB등록
			if(vo.getList() != null) {
				for(int i = 0; i<vo.getList().size(); i++) {
					FileVo fv = new FileVo();
					fv.sethPhoto(vo.getList().get(i).gethPhoto());
					fv.sethPserial(vo.getqSerial());
					cnt = sqlSession.insert("member.qna_file_modify", fv);
				}
			}
			if(cnt>0) {
				b = true;
				sqlSession.commit();
			}
		}catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
			b = false;
		}finally {
			return b;
		}
		   
	}
	
   //마이페이지 배송현황
   public List<MyDeliveVo> myDelSelect(String rId){
      List<MyDeliveVo> list = new ArrayList<MyDeliveVo>();
      MyDeliveVo vo = new MyDeliveVo();
      
      vo.setId(rId);
      
      try {
         for(int i =1; i<6 ; i++) {
            vo.setrDelive(i);
            list.add(sqlSession.selectOne("member.my_delive", vo));
         }
         
      }catch (Exception ex) {
         ex.printStackTrace();
      }finally {
    	  sqlSession.clearCache();
         return list;
      }
      
   }
   
 //마이페이지 관심상품 리스트 관련
   public List<ProductVo> MyLike(String mId){
      List<ProductVo> list = new ArrayList<ProductVo>();
      
      try {
         list = sqlSession.selectList("member.my_like_search", mId);
         System.out.println(list.size());
      }catch (Exception ex) {
         ex.printStackTrace();
      }finally {
    	  sqlSession.clearCache();
       return list;
   }
   }
   
 //관심상품 삭제하기
   public String LikeDel(SlikeVo vo) {
      String msg = "관심상품이 삭제되었습니다.";
      
      try {
         int cnt = sqlSession.delete("member.my_like_del", vo);
         if(cnt <= 0) {
            msg = "관심상품 삭제를 실패했습니다.";
         }
      }catch (Exception ex) {
      ex.printStackTrace();
      sqlSession.rollback();
      }finally {
         sqlSession.commit();
         return msg;
      }
   }
}
