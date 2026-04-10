package re.thymeleaf.dao;

import org.springframework.stereotype.Repository;
import re.thymeleaf.model.Course;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CourseRepository {
    private List<Course> courses;

    public CourseRepository() {
        courses=new ArrayList<Course>();
        courses.add(new Course("1", "Khoá IELTS 6.5+", "Advanced",
                5000000,
                "Lộ trình luyện thi IELTS 6.5+ trong 4 tháng",
                "Nguyễn Văn A", 48,
                false, 0,
                "2026-05-10"));

        courses.add(new Course("2", "Khoá IELTS 5.5", "Intermediate",
                4000000,
                "Khoá nền tảng cho học viên từ 4.0 lên 5.5",
                "Trần Thị B", 40,
                false, 0,
                "2026-05-20"));

        courses.add(new Course("3", "Giao tiếp tiếng Anh 1", "Beginner",
                3000000,
                "Giao tiếp cơ bản cho người mất gốc",
                "Lê Văn C", 36,
                false, 0,
                "2026-06-01"));

        courses.add(new Course("4", "Giao tiếp tiếng Anh 2", "Intermediate",
                3500000,
                "Nâng cao phản xạ và từ vựng giao tiếp",
                "Phạm Thị D", 36,
                false, 0,
                "2026-06-15"));

        courses.add(new Course("5", "Luyện thi TOEIC 650+", "Advanced",
                4500000,
                "Lộ trình luyện thi TOEIC mục tiêu 650+",
                "Đỗ Văn E", 45,
                true, 25,
                "2026-07-01"));
    }

    public List<Course> findAll() {
        return courses;
    }
}
