<%-- 
    Document   : EditSP
    Created on : Mar 24, 2023, 3:00:50 PM
    Author     : tung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link  rel="icon" href="img/cho.png" type="img/x-icon">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="margin-left: 40%;">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Update <b>Web</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editwweb" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Web</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                 <div class="form-group">
                                    <label>ID</label>
                                    <input value="${web.id}" name="id" type="text" class="form-control" required readonly>
                                </div>
                                <div class="form-group">
                                    <label>Tên web</label>
                                    <input value="${web.tenweb}" name="tenweb" type="text" class="form-control" required>
                                </div>
                                 <div class="form-group">
                                    <label>facebook</label>
                                    <input value="${web.facebook}" name="facebook" type="text" class="form-control" required>
                                </div>
                               <div class="form-floating mb-3">
                                        <label for="emailAddress">Email Address</label>
                                        <input class="form-control" name="email"id="emailAddress" type="email" placeholder="Email Address" data-sb-validations="required,email" value="${web.mail}"/>                                         
                                    </div>
                                     <div class="form-group">
                                    <label>Phone</label>
                                    <input  value="${web.phone}" name="phone" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input value="${web.diachi}"  name="diachi" type="text" class="form-control" required>
                                </div>
                               
                                   
                                <div class="form-group">
                                    <label>Thành phố</label>
                                    <input value="${web.thanhpho}"  name="thanhpho"type="text" class="form-control" required>
                                </div>
                                  <div class="form-group">
                                    <label>Giới thiệu</label>
                                    <input value="${web.gioithieu}"  name="gioithieu" type="text" class="form-control" required>
                                </div>
                           
                            </div>
                            <div class="modal-footer">
                                <a href="tbl_web"><button type="button" class="btn btn-primary">Cancel</button></a>
                                <a href="deleteaccount?id=${web.id}"><button type="button" class="btn btn-primary">Delete</button></a>
                                <input onclick="add()"type="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
 <script>
            function add() {
                window.alert("Sửa thông tin Wébsite thành công");

            }
        </script>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>