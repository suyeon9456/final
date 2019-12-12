package bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import MyBatis.MyBatisFactory;

public class RefundDao {
	SqlSession sqlSession;

	RecordVo rvo;

	public RefundDao() {
		sqlSession = MyBatisFactory.getFactory().openSession();
	}

	// 고객 결제 환불목록 조회
	public List<RecordVo> searchConsum(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = sqlSession.selectList("rfs.search", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchF", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(vo.getAttFileB());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 소비자 주단위 조회
	public List<RecordVo> wSearchC(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = sqlSession.selectList("rfs.wSearch", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchF", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 소비자 달단위 조회
	public List<RecordVo> mSearchC(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.mSearch", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchF", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 소비자 3달 조회
	public List<RecordVo> tmSearchC(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.tmSearch", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchF", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 소비자 전체 조회
	public List<RecordVo> aSearchC(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.search", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchF", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 소비자측 refund 수정
	public String modifyC(int serial) {
		String msg = "자료가 정상적으로 수정되었습니다.";
		System.out.println("다오" + serial);
		try {
			int cnt = sqlSession.update("rfs.update1", serial);
			if (cnt < 1)
				msg = "자료가 수정중 오류 발생";
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			return msg;
		}
	}

	// ----------------------------------판매자측---------------------------------------------------

	// 판매자 결제 환불목록 조회
	public List<RecordVo> searchSale(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.searchS", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchFs", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 판매자 주단위 조회
	public List<RecordVo> wSearch(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.wSearchS", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchFs", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 판매자 달단위 조회
	public List<RecordVo> mSearch(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.mSearchS", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchFs", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 판매자 3달 조회
	public List<RecordVo> tmSearch(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.tmSearchS", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchFs", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// 판매자 전체 조회
	public List<RecordVo> aSearch(RecordVo rvo, Param param) {
		List<RecordVo> list = null;
		FileVo vo = null;
		this.rvo = rvo;
		try {
			list = (ArrayList) sqlSession.selectList("rfs.searchS", param);
			for(int i=0; i<list.size(); i++) {
				vo = sqlSession.selectOne("rfs.searchFs", list.get(i).getrCode());
				list.get(i).setfPhoto(vo.getAttFileB()); 
				System.out.println(list.get(i).getfPhoto());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	// refund 수정
	public String modifyS(String serial) {
		String msg = "자료가 정상적으로 수정되었습니다.";
		try {
			int cnt = sqlSession.update("rfs.update2", serial);
			if (cnt < 1)
				msg = "자료가 수정중 오류 발생";
		} catch (Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		} finally {
			sqlSession.commit();
			return msg;
		}
	}
}
