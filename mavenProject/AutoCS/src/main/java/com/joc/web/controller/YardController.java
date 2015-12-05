package com.joc.web.controller;

import com.joc.domain.Teacher;
import com.joc.service.YardmanagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/yard")
public class YardController extends BaseController {
    @Autowired
    private YardmanagementService yardmanagementService;

    //添加教师帐号
    @RequestMapping("/user/add")
    public String add(HttpServletRequest request, HttpServletResponse response){
        String userName = request.getParameter("userName");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        if (userName.isEmpty() || name.isEmpty() || password.isEmpty() || department.isEmpty()) {
            request.setAttribute("errorMsg1", "不能为空");
            return "forward:/yard/user.html";
        }
        else if (yardmanagementService.queryTeacherUserByTeacherUserName(userName) != null){
            request.setAttribute("errorMsg1", "该用户已存在");
            return "yard/yardUser";
        }
        else {
            Teacher teacher = new Teacher();
            teacher.setTeacherUserName(userName);
            teacher.setTeacherName(name);
            teacher.setTeacherPassword(password);
            teacher.setTeacherDepartment(department);
            yardmanagementService.saveTeacherUser(teacher);
            return "redirect:/yard/success.html";
        }
    }

    //查询教师帐号信息
    @RequestMapping("/user/find")
    public String find(HttpServletRequest request, HttpServletResponse response){
        String department = request.getParameter("department");
        String userName = request.getParameter("userName");
        if (department.isEmpty() && userName.isEmpty()){
            request.setAttribute("errorMsg2", "不能为空");
            return "yard/yardUser";
        }
        String[] param = {department, userName, ""};
        List<Teacher> teachers = yardmanagementService.queryTeacherUserByMoreConditions(param);
        if (teachers.isEmpty()){
            request.setAttribute("resultMsg1", "没有找到符合条件的教师");
        }
        request.setAttribute("teacher", teachers);
        return "yard/yardUser";
    }

//    // 打开更改教师页面
//    @RequestMapping(value="/user/{id}/edit")
//    public String editTeacher(@PathVariable Integer id,HttpServletRequest request) {
//        Teacher teacher = yardmanagementService.queryTeacherById(id);
//        request.setAttribute("teacher", teacher);
//        return "yard/yardEdit";
//    }

    // 删除教师信息
    @RequestMapping(value="/user/{id}/delete", method = RequestMethod.DELETE)
    public String deleteTeacher(@PathVariable Integer id, HttpServletRequest request) {
        yardmanagementService.removeTeacher(id);
        String targetUrl = "/yard/user.html";
        return "redirect:"+targetUrl;
    }

    //导入教师表格
    @RequestMapping("/user/upload")
    public String uploadAndImportTeacher(@RequestParam("file") MultipartFile file, HttpServletRequest request)throws Exception{
        if (file.isEmpty()){
            request.setAttribute("errorMsg", "不能为空");
            return "yard/yardUser";
        }
        String originalFileName = file.getOriginalFilename();
        if (!originalFileName.endsWith(".xls") && !originalFileName.endsWith(".XLS")
                && !originalFileName.endsWith(".xlsx") && !originalFileName.endsWith(".XLSX")){
            request.setAttribute("errorMsg", "上传文件的格式不正确");
            return "yard/yardUser";
        }
        String fileName = request.getSession().getServletContext().getRealPath("/") + "uploads/temp/"
                + originalFileName;
        File tempFile = new File(fileName);
        file.transferTo(tempFile);
        yardmanagementService.importTeacherUser(fileName);
        tempFile.delete();
        return "redirect:/yard/success.html";
    }

    //导入课程表格
    @RequestMapping("/course/upload")
    public String importCourses(@RequestParam("file") MultipartFile file, HttpServletRequest request)throws Exception{
        String semester = request.getParameter("semester");
        if (file.isEmpty() || semester.equals("0")){
            request.setAttribute("errorMsg1", "不能为空");
            return "yard/yardCourse";
        }
        String originalFileName = file.getOriginalFilename();
        if (!originalFileName.endsWith(".xls") && !originalFileName.endsWith(".XLS")
                && !originalFileName.endsWith(".xlsx") && !originalFileName.endsWith(".XLSX")){
            request.setAttribute("errorMsg1", "上传文件的格式不正确");
            return "yard/yardCourse";
        }
        int periodId = Calendar.getInstance().get(Calendar.YEAR);
        String pId = Integer.toString(periodId);
        if (semester.equals("1")){
            pId += "01";
        }
        if (semester.equals("2")){
            pId += "02";
        }
        String fileName = request.getSession().getServletContext().getRealPath("/") + "uploads/temp/"
                + originalFileName;
        File tempFile = new File(fileName);
        file.transferTo(tempFile);
        yardmanagementService.importCourse(fileName, pId);
        tempFile.delete();
        return "redirect:/yard/success.html";
    }

}
