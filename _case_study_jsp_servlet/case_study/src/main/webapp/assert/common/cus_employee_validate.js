function checkName() {
    let name = document.getElementById("nameRegex").value;
    let regex = /^(([A-Z][a-z]+)(\s[A-Z][a-z]+)*)+$/
    if (regex.test(name)||name===""){
        document.getElementById("nameMes").innerHTML = "";
    }else {
        document.getElementById("nameMes").innerHTML = "Vui long nhap theo dinh dang, VD: 'Nguyen Khac Phut'";
    }
}

function checkIdCard() {
    let idCard = document.getElementById("idCardRegex").value;
    let regex = /^\d{9}|\d{11}$/;
    if (regex.test(idCard)||idCard===""){
        document.getElementById("idCardMes").innerHTML = "";
    }else {
        document.getElementById("idCardMes").innerHTML = "Vui long nhap ID Card theo dinh dang: 'XXXXXXXXX' or 'XXXXXXXXX'  (X: 0-9)";
    }
}

function checkPhone() {
    let phone = document.getElementById("phoneRegex").value;
    let regex = /^(090\d{7})|(091\d{7})|(\(84\)\+90\d{7})|(\(84\)\+91\d{7})$/;
    if (regex.test(phone)||phone===""){
        document.getElementById("phoneMes").innerHTML = "";
    }else {
        document.getElementById("phoneMes").innerHTML = "Vui long nhap SDT theo dinh dang: 090xxxxxxx/ 091xxxxxxx/ (84)+90xxxxxxx/ (84)+91xxxxxxx";
    }
}

function checkEmail() {
    let email = document.getElementById("emailRegex").value;
    let regex = /^[a-zA-Z0-9_]+@[a-zA-Z]+(\.[a-zA-Z]+){1,3}$/i; //i: insensitive - KHÔNG phân biệt HOA-THƯỜNG
    if (regex.test(email)||email===""){
        document.getElementById("emailMes").innerHTML = "";
    }else {
        document.getElementById("emailMes").innerHTML = "Vui long nhap Email theo dung dinh dang";
    }
}