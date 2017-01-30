/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.util;

import mnm.dao.User_google;
import mnm.dao.Users;

import java.sql.*;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author mohammadghasemy
 */
public class db {

    public String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    final String DB_URL = "jdbc:mysql://localhost/javacart?useUnicode=true&characterEncoding=UTF-8";
    Connection conn = null;
    Statement stmt = null;
    final String USER = "root";
    final String PASS = "xxx";

    public db() {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
        } catch (Exception s) {
        }
    }

    public boolean select_pass(String mail, String uuid) {
        try {
            String sql = "update users set password='" + uuid + "'  where  username='" + mail + "'";
            int i = stmt.executeUpdate(sql);
            if (i == 0) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public int update_user(String id,String firstname,String tel,String add,
        String phone,String addjob,String meli,String lastname,
        String post,
        String state,
        String city
            ){
        try {
            String sql = "update users set "
                    + "`name`='"+firstname+"',"
                    + "`tel`='"+tel+"',"
                    + "`address`='"+add+"',"
                    + "`lastname`='"+lastname+"',"
                    + "`addres_job`='"+addjob+"',"
                    + "`postcode`='"+post+"',"
                    + "`melicode`='"+meli+"',"
                    + "`province`='"+state+"',"
                    + "`city`='"+city+"',"
                    + "`phone`='"+phone+"'"
                    + " where id = '"+id+"' ";
            int r=stmt.executeUpdate(sql);
            return r;
        }catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    public int update_user_pass_check(String u,String p,String newp){
        try {
            String sql = "update users set password='"+newp+"' where id = '"+u+"' and password='"+p+"'";
            int r=stmt.executeUpdate(sql);
            return r;
        }catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    public boolean select_user(User_google u) {
        try {
            String psql = "select id from users where username='" + u.user + "'";
            ResultSet rs = stmt.executeQuery(psql);
            boolean registered = false;
            while (rs.next()) {
                registered = true;
                u.mainid = rs.getString("id");

            }
            String sql = "";
            if (!registered) {
                sql = "insert into users (username,password,google_id, google_name, google_given_name, google_family_name, google_link, google_picture, google_gender,name) values (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                preparedStatement.setString(1, u.user);
                preparedStatement.setString(2, u.pass);
                preparedStatement.setString(3, u.id);
                preparedStatement.setString(4, u.name);
                preparedStatement.setString(5, u.gname);
                preparedStatement.setString(6, u.fname);
                preparedStatement.setString(7, u.link);
                preparedStatement.setString(8, u.pic);
                preparedStatement.setString(9, u.gender);
                preparedStatement.setString(10, u.name);
                preparedStatement.executeUpdate();
                ResultSet rs2 = preparedStatement.getGeneratedKeys();
                if (rs2.next()) {
                    u.mainid = rs2.getInt(1) + "";
                }
            } else {
                sql = "update users set google_id=?, google_name=?, google_given_name=?, google_family_name=?, google_link=?, google_picture=?, google_gender=? where username=?";
                PreparedStatement preparedStatement = conn.prepareStatement(sql);

                preparedStatement.setString(1, u.id);
                preparedStatement.setString(2, u.name);
                preparedStatement.setString(3, u.gname);
                preparedStatement.setString(4, u.fname);
                preparedStatement.setString(5, u.link);
                preparedStatement.setString(6, u.pic);
                preparedStatement.setString(7, u.gender);
                preparedStatement.setString(8, u.user);
                preparedStatement.executeUpdate();
            }

            return registered;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public void insert_user(String u, String p, String name) {
        try {
            String sql = "insert into users (name,username,password) values ('" + name + "','" + u + "','" + p + "')";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public boolean insert_ticket(String text, String ticketnumber, String user, String sub) {
        try {
            if (null == ticketnumber) {
                String sql2 = "select ticketnumber from tickets order by ticketnumber DESC limit 1";

                ResultSet resultSet = stmt.executeQuery(sql2);

                while (resultSet.next()) {

                    ticketnumber = (Integer.parseInt(resultSet.getString("ticketnumber")) + 1) + "";
                }
            }
            String sql = "insert into tickets (subject,texts,ticketnumber,dtpersian,iduser) values ('" + sub + "','" + text + "','" + ticketnumber + "','" + new persian().persiandate(new Date()) + "'," + user + ")";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public String insert_bill(String plan, String iduser, String cost) {
        String id = "";
        try {
            // Register JDBC driver
            String sql = "insert into bill (dt,iduser,price,plan,description) values ('" + new persian().persiandate(new Date())
                    + "'," + iduser + ",'" + cost + "','" + plan + "','" + plan + "')";
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                id = "" + (rs.getInt(1));
            }

        } catch (Exception e) {
            return "";
        }
        return id;
    }
    public String insert_oders(String iduser, int cost, String dt,String oN) {
        String id = "";
        try {
            // Register JDBC driver
            String sql = "insert into store_order"
                    + " (dt,iduser,cost,orderNum) values "
                    + "('" + new persian().persiandate(new Date())
                    + "'," + iduser + ",'" + cost + "','" + oN + "')";
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                id = "" + (rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return id;
    }
    public void insert_oder(int am, String oid, String pid) {
        String id = "";
        try {
            // Register JDBC driver
            String sql = "insert into store_order_item"
                    + " (amount,product_id,order_id) values "
                    + "('"+ am
                    + "'," + pid + ",'" + oid + "')";
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            

        } catch (Exception e) {
         e.printStackTrace();
        }
    }

    public boolean insert_hesab(String card, String shaba, String expire, String bank, String user) {
        try {
            stmt.executeUpdate("insert into hesab (cardnumber,shaba,expir,bankname,dt,userid) values"
                    + "('" + card + "','" + shaba + "','" + expire + "','" + bank + "','" + new persian().persiandate(new Date()) + "'," + user + ")");
        } catch (Exception e) {
            e.printStackTrace();

        }
        return true;
    }

    public boolean insert_merchent(String site, String name, String tel, String desc, String user) {
        try {
            stmt.executeUpdate("insert into dargah (domain,name,tel,description,dt,userid) values"
                    + "('" + site + "','" + name + "','" + tel + "','" + desc + "','" + new persian().persiandate(new Date()) + "'," + user + ")");
        } catch (Exception e) {
            e.printStackTrace();

        }
        return true;
    }

    public boolean insert_transaction(String dargahid, String price, String hesab, String user) {
        try {
            stmt.executeUpdate("insert into transaction (iddargah,price,idhesab,dt,userid) values"
                    + "(" + dargahid + ",'" + price + "','" + hesab + "','" + new persian().persiandate(new Date()) + "'," + user + ")");
        } catch (Exception e) {
            e.printStackTrace();

        }
        return true;
    }

    public int select_cost(Map<String, Integer> carts) {
        int cost = 0;
        try {
            String ids = "";
            for (String s : carts.keySet()) {
                ids += s + ",";
            }
            if (ids.length() > 0) {
                ids = ids.substring(0, ids.length() - 1);
            }else{
                ids="0";
            }
            
            String sql = "select price  from store_products where id in ("
                    + ids + ")";
            
            Map<String, Integer> map = new TreeMap<String, Integer>(carts);
            Iterator it = map.values().iterator();
            ResultSet resultSet = stmt.executeQuery(sql);
            int c = 0;
            while (resultSet.next()) {
                it.hasNext();
                int v = Integer.parseInt(it.next().toString());
                cost += v * Integer.parseInt(resultSet.getString("price"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return cost;
    }

    public Users select_user(String u, String p) {
        try {
            boolean key = false;
            Users us = new Users();
            String sql = "select id,name,tel from users where username = '" + u + "' and password='" + p + "'";

            ResultSet resultSet = stmt.executeQuery(sql);

            while (resultSet.next()) {
                key = true;
                us.setId(resultSet.getInt("id"));
                us.setName(resultSet.getString("name"));
                us.setTel(resultSet.getString("tel"));
            }

//            stmt.close();
//            conn.close();
            //Update the Db
            if (key) {
                return us;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
