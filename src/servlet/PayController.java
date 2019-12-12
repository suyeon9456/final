package servlet;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import bean.PayDao;
import bean.PayParam;
import bean.PayVo;
import bean.RecordVo;
import kakaopay.KakaoDao;

	@Controller
	public class PayController {
		PayVo vo;
		PayDao dao;
	    PayParam para;
	    KakaoDao kakaopay;
	    Map<String, Object> map;
        PayController(PayDao dao) {
			this.dao = dao;
		}
		@RequestMapping(value="payout", method = RequestMethod.POST)
		public ModelAndView handleRequestPayout(HttpServletRequest request, HttpServletResponse response) throws Exception { 
			ModelAndView mv = new ModelAndView(); 
			String paylist = request.getParameter("paylist"); //파람으로 넘어온 JSON STRING 타입
			if(paylist==null || paylist.equals("")) {System.out.println("paylist null"); }
			
			mv.addObject("paylist", paylist ); 
			mv.setViewName("payout"); //리턴될 jsp 경로 
			return mv; }
		
		@RequestMapping(value="realpay", method = RequestMethod.POST)
		public ModelAndView forRealPay(HttpServletRequest request, Model model) throws Exception { 
			ModelAndView mv = new ModelAndView(); 
		    String msg = "insert단 접근 시도";
		    String paylist = request.getParameter("json");
		    msg = dao.insert(request);
		    List<RecordVo> list = dao.data(paylist);
		    mv.addObject("msg", msg);
		    mv.addObject("info", list); 
		    mv.setViewName("bank");
			return mv; 
			}
		
		
		@RequestMapping(value="kakaopay", method = RequestMethod.POST)
		public String kakaopay(HttpServletRequest req) throws Exception {		
			req.setCharacterEncoding("utf-8");
			String json = req.getParameter("json");
			kakaopay = new KakaoDao(json);			
			return "redirect:"+kakaopay.kakaoPayReady();
		}
		
		
		@RequestMapping("success")
		public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) throws Exception {
	        System.out.println(pg_token);
	        ModelAndView mv = new ModelAndView();
	        
	        
	        mv.setViewName("realpay");
	        mv.addObject("info", kakaopay.kakaoPayInfo(pg_token));
	        return mv;        
	    }
		
	}
	
		
		
		
		
       

