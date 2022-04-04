/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Dish;

/**
 *
 * @author dotav
 */
public class DishDAO extends DAO{

    public DishDAO() {
        super();
    }
    
    public List<Dish> getAllDish(String dish_name){
        List<Dish> res = new ArrayList<>();
        String query = "SELECT * FROM tbldish Where name LIKE ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+ dish_name + "%");
            ResultSet rs = ps.executeQuery();
             while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    String type = rs.getString("type");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    res.add(new Dish(id,name,type, image, price, description));
                }
        } catch (Exception e) {
        }
        return res;
    }
    
    public List<Dish> getAppetitDish(String dish_name){
        List<Dish> res = new ArrayList<>();
        String query = "SELECT * FROM tbldish Where type ='Khai vị' and name LIKE ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+ dish_name + "%");
            ResultSet rs = ps.executeQuery();
             while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    String type = rs.getString("type");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    res.add(new Dish(id,name,type, image, price, description));
                }
        } catch (Exception e) {
        }
        return res;
    }

    public List<Dish> getMainDish(String dish_name){
        List<Dish> res = new ArrayList<>();
        String query = "SELECT * FROM tbldish Where type ='Món chính' and name LIKE ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+ dish_name + "%");
            ResultSet rs = ps.executeQuery();
             while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    String type = rs.getString("type");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    res.add(new Dish(id,name,type, image, price, description));
                }
        } catch (Exception e) {
        }
        return res;
    }
    
    public List<Dish> getDessertDish(String dish_name){
        List<Dish> res = new ArrayList<>();
        String query = "SELECT * FROM tbldish Where type ='Tráng miệng' and name LIKE ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+ dish_name + "%");
            ResultSet rs = ps.executeQuery();
             while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    String type = rs.getString("type");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    res.add(new Dish(id,name,type, image, price, description));
                }
        } catch (Exception e) {
        }
        return res;
    }
    
    public List<Dish> getDrink(String dish_name){
        List<Dish> res = new ArrayList<>();
        String query = "SELECT * FROM tbldish Where type ='Đồ uống' and name LIKE ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+ dish_name + "%");
            ResultSet rs = ps.executeQuery();
             while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    String type = rs.getString("type");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    res.add(new Dish(id,name,type, image, price, description));
                }
        } catch (Exception e) {
        }
        return res;
    }
}
