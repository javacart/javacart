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
public class doedit extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String u=(String)session.getAttribute("ukey");
    String p=request.getParameter("pass");
        String pass=request.getParameter("passnew");
        String newp=request.getParameter("passnewtry");
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        
        if(null!=pass&&pass.equals(newp)&&pass.length()!=0){
            if(d.update_user_pass_check(u, p, newp)==1){
                request.setAttribute("message", "گذرواژه با موفقیت تصحیح شد.");
            }else{
                request.setAttribute("message", "گذرواژه فعلی نادرست است.");
            }
        }
        
        getServletContext().getRequestDispatcher("/account.jsp").forward(
                    request, response); 
        
        
    }
    
    
}
