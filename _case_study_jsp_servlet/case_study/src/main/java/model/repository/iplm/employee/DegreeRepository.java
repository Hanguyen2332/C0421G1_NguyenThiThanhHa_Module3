package model.repository.iplm.employee;

import model.bean.employee.EducationDegree;
import model.bean.service.ServiceType;
import model.repository.BaseRepository;
import model.repository.i_employee.IDegreeRepository;
import model.repository.i_employee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DegreeRepository implements IDegreeRepository {
    //ket noi DB:
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public List<EducationDegree> showList() {
        List<EducationDegree> educationDegreeList =  new ArrayList<>();
//
        String selectSql = "select education_degree_id,education_degree_name\n" +
                "from education_degree;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EducationDegree educationDegree = new EducationDegree();

                educationDegree.setDegreeId(resultSet.getInt("education_degree_id"));
                educationDegree.setDegreeName(resultSet.getString("education_degree_name"));

                educationDegreeList.add(educationDegree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegreeList;
    }
}
