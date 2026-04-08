package re.edu.config.dao;



import org.springframework.stereotype.Repository;

@Repository
public class OrderRepository {

    public String getAllOrders() {
        return "Danh sach toan bo don hang";
    }

    public String getOrderById(Long id) {
        return "Thong tin don hang voi ID: " + id;
    }
}