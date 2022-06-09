package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class UserCheckFilter implements Filter{

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);


        boolean isLogged = (session!=null && session.getAttribute("username") !=null);
        String loginURI = request.getContextPath()+"/login";
        boolean isLoginRequest = request.getRequestURI().equals(loginURI);
        boolean isLoginPage = request.getRequestURI().endsWith("login.jsp");

        if(isLogged && (isLoginRequest || isLoginPage)){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
            dispatcher.forward(request, response);
        } else if (isLogged || isLoginRequest) {
            filterChain.doFilter(req,res);
        }else{
            RequestDispatcher dispatcher = request.getRequestDispatcher("login-user.jsp");
            dispatcher.forward(req, res);
        }

        if(request.getSession(false)==null || request.getSession(false).getAttribute("username")==null){
            RequestDispatcher dispatcher = request.getRequestDispatcher("login-user.jsp");
            dispatcher.forward(request, response);
        }else{
            filterChain.doFilter(req,res);
        }
    }
}

