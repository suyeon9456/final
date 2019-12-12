package servlet;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Param;
import bean.RecordDao;
import bean.RecordVo;

@Controller
public class BuyRecordController {
   RecordDao dao;
   HttpServletRequest req;
   
   public BuyRecordController(RecordDao dao) {
      this.dao = dao;
   }
   
   @RequestMapping(value = "ReSearch.rcd")
   public ModelAndView search(Param param, HttpServletRequest req) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
        
      ModelAndView mv = new ModelAndView();
      List<RecordVo> list = dao.search(param);
      
      mv.addObject("list", list);
      mv.addObject("para", param);
      
      mv.setViewName("buyRecord");
      
      return mv;
   }
   
   @RequestMapping(value = "RewSearch.rcd")
   public ModelAndView wsearch(Param param, HttpServletRequest req) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
        
      ModelAndView mv = new ModelAndView();
      List<RecordVo> list = dao.daywSearch(param);
      
      mv.addObject("list", list);
      mv.addObject("para", param);
      mv.setViewName("buyRecord");
      
      return mv;
   }
   
   @RequestMapping(value = "RemSearch.rcd")
   public ModelAndView msearch(Param param, HttpServletRequest req) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
      
      ModelAndView mv = new ModelAndView();
      List<RecordVo> list = dao.daymSearch(param);
      
      mv.addObject("list", list);
      mv.addObject("para", param);
      mv.setViewName("buyRecord");
      
      return mv;
   }
   
   @RequestMapping(value = "RetmSearch.rcd")
   public ModelAndView tmsearch(Param param, HttpServletRequest req) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
      
      ModelAndView mv = new ModelAndView();
      List<RecordVo> list = dao.daytmSearch(param);
      
      mv.addObject("list", list);
      mv.addObject("para", param);
      mv.setViewName("buyRecord");
      
      return mv;
   }
   
   @RequestMapping(value = "Update1.rcd")
   public void update1(RecordVo vo, HttpServletResponse resp, HttpServletRequest req,Param param) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
      
       resp.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=utf-8");
      
      String msg = dao.modify1(vo);
      
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      
      out.println("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=ReSearch.rcd';</script>");            
      out.flush();
      
   }
   
   @RequestMapping(value = "Update2.rcd")
   public void update2(RecordVo vo, HttpServletResponse resp, HttpServletRequest req, Param param) {
      HttpSession session = req.getSession();
        param.setrId((String) session.getAttribute("user_id"));
      
      resp.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=utf-8");
      
      String msg = dao.modify2(vo);
      
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      
      out.println("<script type='text/javascript'>alert('"+msg+"'); location.href='index.jsp?content=ReSearch.rcd';</script>");            
      out.flush();
   }
   
   
   
   
}