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
                                <li >
                                    <a href="contact.jsp">تماس با ما</a>
                                </li>
                                <li >
                                    <a href="about.jsp">درباره ما</a>
                                </li>
                                <li class="active">
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

                                                <div class="col-sm-9" id="blog-listing" dir="rtl">

                    

                    <div class="box">

                        <h1>آخرین اخبار فروشگاه</h1>
                        

                    </div>

                    <div class="post">
                        <h2><a href="#">خبر یک</a></h2>
                        <p class="author-category">توسط
                            <a href="#">مدیر فروشگاه</a> در <a href="#">حوزه عمومی</a>
                        </p>
                        <hr>
                        <p class="date-comments">
                            <a href="#"><i class="fa fa-calendar-o"></i> دیروز</a>
                            <a href="#"><i class="fa fa-comment-o"></i> ۸ نظر</a>
                        </p>
                        <div class="image">
                            <a href="#">
                                <img src="${context}/res/img//blog2.jpg" class="img-responsive" alt="Example blog post alt">
                            </a>
                        </div>
                            <p class="intro">
                                توضیحات ابتدایی
                            </p>
                        <p class="read-more"><a href="#" class="btn btn-primary">مشاهده متن خبر</a>
                        </p>
                    </div>


                    <div class="post">
                        <h2><a href="#">خبر دوم</a></h2>
                        <p class="author-category">توسط
                            <a href="#">مدیر فروشگاه</a> در <a href="#">حوزه عمومی</a>
                        </p>
                        <hr>
                        <p class="date-comments">
                            <a href="#"><i class="fa fa-calendar-o"></i> دیروز</a>
                            <a href="#"><i class="fa fa-comment-o"></i> ۸ نظر</a>
                        </p>
                        <div class="image">
                            <a href="#">
                                <img src="${context}/res/img//blog.jpg" class="img-responsive" alt="Example blog post alt">
                            </a>
                        </div>
                        <p class="intro">
                        توضیحات بعدی
                        </p>
                        <p class="read-more"><a href="#" class="btn btn-primary">مشاهده متن خبر</a>
                        </p>
                    </div>

                    <ul class="pager">
                        <li class="previous disabled"><a href="#">&larr; جدیدتر</a>
                        </li>
                        <li class="next "><a href="#">قدیمی &rarr;</a>
                        </li>
                    </ul>



                </div>


                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>