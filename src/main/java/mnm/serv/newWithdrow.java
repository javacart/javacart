/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

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
public class newWithdrow extends HttpServlet{
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
         System.out.print(user);
        String dargah=(String)request.getParameter("dargah");
        String price=(String)request.getParameter("price");
        String hesab=(String)request.getParameter("hesab");
        db d=(db)session.getAttribute("database");
        d.insert_transaction(dargah,price,hesab,user);
        getServletContext().getRequestDispatcher("/panel/withdraw_list.jsp").forward(
                    request, response);
    }
    
    
   
    
}
