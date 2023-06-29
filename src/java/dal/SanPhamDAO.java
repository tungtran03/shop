/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBcontext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Carts;
import model.SanPham;
import model.Category;

/**
 *
 * @author tung
 */
public class SanPhamDAO extends DBcontext {

    private static List<Carts> listcarts;

    public List<SanPham> getALL() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.sanpham";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                SanPham sanpham = new SanPham();
                sanpham.setId(rs.getInt("ID"));
                sanpham.setTensp(rs.getString("TenSP"));
                sanpham.setLoai(rs.getString("Loai"));
                sanpham.setXuatxu(rs.getString("XuatXu"));
                sanpham.setTrongluong(rs.getDouble("TrongLuong"));
                sanpham.setGiaban(rs.getDouble("GiaBan"));
                sanpham.setGiamgia(rs.getInt("GiamGia"));
                  sanpham.setNamsx(rs.getInt("NamSX"));
                   sanpham.setImages(rs.getString("Images"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                sanpham.setCategory(c);
                
                sanpham.setSell_id(rs.getInt("Sell_ID"));
                sanpham.setSlk(rs.getInt("Soluongkho"));
                sanpham.setTrt(rs.getInt("TrangThai"));
                list.add(sanpham);
            }

        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return list;
    }

    public SanPham getSPByID(int id) {

        String sql = "SELECT * FROM javaweb.sanpham where ID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                 SanPham sanpham = new SanPham();
                sanpham.setId(rs.getInt("ID"));
                sanpham.setTensp(rs.getString("TenSP"));
                sanpham.setLoai(rs.getString("Loai"));
                sanpham.setXuatxu(rs.getString("XuatXu"));
                sanpham.setTrongluong(rs.getDouble("TrongLuong"));
                sanpham.setGiaban(rs.getDouble("GiaBan"));
                sanpham.setGiamgia(rs.getInt("GiamGia"));
                  sanpham.setNamsx(rs.getInt("NamSX"));
                   sanpham.setImages(rs.getString("Images"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                sanpham.setCategory(c);               
                sanpham.setSell_id(rs.getInt("Sell_ID"));
                sanpham.setSlk(rs.getInt("Soluongkho"));
               sanpham.setTrt(rs.getInt("TrangThai"));
                return sanpham;
            }
        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return null;
    }

    public List<Carts> getSPByCarts(int id) {
        listcarts = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.carts where AccountID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                String a = rs.getString("Spvsl");
                String[] l1 = a.split(",");
                String[] l2 = null;
                for (String string : l1) {
                    if (string == "" || string == null) {

                    } else {
                        l2 = string.split(":");
                        if (Integer.parseInt(l2[0]) == 0 || Integer.parseInt(l2[1]) == 0) {

                        } //                    dacat
                        else {
                            Carts carts = new Carts();
                            carts.setSanpham(getSPByID(Integer.parseInt(l2[0])));
                            carts.setSoluong(Integer.parseInt(l2[1]));
                            listcarts.add(carts);
                        }

                    }

                }

            }
            st.close();

        } catch (SQLException e) {
            System.err.println("lỗi nè");
        }
        return listcarts;
    }

    //thêm sản phẩm vào giỏ hàng
    public void addtoCarts(int acid, int bookid, int soluong) {
        getSPByCarts(acid);
        boolean check = true;
        String str = "";
        for (Carts c : listcarts) {
            if (bookid == c.getSanpham().getId()) {
                c.setSoluong(c.getSoluong() + soluong);
                check = false;
            }
            str += "," + c.getSanpham().getId() + ":" + c.getSoluong();
        }
        if (check) {
            Carts carts = new Carts();
            carts.setSanpham(getSPByID(bookid));
            carts.setSoluong(soluong);
            str += "," + carts.getSanpham().getId() + ":" + carts.getSoluong();
            listcarts.add(carts);
        }
        String sql = "UPDATE javaweb.carts SET Spvsl = '" + str + "' WHERE (AccountID =" + acid + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("lỗi nè");
        }
    }

    //xóa sản phẩm trong giỏ hàng
    public void removetoCarts(int bookid, int acid) {

        String str = "";
        if (listcarts.size() > 1) {
            int vtri = 0;
            for (Carts item : listcarts) {
                if (bookid != item.getSanpham().getId()) {
                    vtri++;
                } else {
                    break;
                }
            }
            listcarts.remove(vtri);
            for (Carts c : listcarts) {
                str += "," + c.getSanpham().getId() + ":" + c.getSoluong();
            }
        }
        if (listcarts.size() == 1) {
            listcarts.clear();
            str += ",0:0";
        }
        String sql = "UPDATE javaweb.carts SET Spvsl = '" + str + "' WHERE (AccountID =" + acid + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("lỗi nè");
        }
    }

    // Category
    public List<SanPham> getSanPhamByCid(int id) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.sanpham where CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                  SanPham sanpham = new SanPham();
                sanpham.setId(rs.getInt("ID"));
                sanpham.setTensp(rs.getString("TenSP"));
                sanpham.setLoai(rs.getString("Loai"));
                sanpham.setXuatxu(rs.getString("XuatXu"));
                sanpham.setTrongluong(rs.getDouble("TrongLuong"));
                sanpham.setGiaban(rs.getDouble("GiaBan"));
                sanpham.setGiamgia(rs.getInt("GiamGia"));
                sanpham.setNamsx(rs.getInt("NamSX"));
                sanpham.setImages(rs.getString("Images"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                sanpham.setCategory(c);                
                sanpham.setSell_id(rs.getInt("Sell_ID"));
                sanpham.setSlk(rs.getInt("Soluongkho"));
              sanpham.setTrt(rs.getInt("TrangThai"));
                list.add(sanpham);
            }

        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return list;
    }
    // search sản phẩm 

    public List<SanPham> SearchByName(String txtSearch) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.sanpham where TenSP like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                 SanPham sanpham = new SanPham();
                sanpham.setId(rs.getInt("ID"));
                sanpham.setTensp(rs.getString("TenSP"));
                sanpham.setLoai(rs.getString("Loai"));
                sanpham.setXuatxu(rs.getString("XuatXu"));
                sanpham.setTrongluong(rs.getDouble("TrongLuong"));
                sanpham.setGiaban(rs.getDouble("GiaBan"));
                sanpham.setGiamgia(rs.getInt("GiamGia"));
                sanpham.setNamsx(rs.getInt("NamSX"));
                sanpham.setImages(rs.getString("Images"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                sanpham.setCategory(c);              
                sanpham.setSell_id(rs.getInt("Sell_ID"));
                sanpham.setSlk(rs.getInt("Soluongkho"));
               sanpham.setTrt(rs.getInt("TrangThai"));
                list.add(sanpham);
            }

        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return list;
    }

    // thêm sửa xóa sản phẩm
    public List<SanPham> getSanPhamBySellid(int id) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM javaweb.sanpham where Sell_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                 SanPham sanpham = new SanPham();
                sanpham.setId(rs.getInt("ID"));
                sanpham.setTensp(rs.getString("TenSP"));
                sanpham.setLoai(rs.getString("Loai"));
                sanpham.setXuatxu(rs.getString("XuatXu"));
                sanpham.setTrongluong(rs.getDouble("TrongLuong"));
                sanpham.setGiaban(rs.getDouble("GiaBan"));
                sanpham.setGiamgia(rs.getInt("GiamGia"));
                sanpham.setNamsx(rs.getInt("NamSX"));
                sanpham.setImages(rs.getString("Images"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                sanpham.setCategory(c);        
                sanpham.setSell_id(rs.getInt("Sell_ID"));
                sanpham.setSlk(rs.getInt("Soluongkho"));
               sanpham.setTrt(rs.getInt("TrangThai"));
                list.add(sanpham);
            }

        } catch (SQLException e) {
            System.err.println("lỗi");
        }
        return list;
    }
    //xóa sản phẩm trong managerproduct

    public boolean deleteProduct(int id) {
         String sql = "DELETE FROM javaweb.sanpham WHERE ID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(""+e);
        }
        return false;
    }
    

    //add sản phẩm mới vào danh sách
     public Boolean addSanPham(String name, String loai, String xuatxu, double trongluong,
            double giaban, int giamgia, int namsx, String image, int category, int sid, int slk, int trt) {
        String sql = "INSERT INTO `javaWeb`.`sanpham`"
               + "(`TenSP`,"
                + "`Loai`,"
                + "`XuatXu`,"
                + "`TrongLuong`,"
                + "`GiaBan`,"
                + "`GiamGia`,"
                + "`NamSX`,"
                + "`Images`,"
                + "`CategoryID`,"
                + "`Sell_ID`,"
                + "`Soluongkho`,"
                + "TrangThai)"
                + "VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name.toUpperCase());
            ps.setString(2, loai);
            ps.setString(3, xuatxu);
            ps.setDouble(4, trongluong);
            ps.setDouble(5, giaban);
            ps.setInt(6, giamgia);
            ps.setInt(7, namsx);
            ps.setString(8, image);
            ps.setInt(9, category);
            ps.setInt(10, sid);
            ps.setInt(11, slk);
            ps.setInt(12, trt);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
        }
        return false;
    }
    //Edit sản phẩm
      public String updateSanPham(String name, String loai, String xuatxu, double trongluong,
            double giaban, int giamgia, int namsx, String image, int category, int sid, int slk, int trt, int id) { 
          String sql = "UPDATE `sanpham` SET "
                  + "`TenSP` = ?,"
                  + " `Loai` = ?,"
                  + " `XuatXu` = ?,"
                  + " `TrongLuong` = ?,"
                  + " `GiaBan` = ?,"
                  + " `GiamGia` = ?,"
                  + " `NamSX` = ?,"
                  + " `Images` = ?,"
                  + " `CategoryID` = ?,"
                  + " `Sell_ID` = ?,"
                  + " `Soluongkho` = ?,"
                  + " `TrangThai` = ?"
                  + " WHERE `sanpham`.`ID` = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
           ps.setString(2, loai);
            ps.setString(3, xuatxu);
            ps.setDouble(4, trongluong);
            ps.setDouble(5, giaban);
            ps.setInt(6, giamgia);
            ps.setInt(7, namsx);
            ps.setString(8, image);
            ps.setInt(9, category);
            ps.setInt(10, sid);
            ps.setInt(11, slk);
            ps.setInt(12, trt);
            ps.setInt(13, id);
          
            ps.executeUpdate();

            return sql;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
      
      
    public List<Carts> updateCarts(String s, int accid) {
        String sql = "UPDATE javaWeb.carts SET Spvsl = ? WHERE AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s);
            st.setInt(2, accid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
        return getSPByCarts(accid);
    }
    
//    public int getNumberPage(){
//         String sql = "select count(*) from javaweb.sanpham";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//             ResultSet rs = st.executeQuery();
//            while(rs.next()){
//                int total = rs.getInt(1);
//                int countPage = 0;
//                countPage = total / 4;
//                if(total % 4 != 0){
//                    countPage++;
//                }
//                return countPage;
//            }
//        } catch (SQLException e) {
//        }
//        return 0;  
//    } 
    
     public List<SanPham> getPage(List<SanPham> listSanPham,int start, int end) {
       ArrayList<SanPham> arr = new ArrayList<>();
      //  String sql = "SELECT * FROM javaweb.sanpham ORDER BY sanpham.ID LIMIT 4 OFFSET ?;";
       for(int i = start ; i < end; i++){
           arr.add(listSanPham.get(i));
       }
       return arr;
     }
}

   

