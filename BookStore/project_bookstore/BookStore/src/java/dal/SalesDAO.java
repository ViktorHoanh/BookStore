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
import model.Book;
import model.Type;


public class SalesDAO extends DBContext {

    public double getSaleByType(int tID) {
        String sql = "  select  ol.Quantity as qty, b.Price as p from Order_Status os,"
                + " Orders o, OrderLines ol, Books  b\n"
                + "  where os.OrderID=o.OrderID and o.OrderID = ol.OrderID "
                + "and ol.BookID=b.BookID and b.TypeID = ? and os.StatusID = 4";
        double total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int qty = rs.getInt("qty");
                double price = rs.getDouble("p");
                total += qty * price;
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public List<Book> getTop8SaleBook() {
        String sql = "select top 8 b.BookID, b.PublisherID, b.Title, b.Price, b.TypeID, b.PublishDate,\n"
                + "b.NoPages, b.Description, b.Quantity, b.Image, b.Status\n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4\n"
                + "order by ol.Quantity *  b.Price desc";
        List<Book> list = new ArrayList<>();
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1), pd.getPubById(rs.getString(2)),
                        rs.getString(3), rs.getDouble(4), td.getTypeById(rs.getString(5)),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
                        rs.getString(10)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public double getSaleOfBook(String bID) {
        String sql = "select ol.Quantity *  b.Price as Total from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4\n"
                + "and b.BookID = ?";
        double sales = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sales += rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return sales;
    }

    public Book getBestSeller() {
        String sql = "select top 1 b.BookID, b.PublisherID, b.Title, b.Price, b.TypeID, b.PublishDate,\n"
                + "b.NoPages, b.Description, b.Quantity, b.Image, b.Status\n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4\n"
                + "order by ol.Quantity desc";
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Book(rs.getString(1), pd.getPubById(rs.getString(2)),
                        rs.getString(3), rs.getDouble(4), td.getTypeById(rs.getString(5)),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
                        rs.getString(10));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Book getMostOrderBook() {
        String sql = "select top 1 b.BookID, b.PublisherID, b.Title, b.Price, b.TypeID, b.PublishDate,\n"
                + "b.NoPages, b.Description, b.Quantity, b.Image, b.Status  \n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID != 5\n"
                + "order by ol.Quantity desc";
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Book(rs.getString(1), pd.getPubById(rs.getString(2)),
                        rs.getString(3), rs.getDouble(4), td.getTypeById(rs.getString(5)),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
                        rs.getString(10));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public double getSalesByPub(String pID) {
        String sql = "select ol.Quantity as qty, b.Price as p from Order_Status os,\n"
                + "Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID \n"
                + "and ol.BookID=b.BookID and os.StatusID = 4 and b.PublisherID = ?";
        double total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int qty = rs.getInt("qty");
                double price = rs.getDouble("p");
                total += qty * price;
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public double getTotalSales() {
        String sql = "select sum(ol.Quantity *  b.Price)\n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public String getHighestSaleDate() {
        String sql = "select top 1 os.StatusDate, sum(ol.Quantity *  b.Price)\n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = 4\n"
                + "group by os.StatusDate\n"
                + "order by sum(ol.Quantity *  b.Price) desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return null;
    }

    // giá trị của các đơn hàng: đang vân chuyển, đã hủy, đang xử lý
    public double getValueOfOrderByStatus(int sID) {
        String sql = "select sum(ol.Quantity *  b.Price)\n"
                + "from Order_Status os, Orders o, OrderLines ol, Books  b\n"
                + "where os.OrderID=o.OrderID and o.OrderID = ol.OrderID and ol.BookID=b.BookID and os.StatusID = ?";
        double total = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sID);
            ResultSet rs = st.executeQuery();
            if(rs.next()) total = rs.getDouble(1);
        } catch (SQLException e) {
        }
        return total;
    }

    public static void main(String[] args) {
        SalesDAO sd = new SalesDAO();
        List<Book> listB = sd.getTop8SaleBook();
        System.out.println(listB.get(0).getbID());
        System.out.println(sd.getSaleOfBook(listB.get(0).getbID()));
    }
}
