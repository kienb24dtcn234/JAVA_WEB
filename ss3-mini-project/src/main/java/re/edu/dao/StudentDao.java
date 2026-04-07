package re.edu.dao;

import org.springframework.stereotype.Repository;
import re.edu.model.Student;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentDao {
    private List<Student> students;

    public StudentDao() {
       students = new ArrayList<>();
       students.add(new Student(1,"Nguyễn Quang Huy","ST001","CNTT",2022,3.7,"Đang học"));
       students.add(new Student(2,"Nguyễn Thế Kiên","ST002","MAR",2022,2.0,"Bảo lưu"));
       students.add(new Student(3,"Trần An Ninh","ST003","Ẩm thực",2022,2.9,"Tốt nghiệp"));
       students.add(new Student(4,"Đỗ Trung Hiếu","ST004","Âm nhạc",2022,3.5,"Đang học"));
       students.add(new Student(5,"Đặng Tô Ngọc Dũng","ST005","Phòng chống tội phạm",2022,4.0,"Tốt nghiệp"));
    }

    public List<Student> getStudents() {
        return students;
    }
    public Student findById(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null;
    }
}
