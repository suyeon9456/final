package servlet;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Param;
import bean.RecordDao;
import bean.RecordVo;

@Controller
public class SaleRecordController {
   RecordDao dao;
   
   public SaleRecordController(RecordDao dao) {
      this.dao = dao;
   }
   
   @RequestMapping(value = "ReSaleSearch.rcd")
   public ModelAndView search(Param param) {
      ModelAndView mv = new ModelAndView();
      List<RecordVo> list = dao.asearch(param);
      
      RecordVo vo = new RecordVo();
      vo = dao.afsearch();
      
      mv.addObject("vo", vo);
      mv.addObject("list", list);
      mv.addObject("para", param);
      
      mv.setViewName("saleRecord");
      
      return mv;
   }
   
   @RequestMapping(value = "saleUpdate1.rcd")
   public void update1(RecordVo vo, HttpServletResponse resp) {
       resp.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=utf-8");
      String msg = dao.salemodify1(vo);
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      
      out.println("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=ReSaleSearch.rcd';</script>");            
      out.flush();
   }
   
   @RequestMapping(value = "saleUpdate2.rcd")
   public void update2(RecordVo vo, HttpServletResponse resp) {
       resp.setCharacterEncoding("utf-8");
       resp.setContentType("text/html;charset=utf-8");
      String msg = dao.salemodify2(vo);
      
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      
      out.println("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=ReSaleSearch.rcd';</script>");            
      out.flush();
      
   }
   

   
   
   
   
   
   
   
   
   
}