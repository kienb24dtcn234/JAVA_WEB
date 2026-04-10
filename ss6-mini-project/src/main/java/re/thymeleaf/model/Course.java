package re.thymeleaf.model;

import java.time.LocalDate;

public class Course {

        private String id;
        private String name;
        private String level;
        private double price;
        private String description;
        private String teacher;
        private int duration;
        private boolean isFull;
        private int studentCount;
        private String startDate;

    public Course() {
    }

    public Course(String id, String name, String level, double price, String description, String teacher, int duration, boolean isFull, int studentCount, String startDate) {
        this.id = id;
        this.name = name;
        this.level = level;
        this.price = price;
        this.description = description;
        this.teacher = teacher;
        this.duration = duration;
        this.isFull = isFull;
        this.studentCount = studentCount;
        this.startDate = startDate;
    }



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isFull() {
        return isFull;
    }

    public void setFull(boolean full) {
        isFull = full;
    }

    public int getStudentCount() {
        return studentCount;
    }

    public void setStudentCount(int studentCount) {
        this.studentCount = studentCount;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
}
