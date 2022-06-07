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


@WebServlet(name = "bookNow", value = "/bookNow")
public class Book extends HttpServlet {

    private DbOperations dbOperations;

    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id_macchina = req.getParameter("macchinaId");
        String pick_up_location = req.getParameter("pick-up-location");
        String ret_location = req.getParameter("return-location");
        String pick_up_date = req.getParameter("pick-up-date");
        String ret_date = req.getParameter("return-date");
        String full_name = req.getParameter("full-name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

      /*  try {
            HttpSession session = req.getSession(false);
            if(dbOperations.aggiungiOrdine(pick_up_date, session.getAttribute("username"))){
                resp.sendRedirect("index.jsp");
            }else{
                //TODO messaggo di errore
            };
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

       */

    }
}
