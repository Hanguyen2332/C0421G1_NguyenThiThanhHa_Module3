package model.service.common;

import java.util.regex.Pattern;

public class Validate {

    //Number (floor/quantity/price/deposit/total_payment)
    public void inputNumber(String inputNumber) {
        String regex = "^[1-9]+|([1-9][0-9]+)$";
        if (!Pattern.matches(regex, inputNumber)) {
            System.out.println("Wrong format!Please enter positive Number");
        }
    }

    //Service code:
    public void serCode(String serCode) {
        String regex = "^DV-[0-9]{4}$";
        if (!Pattern.matches(regex, serCode)) {
            System.out.println("Wrong format!Please enter Service Code according to 'DV-XXXX' (where X: 0-9)");
        }
    }
    //customer code:
    public void cusCode(String cusCode) {
        String regex = "^KH-[0-9]{4}$";
        if (!Pattern.matches(regex, cusCode)) {
            System.out.println("Wrong format!Please enter Code according to 'KH-XXXX' (where X: 0-9)");
        }
    }

    public void idCard(String idCard) {
        String regex = "^\\d{9}|\\d{11}$";
        if (!Pattern.matches(regex, idCard)) {
            System.out.println("Wrong format!Please enter ID Card according to 'XXXXXXXXX' or 'XXXXXXXXX'  (where X: 0-9)");
        }
    }

    //    phone:
//    validate: 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx
    public void phoneNumber(String phone) {
        String regex = "^(090\\d{7})|(091\\d{7})|(\\(84\\)\\+90\\d{7})|(\\(84\\)\\+91\\d{7})$";
        if (!Pattern.matches(regex, phone)) {
            System.out.println("Wrong format!Please enter Phone Number according to '090xxxxxxx' or '091xxxxxxx'" +
                    "or (84)+90xxxxxxx or (84)+91xxxxxxx  (where X: 0-9)");
        }
    }

    //email:
    public void email(String email) { //thanhha2332@gmail.com ,thanhha2332@edu.com.vn
        String regex = "^[a-zA-Z0-9]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}$";
        if (!Pattern.matches(regex, email)) {
            System.out.println("Wrong format!Please enter Code according to 'XXXXXXXXX' or 'XXXXXXXXX'  (where X: 0-9)");
        }
    }
}

