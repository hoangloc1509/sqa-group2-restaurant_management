/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author dotav
 */
public class ReservationDAO extends DAO{

    public ReservationDAO() {
        super();
    }
    
    public void saveReservation(int id) throws Exception{
        String query = "INSERT INTO tblreservation(checkin,clientid) VALUES (?, ?)"; 
        try{
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setInt(2,id);
            ps.setString(1,dtf.format(now));
            int rs = ps.executeUpdate();
            //if (rs == 1) return true;
        } catch(Exception e){
            throw e;
        }
        //return false;
    }
    
}
