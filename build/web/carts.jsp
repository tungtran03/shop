<%-- 
    Document   : carts
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
        <title>Giỏ hàng</title>
        <link REL="SHORTCUT ICON" HREF="img\icon.png">
       <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              />

    </head>
    <body>

       <%@include file="/pages/navbar1.jsp" %>

        <section class="h-100" style="background-color: #eee;">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">
                        <div style="width: fit-content;
                             margin-left: 9%;
                             margin-bottom:  2%;">
                            <a style="text-decoration: none;" href="auth">
                                <h6><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                            </a>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Giỏ hàng</h3>
                        </div>

                        <c:if test="${sessionScope.giohang.size()<=0 ||sessionScope.giohang ==null}">
                            <%@include file="/pages/carts_empty.jsp" %>
                        </c:if>

                        <c:if test="${sessionScope.giohang.size()>0}">
                            <c:forEach items="${sessionScope.giohang}" var="giohang">
                                <div class="card rounded-3 mb-4">
                                    <div class="card-body p-4">
                                        <div class="row d-flex justify-content-between align-items-center">

                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <a href="product?id=${giohang.sanpham.id}">
                                                    <img
                                                        src="${giohang.sanpham.images}"
                                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </a>

                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                <p class="lead fw-normal mb-2"><a  style="font-weight: 500;" href="product?id=${giohang.sanpham.id}">${giohang.sanpham.tensp}</a></p>

                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                <button class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                    <i class="fas fa-minus"></i>
                                                </button>

                                                <input id="form1" min="1" max="${giohang.sanpham.slk}" name="quantity" value="${giohang.soluong}" type="number"
                                                       class="form-control form-control-sm text-center" />  <!-- max="${giohang.sanpham.slk}"-->

                                                <button class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                            <c:set var="gia" value="${giohang.sanpham.giaban - giohang.sanpham.giaban*giohang.sanpham.giamgia/100}"></c:set>
                                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                    <h5 class="mb-0"><fmt:formatNumber pattern="###,###" value="${gia*giohang.soluong}"/>₫</h5>
                                            </div>
                                            <div style="display: contents; margin-top: 0.5%" class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                <input name="select" type="checkbox" value="${giohang.sanpham.id}" />
                                                <a onclick="dodelete(${giohang.sanpham.id})"  class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                                <!<!-- href="remove?sanphamid=${giohang.sanpham.id}" -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
<!--                             <div class="col-sm-3 col-xs-3 text-right">
                                            <input readonly="" type="hidden" name="price" value="${(sanpham.getKey().giaban - sanpham.getKey().giaban*sanpham.getKey().giamgia/100)*sanpham.getValue()}">
                                            <h6 ><fmt:formatNumber pattern="###,###" value="${(sanpham.getKey().giaban - sanpham.getKey().giaban*sanpham.getKey().giamgia/100)*sanpham.getValue()}"/>₫ </h6>
                                        </div>-->
                             <div class="card mb-4">
                                <div style="justify-content: flex-end;" class="card-body p-4 d-flex flex-row">
                                    
                                    <button onclick="updatecarts(); giohang()" type="button" class="btn btn-outline-warning btn-lg ms-3">Cập nhật giỏ hàng</button>
                                </div>
                            </div>
                                                                  
<!--                            <div class="card mb-4">
                                <div class="card-body p-4 d-flex flex-row">
                                    <div class="form-outline flex-fill">
                                        <input type="text" id="form1" class="form-control form-control-lg" />
                                        <label class="form-label" for="form1">Mã giảm giá</label>
                                    </div>
                                    <button type="button" class="btn btn-outline-warning btn-lg ms-3">Áp dụng</button>
                                </div>
                            </div>-->

                            <div class="card">
                                 <div class="card-body">
                                    <button onclick="check()" type="submit" class="btn btn-warning btn-block btn-lg">Thanh toán</button>
                                </div>
                            </div>
                        </c:if>



                    </div>
                </div>
            </div>
        </section>

      
    </body>
    <script>
        function updatecarts() {
            var checkbox = document.getElementsByName('select');
            var quantity = document.getElementsByName('quantity');
            var result = "0:0";
            for (var i = 0; i < checkbox.length; i++) {
                result += ',' + checkbox[i].value + ':' + quantity[i].value;
            }
            window.location = "carts?sql=" + result;
        }
         function dodelete(id) {
                let text = "Chắc chắn xóa sản phẩm này?";
                if (confirm(text) === true) {
                    window.location = ("remove?sanphamid=" + id);
                }
            }
            
              function check() {
            var checkbox = document.getElementsByName('select');
            var quantity = document.getElementsByName('quantity');
            var result = "0thdzvkl0";
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked === true) {
                    result += 'tdz' + checkbox[i].value + 'thdzvkl' + quantity[i].value;
                }
            }
            if (result === "0thdzvkl0") {
                alert("Bạn chưa chọn mặt hàng nào để thanh toán !");
            } else {
                window.location = "checkout?order=" + result;
            }
        }
    </script>
    
     <script>
            function add() {
                window.alert("Đã xóa sản phẩm trong giỏ hàng ");

            }
        </script>
        
        <script>
            function giohang() {
                window.alert("Cập nhật giỏ hàng thành công !");

            }
        </script>
    
</html>
