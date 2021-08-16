package model.repository.iplm.employee;

import model.bean.employee.Division;
import model.bean.service.RentType;
import model.repository.BaseRepository;
import model.repository.i_employee.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    //ket noi DB:
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public List<Division> showList() {
        List<Division> divisionList =  new ArrayList<>();

        String selectSql = "select division_id,division_name\n" +
                "from division;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Division division = new Division();
                division.setDivisionId(resultSet.getInt("division_id"));
                division.setDivisionName(resultSet.getString("division_name"));

                divisionList.add(division);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisionList;
    }
}
