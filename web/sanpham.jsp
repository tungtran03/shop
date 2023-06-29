<%-- 
    Document   : index
    Created on : Mar 13, 2023, 2:53:47 PM
    Author     : tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <link  rel="icon" href="img/cho.png" type="img/x-icon">
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <style>
            #square-buttons {
                width: 10px;
                height: 10px;
                border-radius: 100%
            }
            .card:hover{
                box-shadow:rgba(0, 0, 0, 0.35) 0px 5px 15px;
                transform: translateY(-20px);
            }
            .card{
                transition: 0.6s;
            }
        </style>
        <%--<%@include file="/pages/navbar.jsp" %>--%>
        <%--<%@include file="form.jsp" %>--%>

    </head>
    <body>

        <!-- Section-->
        <section  class="py-5">
            <center><h3>SẢN PHẨM</h3></center>  
            <p>${txts}</p>
            <%--<c:if test="${ requestScope.listSanPham.size()!=0}">Không có kết quả nào</c:if>--%>
            <div class="container px-4 px-lg-5 mt-5" ">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                      <%--<jsp:useBean id ="a" class="dal.SanPhamDAO" scope="request"></jsp:useBean>--%>
                    <c:forEach items="${sessionScope.listSanPham}" var="sanpham" >
                        <div class="col mb-5" >
                            <a href="product?id=${sanpham.id}" style=" text-decoration: none;">
                                <div class="card h-100" >
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">-${sanpham.giamgia}%</div>
                                    <!-- Product image-->
                                    <img style="height: 260px;" class="card-img-top"  src="${sanpham.images}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 style="display: -webkit-box;
                                                -webkit-line-clamp: 2;
                                                -webkit-box-orient: vertical;
                                                overflow: hidden;
                                                " class="fw-bolder">${sanpham.tensp}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${sanpham.giaban}"/>₫</span>
                                            <fmt:formatNumber pattern="###,###" value="${sanpham.giaban - sanpham.giaban*sanpham.giamgia/100}"/>₫
                                        </div>
                                    </div>
                                </div>
                            </a>         
                        </div>
                                        
                    </c:forEach>
                </div>
            </div>
        </section>     
                    <script>
                          function timkiem() {
                var search, filter, li, a, i, count = 0, txtValue;
                const show = document.querySelector(".search_input");
                const noti = document.querySelector("#noti");
                search = document.getElementById("search");
                if (search !== '' || search !== null) {
                    show.style.width = "200px";
                    filter = search.value.toUpperCase();
                    alert(search.value);
                    li = document.getElementsByClassName("item");
                    for (i = 0; i < li.length; i++) {
                        a = li[i].getElementsByTagName("h5")[0];
                        txtValue = a.textContent || a.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            count++;
                            li[i].style.display = "";
                        } else {
                            li[i].style.display = "none";
                        }
                    }
                    if (count === 0) {
                        noti.style.display = "block";
                    } else {
                        noti.style.display = "none";
                    }
                }
                    </script>
        <%--<%@include file="/pages/footer.jsp" %>--%>
    </body>
</html>
