<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    
    String context = request.getContextPath();
    
    request.setAttribute("context", context);
    String cat=request.getParameter("categ");
    String title=request.getParameter("title");
    String menuid=request.getParameter("menuid");
    request.setAttribute("ctitle", title);
    if(null==cat||cat.length()==0){
        request.setAttribute("mini", "0");
    }else{
        request.setAttribute("mini", cat);
    }
    request.setAttribute("menu", "menu"+menuid);    
    request.setAttribute("menuid", menuid);    
%>

<%
                                String ebegin=(String)request.getParameter("ebegin");
                                String esize=(String)request.getParameter("esize");
                                
                                try{
                                if(esize.length()==0)esize="20";
                                }catch(Exception s){
                                    esize="20";
                                
                                }
                                try{
                                if(ebegin.length()==0)ebegin="0";
                                }catch(Exception s){
                                
                                ebegin="0";
                                }
                                
                                String nB="ebegin="+(Integer.parseInt(ebegin)+Integer.parseInt(esize))+"&esize="+esize;
                                String pB="ebegin="+(Integer.parseInt(ebegin)-Integer.parseInt(esize))+"&esize="+esize;
                                
                                request.setAttribute("nB", nB);
                                request.setAttribute("pB", pB);
                                request.setAttribute("ebegin", ebegin);
                                request.setAttribute("esize", esize);
                                %>
                                
<%
    
    String tagquery="";
    String tagname="";
 Enumeration enumeration = request.getParameterNames();
while (enumeration.hasMoreElements()) {
        
        String parameterName = (String) enumeration.nextElement();
        if(parameterName.startsWith("tag"))
        tagquery+=(parameterName.substring(3)+",");
        tagname+=request.getParameter(parameterName)+",";
        
    }
if(tagquery.length()>0){
tagquery=tagquery.substring(0, tagquery.length()-1);
request.setAttribute("tag", " or spt.id in ("+tagquery+") ");
request.setAttribute("tagsql", "inner join store_products_tags as spt on spt.idproduct=sp.id");
tagname=tagname.substring(0, tagname.length()-1);
request.setAttribute("ctitle", "اعمال برند یا کاربری "+tagname);
}else{
    request.setAttribute("tag", "");
}
%>   
<%
  String order=request.getParameter("order");
  request.setAttribute("ordertype","");
  if(null!=order){
  if(order.equals("pricehigh")){
  request.setAttribute("order", "Order by sp.price ASC");
  request.setAttribute("ordertype","pricehigh");
  }
  if(order.equals("pricelow")){
  request.setAttribute("order", "Order by sp.price DESC");
  request.setAttribute("ordertype","pricelow");
  }
  if(order.equals("saleslow")){
  request.setAttribute("order", "Order by sp.sales DESC");
  request.setAttribute("ordertype","saleslow");
  }
  if(order.equals("saleshigh")){
  request.setAttribute("order", "Order by sp.sales ASC");
  request.setAttribute("ordertype","saleshigh");
  }
  if(order.equals("name")){
  request.setAttribute("order", "Order by sp.name");
  request.setAttribute("ordertype","name");
  }
  }
%>
<%
   String query=request.getParameter("query");
   if(null!=query){
    request.setAttribute("query","or sp.name like '%"+query+"%'");
    request.setAttribute("ctitle", " نتایج جستجو بر روی \" "+query+" \"");
   }
  
   
%>
<c:url var="nextUrl" value="">
<c:forEach items="${param}" var="entry">
    <c:if test="${entry.key != 'esize' and entry.key != 'ebegin'}">
        <c:param name="${entry.key}" value="${entry.value}" />
    </c:if>
</c:forEach>
</c:url>
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
                        <li>${ctitle}</li>
                    </ul>
                </div>

                <div class="col-md-9" dir="">

                    <div dir="rtl" class="box">
                        <h1>${ctitle}</h1>
                        <p>
                            
                        </p>
                    </div>

                    <div class="box info-bar">
                        <div dir="rtl" class="row">
                           

                            <div class="col-sm-12  products-number-sort">
                                <div class="row">
                                    <form class="form-inline" >
                                        <input type="hidden" value="${ctitle}" name="title"/>
                                        <input type="hidden" value="${menuid}" name="menuid"/>
                                        <input type="hidden" value="${mini}" name="categ"/>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-number">
                                                
                                                <strong>تعداد</strong>
                                                <a href="${nextUrl}&esize=20" class="btn btn-default btn-sm ${(esize==20)?'btn-primary':''}">۲۰</a>
                                                <a href="${nextUrl}&esize=50" class="btn btn-default btn-sm ${(esize==50)?'btn-primary':''}">۵۰</a>
                                                <a href="${nextUrl}&esize=100" class="btn btn-default btn-sm ${(esize==100)?'btn-primary':''}">۱۰۰</a>
                                                محصولات
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-sort-by">
                                                <strong>نمایش بر اساس:</strong>
                                                <select onchange="this.form.submit()" name="order" class="form-control">
                                                    <option ${ordertype.equals('pricelow')?'selected':''} value="pricelow">قیمت(کمینه به بیشنه)</option>
                                                    <option ${ordertype.equals('pricehigh')?'selected':''} value="pricehigh">قیمت(بیشینه به کمینه)</option>
                                                    <option ${ordertype.equals('name')?'selected':''} value="name">نام</option>
                                                    <option ${ordertype.equals('saleslow')?'selected':''} value="saleslow">تعداد فروش(بیشینه به کمینه)</option>
                                                    <option ${ordertype.equals('saleshigh')?'selected':''} value="saleshight">تعداد فروش(بیشینه به کمینه)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row products">
 
                        <sql:query var="result" dataSource="con6">
                            SELECT distinct(sp.id),sp.* FROM store_products as sp 
                            inner join category as c on c.id=sp.idcateg
                            ${tagsql}
                            where sp.idcateg=${mini} or c.parent=${mini} ${tag} ${query}
                            ${order}
                            limit ${ebegin},${esize}
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
                                <a href="${context}/detail.jsp" class="invisible">
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
                        
                        <!-- /.col-md-4 -->
                    </div>
                    <!-- /.products -->

                    <div class="pages">

                       

                        <ul class="pagination">
                            <c:if test="${ebegin>0}">        
                            <li>
                                <a href="${nextUrl}&${pB}">&laquo;</a>
                            </li>
                            </c:if>
                            <li><a href="${nextUrl}&${nB}">&raquo;</a>
                            </li>
                        </ul>
                    </div>


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
                                
                            <sql:query var="result" dataSource="con6">
                                SELECT c1.id,c1.title,count(*) as counter FROM `category` as c1 INNER JOIN category as c2 on c1.id=c2.parent WHERE c1.parent=0 GROUP by c1.id 
                                
                            </sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <c:set var="mainid" value="${row.id}"/>
                            <li>
                            <a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">${row.title} <span class="badge pull-left">${row.counter}</span></a>
                            
                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=<c:out value="${mainid}"/> and !isbanner  </sql:query>
                            <ul>                    
                            <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                <li>
                                    <a style="padding-right: 30px" href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">${row.title}</a>
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
                                </h3>
                        </div>

                        <div class="panel-body">
                            
                            <form action="${context}/list.jsp">
                                <div class="form-group">
                                    <sql:query var="result" dataSource="con6">
                                        SELECT id,title,COUNT(*) as count FROM store_products_tags WHERE isbrand GROUP BY title  
                                    </sql:query>
                                    <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                    <div class="checkbox">
                                        <label>
                                            <input name="tag${row.id}" value="${row.title}" type="checkbox" >${row.title} (${row.count})
                                        </label>
                                    </div>
                                        
                                    </c:forEach>
                                </div>

                                <button type="submit" class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> اعمال</button>

                            </form>

                        </div>
                    </div>

                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">
                                کاربری
                                </h3>
                        </div>

                        <div class="panel-body">

                            <form>
                                <div class="form-group">
                                    <sql:query var="result" dataSource="con6">
                                        SELECT id,title,COUNT(*) as count FROM store_products_tags WHERE isuse GROUP BY title  
                                    </sql:query>
                                    <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                    <div class="checkbox">
                                        <label>
                                            <input name="tag${row.id}" value="${row.title}" type="checkbox" >${row.title} (${row.count})
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