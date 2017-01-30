/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import mnm.email.email_ticket;
import mnm.email.sender;
import mnm.util.db;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author mohammadghasemy
 */
public class sendticket extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean log=(Boolean)session.getAttribute("login");
         try{
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
         
        String text=(String)request.getParameter("ticketnew");
        String ticketnumber=(String)session.getAttribute("ticketnumber");
        String subject=(String)request.getParameter("subject");
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        d.insert_ticket(text, ticketnumber,user,subject);
        getServletContext().getRequestDispatcher("/panel/tickets.jsp").forward(
                    request, response); 
        sender s=new sender();
        s.set(email, "تیکت جدید ارسال شد", new email_ticket().gettext(email));
        s.start();
        sender ss=new sender();
        ss.set("pay4buy.ir@gmail.com", "new ticket", "new ticket from:\n"+email);
        ss.start();
        
        
    }
    
    
    
    
    
}
