/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Translator {
    private String trID, trName;

    public Translator() {
    }

    public Translator(String trID, String trName) {
        this.trID = trID;
        this.trName = trName;
    }

    public String getTrID() {
        return trID;
    }

    public void setTrID(String trID) {
        this.trID = trID;
    }

    public String getTrName() {
        return trName;
    }

    public void setTrName(String trName) {
        this.trName = trName;
    }
    
}
