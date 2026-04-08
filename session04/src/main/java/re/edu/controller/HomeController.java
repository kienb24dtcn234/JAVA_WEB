package re.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @GetMapping("/")
    public ModelAndView index(
            @RequestParam(name = "name", required = false) String name,
            ModelAndView mv
    ) {
        System.out.println(name);

        mv.setViewName("home");
        mv.addObject("name", "huy");
        mv.addObject("age", 18);
        return mv;
    }
}

