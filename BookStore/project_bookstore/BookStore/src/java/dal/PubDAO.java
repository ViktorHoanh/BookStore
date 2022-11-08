/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Publisher;


public class PubDAO extends DBContext {

    public List<Publisher> getAllPub() {
        List<Publisher> list = new ArrayList<>();
        String sql = "select * from Publishers";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Publisher(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getNoBookByPub(String pID) {
        int n = 0;
        String sql = "  select count(*) from Books b, Publishers p\n"
                + "  where b.PublisherID=p.PubID and p.PubID=? and b.Status!=0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) n =rs.getInt(1);
        } catch (Exception e) {
        }
        return n;
    }

    public Publisher getPubById(String id) {
        String sql = "select * from Publishers where PubID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Publisher(rs.getString(1), rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Publisher a) {
        if (getPubById(a.getpID()) == null) {
            String sql = "insert into Publishers\n"
                    + "values (?,?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, a.getpID());
                st.setString(2, a.getpName());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        } else {

        }
    }
}
