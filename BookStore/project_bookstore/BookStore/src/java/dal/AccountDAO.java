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
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Account;


public class AccountDAO extends DBContext {

    public boolean isAccountValid(Account acc) {
        String sql = "  select * from Accounts where Username=? or Email=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUser());
            st.setString(2, acc.getEmail());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
        }
        return true;
    }

    public void addAccount(Account acc) {
        String sql = "insert into Accounts \n"
                + "values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUser());
            st.setString(2, acc.getPass());
            st.setString(3, acc.getEmail());
            st.setInt(4, acc.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account getAccByUsername(String user) {
        String sql = "select * from Accounts where Username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean isAccountExist(String user, String pass) {
        String sql = "select * from Accounts where Username=? and Password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public void changePass(Account acc, String pass) {
        String sql = "  update Accounts\n"
                + "  set Password= ? \n"
                + "  where Username= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, acc.getUser());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int getNoAcc() {
        String sql = "select count(*) from Accounts";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Account> getAccOrderInMonth() {
        String sql = "select a.Username,a.Password,a.Email,a.Role from Accounts a, Orders o\n"
                + "where a.Username=o.Username and MONTH(o.OrderDate) = ? \n"
                + "group by a.Username,a.Password,a.Email,a.Role";
        List<Account> list = new ArrayList<>();
        int month = Calendar.MONTH + 1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Map<String, Double> getTop5PayingAcc() {
        String sql = "select top 5 a.Username, a.Password,a.Email,a.Role, sum(ol.Quantity *  b.Price)\n"
                + "from Accounts a, Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4 and a.Username=o.Username\n"
                + "group by a.Username, a.Password,a.Email,a.Role\n"
                + "order by sum(ol.Quantity *  b.Price) desc";
        Map<String, Double> hashMap = new LinkedHashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                hashMap.put(rs.getString(1), rs.getDouble(5));
            }
        } catch (SQLException e) {
        }
        return hashMap;
    }

    public static void main(String[] args) {
        AccountDAO ad = new AccountDAO();
        System.out.println(ad.getAccOrderInMonth().size());
//        Date today = new Date();
        int month = Calendar.MONTH;
        System.out.println(month);
    }
}
