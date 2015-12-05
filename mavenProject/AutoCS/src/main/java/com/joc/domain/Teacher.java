package com.joc.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "teacher")
public class Teacher extends BaseDomain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int teacherId;

    @Column(name = "user_name")
    private String teacherUserName;

    @Column(name = "password")
    private String teacherPassword;

    @Column(name = "name")
    private String teacherName;

    @Column(name = "department")           //所属系
    private String teacherDepartment;

    @Column(name = "email")
    private String teacherEmail;

    @Column(name = "telephone")
    private String teacherTelephone;

    @Column(name = "sex")
    private String teacherSex;

    @Column(name = "birthday")
    private Date teacherBirthday;

    @Column(updatable = false)
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherUserName() {
        return teacherUserName;
    }

    public void setTeacherUserName(String teacherUserName) {
        this.teacherUserName = teacherUserName;
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherDepartment() {
        return teacherDepartment;
    }

    public void setTeacherDepartment(String teacherDepartment) {
        this.teacherDepartment = teacherDepartment;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public String getTeacherTelephone() {
        return teacherTelephone;
    }

    public void setTeacherTelephone(String teacherTelephone) {
        this.teacherTelephone = teacherTelephone;
    }

    public String getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(String teacherSex) {
        this.teacherSex = teacherSex;
    }

    public Date getTeacherBirthday() {
        return teacherBirthday;
    }

    public void setTeacherBirthday(Date teacherBirthday) {
        this.teacherBirthday = teacherBirthday;
    }
}