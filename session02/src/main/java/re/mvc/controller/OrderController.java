package re.mvc.controller;





import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import re.mvc.model.Order;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String orders(HttpSession session,
                         HttpServletRequest request,
                         Model model) {

        ServletContext application = request.getServletContext();
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }
        List<Order> list = new ArrayList<>();
        list.add(new Order("OD01", "Laptop", 15000000, new Date()));
        list.add(new Order("OD02", "Chuột", 300000, new Date()));
        list.add(new Order("OD03", "Bàn phím", 800000, new Date()));
        model.addAttribute("orderList", list);


        synchronized (application) {
            Integer count = (Integer) application.getAttribute("totalViewCount");
            if (count == null) count = 0;
            count++;
            application.setAttribute("totalViewCount", count);
        }

        return "orders";
    }
}