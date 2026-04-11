package re.thymeleaf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import re.thymeleaf.model.Dish;
import re.thymeleaf.service.DishService;
//[dish-list.html]
//     |
//     |  click "Chỉnh sửa" (/bai3/edit/{id})
//     v
//[DishController]
//     |
//     |  nhận id từ URL (@PathVariable)
//     v
//[DishService]
//     |
//     |  tìm Dish theo id
//     v
//[Controller]
//     |
//     ├── Nếu tồn tại → add vào Model
//     |                 → return edit-dish.html
//     |
//     └── Nếu không tồn tại
//           → redirect /bai2/dishes
//           → kèm message lỗi
//     v
//[edit-dish.html]
//     |
//     |  th:object + th:field
//     v
//Form tự động fill data cũ
@Controller
public class Bai3Controller {

    @Autowired
    private DishService dishService;

    @GetMapping("/bai3/edit/{id}")
    public String editDish(@PathVariable("id") int id, Model model) {
        Dish dish = dishService.getDishById(id);


        if (dish == null) {
            model.addAttribute("error", "Không tìm thấy món ăn yêu cầu!");
            return "redirect:/bai2/dishes";
        }

        model.addAttribute("dish", dish);
        return "edit-dish";
    }
}
