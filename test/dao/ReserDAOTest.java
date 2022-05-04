/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.ClientStat;
import model.Reser;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author profe
 */
public class ReserDAOTest {
    private static Connection con;
    private static ReserDAO reserdao;
    private static ArrayList<Reser> res;
    PreparedStatement  ps;
    public ReserDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
       reserdao = new ReserDAO();
       con = DAO.con;
       
    }
    
    @AfterClass
    public static void tearDownClass() {
        res.clear();
    }
    
    @Before
    public void setUp() {
        
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveReser method, of class ReserDAO.
     */
    
    @Test
    public void testSaveReser_successful() {
        try{
            con.setAutoCommit(false);
            String name = "Phong";
            String phone = "0132567812";
            int quantity = 12;
            String date = "2022-03-20";
            String time = "08:00:00";
            int userid = 1;
            boolean actual = reserdao.saveReser(name, phone, quantity, date,time, userid);
            Assert.assertTrue(actual);
            res = reserdao.getReser(userid);
            Assert.assertEquals(res.get(res.size()-1).getName(),name);
            Assert.assertEquals(res.get(res.size()-1).getPhone(),phone);
            Assert.assertEquals(res.get(res.size()-1).getQuantity(), quantity);
            Assert.assertEquals(res.get(res.size()-1).getDate(), date);
            Assert.assertEquals(res.get(res.size()-1).getTime(), time);
            Assert.assertEquals(res.get(res.size()-1).getClient_id(), userid);
            Assert.assertEquals(res.get(res.size()-1).getIs_ordered(), 0);
            Assert.assertEquals(res.get(res.size()-1).getIs_paid(), 0);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

    /**
     * Test of getReser method, of class ReserDAO.
     */
    @Test
    public void testGetReser_noReser() {
        int userid = 0;
        ArrayList<Reser> listReser = reserdao.getReser(userid);
        Assert.assertNotNull(listReser);
        Assert.assertEquals(listReser.size(), 0);
    }
    
    @Test
    public void testGetReser_manyReser() {
        int userid = 1;
        ArrayList<Reser> listReser = reserdao.getReser(userid);
        Assert.assertNotNull(listReser);
        Assert.assertEquals(listReser.size(), 2);
        for (int i =0; i < listReser.size(); i++){
            Assert.assertEquals(listReser.get(i).getClient_id(),userid);
        }
    }
    /**
     * Test of getOrderReser method, of class ReserDAO.
     */
    @Test
    public void testGetOrderReser_noOrderedReser() {
        int reserid = 0;
        Reser rs = reserdao.getOrderReser(reserid);
        Assert.assertNull(rs);
    }
    @Test
    public void testGetOrderReser_ManyOrderedReser() {
        int reserid = 1;
        Reser rs = reserdao.getOrderReser(reserid);
        Assert.assertNotNull(rs);
        Assert.assertEquals(rs.getId(),reserid);
    }
    /**
     * Test of changeStatus method, of class ReserDAO.
     */
    @Test
    public void testChangeStatus_successful() {
        int reser_id = 8;
        float amount = 250000;
        try{
            con.setAutoCommit(false);
            boolean actual = reserdao.changeStatus(reser_id, amount);
            Assert.assertTrue(actual);
            Reser rs = reserdao.getOrderReser(reser_id);
            Assert.assertEquals(rs.getId(),reser_id);
            Assert.assertEquals(rs.getAmount(),amount,0.00001);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void testChangeStatus_unsuccessful() {
        int reser_id = 15;
        float amount = 241000;
        try{
            con.setAutoCommit(false);
            boolean actual = reserdao.changeStatus(reser_id, amount);
            Assert.assertFalse(actual);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void testChangeStatus_changesameStatus() {
        int reser_id = 5;
        float amount = 241000;
        try{
            con.setAutoCommit(false);
            boolean actual = reserdao.changeStatus(reser_id, amount);
            Assert.assertFalse(actual);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    /**
     * Test of getClientStat method, of class ReserDAO.
     */
    @Test
    public void testGetClientStat_noClient() {
        String begin_date = "2020-03-20";
        String end_date = "2020-01-20";
        List<ClientStat> res= reserdao.getClientStat(begin_date, end_date);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),0);
    }

    @Test
    public void testGetClientStat_manyClient() {
        String begin_date = "2022-03-20";
        String end_date = "2022-03-30";
        List<ClientStat> res= reserdao.getClientStat(begin_date, end_date);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),4);
    }
    /**
     * Test of getStatReser method, of class ReserDAO.
     */
    @Test
    public void testGetStatReser_noReser() {
        int userid=15;
        String begin_date = "2022-03-20";
        String end_date = "2022-03-30";
        ArrayList<Reser> res = reserdao.getStatReser(userid, begin_date, end_date);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),0);
    }
    
    @Test
    public void testGetStatReser_manyReser() {
        int userid=1;
        String begin_date = "2022-03-20";
        String end_date = "2022-03-30";
        ArrayList<Reser> res = reserdao.getStatReser(userid, begin_date, end_date);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),2);
        for (int i = 0; i < res.size(); i++){
            Assert.assertEquals(userid, res.get(i).getClient_id());
        }
    }
    /**
     * Test of getOrderedReser method, of class ReserDAO.
     */
    @Test
    public void testGetOrderedReser_noOrdered() {
        String clientname="Huy";
        ArrayList<Reser> res = reserdao.getOrderedReser(clientname);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),0);
    }
    @Test
    public void testGetOrderedReser_manyOrdered() {
        String clientname="Phong";
        ArrayList<Reser> res = reserdao.getOrderedReser(clientname);
        Assert.assertNotNull(res);
        Assert.assertEquals(res.size(),1);
        for (int i =0 ; i < res.size(); i++){
            Assert.assertTrue(res.get(i).getName().toLowerCase().contains(clientname.toLowerCase()));
        }
    }
    /**
     * Test of confirmPayment method, of class ReserDAO.
     */
    @Test
    public void testConfirmPayment_successful() {
        try{
            con.setAutoCommit(false);
            int reser_id = 2;
            boolean actual = reserdao.confirmPayment(reser_id);
            assertTrue(actual);
            Reser rs = reserdao.getOrderReser(reser_id);
            Assert.assertEquals(rs.getId(),reser_id);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void testConfirmPayment_unsuccessful() {
        try{
            con.setAutoCommit(false);
            int reser_id = 0;
            boolean actual = reserdao.confirmPayment(reser_id);
            assertFalse(actual);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
    
    @Test
    public void testConfirmPayment_confirmsameStatus() {
        try{
            con.setAutoCommit(false);
            int reser_id = 3;
            boolean actual = reserdao.confirmPayment(reser_id);
            assertFalse(actual);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(!con.getAutoCommit()) {
                    con.rollback();
                    con.setAutoCommit(true);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}
