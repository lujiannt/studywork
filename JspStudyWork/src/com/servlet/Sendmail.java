package com.servlet;
  
import java.security.Provider;
import java.security.Security;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.entity.User;
 
/**
* @ClassName: Sendmail
* @Description: Sendmail类继承Thread，因此Sendmail就是一个线程类，这个线程类用于给指定的用户发送Email
* @author: 孤傲苍狼
* @date: 2015-1-12 下午10:43:48
*
*/ 
 public class Sendmail extends Thread {
         //用于给用户发送邮件的邮箱
    private String from = "939650457@qq.com";
         //邮箱的用户名
     private String username = "939650457@qq.com";
         //邮箱的密码
     private String password = "hwwmxclpeufubdfa";
         //发送邮件的服务器地址
     private String host = "smtp.qq.com";
     
     private User user;
     public Sendmail(User user){
         this.user = user;
     }
     
     /* 重写run方法的实现，在run方法中发送邮件给指定的用户
      * @see java.lang.Thread#run()
      */
     @Override
     public void run() {
         try{
        	 
             Properties prop = new Properties();
             //
             prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
             prop.setProperty("mail.smtp.port", "465");
             prop.setProperty("mail.smtp.socketFactory.port", "465");
             //
             prop.setProperty("mail.host", host);
            prop.setProperty("mail.transport.protocol", "smtp");
             prop.setProperty("mail.smtp.auth", "true");
             Session session = Session.getInstance(prop);
             session.setDebug(true);
             Transport ts = session.getTransport();
             ts.connect(host, username, password);
             Message message = createEmail(session,user);
             ts.sendMessage(message, message.getAllRecipients());
             ts.close();
         }catch (Exception e) {
             throw new RuntimeException(e);
         }
     }
     
     /**
     * @Method: createEmail
     * @Description: 创建要发送的邮件
     * @Anthor:孤傲苍狼
     *
     * @param session
     * @param user
     * @return
   * @throws Exception
    */ 
     public Message createEmail(Session session,User user) throws Exception{
         
    	 
    	 
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
         message.setSubject("勤工俭学岗位推送");
         
         String info = "亲爱的" + user.getUsername() + "同学 ，以下是我们为您精心挑选的勤工岗位："+user.getPostInfo();
         message.setContent(info, "text/html;charset=UTF-8");
         message.saveChanges();
         return message;
     }
 }