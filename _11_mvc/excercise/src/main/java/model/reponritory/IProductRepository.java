package model.reponritory;

import model.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();
    void createNew(Product product);
    void updateProduct(int id, Product product);
    void delete(int id);
    Product showDetailInfo(int id);
    Product searchById(int id);
    Product searchByName(String name);
}
