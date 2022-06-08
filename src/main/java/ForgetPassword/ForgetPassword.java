package ForgetPassword;

import DB.DbOperations;

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
        emailBean.setMessage("Ciaoo "+email+"La tua password è: "+password);
        try {
            EmailUtility.sendMail(emailBean);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
