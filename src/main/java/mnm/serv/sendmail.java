/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.util.Date;
import java.util.Properties;

/**
 *
 * @author mohammadghasemy
 */
public class sendmail {
public void sendingmail(String sub,String text,String to){
        Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("pay4buy.ir@gmail.com", "XXXX");
            }
        });

            try {

                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("pay4buy.ir@gmail.com"));
                message.setHeader("Content-Type","text/plain; charset=UTF-8");
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(to));
                message.setSubject(MimeUtility.encodeText(sub, "UTF-8", "Q"),"UTF-8");
                
                
                message.setContent(text, "text/html;charset=UTF-8");
                message.setSentDate(new Date());
                message.saveChanges();
                Transport.send(message);
                
                System.out.println("Done");

            } catch (Exception e) {
                throw new RuntimeException(e);
            }
    }    
public static void main(String a[]){
    sendmail mnm=new sendmail();
    
    mnm.sendingmail("ثبت  در ", m(), "mohammad.ghasemy@gmail.com");
}
public static String m(){
   return new mnm.email.email_request().getTxt();
}
}
