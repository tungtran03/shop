<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>

            body{
                margin-top:20px;
                background:#f5f5f5;
            }
            /**
             * Panels
             */
            /*** General styles ***/
            .panel {
                box-shadow: none;
            }
            .panel-heading {
                border-bottom: 0;
            }
            .panel-title {
                font-size: 17px;
            }
            .panel-title > small {
                font-size: .75em;
                color: #999999;
            }
            .panel-body *:first-child {
                margin-top: 0;
            }
            .panel-footer {
                border-top: 0;
            }

            .panel-default > .panel-heading {
                color: #333333;
                background-color: transparent;
                border-color: rgba(0, 0, 0, 0.07);
            }

            form label {
                color: #999999;
                font-weight: 400;
            }

            .form-horizontal .form-group {
                margin-left: -15px;
                margin-right: -15px;
            }
            @media (min-width: 768px) {
                .form-horizontal .control-label {
                    text-align: right;
                    margin-bottom: 0;
                    padding-top: 7px;
                }
            }

            .profile__contact-info-icon {
                float: left;
                font-size: 18px;
                color: #999999;
            }
            .profile__contact-info-body {
                overflow: hidden;
                padding-left: 20px;
                color: #999999;
            }
            .profile-avatar {
                width: 274px;
                position: relative;
                height: 400px;
                border-radius: 0;
                margin: 0px auto;
                margin-top: 196px;
                border: 4px solid #f3f3f3;
            }
        </style>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container bootstrap snippets bootdeys">
            <div style="display: flex;
                 justify-content: center;" class="row">
                <div class="col-xs-12 col-sm-9">
                    <form class="form-horizontal" action="edit-product" method="post" enctype="multipart/form-data">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <img id="anhshow" src="${requestScope.SanPham.images}" class="img-circle profile-avatar" alt="Image">
                            </div>
                            <center><input id="anhinput" style="margin: 1.5%;" class="text-black-50" type="file" <c:if test="${requestScope.idcheck != 'add'}">value="${requestScope.idcheck}" </c:if>  id="file" name="file" <c:if test="${requestScope.idcheck == 'add'}">required="" </c:if>  /></center>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Thông tin sản phẩm </h4>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">ID sản phẩm</label>
                                        <div class="col-sm-10">
                                                <input name="idcheck" value="${requestScope.idcheck}" readonly="" type="hidden" class="form-control">
                                        <input name="id" value="${requestScope.SanPham.id}" readonly="" type="text" class="form-control">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Tên sản phẩm</label>
                                    <div class="col-sm-10">
                                        <input required="" name="name" value="${requestScope.SanPham.tensp}" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Loại</label>
                                    <div class="col-sm-10">
                                        <input required="" name="loai" value="${requestScope.SanPham.loai}" type="text" class="form-control">
                                    </div>
                                </div>
                                      <div class="form-group">
                                    <label class="col-sm-2 control-label">Xuất xứ</label>
                                    <div class="col-sm-10">
                                        <input required="" name="xuatxu" value="${requestScope.SanPham.xuatxu}" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Trọng lượng</label>
                                    <div class="col-sm-10">
                                        <input name="trongluong" required="" value="${requestScope.SanPham.trongluong}" placeholder="gram" min="1" type="number" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Giá bán(vnđ)</label>
                                    <div  class="col-sm-10">
                                        <input  name="giaban" required="" value="<fmt:formatNumber pattern="###" value="${requestScope.SanPham.giaban}"/>" min="1" placeholder="VND" type="number" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Giảm giá</label>
                                    <div  class="col-sm-10">
                                        <input  name="giamgia" required="" value="${requestScope.SanPham.giamgia}" min="0" placeholder="%" type="number" class="form-control" >
                                    </div>
                                </div>
                                     <div class="form-group">
                                    <label class="col-sm-2 control-label">Năm SX</label>
                                    <div  class="col-sm-10">
                                        <input  name="namsx" required="" value="${requestScope.SanPham.namsx}" min="0" placeholder="" type="number" class="form-control" >
                                    </div>
                                </div>
                              
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Thể loại</label>
                                    <div class="col-sm-10">
                                        <select name="category" class="form-control">
                                            <option value="${requestScope.SanPham.category.id}" selected="">${requestScope.SanPham.category.tenloai}</option>
                                            <c:forEach items="${sessionScope.listCategory}" var="ca">
                                                <option value="${ca.id}">${ca.tenloai}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                              </div>
                                     <div class="form-group">
                                    <label class="col-sm-2 control-label">Sell_id</label>
                                    <div  class="col-sm-10">
                                        <input  name="sell_id" required="" value="${requestScope.SanPham.sell_id}" min="0" placeholder="" type="number" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Số lượng</label>
                                    <div  class="col-sm-10">
                                        <input  name="soluongkho" required="" value="${requestScope.SanPham.slk}" min="0" placeholder="00000" type="number" class="form-control">
                                    </div>
                                </div>
                                    
<!--                                     <div class="form-group">
                                    <label class="col-sm-2 control-label">Trạng thái</label>
                                    <div class="col-sm-10">
                                        <input required="" name="trangthai" value="${requestScope.SanPham.trt}" type="text" class="form-control">
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Trạng thái</label>
                                    <div class="col-sm-10">
                                        <select name="stt" class="form-control">
                                            <option value="${requestScope.SanPham.trt}" selected="">
                                                <c:choose>
                                                    <c:when test="${requestScope.SanPham.trt == 3}">  
                                                        Đặt trước
                                                    </c:when>  
                                                    <c:when test="${requestScope.SanPham.trt == 4}">  
                                                        Hết hàng
                                                    </c:when> 
                                                    <c:when test="${requestScope.SanPham.trt == 5}">  
                                                        Còn hàng
                                                    </c:when>
                                                </c:choose>
                                            </option>
                                            <option value="3">Đặt trước</option>
                                            <option value="4">Hết hàng</option>
                                            <option value="5">Còn hàng</option>
                                        </select>
                                    </div>
                                </div>
                                <!--                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label">Ảnh </label>
                                                                    <div  class="col-sm-10">
                                                                        <input  name="img" value="${requestScope.book.img}" required="" type="text" class="form-control">
                                                                    </div>
                                                                </div>-->
                                <div class="form-group">
                                    <div class="col-sm-10 col-sm-offset-2">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <c:if test="${requestScope.idcheck != 'add'}">
                                            <button <c:if test="${sessionScope.account.role =='2'}">  </c:if> type="button" onclick="dodelete('${requestScope.SanPham.id}')" class="btn btn-danger">Delete</button>
                                        </c:if>
                                        <button type="reset" class="btn btn-default"><a href="tbl-product">Cancel</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function dodelete(id) {
                let text = "Chắc chắn xóa sản phẩm này?";
                if (confirm(text) === true) {
                    window.location = ("delete?action=product&id=" + id);
                }
            }

            const input = document.getElementById('anhinput');
            const image = document.getElementById('anhshow');

            input.addEventListener('change', (e) => {
                if (e.target.files.length) {
                    const src = URL.createObjectURL(e.target.files[0]);
                    image.src = src;
                }
            });
        </script>
    </body>
</html>