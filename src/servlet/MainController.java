package servlet;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.MainDao;
import bean.ProductVo;

@Controller
public class MainController {
	MainDao dao;

	public MainController(MainDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "main.main")
	public ModelAndView search(ProductVo vo) {
		ModelAndView mv = new ModelAndView();
		List<ProductVo> list = dao.search(vo);
		List<ProductVo> listR = dao.search2(vo);
		vo = dao.searchOne(vo);
		
		mv.addObject("list", list);
		mv.addObject("listR", listR);
		mv.addObject("vo", vo);

		mv.setViewName("main"); // .jsp 
		return mv;
	}

}