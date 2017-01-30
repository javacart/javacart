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
                        <li><a href="#">خانه</a>
                        </li>
                        <li>ثبت نام</li>
                    </ul>
                </div>

                <div class="col-md-6" dir="rtl">
                    <div class="box">
                        <h1>کاربر جدید هستید؟</h1>

                        <p class="lead">تنها با پر کردن همین فرم می توانید در سامانه عضو شوید.</p>
                        
                        <hr>
                        <div style="color:red" dir="rtl">
                            ${messagereg}
                        </div>
                        <form action="${context}/doregister" >
                            <div class="form-group">
                                <label for="name">نام</label>
                                <input type="text" class="form-control" name="name">
                            </div>
                            <div class="form-group">
                                <label for="email">ایمیل</label>
                                <input type="text" class="form-control" name="user">
                            </div>
                            <div class="form-group">
                                <label for="password">گذرواژه</label>
                                <input type="password" class="form-control" name="pass">
                            </div>
                            <div class="form-group">
                                <label for="password">تکرار گذارواژه</label>
                                <input type="password" class="form-control" name="pass1">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> ثبت نام</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-md-6" dir="rtl">
                    <div class="box">
                        <h1>ورود</h1>

                        <p class="lead">آیا قبلا ثبت نام کرده اید؟</p>
                        
                        <hr>
                        <div style="color:red" dir="rtl">
                            ${message}
                        </div>
                        <form action="${context}/dologin" >
                            <div class="form-group">
                                <label for="email">ایمیل</label>
                                <input type="text" class="form-control" name="user">
                            </div>
                            <div class="form-group">
                                <label for="password">گذرواژه</label>
                                <input type="password" class="form-control" name="pass">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> ورود</button>
                            </div>
                        </form>
                        <p><a href="${context}/forgot.jsp">گذرواژه را فراموش کردید؟</a></p>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>