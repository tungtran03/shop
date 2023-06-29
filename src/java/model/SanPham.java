/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
/**
 *
 * @author tung
 */
public class SanPham {
  private int id;
private String tensp;
private String loai;
private String xuatxu;
private Double trongluong;
private Double giaban;
private int giamgia;
private int namsx;
private String images;
private Category category;
private int sell_id;
private int slk;
private int trt;

  

   public SanPham(){}

    public SanPham(int id, String tensp, String loai, String xuatxu, Double trongluong, Double giaban, int giamgia, int namsx, String images, Category category, int sell_id, int slk, int trt) {
        this.id = id;
        this.tensp = tensp;
        this.loai = loai;
        this.xuatxu = xuatxu;
        this.trongluong = trongluong;
        this.giaban = giaban;
        this.giamgia = giamgia;
        this.namsx = namsx;
        this.images = images;
        this.category = category;
        this.sell_id = sell_id;
        this.slk = slk;
        this.trt = trt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public String getXuatxu() {
        return xuatxu;
    }

    public void setXuatxu(String xuatxu) {
        this.xuatxu = xuatxu;
    }

    public Double getTrongluong() {
        return trongluong;
    }

    public void setTrongluong(Double trongluong) {
        this.trongluong = trongluong;
    }

    public Double getGiaban() {
        return giaban;
    }

    public void setGiaban(Double giaban) {
        this.giaban = giaban;
    }

    public int getGiamgia() {
        return giamgia;
    }

    public void setGiamgia(int giamgia) {
        this.giamgia = giamgia;
    }

    public int getNamsx() {
        return namsx;
    }

    public void setNamsx(int namsx) {
        this.namsx = namsx;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getSell_id() {
        return sell_id;
    }

    public void setSell_id(int sell_id) {
        this.sell_id = sell_id;
    }

    public int getSlk() {
        return slk;
    }

    public void setSlk(int slk) {
        this.slk = slk;
    }

    public int getTrt() {
        return trt;
    }

    public void setTrt(int trt) {
        this.trt = trt;
    }

   
   
   
}

  
    
