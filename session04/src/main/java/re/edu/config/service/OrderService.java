package re.edu.config.service;



import org.springframework.stereotype.Service;
import re.edu.config.dao.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    // Constructor Injection (chuẩn xịn)
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public String getAllOrders() {
        return orderRepository.getAllOrders();
    }

    public String getOrderById(Long id) {
        return orderRepository.getOrderById(id);
    }
}
