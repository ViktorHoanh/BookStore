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


public class AuthorDAO extends DBContext {

    public List<Author> getAllAuthor() {
        String sql = "select * from Authors";
        List<Author> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Author(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Author getAuthorById(String id) {
        String sql = "select * from Authors\n"
                + "where AuthorID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Author(rs.getString(1), rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Author a) {
        if (getAuthorById(a.getaID()) == null) {
            String sql = "insert into Authors\n"
                    + "values (?,?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, a.getaID());
                st.setString(2, a.getaName());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        }
        else{
            
        }
    }
}
