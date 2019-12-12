package servlet;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.FileUploadService2;
import member.MyQnaParam;
import member.NoticeDao;
import member.NoticeVo;
import member.Param;
import member.QnaVo;
import member.QuestionVo;

@Controller
public class NoticeController {
	NoticeDao dao;

	FileUploadService2 fUpload = new FileUploadService2();

	public NoticeController(NoticeDao dao) {
		this.dao = dao;
	}

	// ----------------------------1대1------------------------------------

	// 1대1문의 조회 페이지로 이동
	@RequestMapping("go_question_search.not")
	public ModelAndView go_question_search(MyQnaParam param) {
		//파라미터에 페이지만 들어오면 된다
		ModelAndView mv = new ModelAndView();
	
		List<QuestionVo> list = new ArrayList<QuestionVo>();
		list = dao.jaewookjjang(param);
		mv.addObject("list", list);
		  for(QuestionVo v : list) {
		        if(v.getqPserial() != 0) {
		           int cnt = v.getSeq().lastIndexOf("/");
		           for(int i =0; i<cnt; i++) {
		              v.setSeq(v.getSeq().replaceFirst("/", "&nbsp"));
		           }
		           v.setSeq(v.getSeq().replaceAll("/", "└<답글>&nbsp"));
		        }else {
		           v.setSeq(v.getSeq().replaceAll("/", ""));
		        }
		     }
		     
		mv.setViewName("admin_question_view");
		return mv;
	}
	
	// 1대1 상세조회 페이지로 이동
	@RequestMapping("go_question_view.not")
	public ModelAndView go_question_view(Param param) {
		ModelAndView mv = new ModelAndView();
		
		QuestionVo vo = dao.viewQuestion(param);
		
		mv.addObject("para", param);
		mv.addObject("vo", vo);
		mv.setViewName("question_view");
		return mv;
	}

	// 1대1 입력 페이지로 이동
	@RequestMapping("go_question_insert.not")
	public ModelAndView go_question_insert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("question_insert");
		return mv;
	}

	// 1대1 입력 페이지 저장
	@RequestMapping("question_insertR.not")
	public ModelAndView question_insertR(QuestionVo vo, Param param) {
		ModelAndView mv = new ModelAndView();
		System.out.println("1대1컨트");
		String msg = dao.question_insert(vo);
		System.out.println("마무리");
		
		List<QuestionVo> list = dao.searchQuestion(param);

		mv.addObject("para", param);
		mv.addObject("list", list);
		mv.setViewName("notice_search");

		return mv;
	}
	
	//1대1 문의 답글 다는 창으로
	   //Admin만 가능함
	   @RequestMapping("question_answer.not")
	   public ModelAndView answer(HttpServletRequest req) {
	      ModelAndView mv = new ModelAndView();
	      String qSerial = req.getParameter("qSerial");
	      QuestionVo vo = new QuestionVo();
	      vo = dao.answer(qSerial);
	      mv.setViewName("admin_answer");
	      mv.addObject("data", vo);
	      return mv;
	   }
	   
	   //1대1문의 답변
	   @RequestMapping("answer.not")
	   public void answerR(QuestionVo vo, HttpServletResponse resp) {
	      PrintWriter out = null;
	      try {
	           resp.setContentType("text/html;charset=utf-8");
	         out = resp.getWriter();
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }
	      
	      String result = dao.answerR(vo);
	      out.print("<script type='text/javascript'>alert('"+result+"'); location.href='index.jsp?content=go_question_search.not';</script>");
	      out.flush();
	   }

	// -----------------------------공지사항------------------------------------

	// 공지사항 조회 페이지로 이동
	@RequestMapping("go_notice_search.not")
	public ModelAndView go_notice_search(Param param) {
		ModelAndView mv = new ModelAndView();

		List<NoticeVo> list = dao.searchNotice(param);

		mv.addObject("para", param);
		mv.addObject("list", list);
		mv.setViewName("notice_search");
		return mv;
	}
	
	// 공지사항 상세조회 페이지로 이동
	@RequestMapping("go_notice_view.not")
	public ModelAndView go_notice_view(Param param) {
		ModelAndView mv = new ModelAndView();
		NoticeVo vo = dao.viewNotice(param);

		mv.addObject("para", param);
		mv.addObject("vo", vo);
		mv.setViewName("notice_view");
		return mv;
	}

	// 공지사항 입력 페이지로 이동
	@RequestMapping("go_notice_insert.not")
	public ModelAndView go_notice_insert(Param param) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice_insert");
		return mv;
	}

	// 공지사항 입력 페이지 저장
	@RequestMapping("notice_insertR.not")
	public ModelAndView notice_insertR(NoticeVo vo,Param param) {
		ModelAndView mv = new ModelAndView();

		String msg = dao.notice_insert(vo);
		System.out.println(msg);
		List<NoticeVo> list = dao.searchNotice(param);

		mv.addObject("para", param);
		mv.addObject("list", list);
		mv.setViewName("notice_search");

		return mv;
	}

}
