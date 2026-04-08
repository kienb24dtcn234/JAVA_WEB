package re.edu.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import re.edu.config.service.OrderService;

@Controller
@RequestMapping("/bai1")
public class OrderController {

    private final OrderService orderService;


    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }


    @GetMapping("/orders")
    @ResponseBody
    public java.lang.String getAllOrders() {
        return orderService.getAllOrders();
    }


    @GetMapping("/orders/{id}")
    @ResponseBody
    public java.lang.String getOrderById(@PathVariable("id") Long id) {
        return orderService.getOrderById(id);
    }


    @PostMapping("/orders")
    @ResponseBody
    public String createOrder() {
        return "Tao don hang moi thanh cong";
    }
}