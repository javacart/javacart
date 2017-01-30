/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

/**
 *
 * @author mohammadghasemy
 */
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
 
    @WebServlet(name = "FileServer", urlPatterns ={"/khfr9553/*"})
    public class FileServer extends HttpServlet {
        protected void doGet(HttpServletRequest request,HttpServletResponse response)
                throws ServletException, IOException {
 
            String fileName = request.getRequestURI();
            String justName = fileName.substring(fileName.lastIndexOf("/"),
                    fileName.length());
//            int pos = request.getContextPath().length();
            int pos=fileName.indexOf("/khfr9553/")+10;
            fileName = "/khfr9553/" + fileName.substring(pos, fileName.length());
            BufferedInputStream buf = null;
            ServletOutputStream myOut = null;
 
            try {
                myOut = response.getOutputStream();
                File myfile = new File(fileName);
 
                response.setContentLength((int) myfile.length());
 
                //statement useful in IE browsers
                if (fileName.endsWith(".css")) {
                    response.setContentType("text/css");
                } else if (fileName.endsWith(".js")) {
                    response.setContentType("text/javascript");
                } else {
                    response.setContentType(request.getContentType());
                }
 
                FileInputStream input = new FileInputStream(myfile);
                buf = new BufferedInputStream(input);
                int readBytes = 0;
 
                //read from the file; write to the ServletOutputStream
                while ((readBytes = buf.read()) != -1) {
                    myOut.write(readBytes);
                }
 
            } catch (IOException ioe) {
                throw new ServletException(ioe.getMessage());
            } finally {
                //close the input/output streams
                if (myOut != null) {
                    myOut.close();
                }
                if (buf != null) {
                    buf.close();
                }
            }
        }
    }
