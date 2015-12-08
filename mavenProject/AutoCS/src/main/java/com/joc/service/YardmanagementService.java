package com.joc.service;

import com.joc.dao.CourseDao;
import com.joc.dao.PeriodDao;
import com.joc.dao.TeacherDao;
import com.joc.dao.YardmanagementDao;
import com.joc.domain.Course;
import com.joc.domain.Period;
import com.joc.domain.Teacher;
import com.joc.domain.Yardmanagement;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class YardmanagementService {
    @Autowired
    private YardmanagementDao yardmanagementDao;
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private PeriodDao periodDao;

    Sheet sheet;

    public Yardmanagement queryUserByUserName(String userName) {
        return yardmanagementDao.getUserByUserName(userName);
    }

    public void saveTeacherUser(Teacher teacher){
        teacherDao.save(teacher);
    }

    public Teacher queryTeacherUserByTeacherUserName(String userName){
        return teacherDao.getUserByUserName(userName);
    }

    public List<Teacher> queryTeacherUserByMoreConditions(String[] conditions){
        return teacherDao.getUserByMoreConditions(conditions);
    }

    public Teacher queryTeacherById(int teacherId){
        return teacherDao.get(teacherId);
    }

    public void removeTeacher(int teacherId){
        Teacher teacher = teacherDao.get(teacherId);
        teacherDao.remove(teacher);
    }

    public void saveTeacherUsersFromExcel(String fileName) throws Exception {
        List<Teacher> teachers = importTeacherUserFromExcel(fileName);
        for (Teacher teacher : teachers){
            Teacher t = teacherDao.getUserByUserName(teacher.getTeacherUserName());
            if (t == null){
                teacherDao.save(teacher);
            }
            if (t != null && !t.equals(teacher)){
                t.setTeacherUserName(teacher.getTeacherUserName());
                t.setTeacherPassword(teacher.getTeacherPassword());
                t.setTeacherName(teacher.getTeacherName());
                t.setTeacherDepartment(teacher.getTeacherDepartment());
                teacherDao.update(t);
            }
        }
        deleteFile(fileName);
    }

    public Period queryPeriodId(String periodId){
        return periodDao.getPeriodId(periodId);
    }

    public void saveCoursesAndPeriod(List<String> fileNames, Period period) throws Exception{
        saveCoursesFromExcel(fileNames, period.getPeriodId());
        savePeriodAll(period);
    }

    //表格顺序正常
    private List<Teacher> importTeacherUserFromExcel(String fileName)throws Exception{
        int rows;
        int beginRows = 2;
//        WorkbookSettings st=new WorkbookSettings();
//        st.setEncoding("UTF-8");                 //设置编码
        Workbook book = Workbook.getWorkbook(new File(fileName));//工作簿
        sheet = book.getSheet(0);//工作表
        rows = sheet.getRows();//行数
        List<Teacher> teachers = new ArrayList<Teacher>();
        for (int i = beginRows; i <= rows; i++) {
            Teacher teacher = new Teacher();
            teacher.setTeacherUserName(getCell(i, 1));//第i 行第一列
            teacher.setTeacherPassword(getCell(i, 2));
            teacher.setTeacherName(getCell(i, 3));
            teacher.setTeacherDepartment(getCell(i, 4));
            teachers.add(teacher);
        }
        return teachers;
    }

    private void savePeriodAll(Period period){
        periodDao.save(period);
    }

    private void saveCoursesFromExcel(List<String> fileNames, String periodId) throws Exception {
        for (String fileName : fileNames) {
            List<Course> courses = importCourseFromExcel(fileName, periodId);
            for (Course course : courses) {
                Course c = courseDao.getCourseByCourseMajorAndName(course.getCourseMajor(), course.getCourseName());
                if (c == null || !c.getPeriodId().equals(course.getPeriodId())) {
                    courseDao.save(course);
                }
                else if (!c.equals(course)) {
                    c.setCourseGrade(course.getCourseGrade());
                    c.setCourseMajor(course.getCourseMajor());
                    c.setCoursePeople(course.getCoursePeople());
                    c.setCourseName(course.getCourseName());
                    c.setCourseType(course.getCourseType());
                    c.setCourseScore(course.getCourseScore());
                    c.setCourseHour(course.getCourseHour());
                    c.setTestHour(course.getTestHour());
                    c.setPracticeHour(course.getPracticeHour());
                    c.setPeriodId(course.getPeriodId());
                    courseDao.update(c);
                }
            }
            deleteFile(fileName);
        }
    }

    //表格顺序正常
    private List<Course> importCourseFromExcel(String fileName, String periodId) throws Exception {
        int rows;
        int beginRows = 4;
//        WorkbookSettings st=new WorkbookSettings();
//        st.setEncoding("UTF-8");                 //设置编码
        Workbook book = Workbook.getWorkbook(new File(fileName));//工作簿
        sheet = book.getSheet(0);//工作表
        rows = sheet.getRows();//行数
        List<Course> courses = new ArrayList<Course>();
        for (int i = beginRows; i <= rows; i++) {
            Course course = new Course();
            course.setCourseGrade(Integer.valueOf(getCell(i, 1)));//第i 行第一列
            course.setCourseMajor(getCell(i, 2));
            course.setCoursePeople(Integer.valueOf(getCell(i, 3)));
            course.setCourseName(getCell(i, 4));
            course.setCourseType(getCell(i, 5));
            course.setCourseScore(Float.valueOf(getCell(i, 6)));
            course.setCourseHour(getCell(i, 7));
            course.setTestHour(getCell(i, 8));
            course.setPracticeHour(getCell(i, 9));
            course.setPeriodId(periodId);
            courses.add(course);
        }
        return courses;
    }

    private String getCell(int i,int j){//获取i行j列的单元格的值
        Cell c = sheet.getCell(j-1, i-1);
        return c.getContents().trim();//返回去空格的值
    }

    private void deleteFile(String fileName){
        File file = new File(fileName);
        file.delete();
    }
}
