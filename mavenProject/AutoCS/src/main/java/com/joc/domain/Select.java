package com.joc.domain;

import javax.persistence.*;

@Entity
@Table(name = "select")
public class Select extends BaseDomain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int selId;

    @Column(name = "courseid")
    private int courseId;

    @Column(name = "time")
    private String courseTime;    //起讫周序

    @Column(name = "teachername")
    private String teacherName;

    @Column(name = "coursename")
    private String courseName;

    @Column(name = "message")
    private String message;       //备注

    public int getSelId() {
        return selId;
    }

    public void setSelId(int selId) {
        this.selId = selId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(String courseTime) {
        this.courseTime = courseTime;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
