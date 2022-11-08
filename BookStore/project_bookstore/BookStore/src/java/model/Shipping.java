/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Shipping {
    
    private int shID;
    private String shName;
    private double cost;
    private int time;

    public Shipping() {
    }

    public Shipping(int shID, String shName, double cost, int time) {
        this.shID = shID;
        this.shName = shName;
        this.cost = cost;
        this.time = time;
    }

    public int getShID() {
        return shID;
    }

    public void setShID(int shID) {
        this.shID = shID;
    }

    public String getShName() {
        return shName;
    }

    public void setShName(String shName) {
        this.shName = shName;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
    
    
}
