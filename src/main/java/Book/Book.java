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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String id_macchina = req.getParameter("macchinaId");
        System.out.println(id_macchina);
        String full_name = req.getParameter("full-name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        String pick_location = (String) session.getAttribute("pick_location");
        String drop_location = (String) session.getAttribute("drop_location");
        Date pick_date = (Date) session.getAttribute("pick_date");
        Date drop_date = (Date) session.getAttribute("drop_date");


        try {

            if(!dbOperations.aggiungiOrdine(new java.sql.Date(pick_date.getTime()), (String) session.getAttribute("username"),  new java.sql.Date(drop_date.getTime()), id_macchina, drop_location, full_name, email, phone, pick_location)){
                resp.sendRedirect("index.jsp");
            }else {
                    //TODO messaggio d'errore
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
