/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.dao;

import org.json.JSONObject;

/**
 *
 * @author mohammadghasemy
 */

        public class User_google{
            public String user;
            public String id;
            public String name;
            public String gname;
            public String fname;
            public String link;
            public String pic;
            public String gender;
             
            public String pass;
            public String mainid;
             public void fetch(String google){
                 JSONObject json=null;
                 try{
                     json = new JSONObject(google);

                     user=(String)json.get("email");
              
              pass="";
              
             }catch(Exception ss){} try{
              id=(String)json.get("id");
             }catch(Exception ss){} try{
              name=(String)json.get("name");
             }catch(Exception ss){} try{
              gname=(String)json.get("given_name");
             }catch(Exception ss){} try{
              fname=(String)json.get("family_name");
             }catch(Exception ss){} try{
              link=(String)json.get("link");
             }catch(Exception ss){} try{
              pic=(String)json.get("picture");
             }catch(Exception ss){} try{
              gender=(String)json.get("gender");
             }catch(Exception ss){} 
             }
        }
