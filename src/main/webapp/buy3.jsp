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
                        <form method="post" action="buy4.jsp">
                            <h1>تکمیل فرایند خرید-نحوه پرداخت</h1>
                            <ul dir="ltr" class="nav nav-pills nav-justified ">
                                <li class="disabled "><a href="${context}/buy4.jsp"><i class="fa fa-eye"></i><br>مرور</a>
                                </li>
                                <li class="active"><a href="${context}/buy3.jsp"><i class="fa fa-money"></i><br>نحوه پرداخت</a>
                                </li>
                                <li class=""><a href="#"><i class="fa fa-truck"></i><br>نحوه ارسال</a>
                                </li>
                                <li class=""><a href="${context}/buy1.jsp"><i class="fa fa-map-marker"></i><br>آدرس ارسال</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6 pull-right">
                                        <div class="box payment-method">

                                            <h4>درگاه بانکی</h4>

                                            <p>پرداخت از طریق درگاه بانکی با تمامی کارت های عضو شتاب</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="payment" value="payment1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="box payment-method">

                                            <h4>درگاه مجازی زرین پال</h4>

                                            <p>چنانچه درگاه بانکی با مشکل مواجه بود از این درگاه استفاده کنید.</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="payment" value="payment2">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 pull-right">
                                        <div class="box payment-method">

                                            <h4>پرداخت در محل</h4>

                                            <p>پرداخت مبلغ به پست چی محترم</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="payment" value="payment3">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.content -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <button type="submit" class="btn btn-primary">تکمیل خرید<i class="fa fa-chevron-left"></i>
                                    </button>
                                </div>
                                <div class="pull-right">
                                    <a href="${context}/buy2.jsp" class="btn btn-default"><i class="fa fa-chevron-right"></i>بازگشت به نحوه ارسال</a>
                                    
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