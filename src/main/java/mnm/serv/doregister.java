/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import mnm.email.email_welcome;
import mnm.email.sender;
import mnm.util.db;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author mohammadghasemy
 */
public class doregister extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
    session.setAttribute("register",true);
    
    String user=request.getParameter("user");
    String name=request.getParameter("name");
        String pass=request.getParameter("pass");
        String pass1=request.getParameter("pass1");
        sender s=new sender();
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        if(null!=pass&&null!=pass1&&validate(pass)&&s.isValidEmailAddress(user)&&pass.equals(pass1)){
            d.insert_user(user, pass,name);
            s.set(user,"ثبت نام با موفقیت انجام شد", new email_welcome().getTxt(user, pass));
            s.start();
            request.setAttribute("messagereg", "ثبت نام انجام شد، می توانید برای خرید ورود کنید.");
        }else{
        request.setAttribute("messagereg","خطاهای زیر ممکن است رخ داده باشد:<br/>"
                + "۱) ایمیل را به شکل صحیح وارد کنید.<br/>"
                + "۲) کلمه عبور می بایست حداقل ۶ کاراکتر باشد و دارای حرف و عدد باشد. نمونه = "+generatepass());
        }
        
        getServletContext().getRequestDispatcher("/register.jsp").forward(
                    request, response); 
        
        
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
    private static final String PASSWORD_PATTERN = 
              "((?=.*\\d)(?=.*[a-z]).{6,20})";
    private Pattern pattern;
	  private Matcher matcher;
    public boolean validate(final String password){
		pattern = Pattern.compile(PASSWORD_PATTERN);

		  matcher = pattern.matcher(password);
		  return matcher.matches();
	    	    
	  }
    
    public String username;
    
    
}
