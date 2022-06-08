package FilterCars;

import DB.DbOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            Date pickUp = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("pickUp"));
            Date dropOff = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("dropOff"));
            ArrayList<ArrayList<String>> veicoliDisponibili = dbOperations.getAvailableVeicoli(pickUp,dropOff);
            req.setAttribute("veicoli", veicoliDisponibili);
            req.getRequestDispatcher("fleet2.jsp").forward(req, resp);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
