package ContactUs;

import ForgetPassword.EmailMessage;
import ForgetPassword.EmailUtility;
import Utility.ServletUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "contactUs", value = "/contactUs")
public class ContactUs extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String NomeCompleto = req.getParameter("name");
      String Email = req.getParameter("email");
      String Oggetto = req.getParameter("subject");
      String Messaggio = req.getParameter("message");

      EmailMessage emailBean = new EmailMessage();
      emailBean.setTo("carrentalsapienza@gmail.com");
      emailBean.setSubject(Oggetto);
      emailBean.setMessage("Messaggio inviato da: "+NomeCompleto+" email: "+Email+"\n"+ Messaggio);
        try {
            EmailUtility.sendMail(emailBean);
            ServletUtility.setSuccessMessage("L'email è stata inviata correttamente",req);
            req.getRequestDispatcher("home/contact.jsp").forward(req,resp);
        } catch (Exception e) {
            ServletUtility.setErrorMessage("Qualcosa è andato storto",req);
            req.getRequestDispatcher("home/contact.jsp").forward(req,resp);
        }
    }
}
