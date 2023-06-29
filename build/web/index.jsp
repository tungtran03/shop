<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Shop Điện thoại - Laptop</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
   <link  rel="icon" href="img/cho.png" type="img/x-icon">

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
  <style>
      .pagination a.active{
          background-color: #209dd8;
          color:white;
           padding: 0.375rem 0.75rem;
      }
  </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="auth" style=" text-decoration: none;">Home</a></h1>
         <form action="search" method="post" class="form-inline my-2 my-lg-0" style="position:absolute; left: 20%; width:40%">
                <div class="input-group input-group-sm">
                    <input value="" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                 </form>
    
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
          <ul>
              <li class="dropdown"><a href="#" style=" text-decoration: none;"><span>Loại Sản Phẩm</span> <i class="bi bi-chevron-down"></i></a>
                 
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


              <li class="dropdown"><a href="#" style=" text-decoration: none;"><span>Cá Nhân</span> <i class="bi bi-chevron-down"></i></a>
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
                  <li><a class="getstarted scrollto" href="login.jsp" style=" text-decoration: none;">Login</a></li></c:if>
                  <c:if test="${sessionScope.account != null}">
                  <li><a data-target="#logoutModal" data-toggle="modal" class="getstarted scrollto" href="logout"  style=" text-decoration: none;">Logout</a></li>
                      <!-- Logout Modal-->
        
                  </c:if>
          </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>Better Solutions For Your Business</h1>
          <h2>We are team of talented designers making websites with Bootstrap</h2>
          <div class="d-flex justify-content-center justify-content-lg-start">
              
               <c:if test="${sessionScope.account == null}">
                    <a href="signup.jsp" class="btn-get-started scrollto">SingUp</a>
                        </c:if>
         
            
            <a href="https://youtu.be/9W8CCe4e51A" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container">

        <div class="row" data-aos="zoom-in">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
              <a href="category?id=1"> <img src="assets/img/clients/logo-iphone.jpg" class="img-fluid" alt=""></a>
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/logo-samsung.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/logo-oppo.jpg" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/Asus-Logo.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/logo-dell.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="assets/img/clients/Windows_logo.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Cliens Section -->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><svg class="svg-icon" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M356.693333 654.08a42.666667 42.666667 0 0 0-5.546666 59.733333 42.666667 42.666667 0 0 0 60.16 5.546667 160.426667 160.426667 0 0 1 201.386666 0 42.666667 42.666667 0 0 0 27.306667 9.813333 42.666667 42.666667 0 0 0 27.306667-75.093333 247.893333 247.893333 0 0 0-310.613334 0z m36.266667-204.373333a42.666667 42.666667 0 0 0 60.16 0 42.666667 42.666667 0 0 0 0-60.16 131.413333 131.413333 0 0 0-180.906667 0 42.666667 42.666667 0 1 0 60.16 60.16 42.666667 42.666667 0 0 1 60.586667 0zM512 85.333333a426.666667 426.666667 0 1 0 426.666667 426.666667A426.666667 426.666667 0 0 0 512 85.333333z m0 768a341.333333 341.333333 0 1 1 341.333333-341.333333 341.333333 341.333333 0 0 1-341.333333 341.333333z m239.786667-463.786666a131.413333 131.413333 0 0 0-180.906667 0 42.666667 42.666667 0 0 0 60.16 60.16 42.666667 42.666667 0 0 1 60.586667 0 42.666667 42.666667 0 0 0 60.16 0 42.666667 42.666667 0 0 0 0-60.16z"  /></svg></span>
                        </button>
                    </div>
                    <div class="modal-body">Chọn "Logout" nếu bạn muốn đăng xuất.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Trở về</button>
                        <a class="btn btn-primary" href="logout">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    <%@include file="sanpham.jsp" %>
    
<!--  -->
      <c:set var="page" value="${sessionScope.page}"/>
                      <div class="container" style="width:300px" >
                          <ul class="pagination"style="margin-top:-22%" >
                              <c:forEach begin="${1}" end="${sessionScope.num}" var="i">
                                  <li class="page-item"><a class="page-link ${i==page?"active":""}" href="category?page=${i}&id=${id}">${i}</a></li>
                                  </c:forEach>
                          </ul>
                      </div>
  <!-- ======= Footer ======= -->
 <%@include file="/pages/footer.jsp" %>
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
<script>
            function logout() {
                window.alert("Logout thành công !");     
            }
        </script>
</html>