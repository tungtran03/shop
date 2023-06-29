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
import model.Category;

/**
 *
 * @author tung
 */
public class CategoryDAO extends DBcontext {

     public List<Category> getALL(){
        List<Category> list = new ArrayList<>();
        String sql ="SELECT * FROM javaweb.category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Category c= new Category(rs.getInt("ID"), rs.getString("TenLoai"));
                list.add(c);
            }
        } catch (SQLException e) {
            
        }
        return list;
    }
    public Category getCategoryByID(int id){
        String sql ="SELECT * FROM javaweb.category where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Category c= new Category(rs.getInt("ID"), rs.getString("TenLoai"));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
      public List<Category> getPage(List<Category> listCategory,int start, int end) {
       ArrayList<Category> arr = new ArrayList<>();
      //  String sql = "SELECT * FROM javaweb.sanpham ORDER BY sanpham.ID LIMIT 4 OFFSET ?;";
       for(int i = start ; i < end; i++){
           arr.add(listCategory.get(i));
       }
       return arr;
     }
}
