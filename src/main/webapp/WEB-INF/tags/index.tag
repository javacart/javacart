<%@tag import="mnm.util.avatar"%>
<%@tag import="mnm.util.persian"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="mnm.util.db"%>
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="maincss" fragment="true" %>
<%@attribute name="mainjs" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%

    if (null==session.getAttribute("database")||null==session.getAttribute("p")) {
        persian p = new persian();
        request.setAttribute("p", p);
        session.setAttribute("p", p);
        db d = new db();
        session.setAttribute("database", d);
    }
    String context = request.getContextPath();
    HashMap<String, Integer> carts=(HashMap<String, Integer>)session.getAttribute("carts");
    
    if(null==carts){
        request.setAttribute("carts_size", 0);
        request.setAttribute("carts_id", "0");
        request.setAttribute("carts_cost", "0");
    }else{
        
        request.setAttribute("carts_size", carts.size());
        request.setAttribute("carts_cost", session.getAttribute("carts_cost"));
        request.setAttribute("carts_id", (session.getAttribute("carts_id").toString().length()==0)?"0":session.getAttribute("carts_id"));
        request.setAttribute("carts", session.getAttribute("carts"));
    }
    
    
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="robots" content="all,follow">
        <meta name="googlebot" content="index,follow,snippet,archive">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Collection of Java BPM System">
        <meta name="author" content="Jbpms">
        <meta name="keywords" content="Collection of Java BPM System">
        <jsp:invoke fragment="maincss"/>
        <!-- styles -->

        <link href="<%=context%>/res/css/font-awesome.css" rel="stylesheet">
        <link href="<%=context%>/res/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=context%>/res/css/animate.min.css" rel="stylesheet">
        <link href="<%=context%>/res/css/owl.carousel.css" rel="stylesheet">
        <link href="<%=context%>/res/css/owl.theme.css" rel="stylesheet">
        <!-- theme stylesheet -->
        <link href="<%=context%>/res/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

        <!-- your stylesheet with modifications -->
        <link href="<%=context%>/res/css/custom.css" rel="stylesheet">

        <script src="<%=context%>/res/js/respond.min.js"></script>

        <link rel="shortcut icon" href="<%=context%>/res/img/favicon.ico">



    </head>

    <body >

        <!-- *** TOPBAR ***
     _________________________________________________________ -->
        <div id="top">
            <div class="container">
                <div class="col-md-6 offer" data-animate="fadeInDown">
                    <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">تخفیف های امروز</a>  <a href="#" dir="rtl">۵۰ درصد تخفیف در پلن های سطح یک</a>
                </div>
                <div class="col-md-6" data-animate="fadeInDown">
                    <ul class="menu">
                        <%
                        String s=(String)session.getAttribute("dologinukey");
                                 if(null!=s)
                                 {
                                     
         %>
                        <li><a href="orders.jsp">سفارشات من</a>
                        </li>
                        
         <li >
             <span dir="rtl">
             ${name} به فروشگاه خودتون خوش آمدید.
             </span>
         </li>

         <%
         }else{
%>
                        <li><a href="#" data-toggle="modal" data-target="#login-modal">ورود</a>
                        </li>
                        <li><a href="register.jsp">ثبت نام</a>
                        </li>
<%}%>
                        <li><a href="contact.jsp">تماس</a>
                        </li>
                        <li><a href="history.jsp">آخرین مشاهده ها</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div dir="rtl" class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
                <div class="modal-dialog modal-sm">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="Login">ورود به فروشگاه</h4>
                        </div>
                        <div class="modal-body">
                            <form action="${context}/dologin" >
                                <div class="form-group">
                                    <input type="text" class="form-control" name="user" id="email-modal" placeholder="ایمیل">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="pass" id="password-modal" placeholder="گذرواژه">
                                </div>

                                <p class="text-center">
                                    <button class="btn btn-primary"><i class="fa fa-sign-in"></i> ورود</button>
                                </p>

                            </form>

                            <p class="text-center text-muted">هنوز ثبت نام نکرده اید؟</p>
                            <p class="text-center text-muted"><a href="register.jsp"><strong>ثبت نام</strong></a>! بسیار ساده است و کمتر از یک دقیقه زمان می گیرد&nbsp;البته که امکانات خوبی بعد از ثبت نام خواهید داشت!</p>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div dir="rtl" class="navbar navbar-default yamm" role="navigation" id="navbar">
            <div class="container">
                <div class="navbar-header pull-right">

                    <a class="navbar-brand home" href="<%=context%>" data-animate-hover="bounce">
                        <img src="<%=context%>/res/img/jbpms_logo.png" alt="Obaju logo" class="hidden-xs">
                        <img src="<%=context%>/res/img/jbpms_logo_small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">خانه</span>
                    </a>
                    <div class="navbar-buttons">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-align-justify"></i>
                        </button>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                            <span class="sr-only">Toggle search</span>
                            <i class="fa fa-search"></i>
                        </button>
                        <a class="btn btn-default navbar-toggle" href="${context}/cart.jsp">
                            <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">۳ آیتم در سبد خرید</span>
                        </a>
                    </div>
                </div>
                <!--/.navbar-header -->

                <div  class="navbar-collapse collapse pull-right" id="navigation">

                    <ul class="nav navbar-nav navbar-right">
                        <li id="menu" class="pull-right"><a href="${context}">خانه</a></li>
                        <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=0 </sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <c:set var="mainid" value="${row.id}"/>
                            <li id="menu${row.id}" class="dropdown yamm-fw pull-right">
                                <a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200"> ${row.title} <b class="caret"></b> </a>
                                <ul dir="rtl" class="dropdown-menu">
                                    <li >
                                        <div class="yamm-content">
                                            <div class="row">
                                                <sql:query var="result" dataSource="con6">SELECT id,imgsrc,title FROM category where parent=<c:out value="${mainid}"/> and isbanner </sql:query>
                                                <c:forEach varStatus="counter" var="row" items="${result.rows}">

                                                    <div class="col-sm-3">
                                                        <div class="banner">
                                                            <a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">
                                                                <img src="<%=context%>/res/img/product/${row.imgsrc}" class="img img-responsive" alt="${row.title}">
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=<c:out value="${mainid}"/> and !isbanner </sql:query>
                                                <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                                    <c:set var="ids" value="${row.id}"/>
                                                    <div class="col-sm-3  pull-right" style="text-align: right">

                                                        <h5><a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">${row.title}</a></h5>
                                                        <ul>
                                                            
                                                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=<c:out value="${ids}"/> and !isbanner  </sql:query>
                                                            <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                                                <li><a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">${row.title}</a></li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                        <script type="text/javascript" language="JavaScript">
        function setClass(id, className) {
            var obj = document.getElementById(id);
            if (obj != null) {
                obj.className = className;
            }
        }
        setClass( "${menu}", "active dropdown yamm-fw pull-right");
    </script>
                </div>
                <!--/.nav-collapse -->

                <div class="navbar-buttons pull-left">

                    <div class="navbar-collapse collapse right" id="basket-overview">
                        <a href="${context}/cart.jsp" dir="rtl" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">
                                ${carts_size}
                                آیتم در سبد خرید
                                </span></a>
                    </div>
                    <!--/.nav-collapse -->

                    <div class="navbar-collapse collapse right" id="search-not-mobile">
                        <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                            <span class="sr-only">Toggle search</span>
                            <i class="fa fa-search"></i>
                        </button>
                    </div>

                </div>

                <div dir="ltr" class="collapse clearfix" id="search">

                    <form class="navbar-form pull-left" role="search" action="<%=context%>/list.jsp">
                        <div class="input-group">
                            <input type="text" name="query" class="form-control" placeholder="جستجو">
                            <span class="input-group-btn">

                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

                            </span>
                        </div>
                    </form>

                </div>
                <!--/.nav-collapse -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#navbar -->

        <!-- *** NAVBAR END *** -->



        <div id="all">

            <jsp:doBody/>
            <!-- /#content -->

            <!-- *** FOOTER ***
     _________________________________________________________ -->
            <div dir="rtl" id="footer" data-animate="fadeInUp">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 pull-left">

                            <h4>آخرین اخبار و مقالات</h4>

                            <p class="text-muted">
                            عضویت در خبرنامه برای دریافت آخرین تخفیف ها و بهترین شرایط فروش
                            </p>

                            <form dir="ltr">
                                <div class="input-group">

                                    <input type="text" class="form-control">

                                    <span class="input-group-btn">

                                        <button class="btn btn-default" type="button">عضویت!</button>

                                    </span>

                                </div>
                                <!-- /input-group -->
                            </form>

                            <hr>

                            <h4>فروشگاه در شبکه های مجازی</h4>

                            <p class="social">
                                <a href="#" class="facebook external" data-animate-hover="shake"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="twitter external" data-animate-hover="shake"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="instagram external" data-animate-hover="shake"><i class="fa fa-instagram"></i></a>
                                <a href="#" class="gplus external" data-animate-hover="shake"><i class="fa fa-google-plus"></i></a>
                                <a href="#" class="email external" data-animate-hover="shake"><i class="fa fa-envelope"></i></a>
                            </p>


                        </div>
                        <div class="col-md-3 col-sm-6 pull-right">
                            <h4>JBPMS</h4>

                            <ul>
                                <li><a href="about.jsp">درباره ما</a>
                                </li>
                                <li><a href="law.jsp">قوانین</a>
                                </li>
                                <li><a href="faq.jsp">سوالات متداول</a>
                                </li>
                                <li><a href="contact.jsp">ارتباط با ما</a>
                                </li>
                                <li><a href="orders.jsp">سفارشات من</a>
                                </li>
                            </ul>

                            

                            <hr class="hidden-md hidden-lg hidden-sm">

                        </div>
                        <!-- /.col-md-3 -->

                        <div class="col-md-6 col-sm-6">
                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=0 </sql:query>
                        <c:forEach varStatus="counter" var="row" items="${result.rows}">
                            <c:set var="mainid" value="${row.id}"/>
                            <h5>${row.title}</h5>
                            <sql:query var="result" dataSource="con6">SELECT id,title FROM category where parent=<c:out value="${mainid}"/> and !isbanner  </sql:query>
                            <ul>                    
                            <c:forEach varStatus="counter" var="row" items="${result.rows}">
                                <li>
                                    <a href="${context}/list.jsp?categ=${row.id}&title=${row.title}&menuid=${mainid}">${row.title}</a>
                                </li>                
                                                    
                                                </c:forEach>
                            </ul>
                        </c:forEach>
                            
                            

                            <hr class="hidden-md hidden-lg">

                        </div>
                        <!-- /.col-md-3 -->

                        
                        <!-- /.col-md-3 -->



                        
                        <!-- /.col-md-3 -->

                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->
            </div>
            <!-- /#footer -->

            <!-- *** FOOTER END *** -->




            <!-- *** COPYRIGHT ***
     _________________________________________________________ -->
            <div id="copyright">
                <div class="container">
                    <div class="col-md-6">
                        <p class="pull-left">© ۱۳۹۵ jbpms.ir</p>

                    </div>
                    <div class="col-md-6">
                        <p class="pull-right" dir="rtl">طراحی شده توسط <a href="http://JBPMS.IR">JBPMS.IR</a>
                            <!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
                        </p>
                    </div>
                </div>
            </div>
            <!-- *** COPYRIGHT END *** -->



        </div>
        <!-- /#all -->




        <!-- *** SCRIPTS TO INCLUDE ***
     _________________________________________________________ -->
        <script src="<%=context%>/res/js/jquery-1.11.0.min.js"></script>
        <script src="<%=context%>/res/js/bootstrap.min.js"></script>
        <script src="<%=context%>/res/js/jquery.cookie.js"></script>
        <script src="<%=context%>/res/js/waypoints.min.js"></script>
        <script src="<%=context%>/res/js/modernizr.js"></script>
        <script src="<%=context%>/res/js/bootstrap-hover-dropdown.js"></script>
        <script src="<%=context%>/res/js/owl.carousel.min.js"></script>
        <script src="<%=context%>/res/js/front.js"></script>


    </body>

</html>