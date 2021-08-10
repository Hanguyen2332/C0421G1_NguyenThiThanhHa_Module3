package model.service.iplm;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.iplm.UserRepository;
import model.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public String insertUser(User user) throws SQLException {
       return userRepository.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return userRepository.delete(id);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }

    @Override
    public List<User> orderByName(){
        return userRepository.orderByName();
    }


    //----------------- 13_practice 1 ---------------//
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    };

    public boolean insertUserBySP(User user) {
        return userRepository.insertUserBySP(user);
    };
}
