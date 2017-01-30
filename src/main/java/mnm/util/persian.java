/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.util;

import com.ghasemkiani.util.icu.PersianCalendar;
import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.NumberFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.ULocale;

import java.util.Date;
import java.util.Enumeration;
import java.util.TimeZone;

/**
 *
 * @author mohammadghasemy
 */
public class persian {
    public static void main(String a[]){
        persian p=new persian();
        String s=p.persiandate_time(new Date());
        System.out.println(s.replaceAll("/","").replaceAll(":", "").replaceAll("،‏", "").replaceAll(" ", ""));
        String t="tag2";
        System.out.println(t.substring(3));
    }
    public String persiandate(Date d){
        if(d == null)
            return "بسته خریداری نشده.";
        calendar.setTime( d);
        SimpleDateFormat sds =(SimpleDateFormat)calendar.getDateTimeFormat(DateFormat.LONG,DateFormat.MEDIUM,uLocale);
        //date=sds.format(calendar.getTime());
        return sds.format(calendar.getTime());
    }
    public String persianclock(Date d){
        if(d == null)
            return "بسته خریداری نشده.";
        calendar.setTime( d);
        SimpleDateFormat sds =(SimpleDateFormat)calendar.getDateTimeFormat(DateFormat.NONE,DateFormat.MEDIUM,uLocale);
        //date=sds.format(calendar.getTime());
        return sds.format(calendar.getTime());
    }
    public String persiandataonly(Date d){
        if(d == null)
            return "بسته خریداری نشده.";
        calendar.setTime( d);
        SimpleDateFormat sds =(SimpleDateFormat)calendar.getDateTimeFormat(DateFormat.MEDIUM,DateFormat.NONE,uLocale);
        //date=sds.format(calendar.getTime());
        return sds.format(calendar.getTime());
    }
    public String persiandate_time(Date d){
        if(d == null)
            return "بسته خریداری نشده.";
        calendar.setTime( d);
        SimpleDateFormat sds =(SimpleDateFormat)calendar.getDateTimeFormat(DateFormat.MEDIUM,DateFormat.MEDIUM,uLocale);
        //date=sds.format(calendar.getTime());
        return sds.format(calendar.getTime());
    }
	ULocale  uLocale = new ULocale("fa_IR");
    TimeZone timeZone = TimeZone.getTimeZone(TimeZone.getDefault().getID());
    PersianCalendar calendar = new PersianCalendar( uLocale);
    public String money(String in){
        String res=in;
        Enumeration as;
        NumberFormat format = NumberFormat.getCurrencyInstance(uLocale);
        res=format.format(Integer.parseInt(in));
        res=res.substring(0, res.lastIndexOf("٫"))+"﷼";
        return res;
    }
}
