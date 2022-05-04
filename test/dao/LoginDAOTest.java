/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import model.User;
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
public class LoginDAOTest {
    private static LoginDAO lgdao; 
    private static Connection con;
    
    public LoginDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        lgdao = new LoginDAO();
        con = DAO.con;
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of checkLogin method, of class LoginDAO.
     */
    @Test
    public void testCheckLogin_fail() throws Exception {
        String username = "littlemiracle";
        String password = "carlsen";
        User u = new User(username,password);
        Assert.assertNull(lgdao.checkLogin(u));
    }

    @Test
    public void testCheckLogin_successful() throws Exception {
        String username = "kai";
        String password = "123";
        String expected_role = "admin";
        User u = new User(username,password);
        String actual_role = lgdao.checkLogin(u);
        Assert.assertEquals(expected_role, actual_role);
    }
    /**
     * Test of getID method, of class LoginDAO.
     */
    @Test
    public void testGetID_fail() throws Exception {
        int expected_id = -1;
        String username = "kai29";
        String password = "123";
        User u = new User(username,password);
        int actual_id = lgdao.getID(u);
        Assert.assertEquals(expected_id, actual_id);
    }
    
    @Test
    public void testGetID_success() throws Exception {
        int expected_id = 3;
        String username = "kai";
        String password = "123";
        User u = new User(username,password);
        int actual_id = lgdao.getID(u);
        Assert.assertEquals(expected_id, actual_id);
    }
}
