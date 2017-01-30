<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
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
                        <li><a href="${context}">خانه</a>
                        </li>
                        <li>صفحه مورد نظر در دسترس نیست</li>
                    </ul>
                </div>

                


                    <div class="row" id="error-page">
                        <div class="col-sm-6 col-sm-offset-3">
                            <div class="box">

                                <p class="text-center">
                                    <img src="${context}/res/img/jbpms_logo.png" alt="jbpms_logo">
                                </p>

                                <h3>
                                    صفحه خارج از دسترس
                                    
                                </h3>
                                <h4 dir="rtl" class="text-muted">
                                    از شما پوزش می خواهیم، احتمالا اشتباهی رخ داده است.
                                </h4>

                                <p class="text-center">
                                    به صفحه اصلی مراجعه بفرمایید
                                </p>

                                <p class="buttons"><a href="${context}" class="btn btn-primary"><i class="fa fa-home"></i> بازگشت به خانه</a>
                                </p>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        
    </jsp:body>
</t:index>