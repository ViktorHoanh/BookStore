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
import model.Type;


public class TypeDAO extends DBContext {

    public List<Type> getAllType() {
        List<Type> list = new ArrayList<>();
        String sql = "select * from Types";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Type(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getNoBookByType(int tID) {
        int n = 0;
        String sql = "  select count(*) from Books b, Types t\n"
                + "  where b.TypeID=t.TypeID and t.TypeID= ? and b.Status!=0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) n= rs.getInt(1);
        } catch (SQLException e) {
        }
        return n;
    }

    public Type getTypeById(String id) {
        String sql = "select * from Types where TypeID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Type(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Type a) {
        if (getTypeById(a.gettID() + "") == null) {
            String sql = "insert into Types \n"
                    + "values (?,?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, a.gettID());
                st.setString(2, a.gettName());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        } else {
        }
    }
}
