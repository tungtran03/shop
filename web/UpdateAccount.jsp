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
                            <h2>Update <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateaccount" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Account</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                 <div class="form-group">
                                    <label>ID</label>
                                    <input value="${acc.id}" name="id" type="text" class="form-control" required readonly>
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input value="${acc.username}" name="user" type="text" class="form-control" required>
                                </div>
                                 <div class="form-group">
                                    <label>Password</label>
                                    <input value="${acc.password}" name="pass" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Họ tên</label>
                                    <input value="${acc.hoten}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input value="${acc.diachi}"  name="diachi" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input  value="${acc.phone}" name="phone" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${acc.email}" name="mail" type="email" placeholder="example@example.com" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Img</label>
                                    <input value="${acc.img}"  name="img"type="text" class="form-control" required>
                                </div>
                                  <div class="form-group">
                                   <label class="col-sm-2 control-label">Phân Quyền</label>
                                        <div class="col-sm-10">
                                            <select name="roleid" class="form-control">
                                                <option value="${requestScope.acc.role}" selected="">
                                                <c:choose>
                                                    <c:when test="${requestScope.acc.role == 1}">  
                                                        Admin  
                                                    </c:when>  
                                                    <c:when test="${requestScope.acc.role == 2}">  
                                                        BTV
                                                    </c:when>
                                                    <c:when test="${requestScope.acc.role == 3}">  
                                                        Người dùng 
                                                    </c:when>  
                                                    <c:when test="${acc.role == 4}">  
                                                        Bị khóa
                                                    </c:when> 
                                                </c:choose>
                                            </option>
                                            <option value="1">Admin</option>
                                            <option value="2">BTV</option>
                                            <option value="3">Người dùng</option>
                                            <option value="4">BỊ KHÓA</option>
                                        </select>
                                </div>
                                  </div>
                                <div class="form-group">
                                    <label>Sell_ID</label>
                                     <input value="${acc.sell}"  name="sellid" type="number" class="form-control" required>
                                </div>
    
                            </div>
                            <div class="modal-footer">
                                <a href="tbl_user"><button type="button" class="btn btn-primary">Cancel</button></a>
                                <a href="deleteaccount?id=${acc.id}"><button type="button" class="btn btn-primary">Delete</button></a>
                                <input onclick="add()"type="submit" class="btn btn-success" value="Update">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
 <script>
            function add() {
                window.alert("Sửa thông tin Account thành công");

            }
            
            
        </script>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>