package Book;

import DB.DbOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "bookNow", value = "/bookNow")
public class Book extends HttpServlet {

    private DbOperations dbOperations;

    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id_macchina = req.getParameter("macchinaId");
        String full_name = req.getParameter("full-name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        String pick_location = (String) req.getAttribute("pick_location");
        String drop_location = (String) req.getAttribute("drop_location");
        String pick_date = (String) req.getAttribute("pick_date");
        String drop_date = (String) req.getAttribute("drop_date");

        try {

            Date pickUp = new SimpleDateFormat("yyyy-MM-dd").parse(pick_date);
            Date dropOff = new SimpleDateFormat("yyyy-MM-dd").parse(drop_date);
            HttpSession session = req.getSession(false);
            if(!dbOperations.aggiungiOrdine((java.sql.Date) pickUp, (String) session.getAttribute("username"), (java.sql.Date) dropOff, id_macchina, drop_location, full_name, email, phone, pick_location)){
                resp.sendRedirect("index.jsp");
            }else {

            }
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }




    }
}
