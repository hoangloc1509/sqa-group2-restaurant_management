/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.util.List;
import model.Dish;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author profe
 */
public class DishDAOTest {
    private static DishDAO dd; 
    private static Connection con;
    public DishDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        dd = new DishDAO();
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
     * Test of getAllDish method, of class DishDAO.
     */
    @Test
    public void testGetAllDish_manyDish() {
        String dish_name = "gà";
        List<Dish> result = dd.getAllDish(dish_name);
        assertEquals(3, result.size());
        for (int i =0; i < result.size(); i++){
            assertTrue(result.get(i).getName().toLowerCase().contains(dish_name.toLowerCase()));
        }
    }
    @Test
    public void testGetAllDish_noDish() {
        String dish_name = "hươu";
        List<Dish> result = dd.getAllDish(dish_name);
        assertNotNull(result);
        assertEquals(0, result.size());
    }
    /**
     * Test of getAppetitDish method, of class DishDAO.
     */
    @Test
    public void testGetAppetitDish_noDish() {
        String dish_name = "ổi";
        List<Dish> result = dd.getAppetitDish(dish_name);
        assertNotNull(result);
        assertEquals(0,result.size());
    }
    @Test
    public void testGetAppetitDish_manyDish() {
        String dish_name = "khoai";
        List<Dish> result = dd.getAppetitDish(dish_name);
        assertEquals(1, result.size());
        for (int i =0; i < result.size(); i++){
            assertTrue(result.get(i).getName().toLowerCase().contains(dish_name.toLowerCase()));
        }
    }
    /**
     * Test of getMainDish method, of class DishDAO.
     */
    @Test
    public void testGetMainDish_noDish() {
        String dish_name = "xáo";
        List<Dish> result = dd.getMainDish(dish_name);
        assertNotNull(result);
        assertEquals(0,result.size());
    }

    @Test
    public void testGetMainDish_manyDish(){
        String dish_name = "";
        List<Dish> result = dd.getMainDish(dish_name);
        assertNotNull(result);
        assertEquals(3,result.size());
        for (int i =0; i < result.size(); i++){
            assertTrue(result.get(i).getName().toLowerCase().contains(dish_name.toLowerCase()));
        }
    }
    /**
     * Test of getDessertDish method, of class DishDAO.
     */
    @Test
    public void testGetDessertDish_noDish() {
        String dish_name = "getDessertDish";
        List<Dish> result = dd.getDessertDish(dish_name);
        assertNotNull(result);
        assertEquals(0,result.size());
    }
    
    @Test
    public void testGetDessertDish_manyDish() {
        String dish_name = "u";
        List<Dish> result = dd.getDessertDish(dish_name);
        assertEquals(3,result.size());
        for (int i =0; i < result.size(); i++){
            assertTrue(result.get(i).getName().toLowerCase().contains(dish_name.toLowerCase()));
        }
    }
    /**
     * Test of getDrink method, of class DishDAO.
     */
    @Test
    public void testGetDrink_noDrink() {
        String dish_name = "getDrink";
        List<Dish> result = dd.getDrink(dish_name);
        assertNotNull(result);
        assertEquals(0, result.size());
    }
    
    @Test
    public void testGetDrink_manyDrink() {
        String dish_name = "pepsi";
        List<Dish> result = dd.getDrink(dish_name);
        assertEquals(3, result.size());
        for (int i =0; i < result.size(); i++){
            assertTrue(result.get(i).getName().toLowerCase().contains(dish_name.toLowerCase()));
        }
    }
}