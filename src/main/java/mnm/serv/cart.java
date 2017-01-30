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
public class cart extends HttpServlet{
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        db d=(db)session.getAttribute("database");
        if(null==d){
        d=new db();
        session.setAttribute("database",d);
        }
        int num=1;
        String id=(String)request.getParameter("id");
        try{
            num=Integer.parseInt(request.getParameter("num"));
        }catch(Exception s){}
        HashMap<String, Integer> carts=(HashMap<String, Integer>)session.getAttribute("carts");
        if(null==carts){
        carts = new HashMap<String,Integer>();
        session.setAttribute("carts",carts);
        }
        try{
        if(null!=id&&id.length()>0&&Integer.parseInt(id)>0&&!carts.containsKey(id))
        {
            carts.put(id,num);
        }
        }catch(Exception s){
            return;
        }
        
        int cost=d.select_cost(carts);
        
        String ids="";
           for(String s:carts.keySet()){
               ids+=s+",";
           }
           if(ids.length()>0)
           ids=ids.substring(0, ids.length()-1);
        System.out.println(ids+"\t"+cost);   
        session.setAttribute("carts_cost",cost);
        session.setAttribute("carts_id",ids);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(
                    request, response);
    }
    
    
   
    
}
