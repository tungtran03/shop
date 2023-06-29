<%-- 
    Document   : product
    Created on : Mar 13, 2023, 2:53:47 PM
    Author     : tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <link  rel="icon" href="img/cho.png" type="img/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <%@include file="/pages/navbar1.jsp" %>
        <%--<c:set var="sanpham" value="${requestScope.sanpham}"/>--%>
        <form action="add" method="post">
            <section class="py-5">

                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <%--<c:set var="SanPham" value="${requestScope.SanSham}"/>--%>
                        <div class="col-md-6">
                            <center><img class="card-img-top mb-5 mb-md-0" src="${sanpham.images}" alt="..." style="
                                         height: 8%;
                                         width: 70%;">
                            </center>
                        </div>

                        <div class="col-md-6">
                            <div class="small mb-1">Mã Hàng: ${sanpham.id}</div>
                            <h1 style="font-size: 2rem;" class="display-5 fw-bolder">${sanpham.tensp}</h1>
                            <div class="fs-5 mb-5">
                                <span class="text-decoration-line-through"><fmt:formatNumber pattern="###,###" value="${sanpham.giaban}"/>₫</span>
                                <span style="color: red;"><fmt:formatNumber pattern="###,###" value="${sanpham.giaban - sanpham.giaban*sanpham.giamgia/100}"/>₫</span>
                            </div>
                            <p class="lead">Xuất Xứ: <a href="#" style="color: red;font-weight: 500;"> ${sanpham.xuatxu}</a></p>
                            <p class="lead">Năm Sản Xuất: ${sanpham.namsx}</p>
                            <p class="lead">Trọng lượng: <fmt:formatNumber pattern="###,###" value="${sanpham.trongluong}"/>g</p>
                            <p class="lead">Thể loại: <a href="#" style="color: red; font-weight: 500;"> ${sanpham.category.tenloai}</a></p>
                            <p class="lead">Còn lại : <a href="#" style="color: red; font-weight: 500;"> ${sanpham.slk}</a> sản phẩm</p>

                            <div class="d-flex">
                                <input type="hidden" class="text-center" readonly name="acid" value="${sessionScope.account.id}"/>
                                <input type="hidden" class="text-center" readonly name="sanphamid" value="${sanpham.id}"/>
                                <input name="soluong" class="form-control text-center me-3" id="inputQuantity" min="1" pattern="[-+]?[0-99]" type="number" value="1" style="max-width: 5rem" />
                                <c:if test="${sanpham.slk > 2&&sanpham.trt==5}">
                                    <input value="Thêm vào giỏ hàng"  class="btn btn-outline-dark flex-shrink-0" type="submit"/>
                                </c:if>
                                     <c:if test="${sanpham.slk > 2&&sanpham.trt==3}">
                                    <input value="Sắp có"  class="btn btn-outline-dark flex-shrink-0" disabled="disabled" type="submit"/>
                                </c:if>
                                <c:if test="${sanpham.slk <=2||sanpham.trt==4}">
                                    <input value="Tạm hết hàng"  class="btn btn-outline-dark flex-shrink-0" disabled="disabled" type="submit"/>
                                </c:if>
                            </div>
                        </div>



                    </div>
                </div>
            </section>
                                <div style="margin-left: 15%">
                                <div id="fb-root" ><P style="font-size: 40px; border:2px solid;height:50px;width:300px;text-align: center;border-radius: 10px;background-color: #96dbe4">Đánh giá</P></div>
                                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v17.0&appId=938097657229150&autoLogAppEvents=1" nonce="2VxKRab0"></script>
                                <div  class="fb-comments" data-href="product.jsp?product?id=${sanpham.id}" data-width="1100" data-numposts="5"></div>
                                </div>
        </form>
        <!-- Related items section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4"> Sản phẩm liên quan</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${sessionScope.listSanPham}" var="sanpham">
                        <c:if test="${sanpham.category.id == sanpham.category.id && i<4}">
                            <c:set var="i" value="${i+1}"></c:set>
                                <div class="col mb-5">
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
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <%@include file="/pages/footer.jsp" %>
        <script>
                                    function add() {
                                        window.alert("Thêm vào giỏ hàng thành công");

                                    }
        </script>
    </body>
</html>
