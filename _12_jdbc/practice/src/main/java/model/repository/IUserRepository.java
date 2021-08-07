package model.repository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    //Hiển thị danh sách User
    //Thêm mới User
    //Sửa thông tin User
    //Xoá User
    // thêm: hiển thị usertheo id

    public List<User> selectAllUsers();

    public String insertUser(User user) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public boolean delete(int id) throws SQLException;

    public User selectUser(int id);

    List<User> searchByCountry(String country);

    List<User> orderByName();

}
