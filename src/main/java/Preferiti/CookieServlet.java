package Preferiti;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "cookieServlet", value = "/cookieServlet")
public class CookieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        Cookie[] cookies = req.getCookies();

        if(cookies != null && cookies.length != 1) {
            for (int i = 1; i < cookies.length; i++) {
                if (Integer.parseInt(cookies[i].getValue()) == Integer.parseInt(id)) {
                    cookies[i].setMaxAge(0);
                    resp.addCookie(cookies[i]);
                }
            }
        }

        resp.sendRedirect("preferiti.jsp");

    }
}
