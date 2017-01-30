<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("page", "index");    
    String context = request.getContextPath();
    request.setAttribute("context", context);
    
%>

<%
        Boolean log = (Boolean) session.getAttribute("login");
        String key = (String) session.getAttribute("ukey");
        if(null==log||!log){
            response.sendRedirect(request.getContextPath()+"/register.jsp");
        }
        request.setAttribute("key", key);
%>
<t:index>
    <jsp:attribute name="maincss">
        <title>
        Jbpms | Collection of Java BPM System
        </title>
    </jsp:attribute>
    <jsp:body>
         <div id="content">
            <div class="container">

                <div class="col-md-12" >
                    <ul class="breadcrumb" dir="rtl">
                        <li><a href="${context}">خانه</a>
                        </li>
                        <li>سبد خرید</li>
                    </ul>
                </div>

                <div class="col-md-9 pull-right" dir="rtl"  id="checkout">

                    <div class="box">
                        <form action="${context}/dobuy">
                            <h1>تکمیل فرایند خرید-نحوه پرداخت</h1>
                            <ul dir="ltr" class="nav nav-pills nav-justified ">
                                <li class="active "><a href="#"><i class="fa fa-eye"></i><br>مرور</a>
                                </li>
                                <li class=""><a href="${context}/buy3.jsp"><i class="fa fa-money"></i><br>نحوه پرداخت</a>
                                </li>
                                <li class=""><a href="${context}/buy2.jsp"><i class="fa fa-truck"></i><br>نحوه ارسال</a>
                                </li>
                                <li class=""><a href="${context}/buy1.jsp"><i class="fa fa-map-marker"></i><br>آدرس ارسال</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="table-responsive">
                                    <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: right" colspan="2">آیتم</th>
                                            <th style="text-align: right">تعداد</th>
                                            <th style="text-align: right">فی</th>
                                            <th style="text-align: right">تخفیف</th>
                                            <th style="text-align: right" colspan="2">جمع</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="result" dataSource="con6">SELECT 
                                            sp.name,sp.price,spi.url,sp.id
                                            FROM store_products as sp
                                            inner join store_products_img as spi on spi.idproduct=sp.id
                                            where sp.id in (${carts_id})
                                             </sql:query>
                                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                            <c:set  var="mainid" value="${row.id}"/>
                                        <tr>
                                            <td>
                                                <a href="#">
                                                    <img src="${context}/res/img/product/${row.url}" alt="White Blouse Armani">
                                                </a>
                                            </td>
                                            <td><a href="#">${row.name}</a>
                                            </td>
                                            <td>
                                                ${carts.get(mainid.toString())}
                                            </td>
                                            <td>${p.money(row.price)}</td>
                                            <td>0</td>
                                            <td>${p.money(row.price*carts.get(mainid.toString()))}</td>
                                            <td><a href="${context}/cartd?id=${row.id}"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th style="text-align: right" colspan="5">جمع کل</th>
                                            <th style="text-align: right" colspan="2">${p.money(carts_cost)}</th>
                                        </tr>
                                    </tfoot>
                                </table>

                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.content -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <button type="submit" class="btn btn-primary">تکمیل خرید<i class="fa fa-chevron-left"></i>
                                    </button>
                                </div>
                                <div class="pull-right">
                                    <a href="${context}/buy3.jsp" class="btn btn-default"><i class="fa fa-chevron-right"></i>بازگشت به نحوه پرداخت</a>
                                    
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                    


                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3" dir="rtl">
                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>خلاصه خرید</h3>
                        </div>
                        <p class="text-muted">
                        خلاصه صورت حساب شما بر اساس آیتم های انتخاب شده به شکل زیر است:
                        </p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>جمع خرید</td>
                                        <th>${carts_cost}</th>
                                    </tr>
                                    <tr>
                                        <td>بسته بندی و ارسال</td>
                                        <th>۰</th>
                                    </tr>
                                    <tr>
                                        <td>مالیات</td>
                                        <th>۰</th>
                                    </tr>
                                    <tr class="total">
                                        <td>جمع کل</td>
                                        <th>${p.money(carts_cost)}</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>


                    

                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>