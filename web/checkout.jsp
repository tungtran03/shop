<%-- 
    Document   : cartscheckout
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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="css/checkoutcss.css">
    </head>
    <body>
        <div class="container wrapper">
            <div class="row cart-head">
                <div class="container">
                <div class="row">
                    <p></p>
                </div>
                    <div style="width: fit-content;
                     margin-left: 9%;
                     margin-bottom:  2%;">
                    <a style="text-decoration: none;" href="carts.jsp">
                        <h6><i class="fa fa-long-arrow-left" ></i>&nbsp;Trở lại</h6>
                    </a>
                </div>
                <div class="row">
                    <p></p>
                </div>
                </div>
            </div>    
            <div class="row cart-body">
                <form class="form-horizontal" method="post" action="checkout">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    <!--REVIEW ORDER-->
                   <div class="panel panel-info">
                            <div class="panel-heading">
                                Review Order <div class="pull-right"><small><a class="afix-1" href="carts.jsp">Edit Cart</a></small></div>
                            </div>
                            <div class="panel-body">
                                <c:forEach items="${requestScope.code}" var="sanpham">
                                    <div class="form-group"><hr /></div>
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                            <img class="img-responsive" src="${sanpham.getKey().images}" />
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div style="color: #3b71ca;" class="col-xs-12">${sanpham.getKey().tensp}</div>
                                            <div class="col-xs-12"><small>Số lượng: <span>${sanpham.getValue()}</span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <input readonly="" type="hidden" name="price" value="${(sanpham.getKey().giaban - sanpham.getKey().giaban*sanpham.getKey().giamgia/100)*sanpham.getValue()}">
                                            <h6 ><fmt:formatNumber pattern="###,###" value="${(sanpham.getKey().giaban - sanpham.getKey().giaban*sanpham.getKey().giamgia/100)*sanpham.getValue()}"/>₫ </h6>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="form-group"><hr /></div>
                                <div class="form-group">
                                    <div style="display: flex;
                                         justify-content: space-around;
                                         height: 37px;" class="col-md-12">
                                        <input style="width:74%" type="text" oninput="changemagg()" class="col-sm-6 col-xs-6" id="magg" name="magg" placeholder="Mã giảm giá" value="" />
                                        <input style="width: 16%; display: flex;
                                               justify-content: center;color: white;
                                               background-color: #338dbc;
                                               border: none;
                                               border-radius: 3px;"  onclick="checkgiamgia()" type="button" class="col-sm-3 col-xs-3 text-right" value="Sử dụng" />
                                    </div>
                                    <div id="noti"style="margin-left: 2.5%;    margin-top: 1%; color:#ff6d6d;display: none" class="col-xs-12">
                                        <small  id="noticheck">Phí ship</small>
                                    </div>
                                </div>
                                <div class="form-group"><hr /></div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <strong>Tạm tính</strong>
                                        <div id="demo" class="pull-right"></div>
                                    </div>
                                    <div class="col-xs-12">
                                        <small>Phí ship</small>
                                        <div id="ship" class="pull-right">-</div>
                                        <input readonly="" type="hidden" id="phiship" name="phiship">
                                    </div>
                                    <div class="col-xs-12">
                                        <small>Giảm giá</small>
                                        <div id="discount" class="pull-right">-</div>
                                        <input readonly="" type="hidden" id="discount" name="discount">
                                    </div>
                                </div>
                                <div class="form-group"><hr /></div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <strong>Tổng tiền</strong>
                                        <div id="total" class="pull-right"></div>
                                        <input style="width:74%" type="hidden" id="totalreal" name="total" value="" />
                                        <input style="width:74%" type="hidden" id="nomal" name="totalfirst" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--REVIEW ORDER END-->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                        <!--SHIPPING METHOD-->
                        <div class="panel panel-info">
                            <div class="panel-heading">Thông tin vận chuyển</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <h4>Thông tin nhận hàng</h4>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Họ và tên:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="hoten" value="${sessionScope.account.hoten}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <strong>Số điện thoại:</strong>
                                        <input type="text" name="phone" class="form-control" value="${sessionScope.account.phone}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <strong>Email:</strong>
                                        <input type="email" name="email" class="form-control" value="${sessionScope.account.email}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Địa chỉ:</strong></div>
                                    <div class="col-md-12">
                                        <input required="" type="text" class="form-control" id="adress" value="" placeholder="Số nhà, đường" />
                                    </div>
                                    <div class="col-md-12">
                                        <input required="" type="hidden" class="form-control" id="adressreal" name="diachi" value="" placeholder="Số nhà, đường" />
                                    </div>
                                    <div class="col-md-12">
                                        <select required=""  class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                            <option value="" selected>Chọn tỉnh thành</option>  
                                        </select>

                                        <select required="" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                                            <option value="" selected>Chọn quận huyện</option>
                                        </select>

                                        <select required=""  class="form-select form-select-sm mb-3" id="ward" aria-label=".form-select-sm">
                                            <option value="" selected>Chọn phường xã</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--SHIPPING METHOD END-->
                        <!--CREDIT CART PAYMENT-->
                        <div class="panel panel-info">
                            <div class="panel-heading"><span><i class="fa fa-cc-visa"></i></span>&nbsp;Thông tin thanh toán</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Phương thức thanh toán:</strong></div>
                                    <div class="col-md-12">
                                        <select onchange="methodChanged(this)" id="CreditCardType" name="Method" class="form-control">
                                            <c:forEach items="${sessionScope.listmethod}" var="method">
                                                <option value="${method.id}">${method.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div id="cre" style="display: none">
                                    <div class="form-group">
                                        <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                        <div class="col-md-12"><input disabled="" type="text" class="form-control" id="car_number" name="car_number" value="" /></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12"><strong>Card CVV:</strong></div>
                                        <div class="col-md-12"><input disabled="" type="text"  class="form-control" id="car_code" name="car_code" value="" /></div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <strong>Expiration Date</strong>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <select disabled="" class="form-control" id="car_month" name="car_month">
                                                <option value="">Month</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <select disabled="" class="form-control" id="car_year" name="car_year">
                                                <option value="">Year</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                                <option value="2025">2025</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button onclick="checkout()" class="btn btn-primary btn-submit-fix">Đặt hàng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--CREDIT CART PAYMENT END-->
                    </div>

                    </forqum>
            </div>
            <div class="row cart-footer">

            </div>
        </div>
        <div class="form-group"><hr /></div>
        <footer style="
                text-align: center;
                margin-bottom: 1%;">Checkout by DBWeb</footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    </body>
    <div class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
                                            const show = document.querySelector('#cre');
                                            const VND = new Intl.NumberFormat('vi-VN', {
                                                style: 'currency',
                                                currency: 'VND',
                                            });
                                            var price = document.getElementsByName('price');
                                            var total = 0;
                                            var ship = 0;
                                            var discount = 0;
                                            for (var i = 0; i < price.length; i++) {
                                                total += Number(price[i].value);
                                            }
                                            var totalfirst = total;
                                            document.getElementById("demo").innerHTML = VND.format(total);
                                            function methodChanged(obj)
                                            {
                                                var cn = document.getElementById("car_number");
                                                var cc = document.getElementById("car_code");
                                                var cm = document.getElementById("car_month");
                                                var cy = document.getElementById("car_year");
                                                var value = obj.value;
                                                if (value === '4') {
                                                    show.style.display = 'block';
                                                    cn.disabled = false;
                                                    cc.disabled = false;
                                                    cm.disabled = false;
                                                    cy.disabled = false;
                                                } else {
                                                    show.style.display = 'none';
                                                    cn.disabled = true;
                                                    cc.disabled = true;
                                                    cm.disabled = true;
                                                    cy.disabled = true;
                                                }
                                            }
                                            ;
                                            var citis = document.getElementById("city");
                                            var districts = document.getElementById("district");
                                            var wards = document.getElementById("ward");
                                            var Parameter = {
                                                url: "./data/vietnam.json", //Đường dẫn đến file chứa dữ liệu hoặc api do backend cung cấp
                                                method: "GET", //do backend cung cấp
                                                responseType: "application/json", //kiểu Dữ liệu trả về do backend cung cấp
                                            };
                                            //gọi ajax = axios => nó trả về cho chúng ta là một promise
                                            var promise = axios(Parameter);
                                            //Xử lý khi request thành công
                                            promise.then(function (result) {
                                                renderCity(result.data);
                                            });
                                            function renderCity(data) {
                                                for (const x of data) {
                                                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
                                                }
                                                // xứ lý khi thay đổi tỉnh thành thì sẽ hiển thị ra quận huyện thuộc tỉnh thành đó
                                                citis.onchange = function () {
                                                    district.length = 1;
                                                    ward.length = 1;
                                                    if (this.value !== "") {
                                                        const result = data.filter(n => n.Id === this.value);
                                                        for (const k of result[0].Districts) {
                                                            district.options[district.options.length] = new Option(k.Name, k.Id);
                                                        }
                                                    }
                                                    var phiship = document.getElementById("phiship").value;
                                                    if (this.value == "01" || this.value == "79") {
                                                        ship = 25000;
                                                    } else {
                                                        ship = 35000;
                                                    }
                                                    $("#phiship").val(ship);
                                                    //totalfirst = (total + ship);
                                                    total = (total + ship) - (total + ship) * discount / 100;
                                                    document.getElementById("ship").innerHTML = VND.format(ship);
                                                    document.getElementById("total").innerHTML = VND.format(total);
                                                };
                                                document.getElementById("total").innerHTML = VND.format(total + ship);
                                                // xứ lý khi thay đổi quận huyện thì sẽ hiển thị ra phường xã thuộc quận huyện đó
                                                district.onchange = function () {
                                                    ward.length = 1;
                                                    const dataCity = data.filter((n) => n.Id === citis.value);
                                                    if (this.value !== "") {
                                                        const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
                                                        for (const w of dataWards) {
                                                            wards.options[wards.options.length] = new Option(w.Name, w.Id);
                                                        }
                                                    }
                                                };
                                            }
                                            ;
                                            var city = "";
                                            var quan = "";
                                            var phuongxa = "";
                                            var adressreal = "";
                                            //Thanh toán nào
                                            $(function () {
                                                $("#city").change(function () {
                                                    city = $("#city option:selected").text();
                                                })
                                            })
                                            $(function () {
                                                $("#district").change(function () {
                                                    quan = $("#district option:selected").text();
                                                })
                                            })
                                            $(function () {
                                                $("#ward").change(function () {
                                                    phuongxa = $("#ward option:selected").text();
                                                })
                                            })
                                            function checkout() {
                                                var adress = document.getElementById("adress").value;
                                                var totalin = document.getElementById("totalreal").value;
                                                var nomal = document.getElementById("nomal").value;
                                                adressreal = adress + ", " + phuongxa + ", " + quan + ", " + city;
                                                totalin = total;
                                                nomal = totalfirst;
                                                $("#adressreal").val(adressreal);
                                                $("#totalreal").val(totalin);
                                                $("#nomal").val(nomal);
                                                return true;
                                            }
                                            ;
                                            function checkgiamgia() {
                                                let noti = "Mã giảm giá không khả dụng";
                                                const show = document.querySelector('#noti');
                                                var magg = document.getElementById("magg").value;
                                                var gg = 10;
                                                if (magg === 'tttt') {
                                                    noti = "Áp thành công mã giảm giá " +gg + "%";
                                                    discount = gg;
                                                    total = total - total * discount / 100;
                                                }

                                                show.style.display = 'block';
                                                document.getElementById("noticheck").innerHTML = noti;
                                                document.getElementById("total").innerHTML = VND.format(total);
                                            }
                                            ;
                                            function changemagg() {
                                                const show = document.querySelector('#noti');
                                                show.style.display = 'none';
                                                discount = 0;
                                                total = totalfirst;
                                                document.getElementById("total").innerHTML = VND.format(total);
                                            }
    </script>

    <script>
    </script>
</html>