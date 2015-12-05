package com.joc.dao;

import com.joc.domain.Teacher;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeacherDao extends BaseDao<Teacher> {
    private final String GET_USER_BY_USERNAME = "from Teacher t where t.teacherUserName = ?";

//    /**
//     * 根据用户名查询User对象
//     * @param userName 用户名
//     * @return 对应userName的User对象，如果不存在，返回null。
//     */
    public Teacher getUserByUserName(String userName){
        List<Teacher> users = (List<Teacher>)find(GET_USER_BY_USERNAME,userName);
        if (users.size() == 0) {
            return null;
        }else{
            return users.get(0);
        }
    }
    public List<Teacher> getUserByMoreConditions(String[] conditions){
        String hql = "from Teacher t where 1=1 ";
        if (!conditions[0].isEmpty()){
            hql = hql + " and t.teacherDepartment = '"+conditions[0]+"' ";
        }
        if (!conditions[1].isEmpty()){
            hql = hql + " and t.teacherUserName = '"+conditions[1]+"' ";
        }
        if (!conditions[2].isEmpty()){
            hql = hql + " and t.teacherName = '"+conditions[2]+"' ";
        }
        hql += " order by t.teacherUserName asc ";
        return (List<Teacher>)find(hql);
    }
}
