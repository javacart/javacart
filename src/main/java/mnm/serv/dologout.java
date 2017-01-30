/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

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
public class dologout extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    
            HttpSession session = request.getSession();
            session.removeAttribute("login");
            session.removeAttribute("ukey");
            session.removeAttribute("dologinukey");
            session.removeAttribute("site");
            getServletContext().getRequestDispatcher("/register.jsp").forward(
                    request, response); 
        
    }
       
}
