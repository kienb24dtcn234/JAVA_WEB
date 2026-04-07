package re.edu.service;

import org.springframework.stereotype.Service;
import re.edu.dao.StudentDao;
import re.edu.model.Student;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class StudentService {
    private StudentDao studentDao;

    public  StudentService(StudentDao studentDao) {
       this.studentDao = studentDao;
    }

    public List<Student> getStudents(){
        return studentDao.getStudents();
    }
    public Student findStudentById(int id){
       return studentDao.findById(id);
    }
    public List<Student> sortByName() {
        List<Student> students = new ArrayList<>(studentDao.getStudents());
        students.sort(Comparator.comparing(Student::getFullName));
        return students;
    }

    public List<Student> sortByGpa() {
        List<Student> students = new ArrayList<>(studentDao.getStudents());
        students.sort(Comparator.comparing(Student::getGpa));
        return students;
    }
    public List<Student> findByName(String name) {
        List<Student> students = new ArrayList<>(studentDao.getStudents());
       return students.stream().filter(s->s.getFullName().toLowerCase().contains(name.toLowerCase())).collect(Collectors.toList());

    }
    public double averageGpa() {
        List<Student> students = new ArrayList<>(studentDao.getStudents());
        double average= (students.stream().mapToDouble(Student::getGpa).sum())/students.size();
        return average;
    }
    public Student maxGpa() {
        List<Student> students = new ArrayList<>(studentDao.getStudents());
        return students.stream().max(Comparator.comparing(Student::getGpa)).get();
    }
    public Map<String, Double> getStatusPercentage() {
        List<Student> students = studentDao.getStudents();
        int total = students.size();
        Map<String, Integer> countMap = new HashMap<>();


        countMap.put("Đang học", 0);
        countMap.put("Bảo lưu", 0);
        countMap.put("Tốt nghiệp", 0);


        for (Student student : students) {
            String status = student.getStatus();
            if (status == null) continue;

            if (status.equalsIgnoreCase("Đang học")) {
                countMap.put("Đang học", countMap.get("Đang học") + 1);
            } else if (status.equalsIgnoreCase("Bảo lưu")) {
                countMap.put("Bảo lưu", countMap.get("Bảo lưu") + 1);
            } else if (status.equalsIgnoreCase("Tốt nghiệp")){
                countMap.put("Tốt nghiệp", countMap.get("Tốt nghiệp") + 1);
            }
        }


        Map<String, Double> percentMap = new HashMap<>();
        if (total == 0) {

            percentMap.put("Đang học", 0.0);
            percentMap.put("Bảo lưu", 0.0);
            percentMap.put("Tốt nghiệp", 0.0);
            return percentMap;
        }

        for (Map.Entry<String, Integer> entry : countMap.entrySet()) {
            double percent = entry.getValue() * 100.0 / total;
            percentMap.put(entry.getKey(), percent);
        }

        return percentMap;
    }

}
