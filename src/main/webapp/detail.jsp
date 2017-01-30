<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setAttribute("page", "index");    
    String context = request.getContextPath();
    request.setAttribute("context", context);
    String id=request.getParameter("id");
    
    if(null==id||id.length()==0){
        response.sendRedirect(request.getContextPath());
    }
    request.setAttribute("mid", id);
%>
<%
Cookie pr = new Cookie("product"+id,id);    
    response.addCookie(pr);
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
                        <li>کالای شماره ${mid}</li>
                    </ul>
                </div>

                <div class="col-md-9">
                    <sql:query var="mresult" dataSource="con6">
                            SELECT * FROM store_products where id=${mid} </sql:query>
                        <c:forEach varStatus="mcounter" var="mrow" items="${mresult.rows}">
                            <c:set var="mini" value="${mrow.idcateg}"/>
                        
                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <sql:query var="result" dataSource="con6">SELECT
                                            url
                            FROM store_products_img
                            where idproduct=${mid} limit 0,1</sql:query>
                            <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <div id="mainImage">
                                <img src="${context}/res/img/product/${row.url}" alt="" class="img-responsive">
                            </div>
                            </c:forEach>
                                <c:if test="${mrow.issale}">
                            <div class="ribbon sale">
                                <div class="theribbon">ویژه</div>
                                <div class="ribbon-background"></div>
                            </div>
                            </c:if>
                            <!-- /.ribbon -->
                            <c:if test="${mrow.isnew}">
                            <div class="ribbon new">
                                <div class="theribbon">جدید</div>
                                <div class="ribbon-background"></div>
                            </div>
                            </c:if>
                            <c:if test="${mrow.isnew}">
                            <div class="ribbon gift">
                                <div class="theribbon">جایزه</div>
                                <div class="ribbon-background"></div>
                            </div>
                            </c:if>
                            <!-- /.ribbon -->

                        </div>
                        <div class="col-sm-6" dir="rtl">
                            <div class="box">
                                <h1 class="text-center">${mrow.name}</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">
                                    توضیحات بیشتر    
                                    </a>
                                </p>
                                <p class="price">${p.money(mrow.price)}</p>

                                <p class="text-center buttons">
                                    <a href="${context}/cart?id=${mrow.id}" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> خرید</a> 
                                    <a href="${context}/wish?id=${mrow.id}" class="btn btn-default"><i class="fa fa-heart"></i> اضافه کردن به علاقمندی ها</a>
                                </p>


                            </div>

                            <div class="row" id="thumbs">
                                <sql:query var="result" dataSource="con6">SELECT
                                            url
                            FROM store_products_img
                            where idproduct=${mid}</sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <div class="col-xs-4">
                                    <a href="${context}/res/img/product/${row.url}" class="thumb">
                                        <img src="${context}/res/img/product/${row.url}" alt="" class="img-responsive">
                                    </a>
                                </div>
                                    
                            
                        </c:forEach>
                            
                            </div>
                        </div>

                    </div>


                                <div class="box" id="details" dir="rtl">
                        
                        ${mrow.description}
                        <hr>
                            <div class="social">
                                <h4>به اشتراک بگذارید:</h4>
                                <p>
                                    <a href="#" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                                    <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                                </p>
                            </div>
                    </div>
                                    </c:forEach>
                    

                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3" style="text-align: right">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu" >

                        <div class="panel-heading">
                            <h3 class="panel-title">موضوعات</h3>
                        </div>

                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked category-menu">
                                
                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=0 </sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <c:set var="mainid" value="${row.id}"/>
                            <li>
                            <a href="list.jsp">${row.title} <span class="badge pull-left">42</span></a>
                            
                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=<c:out value="0"/>  </sql:query>
                            <ul>                    
                            <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                <li>
                                    <a style="padding-right: 30px" href="${row.id}">${row.title}</a>
                                </li>                
                                                    
                                                </c:forEach>
                            </ul>
                            </li>
                        </c:forEach>
                            </ul>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">
                                برند
                                <a class="btn btn-xs btn-danger pull-left" href="#"><i class="fa fa-times-circle"></i> حذف</a></h3>
                        </div>

                        <div class="panel-body">
                            
                            <form>
                                <div class="form-group">
                                    <sql:query var="result" dataSource="con6">
                                        SELECT title,COUNT(*) as count FROM store_products_tags WHERE isbrand GROUP BY title  
                                    </sql:query>
                                    <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">${row.title} (${row.count})
                                        </label>
                                    </div>
                                    </c:forEach>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> اعمال</button>

                            </form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">
                                کاربری
                                <a class="btn btn-xs btn-danger pull-left" href="#"><i class="fa fa-times-circle"></i> حذف</a></h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <sql:query var="result" dataSource="con6">
                                        SELECT title,COUNT(*) as count FROM store_products_tags WHERE isuse GROUP BY title  
                                    </sql:query>
                                    <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox">${row.title} (${row.count})
                                        </label>
                                    </div>
                                    </c:forEach>
                                </div>

                                <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> اعمال</button>

                            </form>

                        </div>
                    </div>

                    <!-- *** MENUS AND FILTERS END *** -->

                    <div class="banner">
                        <sql:query var="result" dataSource="con6">SELECT imgsrc,title FROM category where parent=${mini} and isbanner=1 </sql:query>
                                                <c:forEach varStatus="counter" var="row" items="${result.rows}">
<a href="#">
                            <img src="${context}/res/img/product/${row.imgsrc}" alt="${row.title}" class="img-responsive">
                        </a>
                                                    
                                                </c:forEach>
                        
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>