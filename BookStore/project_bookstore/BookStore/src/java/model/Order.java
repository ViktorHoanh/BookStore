/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Order {
    
    private int oID;
    private Account user;
    private Shipping s;
    private String oDate, cusName, cusPhone, cusAddr, cusEmail; //email can null

    public Order() {
    }

    public Order(int oID, Account user, Shipping s, String oDate, String cusName, String cusPhone, String cusAddr, String cusEmail) {
        this.oID = oID;
        this.user = user;
        this.s = s;
        this.oDate = oDate;
        this.cusName = cusName;
        this.cusPhone = cusPhone;
        this.cusAddr = cusAddr;
        this.cusEmail = cusEmail;
    }

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public Shipping getS() {
        return s;
    }

    public void setS(Shipping s) {
        this.s = s;
    }

    public String getoDate() {
        return oDate;
    }

    public void setoDate(String oDate) {
        this.oDate = oDate;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusAddr() {
        return cusAddr;
    }

    public void setCusAddr(String cusAddr) {
        this.cusAddr = cusAddr;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }
    
}
