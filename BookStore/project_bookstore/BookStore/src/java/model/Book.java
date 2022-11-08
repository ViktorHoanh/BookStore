/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Book {
    
    private String bID;
    private Publisher p;
    private String title;
    private double price;
    private Type t;
    private String pubDate;
    private int noPage;
    private String descrip;
    private int quantity;
    private String image;

    public Book() {
    }

    public Book(String bID, Publisher p, String title, double price, Type t, String pubDate, int noPage, String descrip, int quantity, String image) {
        this.bID = bID;
        this.p = p;
        this.title = title;
        this.price = price;
        this.t = t;
        this.pubDate = pubDate;
        this.noPage = noPage;
        this.descrip = descrip;
        this.quantity = quantity;
        this.image = image;
    }

    public String getbID() {
        return bID;
    }

    public void setbID(String bID) {
        this.bID = bID;
    }

    public Publisher getP() {
        return p;
    }

    public void setP(Publisher p) {
        this.p = p;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Type getT() {
        return t;
    }

    public void setT(Type t) {
        this.t = t;
    }

    public String getPubDate() {
        return pubDate;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }

    public int getNoPage() {
        return noPage;
    }

    public void setNoPage(int noPage) {
        this.noPage = noPage;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    
    
}
