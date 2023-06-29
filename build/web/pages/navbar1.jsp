<%-- 
    Document   : navbar1
    Created on : May 15, 2023, 1:33:50 PM
    Author     : tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Arsha Bootstrap Template - Index</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Arsha
        * Updated: Mar 10 2023 with Bootstrap v5.2.3
        * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top " style="background-color: black">
            <div class="container d-flex align-items-center">

                <h1 class="logo me-auto"><a href="auth">Home</a></h1>               
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar">
                    <ul>
                        <li class="dropdown"><a href="#"><span>Loại Sản Phẩm</span> <i class="bi bi-chevron-down"></i></a>
                             <ul>
                     
                          <c:set var="cid" value="${sessionScope.id}"/>
                           <li>
                              <a class="dropdown-item" href="category?id=5">all</a>
                          </li>
                      <c:forEach items="${sessionScope.listCategory}" var="category">
                          <li>
                              <a class="dropdown-item" href="category?id=${category.id}">${category.tenloai}</a>
                          </li>
                      </c:forEach>
                  </ul>
                        </li>
                        <c:set var="giohang" value="${sessionScope.giohang}"/>
                        <a class="nav-link scrollto" href="carts.jsp">Giỏ Hàng

                            <span class="badge rounded-pill badge-notification bg-danger">${giohang.size()}</span></li>
                        </a>


                        <li class="dropdown"><a href="#"><span>Cá Nhân</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="profiles.jsp">My profile</a></li></c:if>

                                <c:if test="${sessionScope.account.role == 1}">
                                    <li><a href="admin.jsp">Admin Account</a></li></c:if>

                               <c:if test="${sessionScope.account.role == 2}">
                          <li><a href="TB_MProduct.jsp">Manager Product</a></li></c:if>
                                </ul>
                            </li>

                        <c:if test="${sessionScope.account == null}">
                            <li><a class="getstarted scrollto" href="login.jsp">Login</a></li></c:if>
                            <c:if test="${sessionScope.account != null}">
                            <li><a class="getstarted scrollto" href="logout" onclick="logout()">Logout</a></li></c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <!-- End Hero -->

        <!-- End Cliens Section -->

        <!-- ======= Footer ======= -->
        <!-- End Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
