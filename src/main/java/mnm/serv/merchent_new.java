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
public class merchent_new extends HttpServlet{
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
        String site=(String)request.getParameter("site");
        String name=(String)request.getParameter("name");
        String tel=(String)request.getParameter("tel");
        String desc=(String)request.getParameter("desc");
        db d=(db)session.getAttribute("database");
        d.insert_merchent(site,name,tel,desc,user);
        getServletContext().getRequestDispatcher("/panel/merchent_list.jsp").forward(
                    request, response);
    }
    
    
   
    
}
