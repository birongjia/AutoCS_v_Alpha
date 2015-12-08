package com.joc.web.controller;

import com.joc.domain.Departmanagement;
import com.joc.domain.Teacher;
import com.joc.domain.Yardmanagement;
import com.joc.service.DepartmanagementService;
import com.joc.service.TeacherService;
import com.joc.service.YardmanagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
//@SessionAttributes(value = {"loginYard", "loginDepart", "loginTeacher"})
public class LoginController extends BaseController{
    @Autowired
    private YardmanagementService yardmanagementService;
    @Autowired
    private DepartmanagementService departmanagementService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        if (userName.isEmpty()){
            request.setAttribute("errorMsg", "用户名不能为空");
            return "login";
        }
        if (password.isEmpty()){
            request.setAttribute("errorMsg", "密码不能为空");
            return "login";
        }
        if(userType.equals("1")) {
            Yardmanagement yardmanagement = yardmanagementService.queryUserByUserName(userName);
            if (yardmanagement == null) {
                request.setAttribute("errorMsg", "用户名不存在");
                return "login";
            } else if (!yardmanagement.getYardPassword().equals(password)) {
                request.setAttribute("errorMsg", "用户密码不正确");
                return "login";
            } else {
                request.getSession().setAttribute("loginYard", yardmanagement);
                return "yard/yardMain";
            }
        }
        else if(userType.equals("2")) {
            Departmanagement departmanagement = departmanagementService.queryUserByUserName(userName);
            if (departmanagement == null) {
                request.setAttribute("errorMsg", "用户名不存在");
                return "login";
            } else if (!departmanagement.getDepartPassword().equals(password)) {
                request.setAttribute("errorMsg", "用户密码不正确");
                return "login";
            } else {
                request.getSession().setAttribute("loginDepart", departmanagement);
                return "depart/departMain";
            }
        }
        else {
            Teacher teacher = teacherService.queryUserByUserName(userName);
            if (teacher == null) {
                request.setAttribute("errorMsg", "用户名不存在");
                return "login";
            } else if (!teacher.getTeacherPassword().equals(password)) {
                request.setAttribute("errorMsg", "用户密码不正确");
                return "login";
            } else {
                request.getSession().setAttribute("loginTeacher", teacher);
                return "teacher/teacherMain";
            }
        }

//        Yardmanagement yardmanagement = yardmanagementService.findUserByUserName(userName);
//        Departmanagement departmanagement = departmanagementService.findUserByUserName(userName);
//        Teacher teacher = teacherService.findUserByUserName(userName);
//        if (yardmanagement == null) {
//            if (departmanagement == null) {
//                if (teacher == null) {
//                    request.setAttribute("errorMsg", "用户名不存在");
//                    return new ModelAndView("forward:/WEB-INF/jsp/login.jsp");
//                } else if (!teacher.getTeacherPassword().equals(password)) {
//                    request.setAttribute("errorMsg", "用户密码不正确");
//                    return new ModelAndView("forward:/WEB-INF/jsp/login.jsp");
//                } else {
//                    setSessionUser(request, teacher);
//                    userType = 3;
//                }
//            } else if (!departmanagement.getDepartPassword().equals(password)) {
//                request.setAttribute("errorMsg", "用户密码不正确");
//                return new ModelAndView("forward:/WEB-INF/jsp/login.jsp");
//            } else {
//                setSessionUser(request, departmanagement);
//                userType = 2;
//            }
//        } else if (!yardmanagement.getYardPassword().equals(password)) {
//            request.setAttribute("errorMsg", "用户密码不正确");
//            return new ModelAndView("forward:/WEB-INF/jsp/login.jsp");
//        } else {
//            setSessionUser(request, yardmanagement);
//            userType = 1;
//        }
//        switch (userType){
//            case 1: {
//                ModelAndView mav = new ModelAndView("success1");
//                mav.addObject(yardmanagement);
//                return mav;
//            }
//            case 2: {
//                ModelAndView mav = new ModelAndView("success2");
//                mav.addObject(departmanagement);
//                return mav;
//            }
//            case 3:{
//                ModelAndView mav = new ModelAndView("success3");
//                mav.addObject(teacher);
//                return mav;
//            }
//            default: return new ModelAndView("fail");
//        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
//        session.removeAttribute(CommonConstant.USER_CONTEXT);
        session.invalidate();
        return "forward:/index.jsp";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "login";
    }
}
