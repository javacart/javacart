/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.email;

/**
 *
 * @author mohammadghasemy
 */
public class email_ticket {
    public String gettext(String name){
        return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
"<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
"<head>\n" +
"  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n" +
"  <title>Email</title>\n" +
"  <style type=\"text/css\">\n" +
"    \n" +
"    /* Take care of image borders and formatting */\n" +
"\n" +
"    img {\n" +
"      max-width: 600px;\n" +
"      outline: none;\n" +
"      text-decoration: none;\n" +
"      -ms-interpolation-mode: bicubic;\n" +
"    }\n" +
"\n" +
"    a {\n" +
"      text-decoration: none;\n" +
"      border: 0;\n" +
"      outline: none;\n" +
"      color: #21BEB4;\n" +
"    }\n" +
"\n" +
"    a img {\n" +
"      border: none;\n" +
"    }\n" +
"\n" +
"    /* General styling */\n" +
"\n" +
"    td, h1, h2, h3  {\n" +
"      font-family: Helvetica, Arial, sans-serif;\n" +
"      font-weight: 400;\n" +
"    }\n" +
"\n" +
"    body {\n" +
"      -webkit-font-smoothing:antialiased;\n" +
"      -webkit-text-size-adjust:none;\n" +
"      width: 100%;\n" +
"      height: 100%;\n" +
"      color: #37302d;\n" +
"      background: #ffffff;\n" +
"    }\n" +
"\n" +
"    table {\n" +
"      background:\n" +
"    }\n" +
"\n" +
"    h1, h2, h3 {\n" +
"      padding: 0;\n" +
"      margin: 0;\n" +
"      color: #ffffff;\n" +
"      font-weight: 400;\n" +
"    }\n" +
"\n" +
"    h3 {\n" +
"      color: #21c5ba;\n" +
"      font-size: 24px;\n" +
"    }\n" +
"  </style>\n" +
"\n" +
"  \n" +
"\n" +
"  <style type=\"text/css\" media=\"only screen and (max-width: 480px)\">\n" +
"    /* Mobile styles */\n" +
"    @media only screen and (max-width: 480px) {\n" +
"      table[class=\"w320\"] {\n" +
"        width: 320px !important;\n" +
"      }\n" +
"\n" +
"      table[class=\"w300\"] {\n" +
"        width: 300px !important;\n" +
"      }\n" +
"\n" +
"      table[class=\"w290\"] {\n" +
"        width: 290px !important;\n" +
"      }\n" +
"\n" +
"      td[class=\"w320\"] {\n" +
"        width: 320px !important;\n" +
"      }\n" +
"\n" +
"      td[class=\"mobile-center\"] {\n" +
"        text-align: center !important;\n" +
"      }\n" +
"\n" +
"      td[class=\"mobile-padding\"] {\n" +
"        padding-left: 20px !important;\n" +
"        padding-right: 20px !important;\n" +
"        padding-bottom: 20px !important;\n" +
"      }\n" +
"    }\n" +
"  </style>\n" +
"</head>\n" +
"<body dir=\"rtl\" class=\"body\" style=\"padding:0; margin:0; display:block; background:#ffffff; -webkit-text-size-adjust:none\" bgcolor=\"#ffffff\">\n" +
"<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" height=\"100%\" >\n" +
"  <tr>\n" +
"    <td align=\"center\" valign=\"top\" bgcolor=\"#ffffff\"  width=\"100%\">\n" +
"\n" +
"    <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n" +
"      <tr>\n" +
"        <td style=\"border-bottom: 3px solid #3bcdc3;\" width=\"100%\">\n" +
"          <center>\n" +
"            <table cellspacing=\"0\" cellpadding=\"0\" width=\"500\" class=\"w320\">\n" +
"              <tr>\n" +
"                <td valign=\"top\" style=\"padding:10px 0; text-align:left;\" class=\"mobile-center\">\n" +
"                  <img  height=\"62\" src=\"http://pay4buy.ir/assets/img/pay4buy_logo.png\">\n" +
"                </td>\n" +
"              </tr>\n" +
"            </table>\n" +
"          </center>\n" +
"        </td>\n" +
"      </tr>\n" +
"      \n" +
"      <tr>\n" +
"        <td valign=\"top\">\n" +
"          <center>\n" +
"            <table cellspacing=\"0\" cellpadding=\"0\" width=\"500\" class=\"w320\">\n" +
"              <tr>\n" +
"                <td>\n" +
"\n" +
"                  <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n" +
"                    <tr>\n" +
"                      <td class=\"mobile-padding\" style=\"text-align:left;\">\n" +
"                      <br>\n" +
"                      <br>\n" +
"                        سلام ,"+name+"<br><br>\n" +
"                        یک تیکت جدید ثبت شده، به زودی همکارانم از طریق سامانه پرداخت برای خرید <a href=\"http://khazeshgar.ir/dashboard/\">بخش پشتیبانی</a>\n" +
"                          پاسخگوی شما هستند.\n" +
"                        <br>\n" +
"\n" +
"                        <br>\n" +
"                        با نهایت تشکر<br>\n" +
"                        پرداخت برای خرید\n" +
"                      </td>\n" +
"                    </tr>\n" +
"                  </table>\n" +
"                </td>\n" +
"              </tr>\n" +
"              <tr>\n" +
"                <td class=\"mobile-padding\">\n" +
"                <br>\n" +
"                <br>\n" +
"                  \n" +
"                  <br>&nbsp;\n" +
"                  <br>\n" +
"                </td>\n" +
"              </tr>\n" +
"            </table>\n" +
"          </center>\n" +
"        </td>\n" +
"      </tr>\n" +
"      <tr>\n" +
"        <td style=\"background-color:#c2c2c2;\">\n" +
"          <center>\n" +
"            <a href=\"http://pay4buy.ir/\">pay4buy.ir</a>\n" +
"          </center>\n" +
"        </td>\n" +
"      </tr>\n" +
"    </table>\n" +
"    </td>\n" +
"  </tr>\n" +
"</table>\n" +
"</body>\n" +
"</html>";
    }
    
}
