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
    String ids="";
    Cookie cookie = null;
   Cookie[] cookies = null;
   cookies = request.getCookies();
   if( cookies != null ){
      
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         if(cookie.getName().startsWith("product"))
         ids+=cookie.getValue()+",";
         }
  }
   if(ids.length()>0){
       ids=ids.substring(0, ids.length()-1);
request.setAttribute("ids", "where sp.id in  ("+ids+") ");
   }
   else{
       request.setAttribute("ids", "where sp.id in  (0) ");
   }
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
                        <li>تاریخچه مشاهدات من</li>
                    </ul>
                </div>

                

             <div class="col-md-12" id="wishlist" dir="rtl">

                    
                    <div class="box">
                        <h1>کالاهای بازدید شده من</h1>
                        
                    </div>

                                    <div class="row products" dir="ltr">
                                        
<sql:query var="result" dataSource="con6">
                            SELECT sp.* FROM store_products as sp ${ids}
                             </sql:query>
                        <c:forEach varStatus="counter" var="mrow" items="${result.rows}">
                            <c:set var="mainid" value="${mrow.id}"/>
                        <div class="col-md-4 col-sm-6 pull-right">
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
                    <!-- /.products -->

                </div>


            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>