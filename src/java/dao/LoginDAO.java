/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Client;
import model.User;

/**
 *
 * @author dotav
 */
public class LoginDAO extends DAO{

    public LoginDAO() {
        super();
    }
    
    public String checkLogin(User u) throws Exception{
        String query = "SELECT * FROM tbluser WHERE username = ? AND password = ?";
        try{
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1,u.getUsername());
            ps.setString(2,u.getPassword());
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                String role = rs.getString("role");
                return role;
            }
        } catch(Exception e){
            throw e;
        }
        return null;
    }
    
    public int getID(User u) throws Exception{
        String query = "SELECT * FROM tbluser WHERE username = ? AND password = ?";
        try{
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1,u.getUsername());
            ps.setString(2,u.getPassword());
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("ID");
                return id;
            }
        } catch(Exception e){
            throw e;
        }
        return -1;
    }
}
