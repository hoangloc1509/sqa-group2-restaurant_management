/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author dotav
 */
public class DishOrdered implements Serializable{
    private int id;
    private int dish_id;
    private int reser_id;
    private int quantity;
    private String name;
    private float price;

    public DishOrdered(int dish_id, int quantity, String name, float price) {
        this.dish_id = dish_id;
        this.quantity = quantity;
        this.name = name;
        this.price = price*quantity;
    }

    

    public DishOrdered(int id, int dish_id, int reser_id, int quantity, String name, float price) {
        this.id = id;
        this.dish_id = dish_id;
        this.reser_id = reser_id;
        this.quantity = quantity;
        this.name = name;
        this.price = price;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDish_id() {
        return dish_id;
    }

    public void setDish_id(int dish_id) {
        this.dish_id = dish_id;
    }

    public int getReser_id() {
        return reser_id;
    }

    public void setReser_id(int reser_id) {
        this.reser_id = reser_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
    
}
