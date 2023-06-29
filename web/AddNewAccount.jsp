<%-- 
    Document   : AddNewAccount
    Created on : Mar 22, 2023, 4:46:48 PM
    Author     : tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Thêm Account</title>
        <link  rel="icon" href="img/cho.png" type="img/x-icon">
    </head>
    <body>

<div class="container">
    <h2 style="width:100%; border:solid 2px black;"><span style="margin-left: 35%;">Add new Account</span></h2>
    <form action="addac" method="post">
     <div id="signupalert" style="display:none" class="alert alert-danger">
                                <span></span>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-md-3 control-label" style="font-size: larger">Email :</label>
                                <div class="col-md-9">
                                    <input type="email" placeholder="example@example.com"  required="" class="form-control" name="email" placeholder="Email Address">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="usename" class="col-md-3 control-label" style="font-size: larger; margin-top: 20px">Username :</label>
                                <div class="col-md-9" style="margin-top: 20px">
                                    <input type="text" required="" class="form-control" name="user" placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-md-3 control-label" style="font-size: larger; margin-top: 20px">Họ Tên :</label>
                                <div class="col-md-9" style="margin-top: 20px">
                                    <input type="text" required="" class="form-control" name="fullname" placeholder="Full Name">
                                </div>
                            </div>
                         
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label" style="font-size: larger; margin-top: 20px">Mật khẩu :</label>
                                <div class="col-md-9" style="margin-top: 20px">
                                    <input type="password" required="" class="form-control" name="pass" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label" style="font-size: larger; margin-top: 20px">Nhập lại mật khẩu :</label>
                                <div class="col-md-9" style="margin-top: 20px">
                                        <input type="password" required="" class="form-control" name="repass" placeholder="Repassword">
                                </div>
                            </div>
                          <div class="form-group" style="margin-top: 50px">
                                <!-- Button -->                                        
                                <div class="col-md-offset-3 col-md-9" style="margin-top: 20px">
                                    <input id="btn-signup" type="submit" value="Submit" class="btn btn-info">of
                                    <a href="tbl_user"><button type="button" class="btn btn-primary">Back</button></a>
                                </div>
                                
                            </div>
                
  </form>
  <h3 style="color: red">${mess} </h3>
</div>
 
</body>
</html>