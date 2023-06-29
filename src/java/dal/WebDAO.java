/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import model.Configs;
//import model.Discount;
import model.HistoryWeb;
//import model.MethodPayment;
import model.Web;

/**
 *
 * @author tung
 */
public class WebDAO  extends DBcontext{
//     public List<MethodPayment> getMethod() {
//        List<MethodPayment> list = new ArrayList<>();
//        String sql = "SELECT * FROM db_web.methodpayment;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                list.add(new MethodPayment(rs.getInt("ID"), rs.getString("NameMethod")));
//            }
//        } catch (SQLException e) {
//        }
//        return list;
//    }

//    public List<Discount> getAllDis() {
//        List<Discount> list = new ArrayList<>();
//        String sql = "SELECT * FROM db_web.discounttt";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                list.add(new Discount(rs.getString("Magg").toUpperCase(), rs.getDouble("Rate"), rs.getInt("Stt")));
//            }
//        } catch (SQLException e) {
//        }
//        return list;
//    }

    public Web getConfig() {
        String sql = "SELECT * FROM javaweb.web";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Web c = new Web(String.valueOf(rs.getInt("ID")),
                        rs.getString("Tenweb"),
                        rs.getString("Facebook"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Diachi"),
                        rs.getString("Thanhpho"),
                        rs.getString("Gioithieu"));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Web configWeb(int id,String tenweb, String diachi, String thanhpho, String phone, String email, String facebook, String gioithieu) {
        String sql = "UPDATE `javaweb`.`web`"
                + "SET"
                + "`Tenweb` = ?,"
                + "`Diachi` = ?,"
                + "`Thanhpho` = ?,"
                + "`Phone` = ?,"
                + "`Email` = ?,"
                + "`Facebook` = ?,"
                + "`Gioithieu` = ?"
                + "WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tenweb);
            st.setString(2, diachi);
            st.setString(3, thanhpho);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, facebook);
            st.setString(7, gioithieu);
            st.setInt(8, id);
           

            st.executeUpdate();
        } catch (SQLException e) {
        }
        return null;
    }    
    public List<HistoryWeb> getHistory() {
        List<HistoryWeb> list = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.history ORDER BY ID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO accountDAO = new AccountDAO();
                HistoryWeb historyWeb = new HistoryWeb(rs.getInt("ID"),
                        accountDAO.getAccontByID(rs.getInt("AccountID")),
                        rs.getString("ActionHis"),
                        rs.getString("TimeHis"));
                list.add(historyWeb);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addHistory(int accid, String action) {
        String sql = "INSERT INTO `javaweb`.`history`"
                + "(`AccountID`,"
                + "`ActionHis`,"
                + "`TimeHis`) VALUES (?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dateString = df.format(date);
            st.setInt(1, accid);
            st.setString(2, action);
            st.setString(3, dateString);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
     public Web getWebByID(int id){
        
        String sql ="SELECT * FROM javaweb.web where ID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Web web= new Web();
                web.setId(rs.getString("ID"));
                web.setTenweb(rs.getString("Tenweb"));   
                web.setFacebook(rs.getString("Facebook"));       
                web.setMail(rs.getString("Email"));
                web.setPhone(rs.getString("Phone"));    
                web.setDiachi(rs.getString("Diachi"));  
                web.setThanhpho(rs.getString("Thanhpho"));        
                web.setGioithieu(rs.getString("Gioithieu"));                       
                return web;
            }
        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return null;
    }
      public List<Web> getALL() {
        List<Web> list = new ArrayList<>();
        String sql = "SELECT * FROM javaWeb.web";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Web web = new Web(String.valueOf(rs.getInt("ID")),
                       rs.getString("Tenweb"),
                        rs.getString("Facebook"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Diachi"),
                        rs.getString("Thanhpho"),
                        rs.getString("Gioithieu"));
                list.add(web);
            }
        } catch (SQLException e) {

        }
        return list;
    }
}

