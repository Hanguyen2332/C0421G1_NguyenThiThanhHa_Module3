package model.service;

import model.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();
    void createNew(Product product);
    void updateProduct(int id, Product product);
    void delete(int id);
    Product showDetailInfo(int id);
    Product searchById(int id);
    List<Product> searchByName(String name);
}
