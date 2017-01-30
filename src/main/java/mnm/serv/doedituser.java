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
//import mnm.fr9553.callservice;

/**
 *
 * @author mohammadghasemy
 */
public class doedituser extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String u=(String)session.getAttribute("ukey");
        String firstname=request.getParameter("firstname");
        String tel=request.getParameter("tel");
        String add=request.getParameter("add");
        String phone=request.getParameter("site");
        String addjob=request.getParameter("site");
        String meli=request.getParameter("site");
        String lastname=request.getParameter("lastname");
        String post=request.getParameter("post");
        String state=request.getParameter("state");
        String city=request.getParameter("city");
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
            if(d.update_user(u,firstname,tel,add,phone,addjob,meli,lastname,post,state,city)==1){
                request.setAttribute("message", "اطلاعات با موفقیت تصحیح شد.");
            }else{
                
            }
       
        
        getServletContext().getRequestDispatcher("/orders.jsp").forward(
                    request, response); 
        
        
    }
    
    
}
