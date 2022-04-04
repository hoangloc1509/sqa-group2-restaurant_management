/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Table;

/**
 *
 * @author dotav
 */
public class TableDAO extends DAO{

    public TableDAO() {
        super();
    }
    
    public ArrayList<Table> searchTable(String date) throws Exception{
        ArrayList<Table> res = new ArrayList<>();
        try {
            Date date1 = new SimpleDateFormat("dd-M-yyyy hh:mm:ss").parse(date);
            String query = "SELECT * FROM tbltable WHERE id not in(" 
                    + "Select tableid from tblbookedtable "
                    + "where time != ? )";
            try{
                PreparedStatement  ps = con.prepareStatement(query);
                ps.setString(1, date);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    int id = rs.getInt("id");
                    int capacity = rs.getInt("Capacity");
                    int number = rs.getInt("Number");
                    res.add(new Table(id,capacity,number));
                }
                return res;
            } catch(Exception e){
                throw e;
            }
        } catch (ParseException ex) {
            Logger.getLogger(TableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
