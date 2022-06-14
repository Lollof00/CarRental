package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminCheckFilter implements Filter{

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);


        boolean isLogged = (session!=null && session.getAttribute("username") !=null && session.getAttribute("ruolo").equals("admin"));
        String loginURI = request.getContextPath()+"/loginAdmin";
        boolean isLoginRequest = request.getRequestURI().equals(loginURI);

        if (isLogged || isLoginRequest) {
            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
    }
}

