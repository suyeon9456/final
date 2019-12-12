package servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Param;
import bean.RecordVo;
import bean.RefundDao;



@Controller
public class RefundController {
	RefundDao dao;
	
	public RefundController(RefundDao dao) {
		this.dao = dao;
	}

	// 고객 결제 반품|환불 조회
	@RequestMapping("refundC")
	public ModelAndView searchCon(RecordVo rvo, HttpServletRequest req, Param param) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		
		param.setrId((String) session.getAttribute("user_id"));
		
		System.out.println("들어온ID : "+param.getrId());
		List<RecordVo> list = dao.searchConsum(rvo, param);
		mv.addObject("list", list);
		
		mv.setViewName("refundConsumer");
		return mv;
	}
	//1주일 검색
		@RequestMapping(value = "wRefundC")
		public ModelAndView wSearchC(HttpServletRequest req ,RecordVo rvo, Param param) {
			ModelAndView mv = new ModelAndView();
			HttpSession session = req.getSession();
			param.setrId((String) session.getAttribute("user_id"));
			
			System.out.println("1주컨트"+rvo.getrSerial());
			if(rvo.getrSerial() != 1000) {
				String seri = dao.modifyC(rvo.getrSerial());
			}
			List<RecordVo> list = dao.wSearchC(rvo, param);
			
			mv.addObject("list", list);
			mv.addObject("para", param);
			mv.setViewName("refundConsumer");
			
			return mv;
		}
		//한달 검색
		@RequestMapping(value = "mRefundC")
		public ModelAndView mSearchC(HttpServletRequest req ,RecordVo rvo, Param param) {
			ModelAndView mv = new ModelAndView();
			HttpSession session = req.getSession();
			param.setrId((String) session.getAttribute("user_id"));
			
			System.out.println("한달컨트"+rvo.getrSerial());
			if(rvo.getrSerial() != 0) {
				String seri = dao.modifyC(rvo.getrSerial());
			}
			List<RecordVo> list = dao.mSearchC(rvo, param);
			
			mv.addObject("list", list);
			mv.addObject("para", param);
			mv.setViewName("refundConsumer");
			
			return mv;
		}
		//3달 검색
		@RequestMapping(value = "tmRefundC") 
		public ModelAndView tmSearchC(HttpServletRequest req ,RecordVo rvo, Param param) {
			ModelAndView mv = new ModelAndView();
			HttpSession session = req.getSession();
			param.setrId((String) session.getAttribute("user_id"));
			
			System.out.println("세달컨트"+rvo.getrSerial());
			if(rvo.getrSerial() != 1000) {
				String ck = dao.modifyC(rvo.getrSerial());
			}
			List<RecordVo> list = dao.tmSearchC(rvo, param);
			
			mv.addObject("list", list);
			mv.addObject("para", param);
			mv.setViewName("refundConsumer");
			
			return mv;
		}
		//전체검색
		@RequestMapping(value = "aRefundC")
		public ModelAndView aSearchC(HttpServletRequest req ,RecordVo rvo, Param param) {
			ModelAndView mv = new ModelAndView();
			HttpSession session = req.getSession();
			param.setrId((String) session.getAttribute("user_id"));
			
			System.out.println("전체컨트"+rvo.getrSerial());
			if(rvo.getrSerial() != 1000) {
				String ck = dao.modifyC(rvo.getrSerial());
			}
			List<RecordVo> list = dao.aSearchC(rvo, param);
			
			mv.addObject("list", list);
			mv.addObject("para", param);
			mv.setViewName("refundConsumer");
			
			return mv;
		}
	

	
	//---------------------판매자------------------------------------------------------------------------------
	
	// 판매자 결제 반품|환불 조회
	@RequestMapping("refundS")
	public ModelAndView searchSale(HttpServletRequest req ,RecordVo rvo, Param param) {
		ModelAndView mv = new ModelAndView();
		String[] arraySerial = req.getParameterValues("chk");
		if(req.getParameterValues("chk") != null) {
			if(arraySerial.length !=0) {
				for(int i=0; i<arraySerial.length;i++) {
					String ck = dao.modifyS(arraySerial[i]);
				}
			}
		}
		
		List<RecordVo> list = dao.searchSale(rvo, param);			
		mv.addObject("list", list);
		
		mv.setViewName("refundSaler");
		return mv;
	}
	//1주일 검색
	@RequestMapping(value = "wRefundS")
	public ModelAndView wSearch(HttpServletRequest req ,RecordVo rvo, Param param) {
		ModelAndView mv = new ModelAndView();
		String[] arraySerial = req.getParameterValues("chk");
		if(req.getParameterValues("chk") != null) {
			if(arraySerial.length !=0) {
				for(int i=0; i<arraySerial.length;i++) {
					System.out.println(arraySerial[i]);
					String ck = dao.modifyS(arraySerial[i]);
					System.out.println(ck);
				}
			}
		}
		
		List<RecordVo> list = dao.wSearch(rvo, param);
		
		mv.addObject("list", list);
		mv.addObject("para", param);
		mv.setViewName("refundSaler");
		
		return mv;
	}
	//한달 검색
	@RequestMapping(value = "mRefundS")
	public ModelAndView mSearch(HttpServletRequest req ,RecordVo rvo, Param param) {
		ModelAndView mv = new ModelAndView();
		String[] arraySerial = req.getParameterValues("chk");
		if(req.getParameterValues("chk") != null) {
			if(arraySerial.length !=0) {
				for(int i=0; i<arraySerial.length;i++) {
					System.out.println(arraySerial[i]);
					String ck = dao.modifyS(arraySerial[i]);
					System.out.println(ck);
				}
			}
		}
		
		List<RecordVo> list = dao.mSearch(rvo, param);
		
		mv.addObject("list", list);
		mv.addObject("para", param);
		mv.setViewName("refundSaler");
		
		return mv;
	}
	//3달 검색
	@RequestMapping(value = "tmRefundS")
	public ModelAndView tmSearch(HttpServletRequest req ,RecordVo rvo, Param param) {
		ModelAndView mv = new ModelAndView();
		String[] arraySerial = req.getParameterValues("chk");
		if(req.getParameterValues("chk") != null) {
			if(arraySerial.length !=0) {
				for(int i=0; i<arraySerial.length;i++) {
					System.out.println(arraySerial[i]);
					String ck = dao.modifyS(arraySerial[i]);
					System.out.println(ck);
				}
			}
		}
		List<RecordVo> list = dao.tmSearch(rvo, param);
		
		mv.addObject("list", list);
		mv.addObject("para", param);
		mv.setViewName("refundSaler");
		
		return mv;
	}
	//전체검색
	@RequestMapping(value = "aRefundS")
	public ModelAndView aSearch(HttpServletRequest req ,RecordVo rvo, Param param) {
		ModelAndView mv = new ModelAndView();
		
		List<RecordVo> list = dao.aSearch(rvo, param);
		
		mv.addObject("list", list);
		mv.addObject("para", param);
		mv.setViewName("refundSaler");
		
		return mv;
	}
	
}
