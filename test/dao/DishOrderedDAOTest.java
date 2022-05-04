/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.util.List;
import model.DishOrdered;
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
public class DishOrderedDAOTest {
    private static DishOrderedDAO DOdao; 
    private static Connection con;
    
    public DishOrderedDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        DOdao = new DishOrderedDAO();
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
     * Test of matchName method, of class DishOrderedDAO.
     */
    @Test
    public void testMatchName_true() {
        int dish_id = 3;
        String actual = DOdao.matchName(dish_id);
        Assert.assertEquals(actual, "Gà quay");
    }

    @Test
    public void testMatchName_false() {
        int dish_id = 15;
        String actual = DOdao.matchName(dish_id);
        Assert.assertNull(actual);
    }
    /**
     * Test of matchPrice method, of class DishOrderedDAO.
     */
    @Test
    public void testMatchPrice_true() {
        int dish_id = 4;
        float expected = 100000;
        float actual = DOdao.matchPrice(dish_id);
        Assert.assertEquals(expected, actual, 0.001);
    }

    @Test
    public void testMatchPrice_false() {
        int dish_id = 14;
        float actual = DOdao.matchPrice(dish_id);
        Assert.assertEquals(actual,0,0.0001);
    }
    /**
     * Test of saveOrder method, of class DishOrderedDAO.
     */
    @Test
    public void testSaveOrder() throws Exception {
        try{
            con.setAutoCommit(false);
            String name = "Gà quay";
            int quantity = 2;
            float price = 20000;
            int dish_id = 3;
            int reser_id = 6;
            DOdao.saveOrder(name, quantity, price, dish_id, reser_id);
            List<DishOrdered> list = DOdao.getDishOrdered(6);
            Assert.assertEquals(list.get(list.size()-1).getName(), name);
            Assert.assertEquals(list.get(list.size()-1).getQuantity(), quantity);
            Assert.assertEquals(list.get(list.size()-1).getPrice(), price, 0.001);
            Assert.assertEquals(list.get(list.size()-1).getDish_id(), dish_id);
            Assert.assertEquals(list.get(list.size()-1).getReser_id(), reser_id);
            //System.out.println(list.getPrice());
            /*Assert.assertNotNull(list);
            Assert.assertEquals(list.getName(), name);
            Assert.assertEquals(list.getQuantity(), quantity);
            Assert.assertEquals(list.getPrice(), price, 0.001);
            Assert.assertEquals(list.getDish_id(), dish_id);
            Assert.assertEquals(list.getReser_id(), reser_id);*/
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                con.rollback();
                con.setAutoCommit(true);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

    /**
     * Test of getDishOrdered method, of class DishOrderedDAO.
     */
    @Test
    public void testGetDishOrdered_noDish() {
        int reser_id = 0;
        List<DishOrdered> list = DOdao.getDishOrdered(reser_id);
        Assert.assertNotNull(list);
        Assert.assertEquals(list.size(),0);
    }
    
    @Test
    public void testGetDishOrdered_manyDish() {
        int reser_id = 6;
        List<DishOrdered> list = DOdao.getDishOrdered(reser_id);
        Assert.assertNotNull(list);
        Assert.assertEquals(list.size(),4);
        for (int i = 0; i < list.size(); i++){
            Assert.assertEquals(reser_id, list.get(i).getReser_id());
        }
    }
}
