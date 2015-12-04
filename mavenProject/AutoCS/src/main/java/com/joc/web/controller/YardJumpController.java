package com.joc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/yard")
//@SessionAttributes("loginYard")
public class YardJumpController extends BaseController {

    @RequestMapping("/main")
    public String yardMain(HttpServletRequest request, HttpServletResponse response){
        return "yard/yardMain";
    }

    @RequestMapping("/user")
    public String yardUser(HttpServletRequest request, HttpServletResponse response){
        return "yard/yardUser";
    }

    @RequestMapping("/course")
    public String yardCourse(HttpServletRequest request, HttpServletResponse response){
        return "yard/yardCourse";
    }

    @RequestMapping("/history")
    public String yardHistory(HttpServletRequest request, HttpServletResponse response){
        return "yard/yardHistory";
    }

    @RequestMapping("/success")
    public String yardSuccess(HttpServletRequest request, HttpServletResponse response){
        return "yard/yardSuccess";
    }

}
