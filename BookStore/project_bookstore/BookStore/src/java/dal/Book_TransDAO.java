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


public class Book_TransDAO extends DBContext{
    
    public List<Translator> getTransOfBook(String bID) {
        String sql = "  select t.TranslatorID, t.TranslatorName "
                + "from Books_Translators bt, Translators t "
                + "where bt.BookID = ? and bt.TranslatorID=t.TranslatorID";
        List<Translator> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Translator(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public void insert(String bID, String trID) {
        String sql = "insert into Books_Translators\n"
                + "values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            st.setString(2, trID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
