package servlet;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.ProductVo;
import category.CategoryDao;
@Controller
public class CategoryController {
	CategoryDao dao;
	
	public CategoryController(CategoryDao dao) {
		this.dao =dao;
	}
	
	//남자 카테고리 ------------------------------
	//MOutter로 이동
	   @RequestMapping("list.cate")
	   public ModelAndView goOutter(HttpServletRequest req) {
		   ModelAndView mv = new ModelAndView();
		   
	      List<ProductVo> list = new ArrayList<ProductVo>();
	      
	      int pCategory = Integer.parseInt(req.getParameter("asd"));
	       list = dao.list(pCategory);
	       for(ProductVo vo : list) {
	    	   String temp = vo.getpColor();
	    	   if(temp.contains("_")) {
	    		   String[] temp2 = temp.split("_");
	    		   List<String> jaewook = Arrays.asList(temp2);
	    		   vo.setRgb(jaewook);
	    	   }else {
	    		   List<String> suyeon = new ArrayList<String>();
	    		   suyeon.add(vo.getpColor());
	    		   vo.setRgb(suyeon);	    		   
	    	   }
	       }
	      mv.addObject("list", list);
	      
	      switch (pCategory) {
		case 110:
			mv.addObject("category", "Men-Outter");
			break;
			
		case 1101:
			mv.addObject("category", "Leader");
			break;
			
		case 1102:
			mv.addObject("category", "Coat");
			break;
			
		case 1103:
			mv.addObject("category", "Padding");
			break;

		case 111:
			mv.addObject("category", "Men-Top");
			break;
			
		case 1111:
			mv.addObject("category", "Shirt");
			break;
			
		case 1112:
			mv.addObject("category", "MenToMen");
			break;
			
		case 1113:
			mv.addObject("category", "T-Shirt");
			break;
			
		case 112:
			mv.addObject("category", "Men-Bottom");
			break;
			
		case 1121:
			mv.addObject("category", "Jeans");
			break;
			
		case 1122:
			mv.addObject("category", "Slacks");
			break;
			
		case 1123:
			mv.addObject("category", "Shorts");
			break;
			
		case 113:
			mv.addObject("category", "Men-Shoes");
			break;
			
		case 1131:
			mv.addObject("category", "Shoes");
			break;
			
		case 1132:
			mv.addObject("category", "Sneckers");
			break;
			
		case 114:
			mv.addObject("category", "Men-Acc");
			break;
			
		case 1141:
			mv.addObject("category", "Wallet");
			break;
			
		case 1142:
			mv.addObject("category", "Watches");
			break;
			
			
			
			
			
		case 220:
			mv.addObject("category", "여자 탑");
			break;
			
		case 221:
			mv.addObject("category", "여자 드레스");
			break;
			
		case 222:
			mv.addObject("category", "여자 블라우스");
			break;
			
		case 223:
			mv.addObject("category", "여자 신발/가방");
			break;
			
		case 224:
			mv.addObject("category", "여자 악세사리");
			break;
		}
	      
	      mv.setViewName("list");
	      return mv;
	   }
		
	   @RequestMapping(value = "totalFind.cate")
       public ModelAndView totalFind(HttpServletRequest req) {
          ModelAndView mv = new ModelAndView();
          
          String totalFindStr = req.getParameter("totalFindStr");
         
          List<ProductVo> list = dao.totalFindSearch(totalFindStr);
          
          mv.addObject("list", list);
          mv.addObject("totalFindStr",totalFindStr);
          
          mv.setViewName("totalFind");
          
          return mv;
       }
	   
	
}
