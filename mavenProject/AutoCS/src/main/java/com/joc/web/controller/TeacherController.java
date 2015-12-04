package com.joc.web.controller;

import com.joc.domain.Course;
import com.joc.domain.Teacher;
import com.joc.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController extends BaseController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/doCourse")
    public String doTeacherCourse(HttpServletRequest request, HttpServletResponse response){
        Teacher teacher = (Teacher)request.getSession().getAttribute("loginUser");
        if(teacher == null || teacher.getTeacherDepartment().isEmpty()){
            request.setAttribute("errorMsg1", "您还未属于任何系，暂时无法选课");
            return "teacher/teacherMain";
        }
        List<Course> courses = teacherService.queryCourseByMajor(teacher.getTeacherDepartment());
        if(courses == null || courses.isEmpty()){
            request.setAttribute("errorMsg1", "有没可选的课程");
        }
        else{
            request.setAttribute("course", courses);
        }
        return "teacher/teacherCourse";
    }

}
