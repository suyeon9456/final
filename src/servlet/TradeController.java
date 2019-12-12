package servlet;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.CartDao;
import bean.CartParam;
import bean.CartVo;

@Controller
public class TradeController {
	CartVo vo;
	CartDao dao;
    CartParam para;
   
    TradeController(CartDao dao) {
		this.dao = dao;
	}
	@RequestMapping(value="cart")
	public ModelAndView search(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		List<CartVo> list = dao.search(user_id);
		if(list==null) { System.out.println("list null"); }
		mv.addObject("list",list);
		mv.setViewName("cart");
		return mv;
	}

	@RequestMapping(value="insert")
	@ResponseBody
	public void insert(CartVo vo, HttpServletResponse resp) {
		try {
			PrintWriter out = resp.getWriter();
			String msg = dao.insert(vo);
			out.print(msg);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	

	@RequestMapping(value="merge")
	public void Merge(HttpServletRequest req, HttpServletResponse resp) {
		PrintWriter out = null;
		try {
			resp.setCharacterEncoding("utf-8");
			out = resp.getWriter();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	    String msg ="";
	    msg = dao.Merge(req);
	    out.println("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=cart.trade';</script>");
	    out.flush();
	}	
   
}
