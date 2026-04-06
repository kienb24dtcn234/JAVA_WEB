package re.mvc.model;


public class Student {
    private String fullName;
    private int score;

    public Student(String fullName, int score) {
        this.fullName = fullName;
        this.score = score;
    }

    public String getFullName() {
        return fullName;
    }

    public int getScore() {
        return score;
    }
}
