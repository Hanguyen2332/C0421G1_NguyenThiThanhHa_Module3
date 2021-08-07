package model.reponritory.iplm;

import model.bean.Product;
import model.reponritory.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    static Map<Integer, Product> productList = new HashMap<>();

    //    static int id = autoIncrementId();
//    static {
//        productList.put(id,new Product(id,"Bàn chải bồn cầu","Việt Home Care",55000));
//        productList.put(id,new Product(id,"Vim","Việt Home Care",45000));
//        productList.put(id,new Product(id,"Nước Lau sàn Sunlight","Việt Home Care",60000));
//        productList.put(id,new Product(id,"Cây lau sàn 360 độ","Việt Home Care",220000));
//        productList.put(id,new Product(id,"Gif","Việt Home Care",65000));
//        productList.put(id,new Product(id,"Nước lau kính","Việt Home Care",35000));
//    }
    static {
        productList.put(1, new Product(1, "Toilet brush", "Việt Home Care", 55000));
        productList.put(2, new Product(2, "Vim", "Việt Home Care", 45000));
        productList.put(3, new Product(3, "Sunlight", "Việt Home Care", 60000));
        productList.put(4, new Product(4, "bucket", "Việt Home Care", 220000));
        productList.put(5, new Product(5, "Gif", "Việt Home Care", 65000));
        productList.put(6, new Product(6, "Glass cleaner water", "Việt Home Care", 35000));
    }

    //hàm id tự động tăng:
    public static int autoIncrementId() {
        int id = 0;
        if (productList.isEmpty()) {
            return 1;
        } else {
            return id = productList.get(productList.size() - 1).getId() + 1;
        }
    }

    @Override
    public List<Product> display() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void createNew(Product product) {
        productList.put(autoIncrementId(), product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productList.put(id, product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public Product showDetailInfo(int id) {
        return productList.get(id);
    }

    @Override
    public Product searchById(int id) {
        return productList.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productListResult = new ArrayList<>();
        for (Map.Entry<Integer, Product> entry : productList.entrySet()) {
            Product productResult = null;
            if (entry.getValue().getName().contains(name)) {
                productResult = entry.getValue();  //object product
                productListResult.add(productResult);
            }
        }
        return productListResult;
    }
    //    public static void main(String[] args) {
//        ProductRepository productRepository = new ProductRepository();
//        System.out.println(productRepository.searchByName("Nước lau kính"));
//    }
}
