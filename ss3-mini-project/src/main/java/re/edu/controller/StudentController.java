package re.edu.controller;

import com.sun.org.apache.xml.internal.serializer.AttributesImplSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import re.edu.model.Student;
import re.edu.service.StudentService;

import java.util.*;

@Controller

public class StudentController {
    private StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }
    @GetMapping("/")
    public String home() {
        return "redirect:/student";
    }
    @GetMapping("/student")
    public String student(
            @RequestParam(name = "sortBy", required = false) String sortBy,
            Model model) {

        List<Student> students;

        if ("name".equalsIgnoreCase(sortBy)) {
            students = studentService.sortByName();
        } else if ("gpa".equalsIgnoreCase(sortBy)) {
            students = studentService.sortByGpa();
        } else {
            students = studentService.getStudents();
        }

        model.addAttribute("students", students);
        model.addAttribute("size", students.size());
        return "student";
    }
    @GetMapping("/student/detail")
    public String detail(
            @RequestParam(name="id",required = false) int id,
            Model model){
        Student student;
        student=studentService.findStudentById(id);
        model.addAttribute("student",student);
        return "detailStudent";
    }
    @GetMapping("/student/search")
    public String search(
            @RequestParam(name = "keyword", required = false)  String keyword,
            Model model
    ){
        System.out.println(keyword);
        List<Student> students;
       students= studentService.findByName(keyword);
        System.out.println(students.size());
       model.addAttribute("students",students);
       model.addAttribute("size",students.size());
       return "student";
    }
    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        List<Student> students = studentService.getStudents();
        double average = studentService.averageGpa();
        Map<String, Double> statusPercentage = studentService.getStatusPercentage();
        Student topStudent = studentService.maxGpa();

        model.addAttribute("totalStudents", students.size());
        model.addAttribute("averageGpa", average);
        model.addAttribute("statusPercentage", statusPercentage);
        model.addAttribute("topStudent", topStudent);

        return "dashboard"; // dashboard.jsp
    }

}
