/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import mnm.email.email_invoice_server;
import mnm.email.sender;
import mnm.util.db;
import mnm.util.persian;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/**
 *
 * @author mohammadghasemy
 */
public class gatwaynew extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
         try{
             boolean log=(Boolean)session.getAttribute("login");
        if(!log){
            
             getServletContext().getRequestDispatcher("/login.jsp").forward(
                    request, response); 
             return;
        }
        }catch(Exception s){
        
             getServletContext().getRequestDispatcher("/login.jsp").forward(
                    request, response); 
        }
         String user=(String)session.getAttribute("ukey");
         String email=(String)session.getAttribute("email");
         int type=0;
         try{
          
          type=Integer.parseInt(request.getParameter("type"));
          
          cost=price[type-1];
          
          
        String tel=(String)request.getSession().getAttribute("tel");
        String name=(String)request.getSession().getAttribute("name");
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        String t="";
        if(type==1){t="درگاه بدون کارمزد یک ساله، با ارسال ایمیل تاییدیه پرداخت";}
        if(type==2){t="درگاه بدون کارمزد یک ساله، با ارسال ایمیل وپیامک تاییدیه پرداخت";}
        if(type==3){t="۵ صفحه درگاه مستقیم کارمزد یک ساله، با ارسال ایمیل و پیامک تاییدیه پرداخت";}
          String invoi=d.insert_bill(t,user,cost);
            if(isValidEmailAddress(email)){
                sender s=new sender();
                s.set(email, "ثبت پلان جدید در سامانه پرداخت برای خرید", new email_invoice_server().getText(name, email, tel, invoi,new persian().persiandate(new Date()) ,t,"یک ساله", cost+" تومان"));
                s.start();
        
            }
            String text="  یک درخواست جدید ثبت شد<br/>"+
                "نام:"+name+"<br/>"+
                "ایمیل:"+email+"<br/>"+
                "تلفن:"+tel+"<br/>"+
                "پلان:"+type+"_"+"<br/>"+
                 "هزینه:"+cost+"<br/>"+
                "در تاریخ:"+new persian().persiandate(new Date())+"<br/>"+
                "ثبت شد.";
            sender s=new sender();
            s.set("pay4buy.ir@gmail.com", "register new plan", text);
            s.start();
          
         }catch(Exception s){
             s.printStackTrace();
             getServletContext().getRequestDispatcher("/panel/index.jsp").forward(
                    request, response); 
             return;
                     
         }
        
         
         
         
        getServletContext().getRequestDispatcher("/panel/bills.jsp").forward(
                    request, response); 

        
    }
    String price[]=new String[]{"15000","25000","50000"};
    
   
    public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }
    String cost="";
    
    
    
}
