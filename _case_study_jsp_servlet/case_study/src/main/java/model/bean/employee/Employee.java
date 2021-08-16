package model.bean.employee;

import java.sql.Date;

public class Employee {
    private int employeeId;
    private String employeeName;
    private Date dayOfBirth;
    private String idCard;
    private double salary;
    private String phone;
    private String email;
    private String address;
    private int positionId;
    private String positionName;
    private int degreeId;
    private String degreeName;
    private int divisionId;
    private String divisionName;

    private String userName;

    public Employee() {
    }

    public Employee(int employeeId, String employeeName, Date dayOfBirth, String idCard, double salary, String phone, String email, String address, int positionId, String positionName, int degreeId, String degreeName, int divisionId, String divisionName, String userName) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.dayOfBirth = dayOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.positionId = positionId;
        this.positionName = positionName;
        this.degreeId = degreeId;
        this.degreeName = degreeName;
        this.divisionId = divisionId;
        this.divisionName = divisionName;
        this.userName = userName;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public Date getDayOfBirth() {
        return dayOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public double getSalary() {
        return salary;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public int getPositionId() {
        return positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public String getDegreeName() {
        return degreeName;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public String getUserName() {
        return userName;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public void setDayOfBirth(Date dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employeeId=" + employeeId +
                ", employeeName='" + employeeName + '\'' +
                ", dayOfBirth=" + dayOfBirth +
                ", idCard='" + idCard + '\'' +
                ", salary=" + salary +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", positionId=" + positionId +
                ", positionName='" + positionName + '\'' +
                ", degreeId=" + degreeId +
                ", degreeName='" + degreeName + '\'' +
                ", divisionId=" + divisionId +
                ", divisionName='" + divisionName + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }
}
