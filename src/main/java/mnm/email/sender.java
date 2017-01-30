/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.email;

import mnm.serv.sendmail;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.io.UnsupportedEncodingException;



/**
 *
 * @author mohammadghasemy
 */
public class sender extends Thread{
    String mail,text,sub;
    public void set(String m,String s,String t) {
    mail=m;
    text=t;
    sub=s;
    }
    
    public void run(){
         System.out.println("this thread is runing..."+mail+"\t");
        
        if(mail!=null&&isValidEmailAddress(mail)){
            try{
            mail =new String(mail.getBytes("ISO8859_1"), "UTF-8");
            }catch(UnsupportedEncodingException s){}
        
            sendmail sm=new sendmail();
            sm.sendingmail(sub,text,mail);
        } 
        System.out.println("this thread is finish...#############");
        this.stop();
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
}
