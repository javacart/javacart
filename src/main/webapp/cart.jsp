<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("page", "index");    
    String context = request.getContextPath();
    request.setAttribute("context", context);
    
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

                <div class="col-md-9 pull-right" dir="rtl" style="text-align: right" id="basket">

                    <div class="box">

                        <form method="get" action="${context}/cartu">

                            <h1>سبد خرید</h1>
                            <p class="text-muted">سبد خرید شما حاوی
                            ${carts_size}
                            آیتم می باشد.
                            </p>
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
                                                <input type="number"  name="num${counter.index}" value="${carts.get(mainid.toString())}"  style="width: 50px">
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

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="${context}/buy1.jsp" class="btn btn-primary">
                                        تکمیل فرایند خرید 
                                        <i class="fa fa-chevron-left"></i>
                                    </a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-refresh"></i> آپدیت سبد</button>
                                    
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


                    <div class="box">
                        <div class="box-header">
                            <h4>کد تخفیف</h4>
                        </div>
                        <p class="text-muted">
                            اگر کد تخفیف دارید در این قسمت وارد کنید.
                        </p>
                        <form dir="ltr">
                            <div class="input-group">

                                <input type="text" class="form-control">

                                <span class="input-group-btn">

					<button class="btn btn-primary" type="button"><i class="fa fa-gift"></i></button>

				    </span>
                            </div>
                            <!-- /input-group -->
                        </form>
                    </div>

                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>