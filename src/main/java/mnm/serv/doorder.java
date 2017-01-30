/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.serv;

import mnm.util.db;
import mnm.util.persian;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author mohammadghasemy
 */
public class doorder extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        HashMap<String, Integer> carts=(HashMap<String, Integer>)session.getAttribute("carts");
        if(null==carts){
        return;
        }
        int cost=Integer.parseInt(session.getAttribute("carts_cost").toString());
        String user=(String)session.getAttribute("ukey");
        String s=new persian().persiandate_time(new Date());
        s=s.replaceAll("/","").replaceAll(":", "").replaceAll("،‏", "").replaceAll(" ", "");
        String orderNum=getNumber(s);
        String oid=d.insert_oders(user, cost, new persian().persiandataonly(new Date()), orderNum);
        try{
            for (Map.Entry<String, Integer> entry : carts.entrySet()) {
                String key = entry.getKey();
                Integer value = entry.getValue();
                d.insert_oder(value, oid, key);
            }
        }catch(Exception ss){
        ss.printStackTrace();
        }
        
        //clear carts!
        session.setAttribute("carts",null);
        session.setAttribute("carts_cost","0");
        session.setAttribute("carts_id","");
        
        
        getServletContext().getRequestDispatcher("/orders.jsp").forward(
                    request, response);
    }
    
    public String getNumber(String in){
        String res="";
        for(char c:in.toCharArray()){
            res+=Character.getNumericValue(c);
        }
        return res;
    }
   
    
}
