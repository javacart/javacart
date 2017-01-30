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
import java.util.HashMap;

/**
 *
 * @author mohammadghasemy
 */
public class cart_del extends HttpServlet{
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
        carts = new HashMap<String,Integer>();
        session.setAttribute("carts",carts);
        return;
        }
        String id=(String)request.getParameter("id");
        try{
                if(null!=id){
                    carts.remove(id);
                }
            }catch(Exception s){
        s.printStackTrace();
        }
        session.setAttribute("carts",carts);
        int cost=d.select_cost(carts);
        System.out.println(cost);
        session.setAttribute("carts_cost",cost);
        String ids="";
           for(String s:carts.keySet()){
               ids+=s+",";
           }
           if(ids.length()>0)
        ids=ids.substring(0, ids.length()-1);
        session.setAttribute("carts_id",ids);
        
        
        getServletContext().getRequestDispatcher("/cart.jsp").forward(
                    request, response);
    }
    
    
   
    
}
