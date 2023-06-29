<%-- 
    Document   : navbar
    Created on : Mar 11, 2023, 10:29:21 PM
    Author     : tung
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="auth">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Quản trị
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
           

            <!-- Nav Item - Tables -->
              <c:if test="${sessionScope.account.role == 1}">
            <li class="nav-item">
                <a class="nav-link" href="tbl_user">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables Account</span></a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="tbl_web">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Edit Website</span></a>
            </li>
              </c:if>
              <c:if test="${sessionScope.account.role == 2}">
              <li class="nav-item">
                <a class="nav-link" href="tbl-product">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Manager Product</span></a>
            </li>
              </c:if>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                  <a href="auth"><button type="button" class="btn btn-primary">Back</button></a>
            </div>


        </ul>
    </body>
</html>
