package servlet;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.Param;
import bean.ProductDao;
import bean.ProductVo;
import bean.RecordVo;
import bean.SlikeVo;

@Controller
public class ProductController {
   ProductDao dao;
   
   public ProductController(ProductDao dao) {
      this.dao = dao;
   }
   
   
   @RequestMapping(value = "search.shop")
   public ModelAndView search(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.search(param);
      
      mv.addObject("list",list);
      mv.addObject("para", param);
      
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
   
   @RequestMapping(value = "Dsearch.shop")
   public ModelAndView daySearch(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.daySearch(param);
      mv.addObject("list",list);
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
   
   @RequestMapping(value = "Tsearch.shop")
   public ModelAndView daytSearch(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.daytSearch(param);
      mv.addObject("list",list);
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
   
   @RequestMapping(value = "Ssearch.shop")
   public ModelAndView daysSearch(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.daysSearch(param);
      mv.addObject("list",list);
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
   
   @RequestMapping(value = "AscSearch.shop")
   public ModelAndView aSearch(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.aSearch(param);
      mv.addObject("list",list);
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
   
   @RequestMapping(value = "DescSearch.shop")
   public ModelAndView dSearch(Param param) {
      ModelAndView mv = new ModelAndView();
      List<ProductVo> list = dao.dSearch(param);
      mv.addObject("list",list);
      mv.setViewName("eaManager"); // .jsp
      
      return mv;
   }
 //상품 등록 버튼을 눌렀을 때(paging)
 	@RequestMapping(value="insert.shop")
 	public ModelAndView insert(ProductVo vo) {
 		ModelAndView mv = new ModelAndView();
 		
 		mv.addObject("page", vo);
 		mv.setViewName("insert");
 		
 		return mv;
 	}
 	//작성완료하고 추가하는 버튼을 눌렀을때
 	@RequestMapping(value="insertR.shop") 
 	public void insertR(HttpServletRequest req, HttpServletResponse resp) {
 		PrintWriter out = null;
 		try {
 			resp.setCharacterEncoding("utf-8");
 			resp.setContentType("text/html; charset=utf-8");
 			out = resp.getWriter();
 		}catch(Exception ex) {
 			ex.printStackTrace();
 		}
 		String msg = dao.insert(req);
 		out.print("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=adminPage.adm';</script>");
 		out.flush();
 	}
 	@RequestMapping(value = "view.shop")
    public ModelAndView view(HttpServletRequest req) {
       ModelAndView mv = new ModelAndView();
      HttpSession session = req.getSession();
      
       String PCode =(req.getParameter("pCode"));
       ProductVo vo = new ProductVo();
       String user_id = "";
       if((String)session.getAttribute("user_id")!=null) {
    	   user_id = (String)session.getAttribute("user_id");
       }
       vo = dao.list_v(PCode, user_id);
       if(vo.getpContent() != null) {
           if(vo.getpContent().contains("<img src=")) {
              vo.setpContent(vo.getpContent().replaceAll("<img src=\"../se2", "<img src=\"./se2"));          
           }          
        }
       
       if(vo.getpColor().contains("_")) {
           String []temp = vo.getpColor().split("_");
           List<String> rgb = Arrays.asList(temp);
           vo.setRgb(rgb);
        }else {
        	List<String> rgb = new ArrayList<String>();
        	rgb.add(vo.getpColor());
        	vo.setRgb(rgb);
        }
       
       if(vo.getpSize().contains("_")) {
           String []temp = vo.getpSize().split("_");
           List<String> sbg = Arrays.asList(temp);
           vo.setSize(sbg);
        }
       mv.addObject("data", vo);
       mv.setViewName("Customer_View"); //다시 이동 
       return mv;
    }
 	
 	@RequestMapping(value = "deleteR.shop")
 	public ModelAndView deleteR(ProductVo vo) {
 		ModelAndView mv = new ModelAndView();
 		
 		String msg = dao.delete(vo);
 		//String delFile = vo.getPhoto();
 		//String saveDir = "C:/workspace/1903_spring/WebContent/upload/";
 		//File file = new File(saveDir + delFile);
 		//file.delete();
 		
 		mv.addObject("msg", msg);
 		mv.setViewName("delete");
 		
 		return mv;
 	}
 	 //수정하기 버튼을 눌렀을 때(데이터 가져오기)
 	@RequestMapping(value="modify_view.shop")
 	public ModelAndView modify_view(HttpServletRequest req) {
 		ModelAndView mv = new ModelAndView();
 		
 		String PCode =(req.getParameter("pCode"));
 		System.out.println(PCode);
	    ProductVo vo = new ProductVo();
	    
	      vo = dao.modify_view(PCode);
	      
	      String temp = vo.getpColor();
	      
	      if(temp.contains("_")) {
	    	  String[] temp2 = temp.split("_");
	    	  List<String> seongchan = Arrays.asList(temp2);
	    	  vo.setRgb(seongchan);
	      }else {
	    	  List<String> shinseong = new ArrayList<String>();
	    	  shinseong.add(vo.getpColor());
	    	  vo.setRgb(shinseong);
	      }
	      mv.addObject("data", vo);
	      mv.setViewName("modify_view"); //다시 이동 
	      
	      return mv;
 	}
// 	@RequestMapping(value="modifyR.shop")
//	public ModelAndView modifyR(ProductVo vo) {
//		ModelAndView mv = new ModelAndView();
//		String msg = dao.modifyR(vo);
//		System.out.println(vo.getpPrice());
//		mv.addObject("msg", msg);
//		mv.setViewName("modify_result");
//		return mv;
//	}
 	@RequestMapping(value="modifyR.shop")
	   public ModelAndView modifyR(HttpServletRequest req) {
		   ModelAndView mv = new ModelAndView();
		   
	      List<ProductVo> Mlist = new ArrayList<ProductVo>();
	      
	      int pModify = Integer.parseInt(req.getParameter("pCode"));
	       Mlist = dao.modifyR(pModify);
	       System.out.println(req.getParameter("pPrice"));
	       
	       mv.addObject("list", Mlist);
	       mv.setViewName("modify_result");
		      return mv;
	       }
 	
 	@RequestMapping(value = "likeAdd.shop", produces="application/text; charset=utf-8")
    @ResponseBody
    public void likeAdd(@RequestBody String data, HttpServletResponse rs) {
       SlikeVo vo = new SlikeVo();
       String pCode = "";
       String mId = ""; 
       if(data.contains("&")) {
          String[] array = data.split("&"); 
          pCode = array[0].substring(array[0].indexOf("=") + 1, array[0].length());
          mId = array[1].substring(array[1].indexOf("=") + 1, array[1].length());
       }
       
       vo.setpCode(pCode);
       vo.setmId(mId);
       
       dao.likeAdd(vo);
    }
 	
 	@RequestMapping(value = "info.shop", produces="application/text; charset=utf-8")
    @ResponseBody
    public void info(RecordVo vo, HttpServletResponse rs) {
       PrintWriter out = null;
       try {
    	   rs.setCharacterEncoding("utf-8");
    	   out = rs.getWriter();
       }catch(Exception ex) {
    	   ex.printStackTrace();
       }
       ProductVo data = dao.info(vo.getrCode());
       String point = "Y";
       if(data.getpPoint() == 1) {
    	   point = "N";
       }
       String temp = "[{'user_id' : '"+vo.getrId()+"', 'item_code' : '" + vo.getrCode() + "', 'item_name' : '" + data.getpName() + "', 'ea' : '"+vo.getrEa()+"', 'item_price' : '"+data.getpPrice() +"', 'point' : '"+ point + "', 'promote' : '" + data.getpPromotion() + "', 'cal_price' : '" + data.getsPrice() +"'}]";
       out.print(temp);
    }
   
}