package Preferiti;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "cookieServlet", value = "/cookieServlet")
public class CookieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String name = "id" + id;

        Cookie[] cookies = req.getCookies();

        if(cookies != null && cookies.length != 1) {
            for (int i = 1; i < cookies.length; i++) {
                if (cookies[i].getValue().equals(id)) {
                    Cookie c = new Cookie(cookies[i].getName(), id);
                    c.setMaxAge(0);
                    resp.addCookie(c);
                }
            }
        }
        resp.sendRedirect("preferiti.jsp");
    }
}
