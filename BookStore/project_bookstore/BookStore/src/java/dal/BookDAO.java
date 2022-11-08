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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;
import model.Book;


public class BookDAO extends DBContext {

    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<>();
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        String sql = "select * from Books where [Status] != 0";
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

    public void sortBookByPrice(List<Book> list, String sortValue) {
        if (sortValue.equals("normal")) {
        } else {
            Comparator v = (Comparator<Book>) (Book x, Book y) -> {
                if (sortValue.equals("asc")) {
                    if (x.getPrice() < y.getPrice()) {
                        return (-1);
                    } else if (x.getPrice() == y.getPrice()) {
                        return (0);
                    } else {
                        return (1);
                    }
                } else {
                    if (x.getPrice() < y.getPrice()) {
                        return (1);
                    } else if (x.getPrice() == y.getPrice()) {
                        return (0);
                    } else {
                        return (-1);
                    }
                }
            };
            Collections.sort(list, v);
        }
    }

    public List<Book> getListByPage(List<Book> list, int start, int end) {
        ArrayList<Book> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Book getBookByID(String bID) {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        String sql = "select * from Books where BookID = ? and [Status] != 0 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
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

    public List<Book> getRelatedBook(String bID) {
        List<Book> listAll = new ArrayList<>();
        List<Book> list = new ArrayList<>();
        Book book = getBookByID(bID);
        int tID = book.getT().gettID();
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        Random rand = new Random();
        String sql = "select * from Books where TypeID=? and BookID != ? and [Status] != 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tID);
            st.setString(2, bID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listAll.add(new Book(rs.getString(1), pd.getPubById(rs.getString(2)),
                        rs.getString(3), rs.getDouble(4), td.getTypeById(rs.getString(5)),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
                        rs.getString(10)));
            }
            int size = listAll.size();
            for (int i = 0; i < size; i++) {
                int randIndex = rand.nextInt(listAll.size());
                list.add(listAll.get(randIndex));
                listAll.remove(randIndex);
                if (list.size() == 5) {
                    break;
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getBookByTitle(String title) {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        List<Book> list = new ArrayList<>();
        String sql = "select * from Books where Title like ? and [Status] != 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + title + "%");
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

    public List<Book> getBookByType(int tID) {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        List<Book> list = new ArrayList<>();
        String sql = "  select * from Books where TypeID=? and [Status] != 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tID);
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

    public List<Book> getBookByPub(String pID) {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        List<Book> list = new ArrayList<>();
        String sql = "  select * from Books where PublisherID=? and [Status] != 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pID);
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

    public List<Book> getBestSeller() {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        List<Book> list = new ArrayList<>();
        String sql = "select top 15 b.BookID, sum(ol.Quantity) as Tong\n"
                + "  from Books b, OrderLines ol\n"
                + "  where b.BookID=ol.BookID and b.[Status] !=0\n"
                + "  group by b.BookID\n"
                + "  order by Tong desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(getBookByID(rs.getString(1)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Book> getNewBook() {
        PubDAO pd = new PubDAO();
        TypeDAO td = new TypeDAO();
        List<Book> list = new ArrayList<>();
        String sql = "select top 22 * \n"
                + "	from Books where [Status] != 0\n"
                + "	order by PublishDate desc";
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

    //delete means change status of book to 0
    public void delete(String bID) {
        String sql = "update Books\n"
                + "set [Status] = 0\n"
                + "where BookID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Book b) {
        String sql = "update Books \n"
                + "  set Title = ?, Price = ?, PublishDate= ?, NoPages = ?, "
                + "  [Description] = ?, Quantity= ?, [Image] =? \n"
                + "  where BookID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getTitle());
            st.setDouble(2, b.getPrice());
            st.setString(3, b.getPubDate());
            st.setInt(4, b.getNoPage());
            st.setString(5, b.getDescrip());
            st.setInt(6, b.getQuantity());
            st.setString(7, b.getImage());
            st.setString(8, b.getbID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insert(Book b) {
        if (getBookByID(b.getbID()) == null) {
            String sql = "insert into Books\n"
                    + "values (?,?,?,?,?,?,?,?,?,?, default)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, b.getbID());
                st.setString(2, b.getP().getpID());
                st.setString(3, b.getTitle());
                st.setDouble(4, b.getPrice());
                st.setInt(5, b.getT().gettID());
                st.setString(6, b.getPubDate());
                st.setInt(7, b.getNoPage());
                st.setString(8, b.getDescrip());
                st.setInt(9, b.getQuantity());
                st.setString(10, b.getImage());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        }
        else{
            
        }
    }

    public static void main(String[] args) {
        BookDAO bd = new BookDAO();
        List<Book> list = bd.getAllBook();
        Book b = bd.getBookByID("10000174");
        System.out.println(b.getTitle());
    }

}
