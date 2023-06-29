<%-- 
    Document   : carts_empty
    Created on : Mar 13, 2023, 2:53:47 PM
    Author     : tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
            />
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />

    </head>
    <body>
        <div class="container-fluid  mt-100">
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-body cart">
                            <div class="col-sm-12 empty-cart-cls text-center">
                                <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                <h3><strong>Không có sản phẩm nào để thanh toán</strong></h3>
                                <h4>Thêm vài sản phẩm đi cho chủ shop vui :))))</h4>
                                <a href="auth" class="btn btn-primary cart-btn-transform m-3" data-abc="true">Tiếp tục mua sắm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
