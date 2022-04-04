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
import model.DishOrdered;
import model.Reser;

/**
 *
 * @author dotav
 */
public class DishOrderedDAO extends DAO{

    public DishOrderedDAO() {
        super();
    }
    
    public String matchName(int dish_id){
        String query = "SELECT name FROM tbldish WHERE id = ? ";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, dish_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                return name;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public float matchPrice(int dish_id){
        String query = "SELECT price FROM tbldish WHERE id = ? ";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, dish_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                float price = rs.getFloat("price");
                return price;
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public void saveOrder(String name, int quantity, float price, int dish_id, int reser_id) throws Exception{
        String query = "INSERT INTO tbldishordered(name,quantity,price,dish_id,reser_id) VALUES (?,?,?, ?,?)";
        try{
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1,name);
            ps.setInt(2,quantity);
            ps.setFloat(3,price);
            ps.setInt(4, dish_id);
            ps.setInt(5, reser_id);
            int rs = ps.executeUpdate();
            //if (rs == 1) return true;
        } catch(Exception e){
            throw e;
        }
    }
    
    public List<DishOrdered> getDishOrdered(int reser_id){
        List<DishOrdered> list = new ArrayList<>();
        String query = "SELECT * FROM tbldishordered WHERE reser_id = ? ";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, reser_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int dish_id = rs.getInt("dish_id");
                int quantity = rs.getInt("quantity");
                String name = rs.getString("name");
                float price = rs.getFloat("price");
                list.add(new DishOrdered(id,dish_id,reser_id,quantity,name,price));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
