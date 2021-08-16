package model.repository.iplm;

import model.bean.service.Service;
import model.repository.BaseRepository;
import model.repository.i_service.IServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    //ket noi DB:
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public String createService(Service service) {
        int row = 0;
        String insertSql = "INSERT INTO service (service_code,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,\n" +
                "description_other_convenience,pool_area,number_of_floors)\n" +
                "VALUE(?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insertSql);
            preparedStatement.setString(1, service.getCode());
            preparedStatement.setString(2, service.getServiceName());
            preparedStatement.setDouble(3, service.getArea());
            preparedStatement.setDouble(4, service.getCost());
            preparedStatement.setInt(5, service.getMaxPeople());
            preparedStatement.setInt(6, service.getRentTypeId());
            preparedStatement.setInt(7, service.getServiceTypeId());
            preparedStatement.setString(8, service.getStandardRoom());
            preparedStatement.setString(9, service.getOtherConvenienceDes());
            preparedStatement.setDouble(10, service.getPoolArea());
            preparedStatement.setInt(11, service.getFloors());

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row > 0? "Create new Service successfully!" : "Create new Service FAIL!";
    }

    @Override
    public List<Service> showList() {
        List<Service> serviceList = new ArrayList<>();
        //lenh query:
        String selectSql = "SELECT service_id,service_code,service_name,service_area,service_cost,service_max_people,S.rent_type_id,S.service_type_id,standard_room,\n" +
                "description_other_convenience,pool_area,number_of_floors,rent_type_name,service_type_name\n" +
                "FROM service S\n" +
                "INNER JOIN service_type Stype ON S.service_type_id = Stype.service_type_id\n" +
                "INNER JOIN rent_type Rtype ON S.rent_type_id = Rtype.rent_type_id;\n";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Service service = new Service();

                service.setId(resultSet.getInt("service_id"));
                service.setCode(resultSet.getString("service_code"));
                service.setServiceName(resultSet.getString("service_name"));

                service.setArea(resultSet.getDouble("service_area"));
                service.setCost(resultSet.getDouble("service_cost"));

                service.setMaxPeople(resultSet.getInt("service_max_people"));
                service.setRentTypeId(resultSet.getInt("S.rent_type_id"));
                service.setServiceTypeId(resultSet.getInt("S.service_type_id"));

                service.setStandardRoom(resultSet.getString("standard_room"));
                service.setOtherConvenienceDes(resultSet.getString("description_other_convenience"));
                service.setPoolArea(resultSet.getDouble("pool_area"));
                service.setFloors(resultSet.getInt("number_of_floors"));

                service.setRentTypeName(resultSet.getString("rent_type_name"));
                service.setServiceTypeName(resultSet.getString("service_type_name"));
                //add list:
                serviceList.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceList;
    }
}
