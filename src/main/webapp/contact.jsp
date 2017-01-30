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
                        <li>فروشگاه jbpms.ir</li>
                    </ul>
                </div>

                        <div class="col-md-3 pull-right" dir="rtl">
                    <!-- *** PAGES MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">فروشگاه Jbpms.ir</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked" style="padding-right: 0;">
                                <li>
                                    <a href="faq.jsp">سوالات متداول</a>
                                </li>
                                <li class="active">
                                    <a href="contact.jsp">تماس با ما</a>
                                </li>
                                <li >
                                    <a href="about.jsp">درباره ما</a>
                                </li>
                                <li>
                                    <a href="blog.jsp">اخبار</a>
                                </li>
                                <li>
                                    <a href="law.jsp">قوانین ما</a>
                                </li>

                            </ul>

                        </div>
                    </div>

                    <!-- *** PAGES MENU END *** -->


                    <div class="banner">
                        <sql:query var="result" dataSource="con6">SELECT id,imgsrc,title FROM category where parent=0 and isbanner </sql:query>
                                                <c:forEach varStatus="counter" var="row" items="${result.rows}">

                                                            <a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">
                                                                <img src="${context}/res/img/product/${row.imgsrc}" class="img img-responsive" alt="${row.title}">
                                                            </a>
                                                </c:forEach>
                                                
                        
                    </div>
                </div>

                                                <div class="col-md-9" dir="rtl">


                    <div class="box" id="contact">
                        <h1>ارتباط با ما</h1>

                        <p class="lead">
                            راه های ارتباطی با فروشگاه jbpms.ir را می توانید در این قسمت مشاهده بفرمایید.
                            
                        </p>
                        
                        <hr>

                        <div class="row">
                            <div class="col-sm-4">
                                <h3><i class="fa fa-map-marker"></i> آدرس</h3>
                                <p>تهران
                                    <br>بزرگراه نواب
                                    <br>ساختمان گیتی
                                    <br>شماره ۱۲۹
                                    <br>
                                    <strong>دفتر اصلی</strong>
                                </p>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-4">
                                <h3><i class="fa fa-phone"></i> ارتباط تلفنی</h3>
                                <p class="text-muted">
                                    این شماره صرفا جهت ارائه راه کارهای بعدی می باشد.
                                </p>
                                <p><strong>+۹۸۹۳۸۷۷۱۹۳۵۱</strong>
                                </p>
                            </div>
                            <!-- /.col-sm-4 -->
                            <div class="col-sm-4">
                                <h3><i class="fa fa-envelope"></i> پشتیبانی تیکتینگ</h3>
                                <p class="text-muted">
                                لطفا سوالات خود را به ایمیل زیر ارسال کنید:
                                </p>
                                <ul>
                                    <li><strong><a href="mailto:info@jbpms.ir">info@jbpms.ir</a></strong>
                                    </li>
                                    <li><strong><a href="#">تیکتینگ</a></strong></li>
                                </ul>
                            </div>
                            <!-- /.col-sm-4 -->
                        </div>
                        <!-- /.row -->

                        <hr>

                        <div id="map">

                        </div>

                        <hr>
                        <h2>فرم ارسال نظر</h2>

                        <form>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstname">نام</label>
                                        <input type="text" class="form-control" id="firstname">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lastname">نام خانوادگی</label>
                                        <input type="text" class="form-control" id="lastname">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="email">ایمیل</label>
                                        <input type="text" class="form-control" id="email">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="subject">موضوع</label>
                                        <input type="text" class="form-control" id="subject">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="message">پیام</label>
                                        <textarea id="message" class="form-control"></textarea>
                                    </div>
                                </div>

                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> ارسال پیام</button>

                                </div>
                            </div>
                            <!-- /.row -->
                        </form>


                    </div>


                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>