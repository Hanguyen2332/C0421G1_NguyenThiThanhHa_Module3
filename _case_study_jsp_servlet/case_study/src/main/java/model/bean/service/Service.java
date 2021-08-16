package model.bean.service;

public class Service {
    private int id;
    private String code;      //bo sung-Service code
    private String serviceName;
    private double area;
    private double cost;
    private int maxPeople;
    //kieu thue
    private int rentTypeId;
    private String rentTypeName;
    //loai dich vu
    private int serviceTypeId;
    private String serviceTypeName;
    private String standardRoom;
    private String otherConvenienceDes;
    private double poolArea;
    private int floors;

    public Service() {
    }

    public Service(int id, String code, String serviceName, double area, double cost, int maxPeople, int rentTypeId, String rentTypeName, int serviceTypeId, String serviceTypeName, String standardRoom, String otherConvenienceDes, double poolArea, int floors) {
        this.id = id;
        this.code = code;
        this.serviceName = serviceName;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.rentTypeName = rentTypeName;
        this.serviceTypeId = serviceTypeId;
        this.serviceTypeName = serviceTypeName;
        this.standardRoom = standardRoom;
        this.otherConvenienceDes = otherConvenienceDes;
        this.poolArea = poolArea;
        this.floors = floors;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getOtherConvenienceDes() {
        return otherConvenienceDes;
    }

    public void setOtherConvenienceDes(String otherConvenienceDes) {
        this.otherConvenienceDes = otherConvenienceDes;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }

    @Override
    public String toString() {
        return "Service{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", serviceName='" + serviceName + '\'' +
                ", area=" + area +
                ", cost=" + cost +
                ", maxPeople=" + maxPeople +
                ", rentTypeId=" + rentTypeId +
                ", rentTypeName='" + rentTypeName + '\'' +
                ", serviceTypeId=" + serviceTypeId +
                ", serviceTypeName='" + serviceTypeName + '\'' +
                ", standardRoom='" + standardRoom + '\'' +
                ", otherConvenienceDes='" + otherConvenienceDes + '\'' +
                ", poolArea=" + poolArea +
                ", floors=" + floors +
                '}';
    }
}
