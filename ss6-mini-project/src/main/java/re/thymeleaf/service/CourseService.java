package re.thymeleaf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import re.thymeleaf.dao.CourseRepository;
import re.thymeleaf.model.Course;

import java.util.List;


@Service
public class CourseService {

    @Autowired
    private CourseRepository repo;


    public List<Course> filter(String level, double maxPrice) {
        return repo.findAll().stream()
                .filter(c -> level.equals("ALL") || c.getLevel().equals(level))
                .filter(c -> c.getPrice() <= maxPrice)
                .toList();
    }


    public Course findById(String id) {
        return repo.findAll().stream()
                .filter(c -> c.getId().equals(id))
                .findFirst()
                .orElse(null);
    }


    public void update(Course course) {
        Course old = findById(course.getId());
        if (old != null) {
            old.setPrice(course.getPrice());
            old.setStartDate(course.getStartDate());
        }
    }


    public boolean delete(String id) {
        Course c = findById(id);

        if (c == null) return false;

        if (c.getStudentCount() > 0) {
            return false;
        }

        repo.findAll().remove(c);
        return true;
    }
}