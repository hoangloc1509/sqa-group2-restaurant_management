/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.ClientStat;

/**
 *
 * @author dotav
 */
public class ClientDAO extends DAO{

    public ClientDAO() {
        super();
    }
    
    public String[] matchName(List<ClientStat> lcs){
        String res[] = null;
        int cnt=0;
        for (ClientStat c:lcs){
            String query = "SELECT name FROM tblclient WHERE id = ? ";
            try {
                PreparedStatement  ps = con.prepareStatement(query);
                ps.setInt(1, c.getClient_id());
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    String name = rs.getString("name");
                    cnt++;
                    res[cnt] = name;
                }
            } catch (Exception e) {
            }
        }
        return res;
    }
}
