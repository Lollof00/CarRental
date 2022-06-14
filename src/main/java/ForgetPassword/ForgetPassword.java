package ForgetPassword;

import DB.DbOperations;
import Utility.ServletUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ForgetPassword", value = "/ForgetPassword")
public class ForgetPassword extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = dbOperations.getUserEmail(email);
        EmailMessage emailBean = new EmailMessage();
        emailBean.setTo(email);
        emailBean.setSubject("Recupero Password");
        emailBean.setMessage("Ciaoo "+email+" La tua password è: "+password);
        try {
            EmailUtility.sendMail(emailBean);
            ServletUtility.setSuccessMessage("L'email è stata inviata correttamente",req);
            req.getRequestDispatcher("forgotPassword.jsp").forward(req,resp);
        } catch (Exception e) {
           ServletUtility.setErrorMessage("Qualcosa è andato storto oppure l'email non è registrata",req);
           req.getRequestDispatcher("forgotPassword.jsp").forward(req,resp);
        }
    }
}
