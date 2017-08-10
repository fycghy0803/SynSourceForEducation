package com.hysoft.util;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * <p>Title: SinoBase</p>
 * <p>Description: 北京思诺博信息技术有限公司基础库</p>
 * <p>Copyright: 北京思诺博信息技术有限公司 Copyright (c) 2006</p>
 * <p>Company: 北京思诺博信息技术有限公司</p>
 * @author 唐明胜
 * @version 1.0
 */
public class CharacterEncodingFilter implements Filter{
    protected String encoding;
    protected FilterConfig filterConfig;
    
    private String ajaxFlag = "__ajax__";  
    public final String ajaxEncoding = "utf-8";  
    
    public CharacterEncodingFilter() {
        encoding = null;
        filterConfig = null;
    }

    public void destroy() {
        encoding = null;
        filterConfig = null;
    }

    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) req;  
        String queryString = hreq.getQueryString();  
        if (queryString != null && queryString.indexOf(ajaxFlag) != -1) { 
        	req.setCharacterEncoding( ajaxEncoding );
        }else{
        	req.setCharacterEncoding( encoding );
        }
        
        
        HttpServletResponse res = (HttpServletResponse) response;
        res.setDateHeader("Expires", 0);
        if (chain != null) {
            chain.doFilter(req, response);
        }
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        encoding = filterConfig.getInitParameter("encoding");
    }
}
