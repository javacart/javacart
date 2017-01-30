/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import mnm.email.email_forgot;
import mnm.email.sender;
import mnm.util.db;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

/**
 *
 * @author mohammadghasemy
 */
public class doforgot extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    String user=request.getParameter("user");
        System.out.println(user);
        String uuid =generatepass();
        HttpSession session = request.getSession();
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        if(isValidEmailAddress(user)&&d.select_pass(user,uuid)){
            
                    sender s=new sender();
                    s.set(user, "جانشینی گذرواژه", new email_forgot().gettext(user, uuid));
                    s.start();
            request.setAttribute("message","ایمیل شما ارسال شد.");
            
            getServletContext().getRequestDispatcher("/forgot.jsp").forward(
                    request, response); 
        }else{
            request.setAttribute("message","چنین کاربری وجود ندارد.");
            getServletContext().getRequestDispatcher("/forgot.jsp").forward(
                    request, response); 
        }
    }
    public  boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }
    
    private static final String dCase = "abcdefghijklmnopqrstuvwxyz";
    
    private static final String intChar = "0123456789";
    private static Random r = new Random();
    private static String pass = "";
    public String generatepass() {
//        System.out.println ("Generating pass...");
        boolean all=false;
        
        while(!all){
            pass="";
            boolean i=false,d=false;
        while (pass.length () < 9 ){
            int rPick = r.nextInt(2);
            if (rPick == 0){
                d=true;
                int spot = r.nextInt(25);
                pass += dCase.charAt(spot);
            } else if (rPick == 1){
                i=true;
                int spot = r.nextInt (9);
                pass += intChar.charAt (spot);
            }
            if(i&&d){
                all=true;
            }
        }
//        System.out.println(all);
        }
//        System.out.println ("Generated Pass: " + pass);
        return pass;
    }
    
}
