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
                        <li>ارسال مجدد گذرواژه</li>
                    </ul>
                </div>

               

                <div class="col-md-6 col-sm-offset-3" dir="rtl">
                    <div class="box">
                        <h1>جایگذین گذرواژه</h1>

                        <p class="lead">آیا قبلا ثبت نام کرده اید؟</p>
                        
                        <hr>
                        <div style="color:red" dir="rtl">
                            ${message}
                        </div>
                        <form action="${context}/doforgot" >
                            <div class="form-group">
                                <label for="email">ایمیل</label>
                                <input type="text" class="form-control" name="user">
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> ارسال گذرواژه</button>
                            </div>
                        </form>
                        <p><a href="${context}/register.jsp">ورود</a></p>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>