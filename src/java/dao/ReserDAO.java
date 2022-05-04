/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ClientStat;
import model.Reser;

/**
 *
 * @author dotav
 */
public class ReserDAO extends DAO{

    public ReserDAO() {
        super();
    }
    
    public boolean saveReser(String name, String phone, int quantity, String booked_date, String booked_time, int id){
        String query = "INSERT INTO tblreser(name,phone,quantity,booked_date,booked_time,userid,is_ordered,is_paid,amount) VALUES "
                + "(?,?,?,?,?,?,0,0,0)";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setInt(3, quantity);
            ps.setString(4, booked_date);
            ps.setString(5, booked_time);
            ps.setInt(6, id);
            int rs = ps.executeUpdate();
            if (rs == 1) return true;
        } catch (SQLException ex) {
            Logger.getLogger(ReserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ArrayList<Reser> getReser(int id){
        ArrayList<Reser> res = new ArrayList<>();
        String query = "SELECT * FROM tblreser WHERE userid = ? and is_ordered = 0";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int reser_id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int quantity = rs.getInt("quantity");
                String date = rs.getString("booked_date");
                String time = rs.getString("booked_time");
                int user_id = rs.getInt("userid");
                int is_ordered = rs.getInt("is_ordered");
                int is_paid = rs.getInt("is_paid");
                float amount = rs.getFloat("amount");
                res.add(new Reser(reser_id,name,phone,quantity,date,time,user_id,is_ordered,is_paid,amount));
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public Reser getOrderReser(int id){
        ArrayList<Reser> res = new ArrayList<>();
        String query = "SELECT * FROM tblreser WHERE id = ? and is_ordered = 1";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int reser_id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int quantity = rs.getInt("quantity");
                String date = rs.getString("booked_date");
                String time = rs.getString("booked_time");
                int user_id = rs.getInt("userid");
                int is_ordered = rs.getInt("is_ordered");
                int is_paid = rs.getInt("is_paid");
                float amount = rs.getFloat("amount");
                return new Reser(reser_id,name,phone,quantity,date,time,user_id,is_ordered,is_paid,amount);
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public boolean changeStatus(int reser_id, float amount){
        String query = "UPDATE tblreser "
                + "SET is_ordered = 1, amount = ? "
                + "WHERE id=?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setFloat(1, amount);
            ps.setInt(2, reser_id);
            int rs = ps.executeUpdate();
            if (rs != 0) return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<ClientStat> getClientStat(String begin_date, String end_date){
        List<ClientStat> res = new ArrayList<>();
        int[] clientlist;
        clientlist = new int[100000];   
        int cnt=0;
        //
        String query = "SELECT DISTINCT UserId FROM tblreser "
                + "Where booked_date BETWEEN ? AND ?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setDate(1, java.sql.Date.valueOf(begin_date));
            ps.setDate(2, java.sql.Date.valueOf(end_date));
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int client_id = Integer.parseInt(rs.getString("UserId"));
                clientlist[cnt] = client_id;
                cnt++;
            }
        } catch (Exception e) {
        }
        for (int i = 0; i < cnt; i++){
            float sum=0;
            int client_id = clientlist[i];
            query = "SELECT amount FROM tblreser " 
                + "Where userid = ? and booked_date BETWEEN ? AND ?";
            try {
                PreparedStatement  ps = con.prepareStatement(query);
                ps.setInt(1, client_id);
                ps.setDate(2, java.sql.Date.valueOf(begin_date));
                ps.setDate(3, java.sql.Date.valueOf(end_date));
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    float amount = rs.getFloat("amount");
                    sum+=amount;
                }
                res.add(new ClientStat(client_id,sum));
            } catch (Exception e) {
            }
        }
        for (ClientStat i:res){
            float sum=0;
            int client_id = i.getClient_id();
            System.out.println(client_id);
            query = "SELECT name FROM tbluser " 
                + "Where id = ?";
            try {
                PreparedStatement  ps = con.prepareStatement(query);
                ps.setInt(1, client_id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    String name = rs.getString("name");
                    i.setClient_name(name);
                }
            } catch (Exception e) {
            }
        }
        return res;
    }
    
    public ArrayList<Reser> getStatReser(int id, String begin_date, String end_date){
        ArrayList<Reser> res = new ArrayList<>();
        String query = "SELECT * FROM tblreser WHERE userid = ? AND booked_date BETWEEN ? AND ? AND is_ordered = 1";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.setDate(2, java.sql.Date.valueOf(begin_date));
            ps.setDate(3, java.sql.Date.valueOf(end_date));
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int reser_id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int quantity = rs.getInt("quantity");
                String date = rs.getString("booked_date");
                String time = rs.getString("booked_time");
                int client_id = rs.getInt("userid");
                float amount = rs.getFloat("amount");
                res.add(new Reser(reser_id,name,phone,quantity,date,time,client_id,amount));
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public ArrayList<Reser> getOrderedReser(String clientname){
        ArrayList<Reser> res = new ArrayList<>();
        String query = "SELECT * FROM tblreser WHERE name LIKE ? and is_ordered = 1 and is_paid=0";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1, "%"+clientname+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int reser_id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                int quantity = rs.getInt("quantity");
                String date = rs.getString("booked_date");
                String time = rs.getString("booked_time");
                res.add(new Reser(reser_id,name,phone,quantity,date,time));
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public boolean confirmPayment(int reser_id){
        String query = "UPDATE tblreser "
                + "SET is_paid = 1 "
                + "WHERE id=?";
        try {
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(1, reser_id);
            int rs = ps.executeUpdate();
            if (rs != 0) return true;
        } catch (Exception e) {
        }
        return false;
    }
}
