package model.repository.iplm;

import model.bean.service.RentType;
import model.repository.BaseRepository;
import model.repository.i_employee.IDivisionRepository;
import model.repository.i_service.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    //ket noi DB:
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public List<RentType> showList() {
        List<RentType> rentTypeList =  new ArrayList<>();
        String selectSql = "select rent_type_id,rent_type_name\n" +
                "from rent_type;\n";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RentType rentType = new RentType();
                rentType.setRentTypeId(resultSet.getInt("rent_type_id"));
                rentType.setRentTypeName(resultSet.getString("rent_type_name"));

                rentTypeList.add(rentType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}
