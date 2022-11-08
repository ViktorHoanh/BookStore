/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;


public class Cart {
    private List<Item> item;

    public Cart() {
        item = new ArrayList<>();
    }

    public Cart(List<Item> item) {
        this.item = item;
    }
    
}
