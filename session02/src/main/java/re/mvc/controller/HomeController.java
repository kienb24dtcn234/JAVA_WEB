package re.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("age", 10);
        model.addAttribute("list", new int[]{1, 2, 3, 4, 5});

        return "home";
    }

    @GetMapping("/test")
    public String test(@RequestParam int a) {
        System.out.println(a);
        return "home";
    }

    @GetMapping("/bt1")
    public String bt1() {
        return "bt1";
    }
}
