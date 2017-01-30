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
                        <li>تنظیمات کاربری</li>
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
                                <li  >
                                    <a href="${context}/orders.jsp"><i class="fa fa-list"></i> سفارشات من</a>
                                </li>
                                <li>
                                    <a href="${context}/wish.jsp"><i class="fa fa-heart"></i> علایق من</a>
                                </li>
                                <li class="active">
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
                        <h1>تنظیمات کاربری</h1>
                        <p class="text-muted">
                            چنانچه هر گونه سوالی در مورد سفارش خود دارید به بخش تیکتینگ مراجعه کنید:
                            <br/><a href="contact.jsp">تیکتینگ</a>
                        همکاران شما در این بخش به شکل ۲۴ ساعته پاسخگو هستند.
                        </p>
                        <h3>تغیر گذرواژه</h3>

                        <form action="${context}/doedit">
                            <div class="row">
                                <div class="col-sm-6 pull-right">
                                    <div class="form-group">
                                        <label for="password_old">
                                            گذرواژه قدیمی
                                        </label>
                                        <input type="password" class="form-control" id="password_old">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 pull-right">
                                    <div class="form-group">
                                        <label for="password_1">گذرواژه جدید</label>
                                        <input type="password" class="form-control" id="password_1">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_2">لطفا گذرواژه جدید را تکرار کنید</label>
                                        <input type="password" class="form-control" id="password_2">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="col-sm-12 text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> ذخیره سازی گذرواژه</button>
                            </div>
                        </form>

                        <hr>

                        <h3>اطلاعات کاربری جهت ارسال مرسوله</h3>
                        <form action="${context}/doupdate">
                            <div>
                                ${message}
                            </div>
                            <div class="row">
                                <div class="col-sm-6 pull-right">
                                    <div class="form-group">
                                        <label for="firstname">نام</label>
                                        <input type="text" class="form-control" name="firstname">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lastname">نام خانوادگی</label>
                                        <input type="text" class="form-control" name="lastname">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <div class="col-sm-6 pull-right">
                                    <div class="form-group">
                                        <label for="company">آدرس</label>
                                        <input type="text" class="form-control" name="add">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="street">آدرس محل کار</label>
                                        <input type="text" class="form-control" name="addjob">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <div class="col-sm-6 col-md-3 pull-right">
                                    <div class="form-group">
                                        <label for="city">کدپستی</label>
                                        <input type="text" class="form-control" name="post">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 pull-right">
                                    <div class="form-group">
                                        <label for="zip">کدملی</label>
                                        <input type="text" class="form-control" name="meli">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 pull-right">
                                    <div class="form-group">
                                        <label for="state">استان</label>
                                        <select class="form-control" name="state"></select>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="form-group">
                                        <label for="country">شهر</label>
                                        <select class="form-control" name="city"></select>
                                    </div>
                                </div>

                                <div class="col-sm-6 pull-right">
                                    <div class="form-group">
                                        <label for="phone">تلفن همراه</label>
                                        <input type="text" class="form-control" name="phone">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="email">تلفن ثابت</label>
                                        <input type="text" class="form-control" name="tel">
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save changes</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>