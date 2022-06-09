package FilterCars;

import DB.DbOperations;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "FilterCar", value = "/FilterCar")
public class FilterCar extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations= new DbOperations();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String pick_location = req.getParameter("locationPick");
            String drop_location = req.getParameter("locationDrop");
            Date pickUp = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("pickUp"));
            Date dropOff = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("dropOff"));
            ArrayList<ArrayList<String>> veicoliDisponibili = dbOperations.getAvailableVeicoli(pickUp,dropOff);
            HttpSession session = req.getSession(true);
            session.setAttribute("veicoli", veicoliDisponibili);
            session.setAttribute("pick_location", pick_location);
            session.setAttribute("drop_location", drop_location);
            session.setAttribute("pick_date", pickUp);
            session.setAttribute("drop_date", dropOff);
            resp.sendRedirect("home/fleet.jsp");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
