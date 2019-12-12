package servlet;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.Param;
import member.QuestionVo;
import member.NoticeDao;
import member.NoticeVo;

@Controller
public class AdminController {
   NoticeDao dao;
   
   public AdminController(NoticeDao dao) {
      this.dao = dao;
   }
   
   @RequestMapping(value = "adminPage.adm")
   public ModelAndView search(Param param) {
      ModelAndView mv = new ModelAndView();
      List<NoticeVo> list = dao.search(param);
      List<QuestionVo> listt = dao.searchh();
      int cnt1 = dao.stay();
      int cnt2 = dao.refund();
      int cnt3 = dao.ask(); 
      
      mv.addObject("stay", cnt1);
      mv.addObject("refund", cnt2);
      mv.addObject("ask", cnt3);     
      
      mv.addObject("list",list);
      mv.addObject("listt",listt);
      mv.addObject("para", param);
      
      mv.setViewName("adminPage"); // .jsp
      
      return mv;
   }
   
}