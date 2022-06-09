package Preferiti;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "preferiti", value = "/preferiti")
public class Favorites extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        String name = "id" + id;

        Cookie c = new Cookie(name, id);

        resp.addCookie(c);

        resp.sendRedirect("home/fleet.jsp");


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cookie[] cookies = req.getCookies();

        req.setAttribute("cookies", cookies);
        resp.sendRedirect("home/preferiti.jsp");
       /* RequestDispatcher dispatcher = req.getRequestDispatcher("home/preferiti.jsp");
        dispatcher.forward(req, resp);*/

    }
}
