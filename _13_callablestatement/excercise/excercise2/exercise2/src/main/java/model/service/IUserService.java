package model.service;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public List<User> selectAllUsers();

    public String insertUserTransaction(User user) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public boolean delete(int id) throws SQLException;

    public User selectUser(int id);

    List<User> searchByCountry(String country);

    List<User> orderByName();

    //----------------- 13_practice 1 ---------------//
    User getUserById(int id);

    boolean insertUserBySP(User user);
}
