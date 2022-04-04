/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author dotav
 */
public class BookedTableDAO extends DAO{

    public BookedTableDAO() {
        super();
    }
    
    public void saveBookedTable(String time,int tableid, int reserid) throws Exception{
        String query = "INSERT INTO tblbookedtable(time,tableid,reserid) VALUES (?, ?,?)"; 
        try{
            PreparedStatement  ps = con.prepareStatement(query);
            ps.setString(1,time);
            ps.setInt(2,tableid);
            ps.setInt(3,reserid);
            int rs = ps.executeUpdate();
            //if (rs == 1) return true;
        } catch(Exception e){
            throw e;
        }
        //return false;
    }
}
