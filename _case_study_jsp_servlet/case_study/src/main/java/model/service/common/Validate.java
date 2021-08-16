package model.service.common;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

public class Validate {

    //service name/description:
    public static String text(String text) {
        String regex = "^[A-Za-z0-9,]+(\\s[a-zA-Z0-9,]+)*$";
        if (!Pattern.matches(regex, text)) {
            return "Vui lòng chỉ để 1 khoảng trắng giữa các từ";
        }
        return null;
    }

    //NumberFormatException:
//    public static String numberFormatException() {
//
//    }

    //Number (floor/quantity)
    public static String intNumber(int inputNumber) {
        String regex = "^[1-9][0-9]*$";
        if (!Pattern.matches(regex, String.valueOf(inputNumber))) {
            return "Vui lòng nhập số nguyên dương";
        }
        return null;
    }

    //    checkDoubleNumber: price/deposit/total_payment/area
    public static String doubleNumber(double doubleNumber) {
//        String regex = "^([1-9]+|([1-9][0-9]+))(\\.\\d+)*$";  //   \\.\\d
        String regex = "^([1-9]\\d*)\\.\\d+$";
        if (!Pattern.matches(regex, String.valueOf(doubleNumber))) {
            return "Vui lòng nhập số dương";
        }
        return null;
    }

    //Service code:
    public static String serCode(String serCode) {
        String regex = "^DV-[0-9]{4}$";
        if (!Pattern.matches(regex, serCode)) {
            return "Vui lòng nhập theo định dạng: 'DV-XXXX' (where X: 0-9)";
        }
        return null;
    }

    //Name:
    public static String name(String name) {
        String regex = "^([A-Z][a-z]+)(\\s[A-Z][a-z]+)+$";  //cắt khoảng trắng 2 đầu-Repository
        if (!Pattern.matches(regex, name)) {
            return "Tên không được chứa ký tự số";
        }
        return null;
    }

    //customer code:
    public static String cusCode(String cusCode) {
        String regex = "^KH-[0-9]{4}$";
        if (!Pattern.matches(regex, cusCode)) {
            return "Vui lòng nhập theo định dạng: 'KH-XXXX' (X: 0-9)";
        }
        return null;
    }

    //idCard
    public static String idCard(String idCard) {
        String regex = "^\\d{11}|\\d{9}$";
        if (!Pattern.matches(regex, idCard)) {
            return "Vui lòng nhập theo định dạng: 'XXXXXXXXX' or 'XXXXXXXXX'  (X: 0-9)";
        }
        return null;
    }

    //    phone:
//    validate: 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx
    public static String phoneNumber(String phone) {
        String regex = "^(090\\d{7})|(091\\d{7})|(\\(84\\)\\+90\\d{7})|(\\(84\\)\\+91\\d{7})$";
        if (!Pattern.matches(regex, phone)) {
            return "Vui lòng nhập theo định dạng: '090xxxxxxx' or '091xxxxxxx'" +
                    "or (84)+90xxxxxxx or (84)+91xxxxxxx  (x: 0-9)";
        }
        return null;
    }

    //email:
    public static String email(String email) { //thanhha2332@gmail.com ,thanhha2332@edu.com.vn
        String regex = "^[a-zA-Z0-9_]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}$";
        if (!Pattern.matches(regex, email)) {
            return "Vui lòng nhập theo định dạng: 'XXXXXXXXX' or 'XXXXXXXXX'  (X: 0-9)";
        }
        return null;
    }


    //Date
    public static String checkAge(Date birthDay) {
        //check số tuổi:
        LocalDate date = birthDay.toLocalDate();
        int day = date.getDayOfMonth();
        int month = date.getMonthValue();
        int year = date.getYear();
        LocalDate today = LocalDate.now();
        //khoang cach tuoi:
        int years_gap = today.getYear() - year;
        int month_gap = today.getMonthValue() - month;
        int day_gap = today.getDayOfMonth() - day;

        if (years_gap < 18) {
            return "Tuổi phải >= 18 và <=100";
        } else if (years_gap == 18 && month_gap < 0) {
            return "Tuổi phải >= 18 và <=100";
        } else if (years_gap == 18 && month_gap == 0 && day_gap < 0) {
            return "Tuổi phải >= 18 và <=100";
        }
        return null;
    }

    public static String startDate(Date startDate) { //ok
        LocalDate date = startDate.toLocalDate();
        LocalDate currentDate = LocalDate.now();
        int gap = Period.between(currentDate, date).getDays();
        if (gap < 0) {

            return "Ngày bắt đầu phải lớn hơn hoặc bằng ngày hiện tại! ";
        }
        return null;
    }

    public static String gapDay(Date endDate, Date startDate) { //ok
        LocalDate date1 = endDate.toLocalDate();
        LocalDate date2 = startDate.toLocalDate();
        int gap = Period.between(date1, date2).getDays();
        if (gap < 0) {
            return "Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu ! ";
        }
        return null;
    }
}

