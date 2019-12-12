package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import bean.ProductVo;
import bean.SlikeVo;
import member.FileUploadService;
import member.FileVo;
import member.KakaoAPI;
import member.MailCheck;
import member.MemberDao;
import member.MemberVo;
import member.MyDeliveVo;
import member.MyQnaParam;
import member.QnaVo;

@Controller
public class MemberController {
   
   MemberDao dao;
   
   FileUploadService fUpload = new FileUploadService();
   
   private KakaoAPI kakao;
   int ran;
   StringBuffer sb;
   private MailCheck mailCheck = new MailCheck();
   public MemberController(MemberDao dao) {
      this.dao = dao;
   }
   
   //회원가입 사직점으로
   @RequestMapping("go_insert.mem")
   public ModelAndView go_insert() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("insert_agree");
      
      return mv;
   }
   
   //동의했을시 회원가입 폼으로
   @RequestMapping("insert.mem")
   public ModelAndView insert_agree() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("insert");
      return mv;
   }

   //회원가입 후 결과창으로
   @RequestMapping("insert_result.mem")
   public ModelAndView insert(MemberVo vo) {
      ModelAndView mv = new ModelAndView();
      MemberVo result = dao.insert(vo);
      mv.addObject("result", result);
      mv.setViewName("insert_result");
      return mv;
   }

   
   //로그인창으로 이동
   @RequestMapping("go_login.mem")
   public ModelAndView goLogin(HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      String before_page = "";
      if(req.getParameter("pCode") != null) {
    	  before_page = req.getParameter("pCode");
      }
      mv.addObject("b_page", before_page);
      mv.setViewName("login");
      return mv;
   }
   
 //로그인하기
   @RequestMapping("logIn.mem")
   public String login(HttpServletRequest req, HttpServletResponse resp) {
      MemberVo result = new MemberVo();
      resp.setContentType("text/html;charset=utf-8");
      resp.setCharacterEncoding("utf-8");
      HttpSession session = req.getSession();
      MemberVo vo = new MemberVo();
      vo.setmId(req.getParameter("mId"));
      vo.setmPwd(req.getParameter("mPwd"));
      result=dao.login(vo);
      PrintWriter out = null;
      try {
         req.setCharacterEncoding("utf-8");
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      
      if(result != null && result.getmName()!=null && !result.getmName().equals("")) {
         session.setAttribute("user_name", result.getmName());
         session.setAttribute("user_id", result.getmId());
         
         //자동로그인에 관한 쿠키
         if(req.getParameter("keep_info") != null) {
            //유저이름에 관한 쿠키 
            Cookie c_user_name = new Cookie("shop_user_name", result.getmName());
            c_user_name.setPath("/");
            c_user_name.setMaxAge(60*60*24*7);
            resp.addCookie(c_user_name);
            
            //유저아이디에 관한 쿠키
            Cookie c_user_id = new Cookie("shop_user_id", result.getmId());
            c_user_id.setPath("/");
            c_user_id.setMaxAge(60*60*24*7);
            resp.addCookie(c_user_id);
         }
         
         if(req.getParameter("save_id") != null) {
            //아이디 저장에 관한 쿠키
            String c_id = "idsaver";
            Cookie idsaver = new Cookie(c_id, result.getmId());
            idsaver.setPath("/");
            idsaver.setMaxAge(60*60*24);
            resp.addCookie(idsaver);
         }
         
         if(req.getParameter("b_page") != null && !req.getParameter("b_page").equals("")) {
        	 return "redirect:/index.jsp?content=view.shop&pCode="+req.getParameter("b_page");
         }
         return "redirect:/index.jsp";
      }else {         
         out.println("<script>alert('아이디와 비밀번호를 확인해주세요'); location.href='index.jsp?content=go_login.mem';</script>" );
         out.flush();
         return null;
      }
   }
   
   
 //마이페이지 클릭시 마이페이지 창으로
   //TODO select가 아니라 join해서 다른 결제테이블 같은거 가져와야할 듯
   @RequestMapping("mypage.mem")
   public ModelAndView mypage(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      
      HttpSession session = req.getSession();
      
      String user_id = (String) session.getAttribute("user_id");
      
      if(user_id != null && !user_id.equals("")) {
         MemberVo data = dao.select(user_id);
         
         List<MyDeliveVo> list = dao.myDelSelect(user_id);
         
         int price = dao.totprice(user_id);
         
         mv.addObject("tot", price);
         mv.addObject("listSize", list.size());
         mv.addObject("list", list);
         mv.setViewName("mypage");
         mv.addObject("data", data);
      }
      return mv;
   }
   
   //로그아웃버튼 클릭 시
   @RequestMapping("logout.mem")
   public ModelAndView logout(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = req.getSession();
      Cookie[] cookies = req.getCookies();
      if(session.getAttribute("user_id") != null && !session.getAttribute("user_id").equals("")) {
         session.setAttribute("user_name", null);
         session.setAttribute("user_id", null);
         for(Cookie c : cookies) {
            String name = c.getName();
            if(name.equals("shop_user_name")) {
               Cookie user_name = new Cookie("shop_user_name", null);
               user_name.setPath("/");
               user_name.setMaxAge(0);
               resp.addCookie(user_name);
            }
            if(name.equals("shop_user_id")) {
               Cookie user_id = new Cookie("shop_user_id", null);
               user_id.setPath("/");
               user_id.setMaxAge(0);
               resp.addCookie(user_id);
            }
         } 
      }else {
         //카카오로 로그인했을 때
         kakao = new KakaoAPI();
         kakao.kakaoLogout((String)session.getAttribute("access_Token"));
         session.removeAttribute("access_Token");
         session.removeAttribute("user_name");
      }
      
      
      //TODO indext페이지로 이동시키기
      mv.setViewName("redirect:index.jsp");
      return mv;
   }
   
   //아이디찾기 창으로 이동
   @RequestMapping("go_findid.mem")
   public ModelAndView goFindid() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("find_id");
      return mv;
   }
   
   //아이디 찾기
   @RequestMapping("findid.mem")
   public ModelAndView findID(MemberVo vo, HttpServletResponse resp, HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      MemberVo result = new MemberVo();
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch (Exception e) {
         e.printStackTrace();
      }
      result = dao.findid(vo);
      if(result != null) {
         mv.setViewName("find_id_result");
         mv.addObject("data", result);
      }else {
         out.println("<script>alert('등록된 회원정보가 없습니다.');</script>" );
         out.flush();
         mv.setViewName("find_id");
      }
      return mv;      
   }
   
   
   //비밀번호찾기 창으로 이동
   @RequestMapping("go_findpwd.mem")
   public ModelAndView gofindPWD(MemberVo vo) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("data", vo);
      mv.setViewName("find_pwd");
      return mv;
   }
   
   //비밀번호 찾기
   @RequestMapping("findpwd.mem")
   public ModelAndView findPWD(MemberVo vo, HttpServletResponse resp, HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      int result = 0;
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch (Exception e) {
         e.printStackTrace();
      }
      result = dao.findpwd(vo);
      // result가 0=해당회원정보 못찾음 1=임시비밀번호로 변경 안됨 2=비밀번호 변경됨 그러나 이메일에서 오류 3=비밀번호 변경 및 이메일 전송 완료
      switch (result) {
      case 0:
         out.println("<script>alert('등록된 회원정보가 없습니다.');</script>" );
         out.flush();
         mv.setViewName("find_pwd");
         break;
      case 1:
         out.println("<script>alert('임시비밀번호 변경중 오류발생');</script>" );
         out.flush();
         mv.setViewName("find_pwd");
         break;
      case 2:
         out.println("<script>alert('이메일로 전송중 오류발생');</script>" );
         out.flush();
         mv.setViewName("find_pwd");
         break;
      case 3:
         mv.setViewName("find_pwd_result");
         mv.addObject("data", vo);
         break;
      }
      return mv;      
   }
   
   
   //회원정보 수정 가기 전 비밀번호 확인 창
   @RequestMapping("get_modify.mem")
   public ModelAndView getModify() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("get_modify");
      return mv;
   }   
   
   //회원정보수정 창으로
   @RequestMapping("go_modify.mem")
   public ModelAndView goModify(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      MemberVo find = new MemberVo();
      HttpSession session = req.getSession();
      String user_id = (String)session.getAttribute("user_id");
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch (Exception e) {
         e.printStackTrace();
      }
      
      find.setmId(user_id);
      find.setmPwd(req.getParameter("mPwd"));
      boolean b = false;
      b=dao.cpwd(find);
      
      if(b) {
         MemberVo data = new MemberVo();
         data = dao.select(user_id);
         mv.addObject("data", data);
         mv.setViewName("modify");
      }else {
         out.println("<script>alert('비밀번호가 다릅니다.');</script>" );
         out.flush();
         mv.setViewName("get_modify");
      }
      return mv;
   }
   
   //회원정보 수정
   @RequestMapping("modify.mem")
   public ModelAndView modify(MemberVo vo, HttpServletResponse resp, HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      MemberVo result = new MemberVo();
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch (Exception e) {
         e.printStackTrace();
      }
       result = dao.modify(vo);
      if(result != null) {
         mv.addObject("data", result);
         mv.setViewName("modify_result");
      }else {
         out.println("<script>alert('수정중 오류발생');</script>" );
         out.flush();
         mv.setViewName("modify");
      }
      return mv;
   }
   
   
   //회원정보 삭제
   @RequestMapping("delete.mem")
   public ModelAndView delete(MemberVo vo, HttpServletResponse resp, HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      boolean b = false;
      HttpSession session =req.getSession();
      PrintWriter out = null;
      try {
         out = resp.getWriter();
      }catch (Exception e) {
         e.printStackTrace();
      }
       b = dao.delete(vo);
      if(b) {
         mv.setViewName("delete_result");
         //TODO 자동로그인 쿠키 및 로그인중인 세션 삭제
         Cookie[] cookies = req.getCookies();
         if(session.getAttribute("user_id") != null && !session.getAttribute("user_id").equals("")) {
            session.setAttribute("user_name", null);
            session.setAttribute("user_id", null);
            for(Cookie c : cookies) {
               String name = c.getName();
               if(name.equals("shop_user_name")) {
                  Cookie user_name = new Cookie("shop_user_name", null);
                  user_name.setPath("/");
                  user_name.setMaxAge(0);
                  resp.addCookie(user_name);
               }
               if(name.equals("shop_user_id")) {
                  Cookie user_id = new Cookie("shop_user_id", null);
                  user_id.setPath("/");
                  user_id.setMaxAge(0);
                  resp.addCookie(user_id);
               }
            } 
         }
         
      }else {
         out.println("<script>alert('삭제중 오류발생');</script>" );
         out.flush();
         mv.setViewName("modify");
      }
      return mv;
   }
   
   
   //카카오 로그인
   @RequestMapping("kakao.mem")
   public String kakao(@RequestParam("code") String code, HttpSession session) {
      kakao = new KakaoAPI();
      String access_Token = kakao.getAccessToken(code);
      
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
       
       if(userInfo.get("nickname") != null) {
          session.setAttribute("user_name", userInfo.get("nickname"));
          session.setAttribute("user_id", userInfo.get("id"));
          session.setAttribute("access_Token", access_Token);
          
          //sMember테이블에 카카오로 로그인한 회원정보 입력, dao에서 등록된 회원이 아닐시에만 insert
          MemberVo kakao_data = new MemberVo();
          kakao_data.setmEmail(userInfo.get("email").toString());
          kakao_data.setmId(userInfo.get("id").toString());
          kakao_data.setmName(userInfo.get("nickname").toString());
//          
//          if(userInfo.containsKey("gender")) {
//        	  kakao_data.setmGender(userInfo.get("gender").toString());        	  
//          }
//          if(userInfo.containsKey("birthday")) {
//        	  kakao_data.setmDate(userInfo.get("birthday").toString());        	  
//          }
          dao.sns_insert(kakao_data);
       }
       
       return "redirect:/index.jsp";
   }
   
    //구글로그인
   @RequestMapping("google.mem")
   public String google(HttpServletRequest req, HttpSession session) {
       session.setAttribute("user_name", req.getParameter("mName"));
       session.setAttribute("user_id", req.getParameter("mId"));
       //sMember테이블에 구글로 로그인한 회원정보 입력, dao에서 등록된 회원이 아닐시에만 insert
       MemberVo google_data = new MemberVo();
       google_data.setmEmail(req.getParameter("mEmail"));
       google_data.setmId(req.getParameter("mId"));
       google_data.setmName(req.getParameter("mName"));
       dao.sns_insert(google_data);
       
      return "redirect:index.jsp";
   }
   
    //페이스북 로그인
   @RequestMapping("facebook.mem")
   public String facebook(HttpServletRequest req, HttpSession session) {
	   System.out.println("페북 들어옴");
       session.setAttribute("user_name", req.getParameter("mName"));
       session.setAttribute("user_id", req.getParameter("mId"));
       //sMember테이블에 페이스북으로 로그인한 회원정보 입력, dao에서 등록된 회원이 아닐시에만 insert
       MemberVo facebook_data = new MemberVo();
       facebook_data.setmEmail(req.getParameter("mEmail"));
       facebook_data.setmId(req.getParameter("mId"));
       facebook_data.setmName(req.getParameter("mName"));
       dao.sns_insert(facebook_data);
      return "redirect:index.jsp";
   }
   
      
  
  //회원가입시 id 중복체크(ajax)
  @RequestMapping(value="id_check", produces="application/text; charset=utf-8")
     @ResponseBody
     public void id_check(@RequestBody String id, HttpServletResponse rs) {
        String check = id.substring(0, id.length()-1);
        String result = dao.id_check(check);
        try {
           rs.setContentType("text/html;charset=utf-8");
           PrintWriter out = rs.getWriter();
           out.print(result.toString());
        } catch (Exception ex) {
           ex.printStackTrace();
        }
     }
      
      
  //email 인증번호 보내기
  @RequestMapping(value="email_send", produces="application/text; charset=utf-8")
  @ResponseBody
  public void email_send(@RequestBody String data, HttpServletResponse rs) throws Exception{
     mailCheck = new MailCheck();
     String check = data;
     String result = "";
     if(check.contains("%40")) {
        String[] array = check.split("%40");
        check = array[0] + "@" + array[1];
     }
     String email = check.substring(check.lastIndexOf("=") + 1, check.length());
     try {
         //이메일 중복 체크
         int cnt = dao.email_check(email);
         System.out.println(cnt+" 컨트롤러에서 이메일 개수");
         if(cnt > 0) {
            result = "사용중인 이메일 입니다.";
         }else {
            //랜덤 인증번호 생성
            ran = new Random().nextInt(900000) + 100000;
            
            mailCheck.sendMail(email, "2조 쇼핑몰 인증메일 입니다.", "<div id='mail_content'>"
                    + "<h2>2조 쇼핑몰</h2>"
                    + "<p>2조 쇼핑몰을 위한 메일입니다. 인증버튼을 클릭하면 회원가입 페이지로 이동합니다.</p>"
                    + "<p>email 인증버튼 입니다.</p>"
                    + "<table>"
                    + "<tbody>"
                    + "<tr>"
                    + "<td>인증버튼을 클릭 하세요. > </td>"
                    + "<td>"
                    + "<a href = 'http://192.168.0.3:9991/1903_final/index.jsp?content=insert.mem&emailCheckPw=" + ran 
                    + "&" + check
                    + "' style = 'text-decoration: none;'>"
                    + "<div id = 'email_check_pwd_btn' style = 'background-color:#c41e20; color:#fff; border-radius:50px; width:110px; height:30px; text-align:center; font-weight:bold; line-height:30px;'>이메일 인증 확인</div>"
                    + "</a>"
                    + "</td>"
                    + "</tr>"
                    + "</tbody>"
                    + "</table>"
                    + "</div>"
            		);
               result = "인증번호를 전송했습니다.";            
         }
     } catch (Exception ex) {
        ex.printStackTrace();
     }finally {
        rs.setContentType("text/html;charset=utf-8");
        PrintWriter out = rs.getWriter();
        out.print(result.toString());
     }
  }
  
  //인증번호 확인
  @RequestMapping(value="number_send", produces="application/text; charset=utf-8")
  @ResponseBody
  public void number_send(@RequestBody String num, HttpServletResponse rs) {
     String result = "";
     String check = num.substring(0, num.length()-1);
     if(check.equals(String.valueOf(ran)) ) {
        result = "인증되었습니다.";
     }else {
        result = "인증번호가 다릅니다.";
     }      
        try {
        rs.setContentType("text/html;charset=utf-8");
        PrintWriter out = rs.getWriter();
        out.print(result.toString());
     } catch (Exception ex) {
        ex.printStackTrace();
     }
  }
  
     
      
  //회원가입 결과창에서 완료버튼 클릭 시 로그인과 동시에 메인페이지로 이동
  @RequestMapping("result_login.mem")
  public String result_login(HttpServletRequest req, HttpServletResponse resp) throws IOException{
     resp.setContentType("text/html;charset=utf-8");
     req.setCharacterEncoding("utf-8");
     PrintWriter out = resp.getWriter();
     
     MemberVo vo = new MemberVo();
     vo.setmId(req.getParameter("mId"));
     vo.setmName(req.getParameter("mName"));
     
     HttpSession session = req.getSession();
     session.setAttribute("user_name", vo.getmName());
     session.setAttribute("user_id", vo.getmId());
     return "../index";
  }
	   
  //1대1문의 조회 페이지 이동
  @RequestMapping("myqna_search.mem")
  public ModelAndView myqna_search(MyQnaParam qparam, HttpSession session, HttpServletResponse resp) {
     ModelAndView mv = new ModelAndView();
     
     QnaVo vo = new QnaVo();
     String id = String.valueOf(session.getAttribute("user_id"));
     qparam.setqId(id);
     List<QnaVo> list = dao.myqna_search(qparam);
     
     for(QnaVo v : list) {
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
     
     mv.addObject("list", list);
     mv.addObject("para", qparam);
     
     mv.setViewName("mypage_qna");
     
     return mv;
  }
  
  //1대1문의 선택 후 데이터 출력
  @RequestMapping("myqna_view.mem")
  public ModelAndView myqna_view(MyQnaParam qparam) {
     ModelAndView mv = new ModelAndView();
     List<QnaVo> list = dao.myqna_view(qparam);
     mv.addObject("data", list);
     mv.setViewName("mypage_qna_view");
     return mv;
  }
   
   //1대1문의 입력 페이지 이동
   @RequestMapping("myqna_insert.mem")
   public ModelAndView myqna_insert() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("mypage_qna_insert");
      return mv;
   }
   
 //1대1문의 입력 페이지 저장
   @RequestMapping("myqna_insertR.mem")
   public void myqna_insertR(MultipartHttpServletRequest req, QnaVo vo, HttpServletResponse resp) {
	   resp.setContentType("text/html;charset=utf-8");
	   resp.setCharacterEncoding("utf-8");
      List<MultipartFile> fileList = req.getFiles("attFile");
      List<FileVo> list = new ArrayList<FileVo>();
      if(fileList.size() != 0) {
    	  for(MultipartFile file : fileList) {
    		  FileVo fv = new FileVo();
    		  String url = fUpload.restore(file);
    		  fv.sethPhoto(url);	    		  
    		  list.add(fv);
    	  }
    	  vo.setList(list);
      }
      boolean b = dao.myqna_insert(vo);
      PrintWriter out = null;
      try {
         out = resp.getWriter();
         req.setCharacterEncoding("utf-8");
      }catch (Exception e) {
         e.printStackTrace();
      }
      //TODO alert창 인코딩 및 디코딩
      if(b) {
    	  out.println("<script>alert('등록이 정상적으로 완료되었습니다.'); location.href='index.jsp?content=myqna_search.mem';</script>");	    	  
      }else {
    	  out.println("<script>alert('등록 중 오류발생'); location.href='index.jsp?content=myqna_search.mem';</script>");
      }
      out.flush();
   }
   
   //1대1문의 수정
   @RequestMapping("myqna_modifyR.mem")
   public void myqna_modifyR(MultipartHttpServletRequest req, QnaVo vo, HttpServletResponse resp) {
	   resp.setCharacterEncoding("utf-8");
	   resp.setContentType("text/html;charset=utf-8");
	   //새로운 파일 업로드  
	   List<MultipartFile> fileList = req.getFiles("attFile");
	   List<FileVo> list = new ArrayList<FileVo>();
	   if(fileList.size() != 0) {
	   	  for(MultipartFile file : fileList) {
	   		  FileVo fv = new FileVo();
	   		  String url = fUpload.restore(file);
	   		  fv.sethPhoto(url);	    		  
	   		  list.add(fv);
	   	  }
	   	  vo.setList(list);
	   }
      boolean b = dao.myqna_modify(vo);
      PrintWriter out = null;
      try {
         out = resp.getWriter();
         req.setCharacterEncoding("utf-8");
      }catch (Exception e) {
         e.printStackTrace();
      }
      //TODO alert창 인코딩 및 디코딩
      if(b) {
    	  out.println("<script type='text/javascript'>alert('수정완료'); location.href='index.jsp?content=myqna_search.mem';</script>");	    	  
      }else {
    	  out.println("<script type='text/javascript'>alert('수정중 오류발생'); location.href='index.jsp?content=myqna_search.mem';</script>");
      }
      out.flush();
   }
   
 //my_like페이지로 이동
   @RequestMapping(value = "go_my_like.mem")
   public ModelAndView go_my_like(HttpServletRequest req, HttpServletResponse resp) {
      ModelAndView mv = new ModelAndView();
      HttpSession session = req.getSession();
      
      String user_id = (String) session.getAttribute("user_id");
      
      List<ProductVo> list = dao.MyLike(user_id);
      
      mv.addObject("list", list);
      mv.setViewName("my_like");
      return mv;
   }
   
 //관심상품 삭제하기
   @RequestMapping(value = "like_delete.mem")
   public void LikeDel(SlikeVo vo, HttpServletResponse resp) {
      PrintWriter out = null;
      String result = dao.LikeDel(vo);
      try {
         resp.setContentType("text/html;charset=utf-8");
         out = resp.getWriter();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
      out.print("<script type='text/javascript'>alert('"+result+"'); location.href='index.jsp?content=go_my_like.mem';</script>");
      out.flush();
   }
}

