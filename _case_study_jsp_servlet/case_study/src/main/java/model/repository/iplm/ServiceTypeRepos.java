package model.repository.iplm;

import model.bean.service.ServiceType;
import model.repository.BaseRepository;
import model.repository.i_employee.IPositionRepository;
import model.repository.i_service.IServiceRepository;
import model.repository.i_service.IServiceTypeRepos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepos implements IServiceTypeRepos {
    //ket noi DB:
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public List<ServiceType> showList() {
        List<ServiceType> serviceTypeList =  new ArrayList<>();
        String selectSql = "select service_type_id,service_type_name\n" +
                "from service_type;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ServiceType serviceType = new ServiceType();

                serviceType.setServiceTypeId(resultSet.getInt("service_type_id"));
                serviceType.setServiceTypeName(resultSet.getString("service_type_name"));

                serviceTypeList.add(serviceType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceTypeList;
    }
}
