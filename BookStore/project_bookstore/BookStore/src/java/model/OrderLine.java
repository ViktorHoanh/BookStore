/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class OrderLine {
    private Order o;
    private Book b;
    private int quantity;

    public OrderLine() {
    }

    public OrderLine(Order o, Book b, int quantity) {
        this.o = o;
        this.b = b;
        this.quantity = quantity;
    }

    public Order getO() {
        return o;
    }

    public void setO(Order o) {
        this.o = o;
    }

    public Book getB() {
        return b;
    }

    public void setB(Book b) {
        this.b = b;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
