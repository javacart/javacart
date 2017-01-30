<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("menu", "menu");   
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
                <div class="col-md-12">
                    <div id="main-slider">
                        <sql:query var="result" dataSource="con6">SELECT imgsrc FROM index_material where isslider=1</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                        <div class="item">
                            <img data-src="${context}/res/img/slider/${row.imgsrc}" alt="" class="lazyOwl"/>
                        </div>
                        </c:forEach>
                        
                    </div>
                    <!-- /#main-slider -->
                </div>
            </div>

            <!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->
            <div id="advantages">

                <div class="container">
                    <div class="same-height-row">
                        <sql:query var="result" dataSource="con6">SELECT adv_title,adv_desc,adv_icon,url FROM index_material where isadvantage=1</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                        
                            <div class="col-sm-4 pull-right" dir="rtl">
                            <div class="box same-height clickable">
                                <div class="icon"><i class="fa ${row.adv_icon}"></i>
                                </div>

                                <h3><a href="${row.url}">${row.adv_title}</a></h3>
                                <p>${row.adv_desc}</p>
                            </div>
                        </div>
                        </c:forEach>
                        
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

            </div>
            <!-- /#advantages -->

            <!-- *** ADVANTAGES END *** -->

            <!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
            <div id="hot">

                <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>ویژه های هفته</h2>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="product-slider">
                        
                        <sql:query var="mresult" dataSource="con6">SELECT
                            name,price,oldprice,sp.id,issale,isnew,isgift
                            FROM index_material as im
                            inner join store_products as sp on im.idproduct=sp.id
                            where ishweak=1</sql:query>
                        <c:forEach varStatus="counter" var="mrow" items="${mresult.rows}">
                        <c:set var="mainid" value="${mrow.id}"/>
                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <sql:query var="result" dataSource="con6">SELECT
                                            url
                            FROM store_products_img
                            where idproduct=${mainid} limit 0,1</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                        <div class="front">
                                            <a href="${context}/detail.jsp?id=${mainid}">
                                                <img src="${context}/res/img/product/${row.url}" alt="" class="img-responsive">
                                            </a>
                                        </div>
                        </c:forEach>
                            <sql:query var="result" dataSource="con6">SELECT
                                            url
                            FROM store_products_img
                            where idproduct=${mainid} limit 1,2</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                        <div class="back">
                                            <a href="${context}/detail.jsp?id=${mainid}">
                                                <img src="${context}/res/img/product/${row.url}" alt="" class="img-responsive">
                                            </a>
                                        </div>
                        </c:forEach>
                                    </div>
                                </div>
                                <a href="${context}/detail.jsp?id=${mainid}" class="invisible">
                                    <img src="${context}/res/img/product/product2.jpg" alt="" class="img-responsive">
                                </a>
                                <div class="text">
                                    <h3><a href="${context}/detail.jsp?id=${mainid}">${mrow.name}</a></h3>
                                    <p class="price">
                                        <c:if test="${mrow.oldprice!='0'}">
                                        <del>${mrow.oldprice}</del>
                                        </c:if>
                                        ${mrow.price}</p>
                                </div>
                                <!-- /.text -->

                                <!-- /.ribbon -->
                                <c:if test="${mrow.issale}">
                                <div class="ribbon sale">
                                    <div class="theribbon">ویژه</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                </c:if>
                                <c:if test="${mrow.isnew}">
                                <div class="ribbon new">
                                    <div class="theribbon">جدید</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                </c:if>
                                <!-- /.ribbon -->
                                <c:if test="${mrow.isgift}">
                                <div class="ribbon gift">
                                    <div class="theribbon">جایزه</div>
                                    <div class="ribbon-background"></div>
                                </div>
                                </c:if>
                                <!-- /.ribbon -->
                            </div>
                            <!-- /.product -->
                        </div>
                        </c:forEach>
                        

                    </div>
                    <!-- /.product-slider -->
                </div>
                <!-- /.container -->

            </div>
            <!-- /#hot -->

            <!-- *** HOT END *** -->

            <!-- *** GET INSPIRED ***
 _________________________________________________________ -->
            <div class="container" data-animate="fadeInUpBig">
                <div class="col-md-12">
                    <div class="box slideshow">
                        <h3>آخرین محصولات</h3>
                        <p class="lead">بهترین سامانه های مدیریت فرایند و مدیریت سازمان</p>
                        <div id="get-inspired" class="owl-carousel owl-theme">
                            <sql:query var="result" dataSource="con6">SELECT imgsrc FROM index_material where isslider2=1</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                        <div class="item">
                            <img data-src="${context}/res/img/slider/${row.imgsrc}" alt="" class="lazyOwl"/>
                        </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!-- *** GET INSPIRED END *** -->

            <!-- *** BLOG HOMEPAGE ***
 _________________________________________________________ -->

            <div dir="rtl" class="box text-center" data-animate="fadeInUp">
                <div class="container">
                    <div class="col-md-12">
                        <h3 class="text-uppercase">وبلاگ فروشگاه</h3>

                        <p class="lead">
                            آخرین مقالات مرتبط را در وبلاگ ما پیگری کنید.
                            <a href="blog.jsp">
                                مرور آخرین اخبار!
                            </a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="container">

                <div class="col-md-12" data-animate="fadeInUp">

                    <div dir="rtl" id="blog-homepage" class="row">
                        <sql:query var="result" dataSource="con6">SELECT
                            title,content,name,blog.id
                            FROM blog
                            inner join blogcategory as bc on bc.id=blog.categoryid
                             limit 2</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                          
                        <div class="col-sm-6 pull-right">
                            <div class="post">
                                <h4><a href="blog.jsp">
                                    ${row.title}
                                    </a></h4>
                                    <p  class="author-category">
                                    توسط
                                    <a href="#">
                                    مدیر
                                    </a> در دسته <a href="">
                                    ${row.name}
                                    </a>
                                </p>
                                <hr>
                                <p style="text-align: right" class="intro">${row.content}</p>
                                <p class="read-more"><a href="blog.jsp?id=${row.id}" class="btn btn-primary">مشاهده ادامه مطلب</a>
                                </p>
                            </div>
                        </div>

                        </c:forEach>

                    </div>
                    <!-- /#blog-homepage -->
                </div>
            </div>
            <!-- /.container -->

            <!-- *** BLOG HOMEPAGE END *** -->


        </div>
    </jsp:body>
</t:index>