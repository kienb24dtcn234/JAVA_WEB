package re.mvc.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        Model model,
                        HttpSession session) {


        if ((username.equals("admin") && password.equals("admin123")) ||
                (username.equals("staff") && password.equals("staff123"))) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", username.equals("admin") ? "ADMIN" : "STAFF");

            return "redirect:/orders";
        }


        model.addAttribute("error", "Sai username hoặc password!");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}