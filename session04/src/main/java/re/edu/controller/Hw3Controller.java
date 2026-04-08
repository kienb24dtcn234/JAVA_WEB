package re.edu.controller;
//
//Trong Cách A (/bai3/orders/5), số 5 nằm trong URI Path (đường dẫn chính của URL), thể hiện đây là tài nguyên cụ thể.
//Trong Cách B (/bai3/orders?id=5), số 5 nằm trong Query String, thường dùng để lọc hoặc tìm kiếm dữ liệu.
//Theo nguyên tắc REST, khi cần lấy chi tiết một đối tượng cụ thể, nên dùng Path Variable.
//        Vì vậy, em chọn Cách A vì rõ nghĩa hơn, đúng chuẩn REST API và dễ đọc hơn.

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/bai3")
public class Hw3Controller {

    @GetMapping("/orders/{id}")
    @ResponseBody
    public String getOrderDetail(@PathVariable("id") int id) {
        return "Chi tiet don hang so " + id;
    }
}