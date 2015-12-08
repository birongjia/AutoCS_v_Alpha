package com.joc.web.controller;

import com.joc.domain.Period;
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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
            return "redirect:/yard/userSuccess.html";
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
        file.transferTo(new File(fileName));
        yardmanagementService.saveTeacherUsersFromExcel(fileName);
        return "redirect:/yard/userSuccess.html";
    }

    //开始选课
    @RequestMapping("/course/start")
    public String importAndStartCourse(@RequestParam("files") MultipartFile[] files, HttpServletRequest request)throws Exception{
        if (files == null){
            request.setAttribute("errorMsg1", "未选择要导入的表格");
            return "yard/yardCourse";
        }
        if (files.length != 8){
            request.setAttribute("errorMsg1", "还有未选择导入表格的专业");
            return "yard/yardCourse";
        }

        String semester = request.getParameter("semester");
        if (semester.equals("0")){
            request.setAttribute("errorMsg1", "未选择学期");
            return "yard/yardCourse";
        }
        if (yardmanagementService.queryPeriodId(semester) != null){
            request.setAttribute("errorMsg1", "该学期已经开始报课");
            return "yard/yardCourse";
        }

        String beginCourse = request.getParameter("beginCourse");
        String endCourse = request.getParameter("endCourse");
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
        if (beginCourse.isEmpty() || endCourse.isEmpty()){
            request.setAttribute("errorMsg2", "时间未填写完整");
            return "yard/yardCourse";
        }
        if (beginCourse.compareTo(endCourse) > 0){
            request.setAttribute("errorMsg2", "截止时间不能在开始时间之前");
            return "yard/yardCourse";
        }
        if (currentDate.compareTo(beginCourse) > 0){
            request.setAttribute("errorMsg2", "开始报课时间不能在今天之前");
            return "yard/yardCourse";
        }

        String filePath = request.getSession().getServletContext().getRealPath("/") + "uploads/temp/";
        List<String> fileNames = new ArrayList<String>();
        for (MultipartFile file : files) {
            String fileName = saveFile(file, filePath);
            if (fileName.equals("1")){
                deleteFile(fileName);
                request.setAttribute("errorMsg1", "还有未选择导入表格的专业");
                return "yard/yardCourse";
            }
            if (fileName.equals("2")){
                deleteFile(fileName);
                request.setAttribute("errorMsg1", "上传文件的格式不正确");
                return "yard/yardCourse";
            }
            fileNames.add(fileName);
        }

        Period period = new Period();
        Date beginCourseDate =  Date.valueOf(beginCourse);
        Date endCourseDate =  Date.valueOf(endCourse);
        period.setPeriodId(semester);
        period.setStartTime(beginCourseDate);
        period.setDeadLine(endCourseDate);

        yardmanagementService.saveCoursesAndPeriod(fileNames, period);

        return "redirect:/yard/courseSuccess.html";
    }
















    private String saveFile(MultipartFile file, String filePath) throws Exception {
        String originalFileName = file.getOriginalFilename();
        if (file.isEmpty()){
            return "1";//文件为空
        }
        if (!originalFileName.endsWith(".xls") && !originalFileName.endsWith(".XLS")
                && !originalFileName.endsWith(".xlsx") && !originalFileName.endsWith(".XLSX")){
            return "2";//文件格式不正确
        }
        String fileName = filePath + originalFileName;
        file.transferTo(new File(fileName));
        return fileName;
    }

    private void deleteFile(String fileName){
        File file = new File(fileName);
        file.delete();
    }

}
