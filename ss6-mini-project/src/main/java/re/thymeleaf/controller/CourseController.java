package re.thymeleaf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import re.thymeleaf.model.Course;
import re.thymeleaf.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService service;

    // LIST + FILTER
    @GetMapping("/list")
    public String list(
            @RequestParam(value = "level", defaultValue = "ALL") String level,
            @RequestParam(value = "maxPrice", defaultValue = "10000000") double maxPrice,
            Model model
    ) {
        model.addAttribute("courses", service.filter(level, maxPrice));
        return "course/course-list";
    }

    // DETAIL
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model) {
        model.addAttribute("course", service.findById(id));
        return "course/course-detail";
    }

    // MỞ FORM EDIT
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, Model model) {
        model.addAttribute("course", service.findById(id));
        return "course/course-form";
    }

    // UPDATE
    @PostMapping("/update")
    public String update(@ModelAttribute Course course, RedirectAttributes ra) {
        service.update(course);
        ra.addFlashAttribute("success", "Cập nhật thành công!");
        return "redirect:/course/list";
    }

    // DELETE
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id, RedirectAttributes ra) {

        boolean result = service.delete(id);

        if (!result) {
            ra.addFlashAttribute("error", "Không thể hủy khóa học đã có học viên");
        } else {
            ra.addFlashAttribute("success", "Đã xóa khóa học");
        }

        return "redirect:/course/list";
    }
}