<%@tag import="mnm.util.avatar"%>
<%@tag import="mnm.util.persian"%>
<%@tag import="mnm.util.db"%>
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="maincss" fragment="true" %>
<%@attribute name="mainjs" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%

     if(null==session.getAttribute("database")){
    persian p = new persian();
    request.setAttribute("p", p);
    db d=new db();
    session.setAttribute("database",d);
    }
%>

<html >
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content="pay4buy.ir"/>
        <meta name="author" content="pay4buy"/>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
        <jsp:invoke fragment="maincss"/>
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/assets/css/simple-line-icons.css" rel="stylesheet"/>
        <!-- Main styles for this application -->
        <link href="${pageContext.request.contextPath}/assets/dest/style.css" rel="stylesheet"/>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="./assets/js/html5shiv.js"></script>
        <![endif]-->

        <!-- Fav and touch icons -->

    </head>
    <body dir="rtl"  class="navbar-fixed sidebar-nav fixed-nav">
        <header class="navbar">
        <div class="container-fluid">
            <button class="navbar-toggler mobile-toggler hidden-lg-up" type="button">&#9776;</button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"></a>
            <ul class="nav navbar-nav hidden-md-down">
                <li class="nav-item">
                    <a class="nav-link navbar-toggler layout-toggler" href="#">&#9776;</a>
                </li>

                <!--<li class="nav-item p-x-1">
                    <a class="nav-link" href="#">داشبورد</a>
                </li>
                <li class="nav-item p-x-1">
                    <a class="nav-link" href="#">Users</a>
                </li>
                <li class="nav-item p-x-1">
                    <a class="nav-link" href="#">Settings</a>
                </li>-->
            </ul>
            <ul class="nav navbar-nav pull-left hidden-md-down" style="margin-left:15px">
                
                <%
                                String s = (String) session.getAttribute("dologinukey");
                                if (null != s) {
                                    String e = (String) session.getAttribute("email");
                                    e = e.toLowerCase();
                                    String hash = new avatar().md5Hex(e);
                 %>
                <li class="nav-item dropdown" >
                    <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        <img src="https://www.gravatar.com/avatar/<%=hash%>" class="img-avatar" alt=""/>
                        <span class="hidden-md-down">${dologinukey}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-header text-xs-center">
                            <strong>تنظیمات</strong>
                        </div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/panel/bank_list.jsp"><i class="fa fa-user"></i> پنل  من</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/panel/bills.jsp"><i class="fa fa-shopping-cart"></i> فاکتورهای من</a>
                        <!--<a class="dropdown-item" href="#"><i class="fa fa-usd"></i> Payments<span class="tag tag-default">42</span></a>-->
                        <div class="divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/dologout"><i class="fa fa-lock"></i> خروج</a>
                    </div>
                </li>
                <%

                            request.setAttribute("dologinukey", s);
                        }
                        %>
                        
                
            </ul>
        </div>
    </header>
    <div class="sidebar">
        <nav class="sidebar-nav">
            <ul class="nav">
                
                
                 <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/bank_new.jsp"><i class="icon-plus"></i> ثبت حساب بانکی جدید</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/bank_list.jsp"><i class="icon-people"></i> لیست حساب های بانکی</a>
                    
                </li>

                 <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/panel/merchent_new.jsp"><i class="icon-note"></i> درگاه جدید</a>
                     <a class="nav-link" href="${pageContext.request.contextPath}/panel/merchent_list.jsp"><i class="icon-basket"></i> لیست درگاه ها</a>
                </li>

                 <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/withdraw_new.jsp"><i class="icon-diamond"></i> برداشت از حساب</a>
                    
                </li>
                
                 <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/transactionmerchant.jsp"><i class="icon-wallet"></i> تراکنش های به درگاه ها</a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/transactionbank.jsp"><i class="icon-bag"></i>  گزارش برداشت ها</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/panel/tickets.jsp"><i class="icon-support"></i> پشتیبانی</a>
                    
                </li>
                

            </ul>
        </nav>
    </div>
        
        <script type="text/javascript" language="JavaScript">
            function setClass(id, className) {
                var obj = document.getElementById(id);
                if (obj != null) {
                    obj.className = className;
                }
            }
            setClass("${page}", "active");
        </script>


        

        <main class="main">
        <jsp:doBody/>
    </main>

  
    <footer class="footer">
       <span class="text-left" dir="rtl">
            <a href="http://pay4buy.ir">پرداخت برای خرید</a>
            &#169; ۱۳۹۵
        </span>
        
    </footer>
    <!-- Bootstrap and necessary plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/libs/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/libs/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/libs/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/libs/pace.min.js"></script>

    <!-- Plugins and scripts required by all views -->
    <script src="${pageContext.request.contextPath}/assets/js/libs/Chart.min.js"></script>

    <!-- CoreUI main scripts -->

    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

    <!-- Plugins and scripts required by this views -->
    <!-- Custom scripts required by this view -->
    <script src="${pageContext.request.contextPath}/assets/js/views/main.js"></script>
    <jsp:invoke fragment="mainjs"/>
    </body>
</html>