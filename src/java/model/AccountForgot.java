/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tung
 */
public class AccountForgot {
    private int ID;
    private String Mail;
    private String Code;
    
    public AccountForgot(){
        
    }

    public AccountForgot(int ID, String Mail, String Code) {
        this.ID = ID;
        this.Mail = Mail;
        this.Code = Code;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String Mail) {
        this.Mail = Mail;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }
    
    
}
