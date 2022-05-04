/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dotav
 */
public class Reser {
    private int id;
    private String name;
    private String phone;
    private int quantity;
    private String date;
    private String time;
    private int client_id;
    private int is_ordered;
    private int is_paid;
    private float amount;

    public Reser(int id, String name, String phone, int quantity, String date, String time, int client_id, float amount) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.quantity = quantity;
        this.date = date;
        this.time = time;
        this.client_id = client_id;
        this.amount = amount;
    }
    
    public Reser(int id, String name, String phone, int quantity, String date, String time) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.quantity = quantity;
        this.date = date;
        this.time = time;
    }

    public Reser(int id, String name, String phone, int quantity, String date, String time, int client_id, int is_ordered, int is_paid, float amount) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.quantity = quantity;
        this.date = date;
        this.time = time;
        this.client_id = client_id;
        this.is_ordered = is_ordered;
        this.is_paid = is_paid;
        this.amount = amount;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public int getIs_ordered() {
        return is_ordered;
    }

    public void setIs_ordered(int is_ordered) {
        this.is_ordered = is_ordered;
    }

    public int getIs_paid() {
        return is_paid;
    }

    public void setIs_paid(int is_paid) {
        this.is_paid = is_paid;
    }

    
    
    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
    
    
}
