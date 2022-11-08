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
import model.Translator;


public class TranslatorDAO extends DBContext {

    public List<Translator> getAllTrans() {
        String sql = "select * from Translators";
        List<Translator> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Translator(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Translator getTransById(String id) {
        String sql = "select * from Translators\n"
                + "where TranslatorID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Translator(rs.getString(1), rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Translator a) {
        if (getTransById(a.getTrID()) == null) {
            String sql = "insert into Translators \n"
                    + "values (?,?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, a.getTrID());
                st.setString(2, a.getTrName());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        }
        else {
            
        }
    }
}
