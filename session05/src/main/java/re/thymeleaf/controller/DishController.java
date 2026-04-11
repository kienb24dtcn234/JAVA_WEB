package re.thymeleaf.controller;


//public class Dish {
//    private int id;
//    private String name;
//    private double price;
//    private boolean isAvailable;
//
//    // constructor, getter, setter
//}
//[Controller]
//     |
//     |  List<Dish>
//     v
//[Model]
//     |
//     |  ${dishes}
//     v
//[View - dish-list.html]
//     |
//     |  th:each
//     v
//Hiển thị bảng món ăn
//     |
//     ├── Nếu isAvailable = true  → "Còn hàng"
//     └── Nếu isAvailable = false → "Hết hàng" (màu đỏ)
//
//Trường hợp đặc biệt:
//     |
//     └── List rỗng/null → hiện thông báo
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import re.thymeleaf.model.Dish;
import re.thymeleaf.service.DishService;

import java.util.List;

@Controller
public class DishController {

    @Autowired
    private DishService dishService;

    @GetMapping("/bai2/dishes")
    public String showDishList(Model model) {
        List<Dish> dishes = dishService.getAllDishes();
        model.addAttribute("dishes", dishes);
        return "dish-list";
    }
}
