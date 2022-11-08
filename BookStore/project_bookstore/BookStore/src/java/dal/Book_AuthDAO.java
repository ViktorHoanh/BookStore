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
import model.Author;


public class Book_AuthDAO extends DBContext {

    public List<Author> getAuthorsOfBook(String bID) {
        String sql = "  select a.AuthorID, a.AuthorName "
                + "from Books_Authors ba, Authors a "
                + "where ba.BookID = ? and ba.AuthorID=a.AuthorID";
        List<Author> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Author(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insert(String bID, String aID) {
        String sql = "insert into Books_Authors\n"
                + "values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            st.setString(2, aID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
