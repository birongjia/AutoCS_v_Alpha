package com.joc.domain;

import javax.persistence.*;

@Entity
@Table(name = "course")
public class Course extends BaseDomain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int courseId;

    @Column(name = "coursename")
    private String courseName;

    @Column(name = "coursegrade")
    private int courseGrade;

    @Column(name = "coursemajor")
    private String courseMajor;

    @Column(name = "coursepeople")
    private int coursePeople;

    @Column(name = "coursescore")
    private float courseScore;

    @Column(name = "coursehour")
    private String courseHour;

    @Column(name = "testhour")
    private String testHour;     //实验学时

    @Column(name = "practicehour")
    private String practiceHour;     //上机学时

    @Column(name = "periodid")
    private String periodId;

    @Column(name = "coursetype")
    private String courseType;

    @Column(updatable = false)
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseGrade() {
        return courseGrade;
    }

    public void setCourseGrade(int courseGrade) {
        this.courseGrade = courseGrade;
    }

    public String getCourseMajor() {
        return courseMajor;
    }

    public void setCourseMajor(String courseMajor) {
        this.courseMajor = courseMajor;
    }

    public int getCoursePeople() {
        return coursePeople;
    }

    public void setCoursePeople(int coursePeople) {
        this.coursePeople = coursePeople;
    }

    public float getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(float courseScore) {
        this.courseScore = courseScore;
    }

    public String getCourseHour() {
        return courseHour;
    }

    public void setCourseHour(String courseHour) {
        this.courseHour = courseHour;
    }

    public String getTestHour() {
        return testHour;
    }

    public void setTestHour(String testHour) {
        this.testHour = testHour;
    }

    public String getPracticeHour() {
        return practiceHour;
    }

    public void setPracticeHour(String practiceHour) {
        this.practiceHour = practiceHour;
    }

    public String getPeriodId() {
        return periodId;
    }

    public void setPeriodId(String periodId) {
        this.periodId = periodId;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

}
