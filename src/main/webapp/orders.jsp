<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("page", "index");    
    String context = request.getContextPath();
    request.setAttribute("context", context);
    request.setAttribute("mid", request.getParameter("id"));
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
                        <li>سفارشات من</li>
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

                                <div class="col-md-9" id="customer-orders" dir="rtl">
                    <div class="box">
                        <h1>سفارشات من</h1>

                        <p class="lead">لیست سفارشات من </p>
                        <p class="text-muted">
                            چنانچه هر گونه سوالی در مورد سفارش خود دارید به بخش تیکتینگ مراجعه کنید:
                            <br/><a href="contact.jsp">تیکتینگ</a>
                        همکاران شما در این بخش به شکل ۲۴ ساعته پاسخگو هستند.
                        </p>

                        <hr>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead >
                                    <tr style="text-align: right">
                                        <th style="text-align: right">شماره سفارش</th>
                                        <th style="text-align: right">زمان</th>
                                        <th style="text-align: right">جمع هزینه</th>
                                        <th style="text-align: right">وضعیت</th>
                                        <th style="text-align: right">نمایش جزییات</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <sql:query var="result" dataSource="con6">SELECT
                                            orderNum,cost,dt,u.name,store_order.id,status
                                            from store_order
                                       inner join users as u on u.id=store_order.iduser
                                       where u.id=${key}
                                        </sql:query>
                                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                            <tr>
                                                
                                        <th style="text-align: right"># ${row.orderNum}</th>
                                        <td style="text-align: right">${row.dt}</td>
                                        <td style="text-align: right">${p.money(row.cost)}</td>
                                        <td style="text-align: right">
                                            <c:if test="${!row.status}">
                                                <span class="label label-info">
                                                    در حال بررسی
                                                </span>
                                                    </c:if>
                                                    <c:if test="${row.status}">
                                                        <span class="label label-success">
                                                        ثبت شده و ارسال
                                                        </span>
                                                    </c:if>
                                            
                                        </td>
                                        <td style="text-align: right"><a href="order.jsp?id=${row.id}&cost=${row.cost}&time=${row.dt}&status=${row.status}&orderN=${row.orderNum}" class="btn btn-primary btn-sm">نمایش</a>
                                        </td>
                                    
                                                
                                        </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>