<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("page", "index");    
    String context = request.getContextPath();
    request.setAttribute("context", context);
    request.setAttribute("mid", request.getParameter("id"));
    
    String time=request.getParameter("time");
    String orderN=request.getParameter("orderN");
    request.setAttribute("orderN", orderN);
    String cost=request.getParameter("cost");
    request.setAttribute("cost", cost);
    String status=request.getParameter("status");
    request.setAttribute("status", status);
    request.setAttribute("time", time);

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
                        <li>سفارش ${orderN}</li>
                    </ul>
                </div>

                <div class="col-md-3 pull-right">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu" dir="rtl" style="text-align: right;">

                        <div class="panel-heading">
                            <h3 class="panel-title">پنل من</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked" style="padding-right: 0;">
                                <li class="active" >
                                    <a href="${context}/orders.jsp"><i class="fa fa-list"></i> سفارشات من</a>
                                </li>
                                <li>
                                    <a href="${context}/wish.jsp"><i class="fa fa-heart"></i> علایق من</a>
                                </li>
                                <li>
                                    <a href="${context}/acount.jsp"><i class="fa fa-user"></i> تنظیمات آدرس</a>
                                </li>
                                <li>
                                    <a href="${context}/dologout"><i class="fa fa-sign-out"></i> خروج</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                                <div class="col-md-9" id="customer-order" dir="rtl">
                    <div class="box">
                        <h1>سفارش شماره # ${orderN}</h1>

                        <p class="lead">
                            سفارش شماره 
                            # ${orderN} 
                            در تاریخ
                            <strong>${time}</strong> دریافت شد و
                            <strong>
                                <c:if test="${!status}">
                                    در حال بررسی است
                                </c:if>
                                <c:if test="${status}">
                                    ثبت شده و در حال ارسال است
                                </c:if>
                            </strong>.</p>
                        <p class="text-muted">
                            چنانچه هر گونه سوالی در مورد سفارش خود دارید به بخش تیکتینگ مراجعه کنید:
                            <br/><a href="contact.jsp">تیکتینگ</a>
                        همکاران شما در این بخش به شکل ۲۴ ساعته پاسخگو هستند.
                        </p>

                        <hr>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="text-align: right" colspan="2">محصول</th>
                                        <th style="text-align: right">تعداد</th>
                                        <th style="text-align: right">فی</th>
                                        <th style="text-align: right">تخفیف</th>
                                        <th style="text-align: right">جمع کل</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <sql:query var="result" dataSource="con6">SELECT
                                            amount,name,price,sp.id
                                            from store_order_item as spi
                                       inner join store_products as sp on sp.id=spi.product_id
                                       where order_id=${mid}
                                        </sql:query>
                                        <c:forEach varStatus="counter" var="mrow" items="${result.rows}">
                                            <c:set var="mini" value="${mrow.id}"/>
                                            
                                    <tr>
                                        <td>
                                            <sql:query var="sresult" dataSource="con6">SELECT
                                            url
                            FROM store_products_img
                            where idproduct=${mini} limit 0,1</sql:query>
                            <c:forEach varStatus="scounter" var="srow" items="${sresult.rows}">
                                <a href="#">
                                                <img src="${context}/res/img/product/${srow.url}" alt=""/>
                                            </a>
                           
                            </c:forEach>
                                            
                                        </td>
                                        <td><a href="#">${mrow.name}</a>
                                        </td>
                                        <td>${mrow.amount}</td>
                                        <td>${p.money(mrow.price)}</td>
                                        <td>0</td>
                                        <td>${p.money(mrow.price*mrow.amount)}</td>
                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                                <tfoot >
                                    <tr>
                                        <th colspan="5" class="text-left">جمع فاکتور</th>
                                        <th>${p.money(cost)}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-left">هزینه بسته بندی و ارسال</th>
                                        <th>${p.money('0')}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-left">مالیات</th>
                                        <th>${p.money('0')}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-left">جمع کل</th>
                                        <th>${p.money(cost)}</th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="row addresses">
                            
                            <div class="col-md-6 pull-right">
                                <h2>آدرس ارسال شده:</h2>
                                <p></p>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>