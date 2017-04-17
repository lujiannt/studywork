package com.servlet;
  
  import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

  import javax.servlet.ServletException;
  import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;

import com.entity.Clerk;
import com.entity.Post;
import com.entity.User;
import com.service.ClerkService;
import com.serviceImpl.ClerkServiceImpl;
 
 public class RegisterServlet extends HttpServlet {
 //查询出所属的email 和 kind，再根据kind匹配适合的岗位进行推荐
     public void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
    	 ClerkService userservice = new ClerkServiceImpl();
    	 String method = request.getParameter("method");
    	 
    	 if(method.equals("sendMail")) {
    		 //查询出email 和 kind 封装好
    		 String del = request.getParameter("dels");
    	     String[] dels = del.split(",");
    	     int cid = Integer.parseInt(dels[0]);
    		 Clerk c =  userservice.findClerkById(cid);
    		 String email = c.getEmail();
    		 int kind = c.getKind();
    		 
    		 //在根据kind 查出所匹配的岗位
    		 List<Post> posts = new ArrayList<Post>();
    		 posts = userservice.findRightPosts(kind);
    		 String postInfo = "";
    		 
    		 for(int i=0;i<posts.size();i++) {
    			 Post p = posts.get(i);
    			 postInfo = postInfo + "岗位名:"+p.getPname()+",联系人:"+p.getPleadername()+",联系电话:"+p.getPleaderphone()+" ; ";
    		 }
    		 
    	 
    	 //email 推送
         try{
             String username = c.getUname();
             User user = new com.entity.User();
             user.setEmail(email);
             user.setUsername(username);
             user.setPostInfo(postInfo);
             
            //System.out.println("把用户信息注册到数据库中");
             //用户注册成功之后就使用用户注册时的邮箱给用户发送一封Email
             //发送邮件是一件非常耗时的事情，因此这里开辟了另一个线程来专门发送邮件
             Sendmail send = new Sendmail(user);
             //启动线程，线程启动之后就会执行run方法来发送邮件
             send.start();
             
             //注册用户
             //new UserService().registerUser(user);
              response.sendRedirect("../student/sendsuccess.jsp");
         }catch (Exception e) {
             e.printStackTrace();
//             request.setAttribute("message", "推送失败！！");
//             request.getRequestDispatcher("/message.jsp").forward(request, response);
             response.sendRedirect("../student/sendfail.jsp");
         }
    		 
    	 }	 
     }
 
     public void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         doGet(request, response);
     }
 }