package re.edu.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import re.edu.config.service.OrderService;

@Controller
@RequestMapping("/bai2")
public class Hw2Controller {

    private final OrderService orderService;

    public Hw2Controller(OrderService orderService) {
        this.orderService = orderService;
    }


    @GetMapping("/orders")
    @ResponseBody
    public String getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/menu")
    @ResponseBody
    public String getMenu(
            @RequestParam(value = "category", required = false, defaultValue = "chay") String category
    ) {
        return "Menu loai: " + category;
    }
}
