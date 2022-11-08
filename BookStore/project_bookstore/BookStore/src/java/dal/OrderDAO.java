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
import model.Account;
import model.Item;
import model.Order;
import model.OrderLine;
import model.Order_Status;
import model.Shipping;
import model.Status;


public class OrderDAO extends DBContext {
    
    public Shipping getShipByID(String shID) {
        String sql = "select * from ShippingMethods where MethodID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(shID));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Shipping(rs.getInt(1), rs.getString(2),
                        rs.getDouble(3), rs.getInt(4));
            }
        } catch (NumberFormatException | SQLException e) {
        }
        return null;
    }
    
    public Order getOrderByID(String oID) {
        String sql = "select * from Orders where OrderID = ?";
        AccountDAO ad = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(oID));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Order(rs.getInt(1), ad.getAccByUsername(rs.getString(2)),
                        getShipByID(rs.getString(3)), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8));
            }
        } catch (NumberFormatException | SQLException e) {
        }
        return null;
    }
    
    public List<Order> getOrderByUser(Account acc) {
        String sql = "  select * from Orders\n"
                + "  where Username = ? order by OrderID desc";
        List<Order> list = new ArrayList<>();
        AccountDAO ad = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc.getUser());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), ad.getAccByUsername(rs.getString(2)),
                        getShipByID(rs.getString(3)), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public List<Order> getOrderByStatus(List<Order> listO, int sID){
        List<Order> list = new ArrayList<>();
        for(Order o : listO) {
            Order_Status os = getCurrentStatus(o.getoID()+"");
            if(os.getS().getsID()==sID) list.add(o);
        }
        return list;
    }
    
    
    public Status getStatusByID(String sID) {
        String sql = "select * from Status where StatusID= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(sID));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Status(rs.getInt(1), rs.getString(2));
            }
        } catch (NumberFormatException | SQLException e) {
        }
        return null;
    }
    
    public List<Order> getAllOrder() {
        String sql = "select * from Orders";
        List<Order> list = new ArrayList<>();
        AccountDAO ad = new AccountDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), ad.getAccByUsername(rs.getString(2)),
                        getShipByID(rs.getString(3)), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Status> getAllStatus() {
        List<Status> list = new ArrayList<>();
        String sql = "select * from Status";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Status(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Shipping> getAllShipping() {
        List<Shipping> list = new ArrayList<>();
        String sql = "select * from ShippingMethods";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Shipping(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
        }
        
        return list;
    }
    
    public List<Order> getListByPage(List<Order> list, int start, int end) {
        ArrayList<Order> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public List<OrderLine> getAllOrderLines(String oID) {
        List<OrderLine> list = new ArrayList<>();
        String sql = "select * from Orders o, OrderLines ol\n"
                + "where o.OrderID=ol.OrderID and o.OrderID=? ";
        BookDAO bd = new BookDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(oID));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderLine(getOrderByID(oID),
                        bd.getBookByID(rs.getString("BookID")), rs.getInt("Quantity")));
            }
        } catch (NumberFormatException | SQLException e) {
        }
        return list;
    }
    
    public List<Order_Status> getAllOrStatus(String oID) {
        List<Order_Status> list = new ArrayList<>();
        String sql = "select * from Orders o, Order_Status os\n"
                + "where o.OrderID=os.OrderID and o.OrderID = ? \n"
                + "order by os.StatusDate desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(oID));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order_Status(getOrderByID(oID), rs.getString("StatusDate"),
                        getStatusByID(rs.getString("StatusID"))));
            }
        } catch (NumberFormatException | SQLException e) {
        }
        return list;
    }
    
    public int getLastOrderID() {
        String sql = "select top 1* from Orders \n"
                + "order by OrderID desc";
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
    
    public double getPriceOfOrder(String oID){
        List<OrderLine> listOl = getAllOrderLines(oID);
        double total = 0;
        for(OrderLine ol : listOl){
            total += ol.getQuantity()*ol.getB().getPrice();
        }
        return total;
    }
    public Order_Status getCurrentStatus(String oID){
        List<Order_Status> listOS = getAllOrStatus(oID);
        return listOS.get(0);
    }
    
    public void insertOrderStatus(Order_Status os) {
        String sql = "insert into Order_Status\n"
                + "values (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, os.getO().getoID());
            st.setString(2, os.getsDate());
            st.setInt(3, os.getS().getsID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertOrderAndRelated(Order o, List<Item> listI) {
        try {
            String sql1 = "insert into Orders([Username]\n"
                    + "				  ,[ShipMethodID]\n"
                    + "				  ,[OrderDate]\n"
                    + "				  ,[CusName]\n"
                    + "				  ,[CusPhone]\n"
                    + "				  ,[CusAddress]\n"
                    + "				  ,[CusEmail])\n"
                    + "values (?, ?, ?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql1);
            st.setString(1, o.getUser().getUser());
            st.setInt(2, o.getS().getShID());
            st.setString(3, o.getoDate());
            st.setString(4, o.getCusName());
            st.setString(5, o.getCusPhone());
            st.setString(6, o.getCusAddr());
            st.setString(7, o.getCusEmail());
            st.executeUpdate();
            Order_Status os = new Order_Status(o, o.getoDate(), getStatusByID("2"));
            insertOrderStatus(os);
            
            String sql2 = "insert into OrderLines\n"
                    + "values(?,?,?)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, o.getoID());
            for (Item i : listI) {
                st2.setString(2, i.getB().getbID());
                st2.setInt(3, i.getQuantity());
                st2.executeUpdate();
                String sql3 = "update Books\n"
                        + "set Quantity = Quantity - ? \n"
                        + "where BookID = ? ";
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, i.getQuantity());
                st3.setString(2, i.getB().getbID());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        AccountDAO ad = new AccountDAO();
        List<Order> list =od.getAllOrder();
        List<Order> list1 = od.getOrderByStatus(list, 4);
        System.out.println(list1.size());
              
    }
}
