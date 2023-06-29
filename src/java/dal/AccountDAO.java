/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Account;
import model.Category;
import model.Account;
import model.AccountForgot;
import org.apache.tomcat.util.codec.binary.Base64;



/**
 *
 * @author tung
 */
public class AccountDAO extends DBcontext {

    public List<Account> getALL() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM javaWeb.account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getString("Sell_ID"));
                list.add(acc);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
        public Account getAccontByID(int id){
        
        String sql ="SELECT * FROM javaweb.account where ID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
               
                Account acc= new Account();
                acc.setId(rs.getInt("ID"));
                acc.setUsername(rs.getString("Username"));   
                acc.setPassword(rs.getString("Password"));       
                acc.setHoten(rs.getString("Hoten"));
                acc.setDiachi(rs.getString("Diachi"));    
                acc.setPhone(rs.getString("Phone"));  
                acc.setEmail(rs.getString("Email"));        
                acc.setImg(rs.getString("Img"));        
                acc.setRole(rs.getString("RoleID"));
                acc.setSell(rs.getString("Sell_ID"));
                return acc;
            }
        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return null;
    }

    public Account checkLogin(String user, String pass) {
        String sql = "SELECT * FROM javaWeb.account where Username =? and Password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, toSHA1(pass));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getString("Sell_ID"));
                return acc;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "SELECT * FROM javaWeb.account where Username =?  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(rs.getInt("ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Hoten"),
                        rs.getString("Diachi"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Img"),
                        rs.getString("RoleID"),
                        rs.getString("Sell_ID"));
                return acc;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    public Boolean signup(String user, String pass, String hoten,String diachi,String phone, String email,String img, String roleID,String sellid) {
        String query = "INSERT INTO `javaweb`.`account` ("
                + "`Username`,"
                + " `Password`,"
                + " `Hoten`,"
                + " `Diachi`,"
                + " `Phone`,"
                + " `Email`,"
                + " `Img`,"
                + " `RoleID`,"
                + " `Sell_ID`)"
                + " VALUES (?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, toSHA1(pass));
            ps.setString(3, hoten);
            ps.setString(4, diachi);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, img);
            ps.setString(8, roleID);
            ps.setString(9, sellid);
            ps.executeUpdate();

            Account acc = checkAccountExist(user);
              query = "INSERT INTO javaWeb.carts (`AccountID`, `Spvsl`) VALUES (?, '0:0')";
              ps = connection.prepareStatement(query);
              ps.setInt(1,acc.getId());
              ps.executeUpdate();
                       
            return true;

        } catch (Exception e) {

        }
        return false;
    }
    
    
    ///Xóa account trong quyền admin
     public boolean deleteAccount (int id){
            String sql = "DELETE FROM javaweb.carts WHERE AccountID = " + id;
        String sql1 = "DELETE FROM javaweb.account WHERE ID = " + id;
       
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st = connection.prepareStatement(sql1);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }
   
     ///Update account
     
             public Boolean editAccount(int id, String user, String pass, String name, String diachi,
                  String phone, String email, String img, String roleid, String sell_id) {
        String query = "UPDATE `account` SET"
                + " `Username` = ?,"
                + " `Password` = ?,"
                + " `Hoten` = ?,"
                + " `Diachi` = ?,"
                + " `Phone` = ?,"
                + " `Email` = ?,"
                + " `Img` = ?,"
                + " `RoleID` = ?, "
                + " `Sell_ID` = ? "
                + "WHERE `account`.`ID` = ?";
               
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, name);
            ps.setString(4, diachi);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, img);
            ps.setString(8, roleid);
            ps.setString(9, sell_id);
            ps.setInt(10, id);
            ps.executeUpdate();

            return true;

        } catch (Exception e) {

        }
        return false;
    }
             // edit profiles    
                 public Account changeInfo(String hoten, String phone, String address, String email, int id, String user, String pass) {
        String sql = "UPDATE `account` SET"
                + "`Hoten` = ?,"
                + "`Diachi` = ?,"
                + "`Phone` = ?,"
                + "`Email` = ?"
                + "WHERE `account`.`ID` = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hoten);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setInt(5, id);
            st.executeUpdate();

        } catch (SQLException e) {
        }
        return checkLogin(user, pass);
    }
                 
                 //edit pass
                   public boolean changePass(String pass, int id) {
        String sql = "UPDATE `account` SET"
                + "`Password` = ?"
                + "WHERE `account`.`ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, toSHA1(pass));
            st.setInt(2, id);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
                   
     // search account 
         public List<Account> SearchAcByName(String txtSearch){
        List<Account> list = new ArrayList<>();
        String sql ="SELECT * FROM javaweb.account where Username like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,"%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                
                Account acc= new Account();
                 acc.setId(rs.getInt("ID"));
                acc.setUsername(rs.getString("Username"));   
                acc.setPassword(rs.getString("Password"));       
                acc.setHoten(rs.getString("Hoten"));
                acc.setDiachi(rs.getString("Diachi"));    
                acc.setPhone(rs.getString("Phone"));  
                acc.setEmail(rs.getString("Email"));        
                acc.setImg(rs.getString("Img"));        
                acc.setRole(rs.getString("RoleID"));
                acc.setSell(rs.getString("Sell_ID"));
                list.add(acc);
            }
            
        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return list;
    }
         
         //Forgot account
         public AccountForgot fogotAccount(String mail){
             String sql = "SELECT ID, Email FROM javaweb.account WHERE Username = ? or Email = ?";
             try {
                 PreparedStatement st = connection.prepareStatement(sql);
                 st.setString(1, mail);
                 st.setString(2, mail);
                 ResultSet rs = st.executeQuery();
                 if(rs.next()){
                     Random rd = new Random();
                     String otp = String.format("%06d", rd.nextInt(999999));
                     AccountForgot forgot = new AccountForgot(rs.getInt("ID"), rs.getString("Email"), otp);
                     return forgot;
                 }
             } catch (Exception e) {
             }
             return null;
         }
         
         //Mã hóa mật khẩu
         public String toSHA1(String str) {
        String salt = "asjrlkmcoewj@tjle;oxq@$%^*&$#@()*^$#@$###$skjhdjksjf1jurVn";// Làm cho mật khẩu phức tap
        String result = null;
        str = str + salt;
        try {
            byte[] dataBytes = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String(md.digest(dataBytes));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
