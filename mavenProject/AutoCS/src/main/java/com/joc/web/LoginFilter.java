package com.joc.web;

import com.joc.cons.CommonConstant;
import com.joc.domain.Departmanagement;
import com.joc.domain.Teacher;
import com.joc.domain.Yardmanagement;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LoginFilter implements Filter {
    private static final String FILTERED_REQUEST = "@@session_context_filtered_request";

    // ① 需要登录即可访问的URI资源
    private static final String[] INHERENT_URIS = { "/yard", "/depart", "/teacher", "/add", "/save", "/edit", "/update", "/delete" };

    // ② 执行过滤
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        // ②-1 保证该过滤器在一次请求中只被调用一次
        if (request != null && request.getAttribute(FILTERED_REQUEST) != null) {
            chain.doFilter(request, response);
        } else {

            // ②-2 设置过滤标识，防止一次请求多次过滤
            request.setAttribute(FILTERED_REQUEST, Boolean.TRUE);
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            Yardmanagement loginYard = (Yardmanagement)httpRequest.getSession().getAttribute("loginYard");
            Departmanagement loginDepart = (Departmanagement)httpRequest.getSession().getAttribute("loginDepart");
            Teacher loginTeacher = (Teacher)httpRequest.getSession().getAttribute("loginTeacher");
            Object userContext = httpRequest.getSession().getAttribute("loginUser");
            if(loginYard == null){
                if(loginDepart == null){
                    if(loginTeacher == null){
                        userContext = null;
                    }
                    else{
                        userContext = loginTeacher;
                    }
                }
                else{
                    userContext = loginDepart;
                }
            }
            else{
                userContext = loginYard;
            }

            // ②-3 用户未登录, 且当前URI资源需要登录才能访问
            if (userContext == null
                    && isURILogin(httpRequest.getRequestURI(), httpRequest)) {
                String toUrl = httpRequest.getRequestURL().toString();
                if (!StringUtils.isEmpty(httpRequest.getQueryString())) {
                    toUrl += "?" + httpRequest.getQueryString();
                }

                // ②-4将用户的请求URL保存在session中，用于登录成功之后，跳到目标URL
                httpRequest.getSession().setAttribute(CommonConstant.LOGIN_TO_URL, toUrl);

                // ②-5转发到登录页面
                request.getRequestDispatcher("/index.jsp").forward(request,
                        response);
                return;
            }
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }
    /**
     * 当前URI资源是否需要登录才能访问
     * @param requestURI
     * @param request
     * @return
     */
    private boolean isURILogin(String requestURI, HttpServletRequest request) {
        for (String uri : INHERENT_URIS) {
            if (requestURI != null && requestURI.indexOf(uri) >= 0) {
                return true;
            }
        }
        return false;
    }

    public void destroy() {

    }
}
