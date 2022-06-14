package Book;

import DB.DbOperations;
import ForgetPassword.EmailMessage;
import ForgetPassword.EmailUtility;
import Utility.ServletUtility;

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
import java.util.Calendar;
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
        String full_name = req.getParameter("full-name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        String pick_location = (String) session.getAttribute("pick_location");
        String drop_location = (String) session.getAttribute("drop_location");
        Date pick_date = (Date) session.getAttribute("pick_date");
        Date drop_date = (Date) session.getAttribute("drop_date");


        try {

            if(!dbOperations.aggiungiOrdine(new java.sql.Date(pick_date.getTime()), (String) session.getAttribute("username"),  new java.sql.Date(drop_date.getTime()), id_macchina, drop_location, full_name, email, phone, pick_location,"","0")){
               session.setAttribute("bookSuccess","Prenotazione Effettuata");;
               Calendar pick_date_calendar = Calendar.getInstance();
               pick_date_calendar.setTime(pick_date);
               Calendar drop_date_calendar = Calendar.getInstance();
               drop_date_calendar.setTime(drop_date);

                EmailMessage emailBean = new EmailMessage();
                emailBean.setTo(email);
                emailBean.setSubject("Prenotazione del "+pick_date_calendar.get(Calendar.DAY_OF_MONTH)+"/"+pick_date_calendar.get(Calendar.MONTH));
                emailBean.setMessage("Grazie "+full_name+" per aver effettuato il noleggio con Car Rental \nDati del noleggio: \nLuogo di ritiro: "+pick_location+"\n"+
                        "Il giorno: "+pick_date_calendar.get(Calendar.DAY_OF_MONTH)+"/"+pick_date_calendar.get(Calendar.MONTH)+"\n"+"Luogo di consegna: "+drop_location+"\n"+"Il giorno: "+drop_date_calendar.get(Calendar.DAY_OF_MONTH)+"/"+drop_date_calendar.get(Calendar.MONTH)+"\n"+
                        "Email fornita: "+email+"\n"+"Numero ti telefono fornito: "+phone);
                EmailUtility.sendMail(emailBean);
                resp.sendRedirect("home/fleet.jsp");
            }
        } catch (SQLException e) {
            ServletUtility.setErrorMessage("La prenotazione non è andata a buon fine",req);
            req.getRequestDispatcher("home/fleet.jsp").forward(req,resp);
        }


    }
}
