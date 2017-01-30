<%-- 
    Document   : test
    Created on : May 14, 2016, 11:11:51 AM
    Author     : mohammadghasemy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
    
    request.setAttribute("page", "help");
    try{
    String col=request.getParameter("color");
    if(col.length()!=0)
    request.setAttribute("colors", "card-inverse "+col);
    }catch(Exception s){
    request.setAttribute("colors", "");
    }
    %>
<t:index>
    <jsp:attribute name="maincss">
    <title>پرداخت برای خرید - راهنما</title>
    </jsp:attribute>
    <jsp:attribute name="mainjs">
    </jsp:attribute>
                   
    
    <jsp:body>
        
        <div class="container-fluid" >
            <div class="animated fadeIn">
                <div class="row">
                   <div class="col-lg-12 ">


                        <div class="col-md-8 ">
                            <div class="card   ${colors}   text-xs-center" >
                                <div class="card-header">
                                    راهنمای کاربری
                                    <span class="tag tag-pill tag-info"> نسخه ۲.۳</span>
                                </div>
                                <div class="card-block">
                                    <div class="" style="text-align: right">
                                        <h3>تنظیمات درگاه</h3>
                                        <br/>
                                        برای دریافت درگاه از پنل کاربری اقدام به ثبت وب سایت خود کنید.
                                        <br/>
                                        بعد از فعال شدن مرچنت آی دی خود کافیست آن را در وب سرویس خود قرار دهید.
                                        <br/>
                                        <h3>تنظیمات وب سرویس</h3>
                                        <br/>
                                        قبل و بعد از صدور فاکتور می بایست اتوریتی کد را نزد خود داشته باشید.
                                        <br/>
                                        برای چک کردن پرداخت موفق نیز از همین تکنیک استفاده کنید.
                                        <br/>
                                        <h3>استفاده از درگاه به شکل متسقیم در وبلاگ و یا صفحات ساده</h3>
                                        <br/>
                                        کافیست فورم زیر را در صفحه کپی کنید!
                                        <br/>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="card   ${colors}   text-xs-center" >
                                <div class="card-header">
                                    توضیحات برنامه نویسی
                                    <span class="tag tag-pill tag-info"> نسخه ۲.۳</span>
                                </div>
                                <div class="card-block">
                                    <blockquote class="card-blockquote">
                                        <ul>
                                            <li>برای ثبت مرچنت کد می توانید از وب سرویس استفاده کنید.</li>
                                            <li>همیشه بعد از انجام خرید اقدام به چک کردن اتوریتی کنید.</li>
                                            <li>در زمان دریافت توکن صبر کنید تا صفحه کامل لود شود.</li>
                                            <li>همیشه وب سرویس را ابتدا گت کنید.</li>
                                        </ul>
                                    </blockquote> 
                                </div>
                            </div>
                        </div>
                   </div>
                   </div>
                   </div>
                   </div>
               
            
        
        
    </jsp:body>
</t:index>
