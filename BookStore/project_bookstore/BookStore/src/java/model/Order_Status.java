/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Order_Status {
    
    private Order o;
    private String sDate;
    private Status s;
    

    public Order_Status() {
    }

    public Order_Status(Order o, String sDate, Status s) {
        this.o = o;
        this.sDate = sDate;
        this.s = s;
    }

    public Order getO() {
        return o;
    }

    public void setO(Order o) {
        this.o = o;
    }

    public String getsDate() {
        return sDate;
    }

    public void setsDate(String sDate) {
        this.sDate = sDate;
    }

    public Status getS() {
        return s;
    }

    public void setS(Status s) {
        this.s = s;
    }

    
    
    
}
